Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 348F76C864
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 12:43:33 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id h193so17771305ita.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 04:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0VB8sG4NHtfbMzXf0xGnehjCvwpbsKUaacKoDIVKnrw=;
	b=YTz9PybaxELLnhMMsd7BXbUfRIxuFnQhXJ7YU1TkBO6A4fX6lj2DPQ9NFKeaPiSWR3
	LBwr5jk4M49Wl4clKb0kDQYPJpPGbO51rnxptGQ75sfsOeS2Z4HtCmvoAaTg6613n5ju
	9Q7YJZ/mpu4lJHpiHRjP++AAUwN2uC1EUOHjmoi0t6AvkyEOyxVL/FU5ZH6mF/mB9xzK
	vqh2XdciX+BdsJGu+mTKP+l4NuYbFpZovyAh86Rr5kHXaVgkG/2Y8Yz6QH7EAcu7iZKY
	cX4za1H5oWn7yJRsTZjO7Dp8DnBTzOht/ETEuYf0NMHvkWT1KuvieIt1Q3yAacKfKevK
	EziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0VB8sG4NHtfbMzXf0xGnehjCvwpbsKUaacKoDIVKnrw=;
	b=sn0WAaJ3RZ/58GIeFqPZdHyDhrqe16IQQ7F10iwARprxVq3tlMpwvzojr3Qb0hbfAr
	SVc3d2aB0ZiuF71I0p9YBVpAMhrsmu9sXRTmBVWqFOMWaQO0VS0+CJS+DhqyR1ylZjsX
	aQsfCixaZMqXZbDqrS3G007e+updbUIWtLdQBt2bnOjkPn0qZ6hTsbYw2E+2vU56h+X8
	g5nxj+WqHYH+74tzgTaV95y0ZvNgIXy1yrsWK+qJOGykRZlL9atoBsFjUDNhTTtfoTSa
	KrxjJpQdUPkqn33LbP1uPOcze9e9NvO5WzORqdIfswVUgjLD2D+LwO9GM29ZqE+d5egC
	GFQg==
X-Gm-Message-State: AGRZ1gJmxT/+xbboKahf0H3dhRZiJx4BtEc2LOmMdb/Mtqn2k3vqwTDN
	fmFEyGoh0kr9uH7CEyJEcO+MXxu//CLoi447tN2xqQ==
X-Google-Smtp-Source: AJdET5fHYywQMpPLpR4bL/CfefWBsmkeNr7jZHT0IqjgJ3l0jLiYElCZC2zWxEvxUr8W+xqV7CYoiTYwGQLIhFw3kAw=
X-Received: by 2002:a02:1e4c:: with SMTP id m73mr13279703jad.79.1542977014072; 
	Fri, 23 Nov 2018 04:43:34 -0800 (PST)
MIME-Version: 1.0
References: <20181121134127.22420-1-otavio@ossystems.com.br>
In-Reply-To: <20181121134127.22420-1-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Nov 2018 12:43:22 +0000
Message-ID: <CAJTo0LZ4KcFa5n5=B6xCZ8dMZrdH9rLO7sTReFRi2R7=RqwZHg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Marek Vasut <marex@denx.de>, U-Boot Mailing List <u-boot@lists.denx.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade 2018.07 -> 2018.11
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2018 12:43:33 -0000
Content-Type: text/plain; charset="UTF-8"

Can you rebase this on top of the mkimage changes?

Ross
On Wed, 21 Nov 2018 at 13:42, Otavio Salvador <otavio@ossystems.com.br> wrote:
>
> This upgrades U-Boot to 2018.11 release and drop the backported
> security fixes which are now included upstream.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
>  .../u-boot/files/CVE-2018-1000205-1.patch     |  59 --------
>  .../u-boot/files/CVE-2018-1000205-2.patch     | 143 ------------------
>  ..._2018.07.inc => u-boot-common_2018.11.inc} |   7 +-
>  ..._2018.07.bb => u-boot-fw-utils_2018.11.bb} |   0
>  ...e_2018.07.bb => u-boot-mkimage_2018.11.bb} |   0
>  .../{u-boot_2018.07.bb => u-boot_2018.11.bb}  |   0
>  6 files changed, 2 insertions(+), 207 deletions(-)
>  delete mode 100644 meta/recipes-bsp/u-boot/files/CVE-2018-1000205-1.patch
>  delete mode 100644 meta/recipes-bsp/u-boot/files/CVE-2018-1000205-2.patch
>  rename meta/recipes-bsp/u-boot/{u-boot-common_2018.07.inc => u-boot-common_2018.11.inc} (64%)
>  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2018.07.bb => u-boot-fw-utils_2018.11.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2018.07.bb => u-boot-mkimage_2018.11.bb} (100%)
>  rename meta/recipes-bsp/u-boot/{u-boot_2018.07.bb => u-boot_2018.11.bb} (100%)
>
> diff --git a/meta/recipes-bsp/u-boot/files/CVE-2018-1000205-1.patch b/meta/recipes-bsp/u-boot/files/CVE-2018-1000205-1.patch
> deleted file mode 100644
> index fed3c3dcb9..0000000000
> --- a/meta/recipes-bsp/u-boot/files/CVE-2018-1000205-1.patch
> +++ /dev/null
> @@ -1,59 +0,0 @@
> -From 7346c1e192d63cd35f99c7e845e53c5d4d0bdc24 Mon Sep 17 00:00:00 2001
> -From: Teddy Reed <teddy.reed@gmail.com>
> -Date: Sat, 9 Jun 2018 11:45:20 -0400
> -Subject: [PATCH] vboot: Do not use hashed-strings offset
> -
> -The hashed-strings signature property includes two uint32_t values.
> -The first is unneeded as there should never be a start offset into the
> -strings region. The second, the size, is needed because the added
> -signature node appends to this region.
> -
> -See tools/image-host.c, where a static 0 value is used for the offset.
> -
> -Signed-off-by: Teddy Reed <teddy.reed@gmail.com>
> -Reviewed-by: Simon Glass <sjg@chromium.org>
> -
> -Upstream-Status: Backport[http://git.denx.de/?p=u-boot.git;a=commit;
> -                 h=7346c1e192d63cd35f99c7e845e53c5d4d0bdc24]
> -
> -CVE: CVE-2018-1000205
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - common/image-sig.c | 7 +++++--
> - tools/image-host.c | 1 +
> - 2 files changed, 6 insertions(+), 2 deletions(-)
> -
> -diff --git a/common/image-sig.c b/common/image-sig.c
> -index 8d2fd10..5a269d3 100644
> ---- a/common/image-sig.c
> -+++ b/common/image-sig.c
> -@@ -377,8 +377,11 @@ int fit_config_check_sig(const void *fit, int noffset, int required_keynode,
> -       /* Add the strings */
> -       strings = fdt_getprop(fit, noffset, "hashed-strings", NULL);
> -       if (strings) {
> --              fdt_regions[count].offset = fdt_off_dt_strings(fit) +
> --                              fdt32_to_cpu(strings[0]);
> -+              /*
> -+               * The strings region offset must be a static 0x0.
> -+               * This is set in tool/image-host.c
> -+               */
> -+              fdt_regions[count].offset = fdt_off_dt_strings(fit);
> -               fdt_regions[count].size = fdt32_to_cpu(strings[1]);
> -               count++;
> -       }
> -diff --git a/tools/image-host.c b/tools/image-host.c
> -index 8e43671..be2d59b 100644
> ---- a/tools/image-host.c
> -+++ b/tools/image-host.c
> -@@ -135,6 +135,7 @@ static int fit_image_write_sig(void *fit, int noffset, uint8_t *value,
> -
> -               ret = fdt_setprop(fit, noffset, "hashed-nodes",
> -                                  region_prop, region_proplen);
> -+              /* This is a legacy offset, it is unused, and must remain 0. */
> -               strdata[0] = 0;
> -               strdata[1] = cpu_to_fdt32(string_size);
> -               if (!ret) {
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-bsp/u-boot/files/CVE-2018-1000205-2.patch b/meta/recipes-bsp/u-boot/files/CVE-2018-1000205-2.patch
> deleted file mode 100644
> index bb79af1c7b..0000000000
> --- a/meta/recipes-bsp/u-boot/files/CVE-2018-1000205-2.patch
> +++ /dev/null
> @@ -1,143 +0,0 @@
> -From 72239fc85f3eda078547956608c063ab965e90e9 Mon Sep 17 00:00:00 2001
> -From: Teddy Reed <teddy.reed@gmail.com>
> -Date: Sat, 9 Jun 2018 11:38:05 -0400
> -Subject: [PATCH] vboot: Add FIT_SIGNATURE_MAX_SIZE protection
> -
> -This adds a new config value FIT_SIGNATURE_MAX_SIZE, which controls the
> -max size of a FIT header's totalsize field. The field is checked before
> -signature checks are applied to protect from reading past the intended
> -FIT regions.
> -
> -This field is not part of the vboot signature so it should be sanity
> -checked. If the field is corrupted then the structure or string region
> -reads may have unintended behavior, such as reading from device memory.
> -A default value of 256MB is set and intended to support most max storage
> -sizes.
> -
> -Suggested-by: Simon Glass <sjg@chromium.org>
> -Signed-off-by: Teddy Reed <teddy.reed@gmail.com>
> -Reviewed-by: Simon Glass <sjg@chromium.org>
> -
> -Upstream-Status: Backport[http://git.denx.de/?p=u-boot.git;a=commit;
> -                 h=72239fc85f3eda078547956608c063ab965e90e9]
> -
> -CVE: CVE-2018-1000205
> -
> -Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ----
> - Kconfig                     | 10 ++++++++++
> - common/image-sig.c          |  5 +++++
> - test/py/tests/test_vboot.py | 33 +++++++++++++++++++++++++++++++++
> - tools/Makefile              |  1 +
> - 4 files changed, 49 insertions(+)
> -
> -diff --git a/Kconfig b/Kconfig
> -index 5a82c95..c8b86cd 100644
> ---- a/Kconfig
> -+++ b/Kconfig
> -@@ -267,6 +267,16 @@ config FIT_SIGNATURE
> -         format support in this case, enable it using
> -         CONFIG_IMAGE_FORMAT_LEGACY.
> -
> -+config FIT_SIGNATURE_MAX_SIZE
> -+      hex "Max size of signed FIT structures"
> -+      depends on FIT_SIGNATURE
> -+      default 0x10000000
> -+      help
> -+        This option sets a max size in bytes for verified FIT uImages.
> -+        A sane value of 256MB protects corrupted DTB structures from overlapping
> -+        device memory. Assure this size does not extend past expected storage
> -+        space.
> -+
> - config FIT_VERBOSE
> -       bool "Show verbose messages when FIT images fail"
> -       help
> -diff --git a/common/image-sig.c b/common/image-sig.c
> -index f65d883..8d2fd10 100644
> ---- a/common/image-sig.c
> -+++ b/common/image-sig.c
> -@@ -156,6 +156,11 @@ static int fit_image_setup_verify(struct image_sign_info *info,
> - {
> -       char *algo_name;
> -
> -+      if (fdt_totalsize(fit) > CONFIG_FIT_SIGNATURE_MAX_SIZE) {
> -+              *err_msgp = "Total size too large";
> -+              return 1;
> -+      }
> -+
> -       if (fit_image_hash_get_algo(fit, noffset, &algo_name)) {
> -               *err_msgp = "Can't get hash algo property";
> -               return -1;
> -diff --git a/test/py/tests/test_vboot.py b/test/py/tests/test_vboot.py
> -index ee939f2..3d25ec3 100644
> ---- a/test/py/tests/test_vboot.py
> -+++ b/test/py/tests/test_vboot.py
> -@@ -26,6 +26,7 @@ Tests run with both SHA1 and SHA256 hashing.
> -
> - import pytest
> - import sys
> -+import struct
> - import u_boot_utils as util
> -
> - @pytest.mark.boardspec('sandbox')
> -@@ -105,6 +106,26 @@ def test_vboot(u_boot_console):
> -         util.run_and_log(cons, [mkimage, '-F', '-k', tmpdir, '-K', dtb,
> -                                 '-r', fit])
> -
> -+    def replace_fit_totalsize(size):
> -+        """Replace FIT header's totalsize with something greater.
> -+
> -+        The totalsize must be less than or equal to FIT_SIGNATURE_MAX_SIZE.
> -+        If the size is greater, the signature verification should return false.
> -+
> -+        Args:
> -+            size: The new totalsize of the header
> -+
> -+        Returns:
> -+            prev_size: The previous totalsize read from the header
> -+        """
> -+        total_size = 0
> -+        with open(fit, 'r+b') as handle:
> -+            handle.seek(4)
> -+            total_size = handle.read(4)
> -+            handle.seek(4)
> -+            handle.write(struct.pack(">I", size))
> -+        return struct.unpack(">I", total_size)[0]
> -+
> -     def test_with_algo(sha_algo):
> -         """Test verified boot with the given hash algorithm.
> -
> -@@ -146,6 +167,18 @@ def test_vboot(u_boot_console):
> -         util.run_and_log(cons, [fit_check_sign, '-f', fit, '-k', tmpdir,
> -                                 '-k', dtb])
> -
> -+        # Replace header bytes
> -+        bcfg = u_boot_console.config.buildconfig
> -+        max_size = int(bcfg.get('config_fit_signature_max_size', 0x10000000), 0)
> -+        existing_size = replace_fit_totalsize(max_size + 1)
> -+        run_bootm(sha_algo, 'Signed config with bad hash', 'Bad Data Hash', False)
> -+        cons.log.action('%s: Check overflowed FIT header totalsize' % sha_algo)
> -+
> -+        # Replace with existing header bytes
> -+        replace_fit_totalsize(existing_size)
> -+        run_bootm(sha_algo, 'signed config', 'dev+', True)
> -+        cons.log.action('%s: Check default FIT header totalsize' % sha_algo)
> -+
> -         # Increment the first byte of the signature, which should cause failure
> -         sig = util.run_and_log(cons, 'fdtget -t bx %s %s value' %
> -                                (fit, sig_node))
> -diff --git a/tools/Makefile b/tools/Makefile
> -index 5dd33ed..0c3341e 100644
> ---- a/tools/Makefile
> -+++ b/tools/Makefile
> -@@ -133,6 +133,7 @@ ifdef CONFIG_FIT_SIGNATURE
> - # This affects include/image.h, but including the board config file
> - # is tricky, so manually define this options here.
> - HOST_EXTRACFLAGS      += -DCONFIG_FIT_SIGNATURE
> -+HOST_EXTRACFLAGS      += -DCONFIG_FIT_SIGNATURE_MAX_SIZE=$(CONFIG_FIT_SIGNATURE_MAX_SIZE)
> - endif
> -
> - ifdef CONFIG_SYS_U_BOOT_OFFS
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2018.07.inc b/meta/recipes-bsp/u-boot/u-boot-common_2018.11.inc
> similarity index 64%
> rename from meta/recipes-bsp/u-boot/u-boot-common_2018.07.inc
> rename to meta/recipes-bsp/u-boot/u-boot-common_2018.11.inc
> index 22b44dccc6..6f4a10b7a4 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-common_2018.07.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot-common_2018.11.inc
> @@ -8,11 +8,8 @@ PE = "1"
>
>  # We use the revision in order to avoid having to fetch it from the
>  # repo during parse
> -SRCREV = "8c5d4fd0ec222701598a27b26ab7265d4cee45a3"
> +SRCREV = "0157013f4a4945bbdb70bb4d98d680e0845fd784"
>
> -SRC_URI = "git://git.denx.de/u-boot.git \
> -           file://CVE-2018-1000205-1.patch \
> -           file://CVE-2018-1000205-2.patch \
> -"
> +SRC_URI = "git://git.denx.de/u-boot.git"
>
>  S = "${WORKDIR}/git"
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.07.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.11.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.07.bb
> rename to meta/recipes-bsp/u-boot/u-boot-fw-utils_2018.11.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.11.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb
> rename to meta/recipes-bsp/u-boot/u-boot-mkimage_2018.11.bb
> diff --git a/meta/recipes-bsp/u-boot/u-boot_2018.07.bb b/meta/recipes-bsp/u-boot/u-boot_2018.11.bb
> similarity index 100%
> rename from meta/recipes-bsp/u-boot/u-boot_2018.07.bb
> rename to meta/recipes-bsp/u-boot/u-boot_2018.11.bb
> --
> 2.19.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

