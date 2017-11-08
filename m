Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0C5C26093A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 09:15:07 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id h70so5225705ioi.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 01:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SulWjQlnQZaLZTACq0/jQawXpHYDXAhNMKJvbyr2uP8=;
	b=joXjr0LnI4Hmy2+2y/yPJUu4TFS4gA729fDjXsKe4yxwP4qOc1FANolzswdrgGOKi0
	RZhPTx3CW3I3ohX2GPivX24dPu+wJPB3LVvXtJtmfJkm4p5p2TQ8oe0/2P0fUYg0gvWz
	tBb06OQdoR7uZ7nVGvMKd9xB5SYM4Cn3BKte+CffQH/VBqQI83wggDo3uiue2d9G/vxW
	zdn4fRj7FGV8UGB2175p+oeHv8qR7VSwiol8zCThvkSYIaRUa8M07K9UWHQoruPEV1jq
	DoXpkoi+F72x8TO0wKSvhRdlSptur+zC51gthFR9WzRg68lJ3ysil1u/1tjn3uzNxDmM
	D86g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SulWjQlnQZaLZTACq0/jQawXpHYDXAhNMKJvbyr2uP8=;
	b=Tg2tXk9Vr2kghTI3cTPdCssOKEjNVERPlwn/Y/O12mgCqWSqfIawmzbyiUXtClXN/u
	NhWzHHWBTpXRIh7dmvd3T5HgQFv65rc46Lg3S7N9OuQv0ODkGwnehPg/gMMpCdUfn1fM
	0Zk3BlWRF5mS8IGHBSl3o7y9YY+KhEo2h7C7bOMkeKjdcrZRbHaS2SUFfJC0HXxojc29
	f7hUYlskNin0GQsOstEYpYJQHO7cJKzLbaekpAV+m5WCGZutSZ1DCE8Vr29BVOZf6CIL
	71yUJ6Z2UI+oneBf4UltonqkmFcdBARtivlFcnJNMS4Q66MxnAXEmz+XTIJTG3SKmh5d
	6FBg==
X-Gm-Message-State: AJaThX5hyfDCRVmAo+sHsgyxnqfGT1kOBIkTtXcgTzzROg+gt1gUDtXW
	TKfVbq9iXc6rRy7MI957OvFTaVzCXT5SalKVAgqT2g==
X-Google-Smtp-Source: AGs4zMbjkhxBre0TiIKiBVG1Wr3TtVcSrFc4lRiwtCWe4VAYYKapD3fJ7jgm20heydaFblP52NtGi+YkSStM6EugIAo=
X-Received: by 10.107.183.151 with SMTP id h145mr2150128iof.259.1510132508474; 
	Wed, 08 Nov 2017 01:15:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.176.10 with HTTP; Wed, 8 Nov 2017 01:14:47 -0800 (PST)
In-Reply-To: <1510134962-86616-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1510134962-86616-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Nov 2017 09:14:47 +0000
Message-ID: <CAJTo0LZxphpcaoE2oOFzBt1EDgiK5XX8KUUVvA=xPQyZfWOFcg@mail.gmail.com>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kexec-tools: 2.0.14 -> 2.0.15
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
X-List-Received-Date: Wed, 08 Nov 2017 09:15:08 -0000
Content-Type: multipart/alternative; boundary="94eb2c0c07b0bb561f055d751f53"

--94eb2c0c07b0bb561f055d751f53
Content-Type: text/plain; charset="UTF-8"

Does this work on poky-lsb?  Previous upgrades were failing with that due
to the security flags being enabled.

Ross

On 8 November 2017 at 09:56, zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:

> 1) Upgrade kexec-tools from 2.0.14 to 2.0.15.
> 2) Remove patches that are included in 2.0.15.
>    kexec-tools/0001-arm64-Disable-PIC.patch
>    kexec-tools/0001-kexec-exntend-the-semantics-of-
> kexec_iomem_for_each_.patch
>    kexec-tools/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch
>    kexec-tools/0001-x86-x86_64-Fix-format-warning-with-die.patch
>    kexec-tools/0002-kexec-generalize-and-rename-get_kernel_stext_sym.patch
>    kexec-tools/0002-ppc-Fix-format-warning-with-die.patch
>    kexec-tools/0003-arm64-identify-PHYS_OFFSET-correctly.patch
>    kexec-tools/0004-arm64-kdump-identify-memory-regions.patch
>    kexec-tools/0005-arm64-kdump-add-elf-core-header-segment.patch
>    kexec-tools/0006-arm64-kdump-set-up-kernel-image-segment.patch
>    kexec-tools/0007-arm64-kdump-set-up-other-segments.patch
>    kexec-tools/0008-arm64-kdump-add-DT-properties-to-crash-
> dump-kernel-s.patch
>    kexec-tools/0009-arm64-kdump-Add-support-for-binary-image-files.patch
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../kexec/kexec-tools/0001-arm64-Disable-PIC.patch |  31 ----
>  ...nd-the-semantics-of-kexec_iomem_for_each_.patch |  78 --------
>  .../0001-vmcore-dmesg-Define-_GNU_SOURCE.patch     |  31 ----
>  ...01-x86-x86_64-Fix-format-warning-with-die.patch |  78 --------
>  ...eneralize-and-rename-get_kernel_stext_sym.patch | 194
> --------------------
>  .../0002-ppc-Fix-format-warning-with-die.patch     |  43 -----
>  ...0003-arm64-identify-PHYS_OFFSET-correctly.patch |  76 --------
>  .../0004-arm64-kdump-identify-memory-regions.patch | 202
> ---------------------
>  ...5-arm64-kdump-add-elf-core-header-segment.patch | 191
> -------------------
>  ...6-arm64-kdump-set-up-kernel-image-segment.patch | 137 --------------
>  .../0007-arm64-kdump-set-up-other-segments.patch   |  35 ----
>  ...-add-DT-properties-to-crash-dump-kernel-s.patch | 150 ---------------
>  ...-kdump-Add-support-for-binary-image-files.patch |  52 ------
>  ...kexec-tools_2.0.14.bb => kexec-tools_2.0.15.bb} |  17 +-
>  14 files changed, 2 insertions(+), 1313 deletions(-)
>  delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-arm64-
> Disable-PIC.patch
>  delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-kexec-
> exntend-the-semantics-of-kexec_iomem_for_each_.patch
>  delete mode 100644 meta/recipes-kernel/kexec/
> kexec-tools/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch
>  delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0001-x86-x86_64-
> Fix-format-warning-with-die.patch
>  delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0002-kexec-
> generalize-and-rename-get_kernel_stext_sym.patch
>  delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0002-ppc-Fix-
> format-warning-with-die.patch
>  delete mode 100644 meta/recipes-kernel/kexec/kexec-tools/0003-arm64-
> identify-PHYS_OFFSET-correctly.patch
>  delete mode 100644 meta/recipes-kernel/kexec/
> kexec-tools/0004-arm64-kdump-identify-memory-regions.patch
>  delete mode 100644 meta/recipes-kernel/kexec/
> kexec-tools/0005-arm64-kdump-add-elf-core-header-segment.patch
>  delete mode 100644 meta/recipes-kernel/kexec/
> kexec-tools/0006-arm64-kdump-set-up-kernel-image-segment.patch
>  delete mode 100644 meta/recipes-kernel/kexec/
> kexec-tools/0007-arm64-kdump-set-up-other-segments.patch
>  delete mode 100644 meta/recipes-kernel/kexec/
> kexec-tools/0008-arm64-kdump-add-DT-properties-to-crash-
> dump-kernel-s.patch
>  delete mode 100644 meta/recipes-kernel/kexec/
> kexec-tools/0009-arm64-kdump-Add-support-for-binary-image-files.patch
>  rename meta/recipes-kernel/kexec/{kexec-tools_2.0.14.bb =>
> kexec-tools_2.0.15.bb} (63%)
>
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-Disable-PIC.patch
> b/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-Disable-PIC.patch
> deleted file mode 100644
> index 84e94d7..0000000
> --- a/meta/recipes-kernel/kexec/kexec-tools/0001-arm64-Disable-PIC.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 3bb73e5e5649b455e15d5ca3a7ad1a90c4960972 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 10 Jun 2017 11:54:36 -0700
> -Subject: [PATCH] arm64: Disable PIC
> -
> -Fix
> -| cc1: sorry, unimplemented: code model 'large' with -fPIC
> -| make: *** [Makefile:118: purgatory/arch/arm64/entry.o] Error 1
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Pending
> -
> - purgatory/arch/arm64/Makefile | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/purgatory/arch/arm64/Makefile b/purgatory/arch/arm64/
> Makefile
> -index 636abea..80068ca 100644
> ---- a/purgatory/arch/arm64/Makefile
> -+++ b/purgatory/arch/arm64/Makefile
> -@@ -1,6 +1,7 @@
> -
> - arm64_PURGATORY_EXTRA_CFLAGS = \
> -       -mcmodel=large \
> -+      -fno-PIC \
> -       -fno-stack-protector \
> -       -fno-asynchronous-unwind-tables \
> -       -Wundef \
> ---
> -2.13.1
> -
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-
> exntend-the-semantics-of-kexec_iomem_for_each_.patch
> b/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-
> exntend-the-semantics-of-kexec_iomem_for_each_.patch
> deleted file mode 100644
> index 822f28c..0000000
> --- a/meta/recipes-kernel/kexec/kexec-tools/0001-kexec-
> exntend-the-semantics-of-kexec_iomem_for_each_.patch
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -From 02eed0f8f2748fd7579f69e5373445b52b2b8754 Mon Sep 17 00:00:00 2001
> -From: AKASHI Takahiro <takahiro.akashi@linaro.org>
> -Date: Mon, 17 Oct 2016 13:56:58 +0900
> -Subject: [PATCH 1/9] kexec: exntend the semantics of
> kexec_iomem_for_each_line
> -
> -The current kexec_iomem_for_each_line() counts up all the lines for which
> -a callback function returns zero(0) or positive, and otherwise it stops
> -further scanning.
> -This behavior is incovenient in some cases. For instance, on arm64, we
> want
> -to count up "System RAM" entries, but need to skip "reserved" entries.
> -
> -So this patch extends the semantics so that we will continue to scan
> -succeeding entries but not count lines for which a callback function
> -returns positive.
> -
> -The current users of kexec_iomem_for_each_line(), arm, sh and x86, will
> not
> -be affected by this change because
> -* arm
> -  The callback function only returns -1 or 0, and the return value of
> -  kexec_iomem_for_each_line() will never be used.
> -* sh, x86
> -  The callback function may return (-1 for sh,) 0 or 1, but always returns
> -  1 once we have reached the maximum number of entries allowed.
> -  Even so the current kexec_iomem_for_each_line() counts them up.
> -  This change actually fixes this bug.
> -
> -Upstream-Status: Backport [https://git.linaro.org/
> people/takahiro.akashi/kexec-tools.git]
> -
> -Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> -Signed-off-by: He Zhe <zhe.he@windriver.com>
> ----
> - kexec/kexec-iomem.c | 15 ++++++++++-----
> - 1 file changed, 10 insertions(+), 5 deletions(-)
> -
> -diff --git a/kexec/kexec-iomem.c b/kexec/kexec-iomem.c
> -index 485a2e8..0a0277a 100644
> ---- a/kexec/kexec-iomem.c
> -+++ b/kexec/kexec-iomem.c
> -@@ -18,6 +18,9 @@
> -  * Iterate over each line in the file returned by proc_iomem(). If match
> is
> -  * NULL or if the line matches with our match-pattern then call the
> -  * callback if non-NULL.
> -+ * If match is NULL, callback should return a negative if error.
> -+ * Otherwise the interation goes on, incrementing nr but only if callback
> -+ * returns 0 (matched).
> -  *
> -  * Return the number of lines matched.
> -  */
> -@@ -37,7 +40,7 @@ int kexec_iomem_for_each_line(char *match,
> -       char *str;
> -       int consumed;
> -       int count;
> --      int nr = 0;
> -+      int nr = 0, ret;
> -
> -       fp = fopen(iomem, "r");
> -       if (!fp)
> -@@ -50,11 +53,13 @@ int kexec_iomem_for_each_line(char *match,
> -               str = line + consumed;
> -               size = end - start + 1;
> -               if (!match || memcmp(str, match, strlen(match)) == 0) {
> --                      if (callback
> --                          && callback(data, nr, str, start, size) < 0) {
> --                              break;
> -+                      if (callback) {
> -+                              ret = callback(data, nr, str, start, size);
> -+                              if (ret < 0)
> -+                                      break;
> -+                              else if (ret == 0)
> -+                                      nr++;
> -                       }
> --                      nr++;
> -               }
> -       }
> -
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-vmcore-dmesg-Define-_GNU_SOURCE.patch
> b/meta/recipes-kernel/kexec/kexec-tools/0001-vmcore-dmesg-
> Define-_GNU_SOURCE.patch
> deleted file mode 100644
> index 90c2f6e..0000000
> --- a/meta/recipes-kernel/kexec/kexec-tools/0001-vmcore-dmesg-
> Define-_GNU_SOURCE.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From d811875a41b4628040abaada3da29b7b9592e757 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Sat, 9 Jan 2016 17:16:16 -0800
> -Subject: [PATCH] vmcore-dmesg: Define _GNU_SOURCE
> -
> -loff_t is guarded with _GNU_SOURCE on some C library implementations
> -e.g. musl since this type is not defined by POSIX. Define _GNU_SOURCE to
> -include this define, it should help compiling on musl while nothing
> -changes for glibc based systems since there _GNU_SOURCE is already
> -defined
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ----
> -Upstream-Status: Submitted
> -
> - vmcore-dmesg/vmcore-dmesg.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/vmcore-dmesg/vmcore-dmesg.c b/vmcore-dmesg/vmcore-dmesg.c
> -index 0364636..a8f56df 100644
> ---- a/vmcore-dmesg/vmcore-dmesg.c
> -+++ b/vmcore-dmesg/vmcore-dmesg.c
> -@@ -1,4 +1,5 @@
> - #define _XOPEN_SOURCE 600
> -+#define _GNU_SOURCE
> - #define _LARGEFILE_SOURCE 1
> - #define _FILE_OFFSET_BITS 64
> - #include <endian.h>
> ---
> -2.7.0
> -
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/0001-x86-x86_64-
> Fix-format-warning-with-die.patch b/meta/recipes-kernel/kexec/
> kexec-tools/0001-x86-x86_64-Fix-format-warning-with-die.patch
> deleted file mode 100644
> index e601f52..0000000
> --- a/meta/recipes-kernel/kexec/kexec-tools/0001-x86-x86_64-
> Fix-format-warning-with-die.patch
> +++ /dev/null
> @@ -1,78 +0,0 @@
> -Upstream-Status: Backport
> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -
> -
> -From 1550f81bf1886aa0520da0b6181cd61c1a75d4ad Mon Sep 17 00:00:00 2001
> -From: Pratyush Anand <panand@redhat.com>
> -Date: Tue, 14 Mar 2017 17:59:22 +0530
> -Subject: [PATCH 1/2] x86/x86_64: Fix format warning with die()
> -
> -Fedora koji uses gcc version 7.0.1-0.12.fc27, and it generates a build
> -warning
> -
> -   kexec/arch/i386/kexec-elf-x86.c:299:3: error: format not a string
> -   literal and no format arguments [-Werror=format-security]
> -       die(error_msg);
> -       ^~~
> -    cc1: some warnings being treated as errors
> -
> -error_msg can have a format specifier as well in string. In such cases,
> -if there is no other arguments for the format variable then code will
> -try to access a non existing argument. Therefore, use 1st argument as
> -format specifier for string print and pass error_msg as the string to be
> -printed.
> -
> -While doing that,also use const qualifier before "char *error_msg".
> -
> -Signed-off-by: Pratyush Anand <panand@redhat.com>
> -Signed-off-by: Simon Horman <horms@verge.net.au>
> ----
> - kexec/arch/i386/kexec-elf-x86.c      | 4 ++--
> - kexec/arch/x86_64/kexec-elf-x86_64.c | 4 ++--
> - 2 files changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/kexec/arch/i386/kexec-elf-x86.c b/kexec/arch/i386/kexec-elf-
> x86.c
> -index de00dcb..fedf031 100644
> ---- a/kexec/arch/i386/kexec-elf-x86.c
> -+++ b/kexec/arch/i386/kexec-elf-x86.c
> -@@ -91,7 +91,7 @@ int elf_x86_load(int argc, char **argv, const char
> *buf, off_t len,
> -       char *command_line = NULL, *modified_cmdline = NULL;
> -       const char *append = NULL;
> -       char *tmp_cmdline = NULL;
> --      char *error_msg = NULL;
> -+      const char *error_msg = NULL;
> -       int result;
> -       int command_line_len;
> -       const char *ramdisk;
> -@@ -296,6 +296,6 @@ out:
> -       free(command_line);
> -       free(modified_cmdline);
> -       if (error_msg)
> --              die(error_msg);
> -+              die("%s", error_msg);
> -       return result;
> - }
> -diff --git a/kexec/arch/x86_64/kexec-elf-x86_64.c
> b/kexec/arch/x86_64/kexec-elf-x86_64.c
> -index ae65692..ad22311 100644
> ---- a/kexec/arch/x86_64/kexec-elf-x86_64.c
> -+++ b/kexec/arch/x86_64/kexec-elf-x86_64.c
> -@@ -99,7 +99,7 @@ int elf_x86_64_load(int argc, char **argv, const char
> *buf, off_t len,
> - #define ARG_STYLE_NONE  2
> -       int opt;
> -       int result = 0;
> --      char *error_msg = NULL;
> -+      const char *error_msg = NULL;
> -
> -       /* See options.h and add any new options there too! */
> -       static const struct option options[] = {
> -@@ -276,6 +276,6 @@ out:
> -       free(command_line);
> -       free(modified_cmdline);
> -       if (error_msg)
> --              die(error_msg);
> -+              die("%s", error_msg);
> -       return result;
> - }
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/0002-kexec-
> generalize-and-rename-get_kernel_stext_sym.patch
> b/meta/recipes-kernel/kexec/kexec-tools/0002-kexec-
> generalize-and-rename-get_kernel_stext_sym.patch
> deleted file mode 100644
> index 953f13b..0000000
> --- a/meta/recipes-kernel/kexec/kexec-tools/0002-kexec-
> generalize-and-rename-get_kernel_stext_sym.patch
> +++ /dev/null
> @@ -1,194 +0,0 @@
> -From d29f37bb6e9114aba96c606103b110f511bee9a1 Mon Sep 17 00:00:00 2001
> -From: Pratyush Anand <panand@redhat.com>
> -Date: Wed, 2 Nov 2016 15:05:25 +0530
> -Subject: [PATCH 2/9] kexec: generalize and rename get_kernel_stext_sym()
> -
> -get_kernel_stext_sym() has been defined for both arm and i386. Other
> -architecture might need some other kernel symbol address. Therefore
> rewrite
> -this function as generic function to get any kernel symbol address.
> -
> -More over, kallsyms is not arch specific representation, therefore have
> -common function for all arches.
> -
> -Upstream-Status: Backport [https://git.linaro.org/
> people/takahiro.akashi/kexec-tools.git]
> -
> -Signed-off-by: Pratyush Anand <panand@redhat.com>
> -[created symbols.c]
> -Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> -Signed-off-by: He Zhe <zhe.he@windriver.com>
> ----
> - kexec/Makefile                  |  1 +
> - kexec/arch/arm/crashdump-arm.c  | 40 +-----------------------------
> ----------
> - kexec/arch/i386/crashdump-x86.c | 29 -----------------------------
> - kexec/kexec.h                   |  2 ++
> - kexec/symbols.c                 | 41 ++++++++++++++++++++++++++++++
> +++++++++++
> - 5 files changed, 45 insertions(+), 68 deletions(-)
> - create mode 100644 kexec/symbols.c
> -
> -diff --git a/kexec/Makefile b/kexec/Makefile
> -index 39f365f..2b4fb3d 100644
> ---- a/kexec/Makefile
> -+++ b/kexec/Makefile
> -@@ -26,6 +26,7 @@ KEXEC_SRCS_base += kexec/kernel_version.c
> - KEXEC_SRCS_base += kexec/lzma.c
> - KEXEC_SRCS_base += kexec/zlib.c
> - KEXEC_SRCS_base += kexec/kexec-xen.c
> -+KEXEC_SRCS_base += kexec/symbols.c
> -
> - KEXEC_GENERATED_SRCS += $(PURGATORY_HEX_C)
> -
> -diff --git a/kexec/arch/arm/crashdump-arm.c b/kexec/arch/arm/crashdump-
> arm.c
> -index 4a89b5e..245c21a 100644
> ---- a/kexec/arch/arm/crashdump-arm.c
> -+++ b/kexec/arch/arm/crashdump-arm.c
> -@@ -73,48 +73,10 @@ static struct crash_elf_info elf_info = {
> -
> - extern unsigned long long user_page_offset;
> -
> --/* Retrieve kernel _stext symbol virtual address from /proc/kallsyms */
> --static unsigned long long get_kernel_stext_sym(void)
> --{
> --      const char *kallsyms = "/proc/kallsyms";
> --      const char *stext = "_stext";
> --      char sym[128];
> --      char line[128];
> --      FILE *fp;
> --      unsigned long long vaddr = 0;
> --      char type;
> --
> --      fp = fopen(kallsyms, "r");
> --      if (!fp) {
> --              fprintf(stderr, "Cannot open %s\n", kallsyms);
> --              return 0;
> --      }
> --
> --      while(fgets(line, sizeof(line), fp) != NULL) {
> --              unsigned long long addr;
> --
> --              if (sscanf(line, "%Lx %c %s", &addr, &type, sym) != 3)
> --                      continue;
> --
> --              if (strcmp(sym, stext) == 0) {
> --                      dbgprintf("kernel symbol %s vaddr = %#llx\n",
> stext, addr);
> --                      vaddr = addr;
> --                      break;
> --              }
> --      }
> --
> --      fclose(fp);
> --
> --      if (vaddr == 0)
> --              fprintf(stderr, "Cannot get kernel %s symbol address\n",
> stext);
> --
> --      return vaddr;
> --}
> --
> - static int get_kernel_page_offset(struct kexec_info *info,
> -               struct crash_elf_info *elf_info)
> - {
> --      unsigned long long stext_sym_addr = get_kernel_stext_sym();
> -+      unsigned long long stext_sym_addr = get_kernel_sym("_stext");
> -       if (stext_sym_addr == 0) {
> -               if (user_page_offset != (-1ULL)) {
> -                       elf_info->page_offset = user_page_offset;
> -diff --git a/kexec/arch/i386/crashdump-x86.c b/kexec/arch/i386/crashdump-
> x86.c
> -index ab833d4..abf82a5 100644
> ---- a/kexec/arch/i386/crashdump-x86.c
> -+++ b/kexec/arch/i386/crashdump-x86.c
> -@@ -102,35 +102,6 @@ static int get_kernel_paddr(struct kexec_info
> *UNUSED(info),
> -       return -1;
> - }
> -
> --/* Retrieve kernel symbol virtual address from /proc/kallsyms */
> --static unsigned long long get_kernel_sym(const char *symbol)
> --{
> --      const char *kallsyms = "/proc/kallsyms";
> --      char sym[128];
> --      char line[128];
> --      FILE *fp;
> --      unsigned long long vaddr;
> --      char type;
> --
> --      fp = fopen(kallsyms, "r");
> --      if (!fp) {
> --              fprintf(stderr, "Cannot open %s\n", kallsyms);
> --              return 0;
> --      }
> --
> --      while(fgets(line, sizeof(line), fp) != NULL) {
> --              if (sscanf(line, "%Lx %c %s", &vaddr, &type, sym) != 3)
> --                      continue;
> --              if (strcmp(sym, symbol) == 0) {
> --                      dbgprintf("kernel symbol %s vaddr = %16llx\n",
> symbol, vaddr);
> --                      return vaddr;
> --              }
> --      }
> --
> --      fprintf(stderr, "Cannot get kernel %s symbol address\n", symbol);
> --      return 0;
> --}
> --
> - /* Retrieve info regarding virtual address kernel has been compiled for
> and
> -  * size of the kernel from /proc/kcore. Current /proc/kcore parsing from
> -  * from kexec-tools fails because of malformed elf notes. A kernel patch
> has
> -diff --git a/kexec/kexec.h b/kexec/kexec.h
> -index 9194f1c..b4fafad 100644
> ---- a/kexec/kexec.h
> -+++ b/kexec/kexec.h
> -@@ -312,4 +312,6 @@ int xen_kexec_load(struct kexec_info *info);
> - int xen_kexec_unload(uint64_t kexec_flags);
> - void xen_kexec_exec(void);
> -
> -+extern unsigned long long get_kernel_sym(const char *text);
> -+
> - #endif /* KEXEC_H */
> -diff --git a/kexec/symbols.c b/kexec/symbols.c
> -new file mode 100644
> -index 0000000..ea6e327
> ---- /dev/null
> -+++ b/kexec/symbols.c
> -@@ -0,0 +1,41 @@
> -+#include <stdio.h>
> -+#include <string.h>
> -+#include "kexec.h"
> -+
> -+/* Retrieve kernel symbol virtual address from /proc/kallsyms */
> -+unsigned long long get_kernel_sym(const char *text)
> -+{
> -+      const char *kallsyms = "/proc/kallsyms";
> -+      char sym[128];
> -+      char line[128];
> -+      FILE *fp;
> -+      unsigned long long vaddr = 0;
> -+      char type;
> -+
> -+      fp = fopen(kallsyms, "r");
> -+      if (!fp) {
> -+              fprintf(stderr, "Cannot open %s\n", kallsyms);
> -+              return 0;
> -+      }
> -+
> -+      while (fgets(line, sizeof(line), fp) != NULL) {
> -+              unsigned long long addr;
> -+
> -+              if (sscanf(line, "%Lx %c %s", &addr, &type, sym) != 3)
> -+                      continue;
> -+
> -+              if (strcmp(sym, text) == 0) {
> -+                      dbgprintf("kernel symbol %s vaddr = %#llx\n",
> -+                                                              text,
> addr);
> -+                      vaddr = addr;
> -+                      break;
> -+              }
> -+      }
> -+
> -+      fclose(fp);
> -+
> -+      if (vaddr == 0)
> -+              fprintf(stderr, "Cannot get kernel %s symbol address\n",
> text);
> -+
> -+      return vaddr;
> -+}
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/0002-ppc-Fix-format-warning-with-die.patch
> b/meta/recipes-kernel/kexec/kexec-tools/0002-ppc-Fix-
> format-warning-with-die.patch
> deleted file mode 100644
> index 6a1c06d..0000000
> --- a/meta/recipes-kernel/kexec/kexec-tools/0002-ppc-Fix-
> format-warning-with-die.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 1c956fc8c6b6324d8d38bba5f9e60a018051c6f5 Mon Sep 17 00:00:00 2001
> -From: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -Date: Thu, 16 Mar 2017 15:39:06 +0200
> -Subject: [PATCH 2/2] ppc: Fix format warning with die()
> -
> -Enable compiling kexec-tools for ppc with -Werror=format-security.
> -
> -Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> -Upstream-Status: Submitted [Mailing list]
> ----
> - kexec/arch/ppc/kexec-elf-ppc.c    | 2 +-
> - kexec/arch/ppc/kexec-uImage-ppc.c | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/kexec/arch/ppc/kexec-elf-ppc.c b/kexec/arch/ppc/kexec-elf-
> ppc.c
> -index 291f06d..ad43ad1 100644
> ---- a/kexec/arch/ppc/kexec-elf-ppc.c
> -+++ b/kexec/arch/ppc/kexec-elf-ppc.c
> -@@ -453,7 +453,7 @@ out:
> -       if (!tmp_cmdline)
> -               free(command_line);
> -       if (error_msg)
> --              die(error_msg);
> -+              die("%s", error_msg);
> -
> -       return result;
> - }
> -diff --git a/kexec/arch/ppc/kexec-uImage-ppc.c
> b/kexec/arch/ppc/kexec-uImage-ppc.c
> -index 5eec6e4..e8f7adc 100644
> ---- a/kexec/arch/ppc/kexec-uImage-ppc.c
> -+++ b/kexec/arch/ppc/kexec-uImage-ppc.c
> -@@ -306,7 +306,7 @@ out:
> -       if (!tmp_cmdline)
> -               free(command_line);
> -       if (error_msg)
> --              die(error_msg);
> -+              die("%s", error_msg);
> -       return ret;
> - }
> -
> ---
> -2.11.0
> -
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/0003-arm64-
> identify-PHYS_OFFSET-correctly.patch b/meta/recipes-kernel/kexec/
> kexec-tools/0003-arm64-identify-PHYS_OFFSET-correctly.patch
> deleted file mode 100644
> index 1a1c317..0000000
> --- a/meta/recipes-kernel/kexec/kexec-tools/0003-arm64-
> identify-PHYS_OFFSET-correctly.patch
> +++ /dev/null
> @@ -1,76 +0,0 @@
> -From 16df170ad4808d12acd5e919ac4f6e7f33a247b3 Mon Sep 17 00:00:00 2001
> -From: AKASHI Takahiro <takahiro.akashi@linaro.org>
> -Date: Thu, 1 Sep 2016 10:57:42 +0900
> -Subject: [PATCH 3/9] arm64: identify PHYS_OFFSET correctly
> -
> -Due to the kernel patch, commit e7cd190385d1 ("arm64: mark reserved
> -memblock regions explicitly in iomem"), the current code will not be able
> -to identify the correct value of PHYS_OFFSET if some "reserved" memory
> -region, which is likely to be UEFI runtime services code/data, exists at
> -an address below the first "System RAM" regions.
> -
> -This patch fixes this issue.
> -
> -Upstream-Status: Backport [https://git.linaro.org/
> people/takahiro.akashi/kexec-tools.git]
> -
> -Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> -Signed-off-by: He Zhe <zhe.he@windriver.com>
> ----
> - kexec/arch/arm64/iomem.h       |  7 +++++++
> - kexec/arch/arm64/kexec-arm64.c | 12 ++++++++++--
> - 2 files changed, 17 insertions(+), 2 deletions(-)
> - create mode 100644 kexec/arch/arm64/iomem.h
> -
> -diff --git a/kexec/arch/arm64/iomem.h b/kexec/arch/arm64/iomem.h
> -new file mode 100644
> -index 0000000..7fd66eb
> ---- /dev/null
> -+++ b/kexec/arch/arm64/iomem.h
> -@@ -0,0 +1,7 @@
> -+#ifndef IOMEM_H
> -+#define IOMEM_H
> -+
> -+#define SYSTEM_RAM            "System RAM\n"
> -+#define IOMEM_RESERVED                "reserved\n"
> -+
> -+#endif
> -diff --git a/kexec/arch/arm64/kexec-arm64.c b/kexec/arch/arm64/kexec-
> arm64.c
> -index 2e8839a..8ac811d 100644
> ---- a/kexec/arch/arm64/kexec-arm64.c
> -+++ b/kexec/arch/arm64/kexec-arm64.c
> -@@ -21,6 +21,7 @@
> - #include "crashdump-arm64.h"
> - #include "dt-ops.h"
> - #include "fs2dt.h"
> -+#include "iomem.h"
> - #include "kexec-syscall.h"
> - #include "arch/options.h"
> -
> -@@ -475,7 +476,14 @@ static int get_memory_ranges_iomem_cb(void *data,
> int nr, char *str,
> -               return -1;
> -
> -       r = (struct memory_range *)data + nr;
> --      r->type = RANGE_RAM;
> -+
> -+      if (!strncmp(str, SYSTEM_RAM, strlen(SYSTEM_RAM)))
> -+              r->type = RANGE_RAM;
> -+      else if (!strncmp(str, IOMEM_RESERVED, strlen(IOMEM_RESERVED)))
> -+              r->type = RANGE_RESERVED;
> -+      else
> -+              return 1;
> -+
> -       r->start = base;
> -       r->end = base + length - 1;
> -
> -@@ -494,7 +502,7 @@ static int get_memory_ranges_iomem_cb(void *data,
> int nr, char *str,
> - static int get_memory_ranges_iomem(struct memory_range *array,
> -       unsigned int *count)
> - {
> --      *count = kexec_iomem_for_each_line("System RAM\n",
> -+      *count = kexec_iomem_for_each_line(NULL,
> -               get_memory_ranges_iomem_cb, array);
> -
> -       if (!*count) {
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/0004-arm64-kdump-identify-memory-regions.patch
> b/meta/recipes-kernel/kexec/kexec-tools/0004-arm64-kdump-
> identify-memory-regions.patch
> deleted file mode 100644
> index 66600f3..0000000
> --- a/meta/recipes-kernel/kexec/kexec-tools/0004-arm64-kdump-
> identify-memory-regions.patch
> +++ /dev/null
> @@ -1,202 +0,0 @@
> -From 48a4c7874d8264ddbfaec2e9858d7866a2d2eb60 Mon Sep 17 00:00:00 2001
> -From: AKASHI Takahiro <takahiro.akashi@linaro.org>
> -Date: Wed, 5 Aug 2015 13:16:30 +0900
> -Subject: [PATCH 4/9] arm64: kdump: identify memory regions
> -
> -The following regions need to be identified for later use:
> - a) memory regions which belong to the 1st kernel
> - b) usable memory reserved for crash dump kernel
> -
> -We go through /proc/iomem to find out a) and b) which are marked
> -as "System RAM" and "Crash kernel", respectively.
> -
> -Upstream-Status: Backport [https://git.linaro.org/
> people/takahiro.akashi/kexec-tools.git]
> -
> -Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> -Signed-off-by: He Zhe <zhe.he@windriver.com>
> ----
> - kexec/arch/arm64/Makefile          |   2 +
> - kexec/arch/arm64/crashdump-arm64.c | 100 ++++++++++++++++++++++++++++++
> ++++++-
> - kexec/arch/arm64/crashdump-arm64.h |  14 +++++-
> - kexec/arch/arm64/iomem.h           |   1 +
> - 4 files changed, 114 insertions(+), 3 deletions(-)
> -
> -diff --git a/kexec/arch/arm64/Makefile b/kexec/arch/arm64/Makefile
> -index 74b677f..2d4ae0e 100644
> ---- a/kexec/arch/arm64/Makefile
> -+++ b/kexec/arch/arm64/Makefile
> -@@ -6,6 +6,8 @@ arm64_FS2DT_INCLUDE += \
> -
> - arm64_DT_OPS += kexec/dt-ops.c
> -
> -+arm64_MEM_REGIONS = kexec/mem_regions.c
> -+
> - arm64_CPPFLAGS += -I $(srcdir)/kexec/
> -
> - arm64_KEXEC_SRCS += \
> -diff --git a/kexec/arch/arm64/crashdump-arm64.c
> b/kexec/arch/arm64/crashdump-arm64.c
> -index d2272c8..dcaca43 100644
> ---- a/kexec/arch/arm64/crashdump-arm64.c
> -+++ b/kexec/arch/arm64/crashdump-arm64.c
> -@@ -1,5 +1,13 @@
> - /*
> -  * ARM64 crashdump.
> -+ *     partly derived from arm implementation
> -+ *
> -+ * Copyright (c) 2014-2016 Linaro Limited
> -+ * Author: AKASHI Takahiro <takahiro.akashi@linaro.org>
> -+ *
> -+ * This program is free software; you can redistribute it and/or modify
> -+ * it under the terms of the GNU General Public License version 2 as
> -+ * published by the Free Software Foundation.
> -  */
> -
> - #define _GNU_SOURCE
> -@@ -10,12 +18,102 @@
> - #include "kexec.h"
> - #include "crashdump.h"
> - #include "crashdump-arm64.h"
> -+#include "iomem.h"
> - #include "kexec-arm64.h"
> - #include "kexec-elf.h"
> -+#include "mem_regions.h"
> -
> --struct memory_ranges usablemem_rgns = {};
> -+/* memory ranges on crashed kernel */
> -+static struct memory_range crash_memory_ranges[CRASH_MAX_MEMORY_RANGES];
> -+static struct memory_ranges crash_memory_rgns = {
> -+      .size = 0,
> -+      .max_size = CRASH_MAX_MEMORY_RANGES,
> -+      .ranges = crash_memory_ranges,
> -+};
> -+
> -+/* memory range reserved for crashkernel */
> -+struct memory_range crash_reserved_mem;
> -+struct memory_ranges usablemem_rgns = {
> -+      .size = 0,
> -+      .max_size = 1,
> -+      .ranges = &crash_reserved_mem,
> -+};
> -+
> -+/*
> -+ * iomem_range_callback() - callback called for each iomem region
> -+ * @data: not used
> -+ * @nr: not used
> -+ * @str: name of the memory region
> -+ * @base: start address of the memory region
> -+ * @length: size of the memory region
> -+ *
> -+ * This function is called once for each memory region found in
> /proc/iomem.
> -+ * It locates system RAM and crashkernel reserved memory and places
> these to
> -+ * variables, respectively, crash_memory_ranges and crash_reserved_mem.
> -+ */
> -+
> -+static int iomem_range_callback(void *UNUSED(data), int UNUSED(nr),
> -+                              char *str, unsigned long long base,
> -+                              unsigned long long length)
> -+{
> -+      if (strncmp(str, CRASH_KERNEL, strlen(CRASH_KERNEL)) == 0)
> -+              return mem_regions_add(&usablemem_rgns,
> -+                                     base, length, RANGE_RAM);
> -+      else if (strncmp(str, SYSTEM_RAM, strlen(SYSTEM_RAM)) == 0)
> -+              return mem_regions_add(&crash_memory_rgns,
> -+                                     base, length, RANGE_RAM);
> -+
> -+      return 0;
> -+}
> -
> - int is_crashkernel_mem_reserved(void)
> - {
> -+      if (!crash_reserved_mem.end)
> -+              kexec_iomem_for_each_line(NULL, iomem_range_callback,
> NULL);
> -+
> -+      return crash_reserved_mem.start != crash_reserved_mem.end;
> -+}
> -+
> -+/*
> -+ * crash_get_memory_ranges() - read system physical memory
> -+ *
> -+ * Function reads through system physical memory and stores found memory
> -+ * regions in crash_memory_ranges.
> -+ * Regions are sorted in ascending order.
> -+ *
> -+ * Returns 0 in case of success and -1 otherwise (errno is set).
> -+ */
> -+static int crash_get_memory_ranges(void)
> -+{
> -+      /*
> -+       * First read all memory regions that can be considered as
> -+       * system memory including the crash area.
> -+       */
> -+      if (!usablemem_rgns.size)
> -+              kexec_iomem_for_each_line(NULL, iomem_range_callback,
> NULL);
> -+
> -+      /* allow only a single region for crash dump kernel */
> -+      if (usablemem_rgns.size != 1) {
> -+              errno = EINVAL;
> -+              return -1;
> -+      }
> -+
> -+      dbgprint_mem_range("Reserved memory range", &crash_reserved_mem,
> 1);
> -+
> -+      if (mem_regions_exclude(&crash_memory_rgns, &crash_reserved_mem))
> {
> -+              fprintf(stderr,
> -+                      "Error: Number of crash memory ranges excedeed the
> max limit\n");
> -+              errno = ENOMEM;
> -+              return -1;
> -+      }
> -+
> -+      /*
> -+       * Make sure that the memory regions are sorted.
> -+       */
> -+      mem_regions_sort(&crash_memory_rgns);
> -+
> -+      dbgprint_mem_range("Coredump memory ranges",
> -+                         crash_memory_rgns.ranges,
> crash_memory_rgns.size);
> -+
> -       return 0;
> - }
> -diff --git a/kexec/arch/arm64/crashdump-arm64.h
> b/kexec/arch/arm64/crashdump-arm64.h
> -index f33c7a2..07a0ed0 100644
> ---- a/kexec/arch/arm64/crashdump-arm64.h
> -+++ b/kexec/arch/arm64/crashdump-arm64.h
> -@@ -1,12 +1,22 @@
> - /*
> -  * ARM64 crashdump.
> -+ *
> -+ * Copyright (c) 2014-2016 Linaro Limited
> -+ * Author: AKASHI Takahiro <takahiro.akashi@linaro.org>
> -+ *
> -+ * This program is free software; you can redistribute it and/or modify
> -+ * it under the terms of the GNU General Public License version 2 as
> -+ * published by the Free Software Foundation.
> -  */
> -
> --#if !defined(CRASHDUMP_ARM64_H)
> -+#ifndef CRASHDUMP_ARM64_H
> - #define CRASHDUMP_ARM64_H
> -
> - #include "kexec.h"
> -
> -+#define CRASH_MAX_MEMORY_RANGES       32
> -+
> - extern struct memory_ranges usablemem_rgns;
> -+extern struct memory_range crash_reserved_mem;
> -
> --#endif
> -+#endif /* CRASHDUMP_ARM64_H */
> -diff --git a/kexec/arch/arm64/iomem.h b/kexec/arch/arm64/iomem.h
> -index 7fd66eb..20cda87 100644
> ---- a/kexec/arch/arm64/iomem.h
> -+++ b/kexec/arch/arm64/iomem.h
> -@@ -2,6 +2,7 @@
> - #define IOMEM_H
> -
> - #define SYSTEM_RAM            "System RAM\n"
> -+#define CRASH_KERNEL          "Crash kernel\n"
> - #define IOMEM_RESERVED                "reserved\n"
> -
> - #endif
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/0005-arm64-kdump-
> add-elf-core-header-segment.patch b/meta/recipes-kernel/kexec/
> kexec-tools/0005-arm64-kdump-add-elf-core-header-segment.patch
> deleted file mode 100644
> index fe535b6..0000000
> --- a/meta/recipes-kernel/kexec/kexec-tools/0005-arm64-kdump-
> add-elf-core-header-segment.patch
> +++ /dev/null
> @@ -1,191 +0,0 @@
> -From 769da25627cebb2a53caee5d5be78a32d376adc1 Mon Sep 17 00:00:00 2001
> -From: AKASHI Takahiro <takahiro.akashi@linaro.org>
> -Date: Wed, 5 Aug 2015 13:45:15 +0900
> -Subject: [PATCH 5/9] arm64: kdump: add elf core header segment
> -
> -Elf core header contains the information necessary for the coredump of
> -the 1st kernel, including its physcal memory layout as well as cpu
> register
> -states at the panic.
> -The segment is allocated inside the reserved memory of crash dump kernel.
> -
> -Upstream-Status: Backport [https://git.linaro.org/
> people/takahiro.akashi/kexec-tools.git]
> -
> -Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> -Signed-off-by: He Zhe <zhe.he@windriver.com>
> ----
> - kexec/arch/arm64/crashdump-arm64.c | 96 ++++++++++++++++++++++++++++++
> ++++++++
> - kexec/arch/arm64/crashdump-arm64.h |  3 ++
> - kexec/arch/arm64/iomem.h           |  2 +
> - kexec/arch/arm64/kexec-elf-arm64.c | 10 ++++
> - 4 files changed, 111 insertions(+)
> -
> -diff --git a/kexec/arch/arm64/crashdump-arm64.c
> b/kexec/arch/arm64/crashdump-arm64.c
> -index dcaca43..8346131 100644
> ---- a/kexec/arch/arm64/crashdump-arm64.c
> -+++ b/kexec/arch/arm64/crashdump-arm64.c
> -@@ -39,6 +39,39 @@ struct memory_ranges usablemem_rgns = {
> -       .ranges = &crash_reserved_mem,
> - };
> -
> -+struct memory_range elfcorehdr_mem;
> -+
> -+static struct crash_elf_info elf_info = {
> -+      .class          = ELFCLASS64,
> -+#if (__BYTE_ORDER == __LITTLE_ENDIAN)
> -+      .data           = ELFDATA2LSB,
> -+#else
> -+      .data           = ELFDATA2MSB,
> -+#endif
> -+      .machine        = EM_AARCH64,
> -+};
> -+
> -+/*
> -+ * Note: The returned value is correct only if !CONFIG_RANDOMIZE_BASE.
> -+ */
> -+static uint64_t get_kernel_page_offset(void)
> -+{
> -+      int i;
> -+
> -+      if (elf_info.kern_vaddr_start == UINT64_MAX)
> -+              return UINT64_MAX;
> -+
> -+      /* Current max virtual memory range is 48-bits. */
> -+      for (i = 48; i > 0; i--)
> -+              if (!(elf_info.kern_vaddr_start & (1UL << i)))
> -+                      break;
> -+
> -+      if (i <= 0)
> -+              return UINT64_MAX;
> -+      else
> -+              return UINT64_MAX << i;
> -+}
> -+
> - /*
> -  * iomem_range_callback() - callback called for each iomem region
> -  * @data: not used
> -@@ -62,6 +95,10 @@ static int iomem_range_callback(void *UNUSED(data),
> int UNUSED(nr),
> -       else if (strncmp(str, SYSTEM_RAM, strlen(SYSTEM_RAM)) == 0)
> -               return mem_regions_add(&crash_memory_rgns,
> -                                      base, length, RANGE_RAM);
> -+      else if (strncmp(str, KERNEL_CODE, strlen(KERNEL_CODE)) == 0)
> -+              elf_info.kern_paddr_start = base;
> -+      else if (strncmp(str, KERNEL_DATA, strlen(KERNEL_DATA)) == 0)
> -+              elf_info.kern_size = base + length -
> elf_info.kern_paddr_start;
> -
> -       return 0;
> - }
> -@@ -115,5 +152,64 @@ static int crash_get_memory_ranges(void)
> -       dbgprint_mem_range("Coredump memory ranges",
> -                          crash_memory_rgns.ranges,
> crash_memory_rgns.size);
> -
> -+      /*
> -+       * For additional kernel code/data segment.
> -+       * kern_paddr_start/kern_size are determined in
> iomem_range_callback
> -+       */
> -+      elf_info.kern_vaddr_start = get_kernel_sym("_text");
> -+      if (!elf_info.kern_vaddr_start)
> -+              elf_info.kern_vaddr_start = UINT64_MAX;
> -+
> -+      return 0;
> -+}
> -+
> -+/*
> -+ * load_crashdump_segments() - load the elf core header
> -+ * @info: kexec info structure
> -+ *
> -+ * This function creates and loads an additional segment of elf core
> header
> -+ : which is used to construct /proc/vmcore on crash dump kernel.
> -+ *
> -+ * Return 0 in case of success and -1 in case of error.
> -+ */
> -+
> -+int load_crashdump_segments(struct kexec_info *info)
> -+{
> -+      unsigned long elfcorehdr;
> -+      unsigned long bufsz;
> -+      void *buf;
> -+      int err;
> -+
> -+      /*
> -+       * First fetch all the memory (RAM) ranges that we are going to
> -+       * pass to the crash dump kernel during panic.
> -+       */
> -+
> -+      err = crash_get_memory_ranges();
> -+
> -+      if (err)
> -+              return err;
> -+
> -+      elf_info.page_offset = get_kernel_page_offset();
> -+      dbgprintf("%s: page_offset:   %016llx\n", __func__,
> -+                      elf_info.page_offset);
> -+
> -+      err = crash_create_elf64_headers(info, &elf_info,
> -+                      crash_memory_rgns.ranges, crash_memory_rgns.size,
> -+                      &buf, &bufsz, ELF_CORE_HEADER_ALIGN);
> -+
> -+      if (err)
> -+              return err;
> -+
> -+      elfcorehdr = add_buffer_phys_virt(info, buf, bufsz, bufsz, 0,
> -+              crash_reserved_mem.start, crash_reserved_mem.end,
> -+              -1, 0);
> -+
> -+      elfcorehdr_mem.start = elfcorehdr;
> -+      elfcorehdr_mem.end = elfcorehdr + bufsz - 1;
> -+
> -+      dbgprintf("%s: elfcorehdr 0x%llx-0x%llx\n", __func__,
> -+                      elfcorehdr_mem.start, elfcorehdr_mem.end);
> -+
> -       return 0;
> - }
> -diff --git a/kexec/arch/arm64/crashdump-arm64.h
> b/kexec/arch/arm64/crashdump-arm64.h
> -index 07a0ed0..da75a2d 100644
> ---- a/kexec/arch/arm64/crashdump-arm64.h
> -+++ b/kexec/arch/arm64/crashdump-arm64.h
> -@@ -18,5 +18,8 @@
> -
> - extern struct memory_ranges usablemem_rgns;
> - extern struct memory_range crash_reserved_mem;
> -+extern struct memory_range elfcorehdr_mem;
> -+
> -+extern int load_crashdump_segments(struct kexec_info *info);
> -
> - #endif /* CRASHDUMP_ARM64_H */
> -diff --git a/kexec/arch/arm64/iomem.h b/kexec/arch/arm64/iomem.h
> -index 20cda87..d4864bb 100644
> ---- a/kexec/arch/arm64/iomem.h
> -+++ b/kexec/arch/arm64/iomem.h
> -@@ -2,6 +2,8 @@
> - #define IOMEM_H
> -
> - #define SYSTEM_RAM            "System RAM\n"
> -+#define KERNEL_CODE           "Kernel code\n"
> -+#define KERNEL_DATA           "Kernel data\n"
> - #define CRASH_KERNEL          "Crash kernel\n"
> - #define IOMEM_RESERVED                "reserved\n"
> -
> -diff --git a/kexec/arch/arm64/kexec-elf-arm64.c
> b/kexec/arch/arm64/kexec-elf-arm64.c
> -index daf8bf0..c70a37a 100644
> ---- a/kexec/arch/arm64/kexec-elf-arm64.c
> -+++ b/kexec/arch/arm64/kexec-elf-arm64.c
> -@@ -119,6 +119,16 @@ int elf_arm64_load(int argc, char **argv, const char
> *kernel_buf,
> -       dbgprintf("%s: PE format:      %s\n", __func__,
> -               (arm64_header_check_pe_sig(header) ? "yes" : "no"));
> -
> -+      if (info->kexec_flags & KEXEC_ON_CRASH) {
> -+              /* create and initialize elf core header segment */
> -+              result = load_crashdump_segments(info);
> -+              if (result) {
> -+                      dbgprintf("%s: Creating eflcorehdr failed.\n",
> -+                                                              __func__);
> -+                      goto exit;
> -+              }
> -+      }
> -+
> -       /* load the kernel */
> -       result = elf_exec_load(&ehdr, info);
> -
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/0006-arm64-kdump-
> set-up-kernel-image-segment.patch b/meta/recipes-kernel/kexec/
> kexec-tools/0006-arm64-kdump-set-up-kernel-image-segment.patch
> deleted file mode 100644
> index 4149551..0000000
> --- a/meta/recipes-kernel/kexec/kexec-tools/0006-arm64-kdump-
> set-up-kernel-image-segment.patch
> +++ /dev/null
> @@ -1,137 +0,0 @@
> -From 4079c93ac5453ef5f7889ab64920c1e9427690ef Mon Sep 17 00:00:00 2001
> -From: AKASHI Takahiro <takahiro.akashi@linaro.org>
> -Date: Tue, 17 Feb 2015 16:06:55 +0900
> -Subject: [PATCH 6/9] arm64: kdump: set up kernel image segment
> -
> -On arm64, we can use the same kernel image as 1st kernel, but
> -we have to modify the entry point as well as segments' addresses
> -in the kernel's elf header in order to load them into correct places.
> -
> -Upstream-Status: Backport [https://git.linaro.org/
> people/takahiro.akashi/kexec-tools.git]
> -
> -Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> -Signed-off-by: He Zhe <zhe.he@windriver.com>
> ----
> - kexec/arch/arm64/crashdump-arm64.c | 23 +++++++++++++++++++++++
> - kexec/arch/arm64/crashdump-arm64.h |  1 +
> - kexec/arch/arm64/kexec-arm64.c     | 25 ++++++++++++++++++++-----
> - kexec/arch/arm64/kexec-elf-arm64.c | 10 +++++++++-
> - 4 files changed, 53 insertions(+), 6 deletions(-)
> -
> -diff --git a/kexec/arch/arm64/crashdump-arm64.c
> b/kexec/arch/arm64/crashdump-arm64.c
> -index 8346131..9517329 100644
> ---- a/kexec/arch/arm64/crashdump-arm64.c
> -+++ b/kexec/arch/arm64/crashdump-arm64.c
> -@@ -213,3 +213,26 @@ int load_crashdump_segments(struct kexec_info *info)
> -
> -       return 0;
> - }
> -+
> -+/*
> -+ * e_entry and p_paddr are actually in virtual address space.
> -+ * Those values will be translated to physcal addresses by
> -+ * using virt_to_phys().
> -+ * So let's get ready for later use so the memory base (phys_offset)
> -+ * will be correctly replaced with crash_reserved_mem.start.
> -+ */
> -+void modify_ehdr_for_crashdump(struct mem_ehdr *ehdr)
> -+{
> -+      struct mem_phdr *phdr;
> -+      int i;
> -+
> -+      ehdr->e_entry += - arm64_mem.phys_offset +
> crash_reserved_mem.start;
> -+
> -+      for (i = 0; i < ehdr->e_phnum; i++) {
> -+              phdr = &ehdr->e_phdr[i];
> -+              if (phdr->p_type != PT_LOAD)
> -+                      continue;
> -+              phdr->p_paddr +=
> -+                      (-arm64_mem.phys_offset +
> crash_reserved_mem.start);
> -+      }
> -+}
> -diff --git a/kexec/arch/arm64/crashdump-arm64.h
> b/kexec/arch/arm64/crashdump-arm64.h
> -index da75a2d..382f571 100644
> ---- a/kexec/arch/arm64/crashdump-arm64.h
> -+++ b/kexec/arch/arm64/crashdump-arm64.h
> -@@ -21,5 +21,6 @@ extern struct memory_range crash_reserved_mem;
> - extern struct memory_range elfcorehdr_mem;
> -
> - extern int load_crashdump_segments(struct kexec_info *info);
> -+extern void modify_ehdr_for_crashdump(struct mem_ehdr *ehdr);
> -
> - #endif /* CRASHDUMP_ARM64_H */
> -diff --git a/kexec/arch/arm64/kexec-arm64.c b/kexec/arch/arm64/kexec-
> arm64.c
> -index 8ac811d..cec4e41 100644
> ---- a/kexec/arch/arm64/kexec-arm64.c
> -+++ b/kexec/arch/arm64/kexec-arm64.c
> -@@ -307,12 +307,27 @@ unsigned long arm64_locate_kernel_segment(struct
> kexec_info *info)
> - {
> -       unsigned long hole;
> -
> --      hole = locate_hole(info,
> --              arm64_mem.text_offset + arm64_mem.image_size,
> --              MiB(2), 0, ULONG_MAX, 1);
> -+      if (info->kexec_flags & KEXEC_ON_CRASH) {
> -+              unsigned long hole_end;
> -+
> -+              hole = (crash_reserved_mem.start < mem_min ?
> -+                              mem_min : crash_reserved_mem.start);
> -+              hole = _ALIGN_UP(hole, MiB(2));
> -+              hole_end = hole + arm64_mem.text_offset +
> arm64_mem.image_size;
> -+
> -+              if ((hole_end > mem_max) ||
> -+                  (hole_end > crash_reserved_mem.end)) {
> -+                      dbgprintf("%s: Crash kernel out of range\n",
> __func__);
> -+                      hole = ULONG_MAX;
> -+              }
> -+      } else {
> -+              hole = locate_hole(info,
> -+                      arm64_mem.text_offset + arm64_mem.image_size,
> -+                      MiB(2), 0, ULONG_MAX, 1);
> -
> --      if (hole == ULONG_MAX)
> --              dbgprintf("%s: locate_hole failed\n", __func__);
> -+              if (hole == ULONG_MAX)
> -+                      dbgprintf("%s: locate_hole failed\n", __func__);
> -+      }
> -
> -       return hole;
> - }
> -diff --git a/kexec/arch/arm64/kexec-elf-arm64.c
> b/kexec/arch/arm64/kexec-elf-arm64.c
> -index c70a37a..842ce21 100644
> ---- a/kexec/arch/arm64/kexec-elf-arm64.c
> -+++ b/kexec/arch/arm64/kexec-elf-arm64.c
> -@@ -9,6 +9,7 @@
> - #include <stdlib.h>
> - #include <linux/elf.h>
> -
> -+#include "crashdump-arm64.h"
> - #include "kexec-arm64.h"
> - #include "kexec-elf.h"
> - #include "kexec-syscall.h"
> -@@ -105,7 +106,8 @@ int elf_arm64_load(int argc, char **argv, const char
> *kernel_buf,
> -       }
> -
> -       arm64_mem.vp_offset = _ALIGN_DOWN(ehdr.e_entry, MiB(2));
> --      arm64_mem.vp_offset -= kernel_segment - get_phys_offset();
> -+      if (!(info->kexec_flags & KEXEC_ON_CRASH))
> -+              arm64_mem.vp_offset -= kernel_segment - get_phys_offset();
> -
> -       dbgprintf("%s: kernel_segment: %016lx\n", __func__,
> kernel_segment);
> -       dbgprintf("%s: text_offset:    %016lx\n", __func__,
> -@@ -127,6 +129,12 @@ int elf_arm64_load(int argc, char **argv, const char
> *kernel_buf,
> -                                                               __func__);
> -                       goto exit;
> -               }
> -+
> -+              /*
> -+               * offset addresses in order to fit vmlinux
> -+               * (elf_exec) into crash kernel's memory
> -+               */
> -+              modify_ehdr_for_crashdump(&ehdr);
> -       }
> -
> -       /* load the kernel */
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/0007-arm64-kdump-set-up-other-segments.patch
> b/meta/recipes-kernel/kexec/kexec-tools/0007-arm64-kdump-
> set-up-other-segments.patch
> deleted file mode 100644
> index 2745466..0000000
> --- a/meta/recipes-kernel/kexec/kexec-tools/0007-arm64-kdump-
> set-up-other-segments.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 07ad14e12665221d754fde8e47c32ac18c24586a Mon Sep 17 00:00:00 2001
> -From: AKASHI Takahiro <takahiro.akashi@linaro.org>
> -Date: Fri, 31 Jul 2015 20:01:39 +0900
> -Subject: [PATCH 7/9] arm64: kdump: set up other segments
> -
> -We make sure that all the other segments, initrd and device-tree blob,
> -also be loaded into the reserved memory of crash dump kernel.
> -
> -Upstream-Status: Backport [https://git.linaro.org/
> people/takahiro.akashi/kexec-tools.git]
> -
> -Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> -Signed-off-by: He Zhe <zhe.he@windriver.com>
> ----
> - kexec/arch/arm64/kexec-arm64.c | 5 ++++-
> - 1 file changed, 4 insertions(+), 1 deletion(-)
> -
> -diff --git a/kexec/arch/arm64/kexec-arm64.c b/kexec/arch/arm64/kexec-
> arm64.c
> -index cec4e41..78a0035 100644
> ---- a/kexec/arch/arm64/kexec-arm64.c
> -+++ b/kexec/arch/arm64/kexec-arm64.c
> -@@ -374,7 +374,10 @@ int arm64_load_other_segments(struct kexec_info
> *info,
> -       /* Put the other segments after the image. */
> -
> -       hole_min = image_base + arm64_mem.image_size;
> --      hole_max = ULONG_MAX;
> -+      if (info->kexec_flags & KEXEC_ON_CRASH)
> -+              hole_max = crash_reserved_mem.end;
> -+      else
> -+              hole_max = ULONG_MAX;
> -
> -       if (arm64_opts.initrd) {
> -               initrd_buf = slurp_file(arm64_opts.initrd, &initrd_size);
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/0008-arm64-kdump-
> add-DT-properties-to-crash-dump-kernel-s.patch
> b/meta/recipes-kernel/kexec/kexec-tools/0008-arm64-kdump-
> add-DT-properties-to-crash-dump-kernel-s.patch
> deleted file mode 100644
> index 31c3d85..0000000
> --- a/meta/recipes-kernel/kexec/kexec-tools/0008-arm64-kdump-
> add-DT-properties-to-crash-dump-kernel-s.patch
> +++ /dev/null
> @@ -1,150 +0,0 @@
> -From 23bf7ac189cc3b87ceb9d1d3b69b5c4815354add Mon Sep 17 00:00:00 2001
> -From: AKASHI Takahiro <takahiro.akashi@linaro.org>
> -Date: Wed, 27 Jan 2016 13:38:39 +0900
> -Subject: [PATCH 8/9] arm64: kdump: add DT properties to crash dump
> kernel's
> - dtb
> -
> -We pass the following properties to crash dump kernel:
> -linux,elfcorehdr: elf core header segment,
> -                 same as "elfcorehdr=" kernel parameter on other archs
> -linux,usable-memory-range: usable memory reserved for crash dump kernel
> -
> -Upstream-Status: Backport [https://git.linaro.org/
> people/takahiro.akashi/kexec-tools.git]
> -
> -Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> -Signed-off-by: He Zhe <zhe.he@windriver.com>
> ----
> - kexec/arch/arm64/kexec-arm64.c     | 76 ++++++++++++++++++++++++++++++
> +++++---
> - kexec/arch/arm64/kexec-elf-arm64.c |  5 ---
> - 2 files changed, 71 insertions(+), 10 deletions(-)
> -
> -diff --git a/kexec/arch/arm64/kexec-arm64.c b/kexec/arch/arm64/kexec-
> arm64.c
> -index 78a0035..a8fb64f 100644
> ---- a/kexec/arch/arm64/kexec-arm64.c
> -+++ b/kexec/arch/arm64/kexec-arm64.c
> -@@ -128,9 +128,6 @@ int arch_process_options(int argc, char **argv)
> -               case OPT_INITRD:
> -                       arm64_opts.initrd = optarg;
> -                       break;
> --              case OPT_PANIC:
> --                      die("load-panic (-p) not supported");
> --                      break;
> -               default:
> -                       break; /* Ignore core and unknown options. */
> -               }
> -@@ -285,8 +282,12 @@ on_success:
> -  * setup_2nd_dtb - Setup the 2nd stage kernel's dtb.
> -  */
> -
> --static int setup_2nd_dtb(struct dtb *dtb, char *command_line)
> -+static int setup_2nd_dtb(struct dtb *dtb, char *command_line, int
> on_crash)
> - {
> -+      char *new_buf;
> -+      int new_size;
> -+      int nodeoffset;
> -+      uint64_t range[2];
> -       int result;
> -
> -       result = fdt_check_header(dtb->buf);
> -@@ -298,8 +299,72 @@ static int setup_2nd_dtb(struct dtb *dtb, char
> *command_line)
> -
> -       result = set_bootargs(dtb, command_line);
> -
> -+      /* remove those anyway */
> -+      nodeoffset = fdt_path_offset(dtb->buf, "/chosen");
> -+      fdt_delprop(dtb->buf, nodeoffset, "linux,crashkernel-base");
> -+      fdt_delprop(dtb->buf, nodeoffset, "linux,crashkernel-size");
> -+
> -+      if (on_crash) {
> -+              nodeoffset = fdt_path_offset(dtb->buf, "/chosen");
> -+              fdt_delprop(dtb->buf, nodeoffset, "linux,elfcorehdr");
> -+              fdt_delprop(dtb->buf, nodeoffset,
> "linux,usable-memory-range");
> -+              new_size = fdt_totalsize(dtb->buf)
> -+                      + 2 * (sizeof(struct fdt_property)
> -+                                      + FDT_TAGALIGN(sizeof(range)))
> -+                      + strlen("linux,elfcorehdr") + 1
> -+                      + strlen("linux,usable-memory-range") + 1;
> -+
> -+              new_buf = xmalloc(new_size);
> -+              result = fdt_open_into(dtb->buf, new_buf, new_size);
> -+              if (result) {
> -+                      dbgprintf("%s: fdt_open_into failed: %s\n",
> __func__,
> -+                              fdt_strerror(result));
> -+                      result = -ENOSPC;
> -+                      goto on_error;
> -+              }
> -+
> -+              range[0] = cpu_to_be64(elfcorehdr_mem.start);
> -+              range[1] = cpu_to_be64(elfcorehdr_mem.end
> -+                              - elfcorehdr_mem.start + 1);
> -+              nodeoffset = fdt_path_offset(new_buf, "/chosen");
> -+              result = fdt_setprop(new_buf, nodeoffset,
> "linux,elfcorehdr",
> -+                              (void *)range, sizeof(range));
> -+              if (result) {
> -+                      dbgprintf("%s: fdt_setprop failed: %s\n", __func__,
> -+                              fdt_strerror(result));
> -+                      result = -EINVAL;
> -+                      goto on_error;
> -+              }
> -+
> -+              range[0] = cpu_to_be64(crash_reserved_mem.start);
> -+              range[1] = cpu_to_be64(crash_reserved_mem.end
> -+                              - crash_reserved_mem.start + 1);
> -+              nodeoffset = fdt_path_offset(new_buf, "/chosen");
> -+              result = fdt_setprop(new_buf, nodeoffset,
> -+                              "linux,usable-memory-range",
> -+                              (void *)range, sizeof(range));
> -+              if (result) {
> -+                      dbgprintf("%s: fdt_setprop failed: %s\n", __func__,
> -+                              fdt_strerror(result));
> -+                      result = -EINVAL;
> -+                      goto on_error;
> -+              }
> -+
> -+              fdt_pack(new_buf);
> -+              dtb->buf = new_buf;
> -+              dtb->size = fdt_totalsize(new_buf);
> -+      }
> -+
> -       dump_reservemap(dtb);
> -
> -+
> -+      return result;
> -+
> -+on_error:
> -+      fprintf(stderr, "kexec: %s failed.\n", __func__);
> -+      if (new_buf)
> -+              free(new_buf);
> -+
> -       return result;
> - }
> -
> -@@ -366,7 +431,8 @@ int arm64_load_other_segments(struct kexec_info
> *info,
> -               }
> -       }
> -
> --      result = setup_2nd_dtb(&dtb, command_line);
> -+      result = setup_2nd_dtb(&dtb, command_line,
> -+                      info->kexec_flags & KEXEC_ON_CRASH);
> -
> -       if (result)
> -               return -EFAILED;
> -diff --git a/kexec/arch/arm64/kexec-elf-arm64.c
> b/kexec/arch/arm64/kexec-elf-arm64.c
> -index 842ce21..b17a31a 100644
> ---- a/kexec/arch/arm64/kexec-elf-arm64.c
> -+++ b/kexec/arch/arm64/kexec-elf-arm64.c
> -@@ -47,11 +47,6 @@ int elf_arm64_load(int argc, char **argv, const char
> *kernel_buf,
> -       int result;
> -       int i;
> -
> --      if (info->kexec_flags & KEXEC_ON_CRASH) {
> --              fprintf(stderr, "kexec: kdump not yet supported on
> arm64\n");
> --              return -EFAILED;
> --      }
> --
> -       result = build_elf_exec_info(kernel_buf, kernel_size, &ehdr, 0);
> -
> -       if (result < 0) {
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-kernel/kexec/kexec-tools/0009-arm64-kdump-
> Add-support-for-binary-image-files.patch b/meta/recipes-kernel/kexec/
> kexec-tools/0009-arm64-kdump-Add-support-for-binary-image-files.patch
> deleted file mode 100644
> index 8b1c018..0000000
> --- a/meta/recipes-kernel/kexec/kexec-tools/0009-arm64-kdump-
> Add-support-for-binary-image-files.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From 5a4958f01a793c3e7f440f5bae75666a4349cc50 Mon Sep 17 00:00:00 2001
> -From: Pratyush Anand <panand@redhat.com>
> -Date: Thu, 14 May 2015 11:25:37 +0530
> -Subject: [PATCH 9/9] arm64: kdump: Add support for binary image files
> -
> -This patch adds support to use binary image ie arch/arm64/boot/Image with
> -kdump.
> -
> -Upstream-Status: Backport [https://git.linaro.org/
> people/takahiro.akashi/kexec-tools.git]
> -
> -Signed-off-by: Pratyush Anand <panand@redhat.com>
> -[takahiro.akashi@linaro.org: a bit reworked]
> -Signed-off-by: AKASHI Takahiro <takahiro.akashi@linaro.org>
> -Signed-off-by: He Zhe <zhe.he@windriver.com>
> ----
> - kexec/arch/arm64/kexec-image-arm64.c | 12 ++++++++++++
> - 1 file changed, 12 insertions(+)
> -
> -diff --git a/kexec/arch/arm64/kexec-image-arm64.c
> b/kexec/arch/arm64/kexec-image-arm64.c
> -index 960ed96..982e431 100644
> ---- a/kexec/arch/arm64/kexec-image-arm64.c
> -+++ b/kexec/arch/arm64/kexec-image-arm64.c
> -@@ -4,7 +4,9 @@
> -
> - #define _GNU_SOURCE
> -
> -+#include "crashdump-arm64.h"
> - #include "kexec-arm64.h"
> -+#include "kexec-syscall.h"
> - #include <limits.h>
> -
> - int image_arm64_probe(const char *kernel_buf, off_t kernel_size)
> -@@ -58,6 +60,16 @@ int image_arm64_load(int argc, char **argv, const char
> *kernel_buf,
> -       dbgprintf("%s: PE format:      %s\n", __func__,
> -               (arm64_header_check_pe_sig(header) ? "yes" : "no"));
> -
> -+      if (info->kexec_flags & KEXEC_ON_CRASH) {
> -+              /* create and initialize elf core header segment */
> -+              result = load_crashdump_segments(info);
> -+              if (result) {
> -+                      dbgprintf("%s: Creating eflcorehdr failed.\n",
> -+                                                              __func__);
> -+                      goto exit;
> -+              }
> -+      }
> -+
> -       /* load the kernel */
> -       add_segment_phys_virt(info, kernel_buf, kernel_size,
> -                       kernel_segment + arm64_mem.text_offset,
> ---
> -1.9.1
> -
> diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
> b/meta/recipes-kernel/kexec/kexec-tools_2.0.15.bb
> similarity index 63%
> rename from meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
> rename to meta/recipes-kernel/kexec/kexec-tools_2.0.15.bb
> index 0f6398f1..6bd9025 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.14.bb
> +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.15.bb
> @@ -5,26 +5,13 @@ EXTRA_OECONF = " --with-zlib=yes"
>  SRC_URI += "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz
> \
>              file://0002-powerpc-change-the-memory-size-limit.patch \
>              file://0001-purgatory-Pass-r-directly-to-linker.patch \
> -            file://0001-vmcore-dmesg-Define-_GNU_SOURCE.patch \
> -            file://0001-kexec-exntend-the-semantics-of-kexec_iomem_for_each_.patch
> \
> -            file://0002-kexec-generalize-and-rename-get_kernel_stext_sym.patch
> \
> -            file://0003-arm64-identify-PHYS_OFFSET-correctly.patch \
> -            file://0004-arm64-kdump-identify-memory-regions.patch \
> -            file://0005-arm64-kdump-add-elf-core-header-segment.patch \
> -            file://0006-arm64-kdump-set-up-kernel-image-segment.patch \
> -            file://0007-arm64-kdump-set-up-other-segments.patch \
> -            file://0008-arm64-kdump-add-DT-properties-to-crash-dump-kernel-s.patch
> \
> -            file://0009-arm64-kdump-Add-support-for-binary-image-files.patch
> \
>              file://0010-kexec-ARM-Fix-add_buffer_phys_virt-align-issue.patch
> \
> -            file://0001-x86-x86_64-Fix-format-warning-with-die.patch \
> -            file://0002-ppc-Fix-format-warning-with-die.patch \
>              file://kexec-x32.patch \
>              file://0001-Disable-PIE-during-link.patch \
> -            file://0001-arm64-Disable-PIC.patch \
>           "
>
> -SRC_URI[md5sum] = "b2b2c5e6b29d467d6e99d587fb6b7cf5"
> -SRC_URI[sha256sum] = "b3e69519d2acced256843b1e8f1ecf
> a00d9b54fa07449ed78f05b9193f239370"
> +SRC_URI[md5sum] = "78906fdc255656fa2b9996c8acb3ef62"
> +SRC_URI[sha256sum] = "42dbd0dab9964cd1ed89fa4571c8d1
> 3191eb7132b361ade5ac44517c91ecb97e"
>
>  SECURITY_PIE_CFLAGS_remove = "-fPIE -pie"
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c0c07b0bb561f055d751f53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Does this work on poky-lsb?=C2=A0 Previous upgrades were f=
ailing with that due to the security flags being enabled.<div><br></div><di=
v>Ross</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On 8 November 2017 at 09:56, zhengrq <span dir=3D"ltr">&lt;<a href=3D"mail=
to:zhengrq.fnst@cn.fujitsu.com" target=3D"_blank">zhengrq.fnst@cn.fujitsu.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">1) Upgrade kexec=
-tools from 2.0.14 to 2.0.15.<br>
2) Remove patches that are included in 2.0.15.<br>
=C2=A0 =C2=A0kexec-tools/0001-arm64-<wbr>Disable-PIC.patch<br>
=C2=A0 =C2=A0kexec-tools/0001-kexec-<wbr>exntend-the-semantics-of-<wbr>kexe=
c_iomem_for_each_.patch<br>
=C2=A0 =C2=A0kexec-tools/0001-vmcore-dmesg-<wbr>Define-_GNU_SOURCE.patch<br=
>
=C2=A0 =C2=A0kexec-tools/0001-x86-x86_64-<wbr>Fix-format-warning-with-die.<=
wbr>patch<br>
=C2=A0 =C2=A0kexec-tools/0002-kexec-<wbr>generalize-and-rename-get_<wbr>ker=
nel_stext_sym.patch<br>
=C2=A0 =C2=A0kexec-tools/0002-ppc-Fix-<wbr>format-warning-with-die.patch<br=
>
=C2=A0 =C2=A0kexec-tools/0003-arm64-<wbr>identify-PHYS_OFFSET-<wbr>correctl=
y.patch<br>
=C2=A0 =C2=A0kexec-tools/0004-arm64-kdump-<wbr>identify-memory-regions.patc=
h<br>
=C2=A0 =C2=A0kexec-tools/0005-arm64-kdump-<wbr>add-elf-core-header-segment.=
<wbr>patch<br>
=C2=A0 =C2=A0kexec-tools/0006-arm64-kdump-<wbr>set-up-kernel-image-segment.=
<wbr>patch<br>
=C2=A0 =C2=A0kexec-tools/0007-arm64-kdump-<wbr>set-up-other-segments.patch<=
br>
=C2=A0 =C2=A0kexec-tools/0008-arm64-kdump-<wbr>add-DT-properties-to-crash-<=
wbr>dump-kernel-s.patch<br>
=C2=A0 =C2=A0kexec-tools/0009-arm64-kdump-<wbr>Add-support-for-binary-image=
-<wbr>files.patch<br>
<br>
Signed-off-by: Zheng Ruoqin &lt;<a href=3D"mailto:zhengrq.fnst@cn.fujitsu.c=
om">zhengrq.fnst@cn.fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../kexec/kexec-tools/0001-<wbr>arm64-Disable-PIC.patch |=C2=A0 31 --=
--<br>
=C2=A0...nd-the-semantics-of-kexec_<wbr>iomem_for_each_.patch |=C2=A0 78 --=
------<br>
=C2=A0.../0001-vmcore-dmesg-Define-_<wbr>GNU_SOURCE.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 31 ----<br>
=C2=A0...01-x86-x86_64-Fix-format-<wbr>warning-with-die.patch |=C2=A0 78 --=
------<br>
=C2=A0...eneralize-and-rename-get_<wbr>kernel_stext_sym.patch | 194 -------=
-------------<br>
=C2=A0.../0002-ppc-Fix-format-<wbr>warning-with-die.patch=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 43 -----<br>
=C2=A0...0003-arm64-identify-PHYS_<wbr>OFFSET-correctly.patch |=C2=A0 76 --=
------<br>
=C2=A0.../0004-arm64-kdump-identify-<wbr>memory-regions.patch | 202 -------=
--------------<br>
=C2=A0...5-arm64-kdump-add-elf-core-<wbr>header-segment.patch | 191 -------=
------------<br>
=C2=A0...6-arm64-kdump-set-up-<wbr>kernel-image-segment.patch | 137 -------=
-------<br>
=C2=A0.../0007-arm64-kdump-set-up-<wbr>other-segments.patch=C2=A0 =C2=A0|=
=C2=A0 35 ----<br>
=C2=A0...-add-DT-properties-to-<wbr>crash-dump-kernel-s.patch | 150 -------=
--------<br>
=C2=A0...-kdump-Add-support-for-<wbr>binary-image-files.patch |=C2=A0 52 --=
----<br>
=C2=A0...<a href=3D"http://kexec-tools_2.0.14.bb" rel=3D"noreferrer" target=
=3D"_blank">kexec-tools_2.0.14.bb</a> =3D&gt; <a href=3D"http://kexec-tools=
_2.0.15.bb" rel=3D"noreferrer" target=3D"_blank">kexec-tools_2.0.15.bb</a>}=
 |=C2=A0 17 +-<br>
=C2=A014 files changed, 2 insertions(+), 1313 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-kernel/kexec/<wbr>kexec-tools/0001-ar=
m64-<wbr>Disable-PIC.patch<br>
=C2=A0delete mode 100644 meta/recipes-kernel/kexec/<wbr>kexec-tools/0001-ke=
xec-<wbr>exntend-the-semantics-of-<wbr>kexec_iomem_for_each_.patch<br>
=C2=A0delete mode 100644 meta/recipes-kernel/kexec/<wbr>kexec-tools/0001-vm=
core-dmesg-<wbr>Define-_GNU_SOURCE.patch<br>
=C2=A0delete mode 100644 meta/recipes-kernel/kexec/<wbr>kexec-tools/0001-x8=
6-x86_64-<wbr>Fix-format-warning-with-die.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-kernel/kexec/<wbr>kexec-tools/0002-ke=
xec-<wbr>generalize-and-rename-get_<wbr>kernel_stext_sym.patch<br>
=C2=A0delete mode 100644 meta/recipes-kernel/kexec/<wbr>kexec-tools/0002-pp=
c-Fix-<wbr>format-warning-with-die.patch<br>
=C2=A0delete mode 100644 meta/recipes-kernel/kexec/<wbr>kexec-tools/0003-ar=
m64-<wbr>identify-PHYS_OFFSET-<wbr>correctly.patch<br>
=C2=A0delete mode 100644 meta/recipes-kernel/kexec/<wbr>kexec-tools/0004-ar=
m64-kdump-<wbr>identify-memory-regions.patch<br>
=C2=A0delete mode 100644 meta/recipes-kernel/kexec/<wbr>kexec-tools/0005-ar=
m64-kdump-<wbr>add-elf-core-header-segment.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-kernel/kexec/<wbr>kexec-tools/0006-ar=
m64-kdump-<wbr>set-up-kernel-image-segment.<wbr>patch<br>
=C2=A0delete mode 100644 meta/recipes-kernel/kexec/<wbr>kexec-tools/0007-ar=
m64-kdump-<wbr>set-up-other-segments.patch<br>
=C2=A0delete mode 100644 meta/recipes-kernel/kexec/<wbr>kexec-tools/0008-ar=
m64-kdump-<wbr>add-DT-properties-to-crash-<wbr>dump-kernel-s.patch<br>
=C2=A0delete mode 100644 meta/recipes-kernel/kexec/<wbr>kexec-tools/0009-ar=
m64-kdump-<wbr>Add-support-for-binary-image-<wbr>files.patch<br>
=C2=A0rename meta/recipes-kernel/kexec/{<a href=3D"http://kexec-tools_2.0.1=
4.bb" rel=3D"noreferrer" target=3D"_blank">kex<wbr>ec-tools_2.0.14.bb</a> =
=3D&gt; <a href=3D"http://kexec-tools_2.0.15.bb" rel=3D"noreferrer" target=
=3D"_blank">kexec-tools_2.0.15.bb</a>} (63%)<br>
<br>
diff --git a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0001-arm64-<wbr>Dis=
able-PIC.patch b/meta/recipes-kernel/kexec/<wbr>kexec-tools/0001-arm64-<wbr=
>Disable-PIC.patch<br>
deleted file mode 100644<br>
index 84e94d7..0000000<br>
--- a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0001-arm64-<wbr>Disable-PI=
C.patch<br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-From 3bb73e5e5649b455e15d5ca3a7ad1a<wbr>90c4960972 Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Sat, 10 Jun 2017 11:54:36 -0700<br>
-Subject: [PATCH] arm64: Disable PIC<br>
-<br>
-Fix<br>
-| cc1: sorry, unimplemented: code model &#39;large&#39; with -fPIC<br>
-| make: *** [Makefile:118: purgatory/arch/arm64/entry.o] Error 1<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
-Upstream-Status: Pending<br>
-<br>
- purgatory/arch/arm64/Makefile | 1 +<br>
- 1 file changed, 1 insertion(+)<br>
-<br>
-diff --git a/purgatory/arch/arm64/<wbr>Makefile b/purgatory/arch/arm64/<wb=
r>Makefile<br>
-index 636abea..80068ca 100644<br>
---- a/purgatory/arch/arm64/<wbr>Makefile<br>
-+++ b/purgatory/arch/arm64/<wbr>Makefile<br>
-@@ -1,6 +1,7 @@<br>
-<br>
- arm64_PURGATORY_EXTRA_CFLAGS =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-mcmodel=3Dlarge \<br>
-+=C2=A0 =C2=A0 =C2=A0 -fno-PIC \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-fno-stack-protector \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-fno-asynchronous-unwind-<wbr>tables \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-Wundef \<br>
---<br>
-2.13.1<br>
-<br>
diff --git a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0001-kexec-<wbr>exn=
tend-the-semantics-of-<wbr>kexec_iomem_for_each_.patch b/meta/recipes-kerne=
l/kexec/<wbr>kexec-tools/0001-kexec-<wbr>exntend-the-semantics-of-<wbr>kexe=
c_iomem_for_each_.patch<br>
deleted file mode 100644<br>
index 822f28c..0000000<br>
--- a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0001-kexec-<wbr>exntend-th=
e-semantics-of-<wbr>kexec_iomem_for_each_.patch<br>
+++ /dev/null<br>
@@ -1,78 +0,0 @@<br>
-From 02eed0f8f2748fd7579f69e5373445<wbr>b52b2b8754 Mon Sep 17 00:00:00 200=
1<br>
-From: AKASHI Takahiro &lt;<a href=3D"mailto:takahiro.akashi@linaro.org">ta=
kahiro.akashi@linaro.org</a>&gt;<br>
-Date: Mon, 17 Oct 2016 13:56:58 +0900<br>
-Subject: [PATCH 1/9] kexec: exntend the semantics of kexec_iomem_for_each_=
line<br>
-<br>
-The current kexec_iomem_for_each_line() counts up all the lines for which<=
br>
-a callback function returns zero(0) or positive, and otherwise it stops<br=
>
-further scanning.<br>
-This behavior is incovenient in some cases. For instance, on arm64, we wan=
t<br>
-to count up &quot;System RAM&quot; entries, but need to skip &quot;reserve=
d&quot; entries.<br>
-<br>
-So this patch extends the semantics so that we will continue to scan<br>
-succeeding entries but not count lines for which a callback function<br>
-returns positive.<br>
-<br>
-The current users of kexec_iomem_for_each_line(), arm, sh and x86, will no=
t<br>
-be affected by this change because<br>
-* arm<br>
-=C2=A0 The callback function only returns -1 or 0, and the return value of=
<br>
-=C2=A0 kexec_iomem_for_each_line() will never be used.<br>
-* sh, x86<br>
-=C2=A0 The callback function may return (-1 for sh,) 0 or 1, but always re=
turns<br>
-=C2=A0 1 once we have reached the maximum number of entries allowed.<br>
-=C2=A0 Even so the current kexec_iomem_for_each_line() counts them up.<br>
-=C2=A0 This change actually fixes this bug.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://git.linaro.org/people/takahi=
ro.akashi/kexec-tools.git" rel=3D"noreferrer" target=3D"_blank">https://git=
.linaro.org/<wbr>people/takahiro.akashi/kexec-<wbr>tools.git</a>]<br>
-<br>
-Signed-off-by: AKASHI Takahiro &lt;<a href=3D"mailto:takahiro.akashi@linar=
o.org">takahiro.akashi@linaro.org</a>&gt;<br>
-Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@w=
indriver.com</a>&gt;<br>
----<br>
- kexec/kexec-iomem.c | 15 ++++++++++-----<br>
- 1 file changed, 10 insertions(+), 5 deletions(-)<br>
-<br>
-diff --git a/kexec/kexec-iomem.c b/kexec/kexec-iomem.c<br>
-index 485a2e8..0a0277a 100644<br>
---- a/kexec/kexec-iomem.c<br>
-+++ b/kexec/kexec-iomem.c<br>
-@@ -18,6 +18,9 @@<br>
-=C2=A0 * Iterate over each line in the file returned by proc_iomem(). If m=
atch is<br>
-=C2=A0 * NULL or if the line matches with our match-pattern then call the<=
br>
-=C2=A0 * callback if non-NULL.<br>
-+ * If match is NULL, callback should return a negative if error.<br>
-+ * Otherwise the interation goes on, incrementing nr but only if callback=
<br>
-+ * returns 0 (matched).<br>
-=C2=A0 *<br>
-=C2=A0 * Return the number of lines matched.<br>
-=C2=A0 */<br>
-@@ -37,7 +40,7 @@ int kexec_iomem_for_each_line(char *match,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char *str;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int consumed;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int count;<br>
--=C2=A0 =C2=A0 =C2=A0 int nr =3D 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 int nr =3D 0, ret;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0fp =3D fopen(iomem, &quot;r&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!fp)<br>
-@@ -50,11 +53,13 @@ int kexec_iomem_for_each_line(char *match,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0str =3D line + cons=
umed;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size =3D end - star=
t + 1;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!match || memcm=
p(str, match, strlen(match)) =3D=3D 0) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (callback<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &amp;&amp; callback(data, nr, str, start, size) &lt; 0) {=
<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if (callback) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D callback(data, nr, str, start, size=
);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret &lt; 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (ret =3D=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nr++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0}<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 nr++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
---<br>
-1.9.1<br>
-<br>
diff --git a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0001-vmcore-dmesg-<=
wbr>Define-_GNU_SOURCE.patch b/meta/recipes-kernel/kexec/<wbr>kexec-tools/0=
001-vmcore-dmesg-<wbr>Define-_GNU_SOURCE.patch<br>
deleted file mode 100644<br>
index 90c2f6e..0000000<br>
--- a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0001-vmcore-dmesg-<wbr>Def=
ine-_GNU_SOURCE.patch<br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-From d811875a41b4628040abaada3da29b<wbr>7b9592e757 Mon Sep 17 00:00:00 200=
1<br>
-From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.co=
m</a>&gt;<br>
-Date: Sat, 9 Jan 2016 17:16:16 -0800<br>
-Subject: [PATCH] vmcore-dmesg: Define _GNU_SOURCE<br>
-<br>
-loff_t is guarded with _GNU_SOURCE on some C library implementations<br>
-e.g. musl since this type is not defined by POSIX. Define _GNU_SOURCE to<b=
r>
-include this define, it should help compiling on musl while nothing<br>
-changes for glibc based systems since there _GNU_SOURCE is already<br>
-defined<br>
-<br>
-Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem=
@gmail.com</a>&gt;<br>
----<br>
-Upstream-Status: Submitted<br>
-<br>
- vmcore-dmesg/vmcore-dmesg.c | 1 +<br>
- 1 file changed, 1 insertion(+)<br>
-<br>
-diff --git a/vmcore-dmesg/vmcore-dmesg.c b/vmcore-dmesg/vmcore-dmesg.c<br>
-index 0364636..a8f56df 100644<br>
---- a/vmcore-dmesg/vmcore-dmesg.c<br>
-+++ b/vmcore-dmesg/vmcore-dmesg.c<br>
-@@ -1,4 +1,5 @@<br>
- #define _XOPEN_SOURCE 600<br>
-+#define _GNU_SOURCE<br>
- #define _LARGEFILE_SOURCE 1<br>
- #define _FILE_OFFSET_BITS 64<br>
- #include &lt;endian.h&gt;<br>
---<br>
-2.7.0<br>
-<br>
diff --git a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0001-x86-x86_64-<wb=
r>Fix-format-warning-with-die.<wbr>patch b/meta/recipes-kernel/kexec/<wbr>k=
exec-tools/0001-x86-x86_64-<wbr>Fix-format-warning-with-die.<wbr>patch<br>
deleted file mode 100644<br>
index e601f52..0000000<br>
--- a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0001-x86-x86_64-<wbr>Fix-f=
ormat-warning-with-die.<wbr>patch<br>
+++ /dev/null<br>
@@ -1,78 +0,0 @@<br>
-Upstream-Status: Backport<br>
-Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om">jussi.kukkonen@intel.com</a>&gt;<br>
-<br>
-<br>
-From 1550f81bf1886aa0520da0b6181cd6<wbr>1c1a75d4ad Mon Sep 17 00:00:00 200=
1<br>
-From: Pratyush Anand &lt;<a href=3D"mailto:panand@redhat.com">panand@redha=
t.com</a>&gt;<br>
-Date: Tue, 14 Mar 2017 17:59:22 +0530<br>
-Subject: [PATCH 1/2] x86/x86_64: Fix format warning with die()<br>
-<br>
-Fedora koji uses gcc version 7.0.1-0.12.fc27, and it generates a build<br>
-warning<br>
-<br>
-=C2=A0 =C2=A0kexec/arch/i386/kexec-elf-x86.<wbr>c:299:3: error: format not=
 a string<br>
-=C2=A0 =C2=A0literal and no format arguments [-Werror=3Dformat-security]<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0die(error_msg);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0^~~<br>
-=C2=A0 =C2=A0 cc1: some warnings being treated as errors<br>
-<br>
-error_msg can have a format specifier as well in string. In such cases,<br=
>
-if there is no other arguments for the format variable then code will<br>
-try to access a non existing argument. Therefore, use 1st argument as<br>
-format specifier for string print and pass error_msg as the string to be<b=
r>
-printed.<br>
-<br>
-While doing that,also use const qualifier before &quot;char *error_msg&quo=
t;.<br>
-<br>
-Signed-off-by: Pratyush Anand &lt;<a href=3D"mailto:panand@redhat.com">pan=
and@redhat.com</a>&gt;<br>
-Signed-off-by: Simon Horman &lt;<a href=3D"mailto:horms@verge.net.au">horm=
s@verge.net.au</a>&gt;<br>
----<br>
- kexec/arch/i386/kexec-elf-x86.<wbr>c=C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
- kexec/arch/x86_64/kexec-elf-<wbr>x86_64.c | 4 ++--<br>
- 2 files changed, 4 insertions(+), 4 deletions(-)<br>
-<br>
-diff --git a/kexec/arch/i386/kexec-elf-<wbr>x86.c b/kexec/arch/i386/kexec-=
elf-<wbr>x86.c<br>
-index de00dcb..fedf031 100644<br>
---- a/kexec/arch/i386/kexec-elf-<wbr>x86.c<br>
-+++ b/kexec/arch/i386/kexec-elf-<wbr>x86.c<br>
-@@ -91,7 +91,7 @@ int elf_x86_load(int argc, char **argv, const char *buf,=
 off_t len,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char *command_line =3D NULL, *modified_cmdline =
=3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *append =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0char *tmp_cmdline =3D NULL;<br>
--=C2=A0 =C2=A0 =C2=A0 char *error_msg =3D NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 const char *error_msg =3D NULL;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int result;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int command_line_len;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0const char *ramdisk;<br>
-@@ -296,6 +296,6 @@ out:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0free(command_line);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0free(modified_cmdline);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (error_msg)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 die(error_msg);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 die(&quot;%s&quot;, erro=
r_msg);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return result;<br>
- }<br>
-diff --git a/kexec/arch/x86_64/kexec-elf-<wbr>x86_64.c b/kexec/arch/x86_64=
/kexec-elf-<wbr>x86_64.c<br>
-index ae65692..ad22311 100644<br>
---- a/kexec/arch/x86_64/kexec-elf-<wbr>x86_64.c<br>
-+++ b/kexec/arch/x86_64/kexec-elf-<wbr>x86_64.c<br>
-@@ -99,7 +99,7 @@ int elf_x86_64_load(int argc, char **argv, const char *b=
uf, off_t len,<br>
- #define ARG_STYLE_NONE=C2=A0 2<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int opt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int result =3D 0;<br>
--=C2=A0 =C2=A0 =C2=A0 char *error_msg =3D NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 const char *error_msg =3D NULL;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* See options.h and add any new options there =
too! */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0static const struct option options[] =3D {<br>
-@@ -276,6 +276,6 @@ out:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0free(command_line);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0free(modified_cmdline);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (error_msg)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 die(error_msg);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 die(&quot;%s&quot;, erro=
r_msg);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return result;<br>
- }<br>
---<br>
-2.11.0<br>
-<br>
diff --git a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0002-kexec-<wbr>gen=
eralize-and-rename-get_<wbr>kernel_stext_sym.patch b/meta/recipes-kernel/ke=
xec/<wbr>kexec-tools/0002-kexec-<wbr>generalize-and-rename-get_<wbr>kernel_=
stext_sym.patch<br>
deleted file mode 100644<br>
index 953f13b..0000000<br>
--- a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0002-kexec-<wbr>generalize=
-and-rename-get_<wbr>kernel_stext_sym.patch<br>
+++ /dev/null<br>
@@ -1,194 +0,0 @@<br>
-From d29f37bb6e9114aba96c606103b110<wbr>f511bee9a1 Mon Sep 17 00:00:00 200=
1<br>
-From: Pratyush Anand &lt;<a href=3D"mailto:panand@redhat.com">panand@redha=
t.com</a>&gt;<br>
-Date: Wed, 2 Nov 2016 15:05:25 +0530<br>
-Subject: [PATCH 2/9] kexec: generalize and rename get_kernel_stext_sym()<b=
r>
-<br>
-get_kernel_stext_sym() has been defined for both arm and i386. Other<br>
-architecture might need some other kernel symbol address. Therefore rewrit=
e<br>
-this function as generic function to get any kernel symbol address.<br>
-<br>
-More over, kallsyms is not arch specific representation, therefore have<br=
>
-common function for all arches.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://git.linaro.org/people/takahi=
ro.akashi/kexec-tools.git" rel=3D"noreferrer" target=3D"_blank">https://git=
.linaro.org/<wbr>people/takahiro.akashi/kexec-<wbr>tools.git</a>]<br>
-<br>
-Signed-off-by: Pratyush Anand &lt;<a href=3D"mailto:panand@redhat.com">pan=
and@redhat.com</a>&gt;<br>
-[created symbols.c]<br>
-Signed-off-by: AKASHI Takahiro &lt;<a href=3D"mailto:takahiro.akashi@linar=
o.org">takahiro.akashi@linaro.org</a>&gt;<br>
-Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@w=
indriver.com</a>&gt;<br>
----<br>
- kexec/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 1 +<br>
- kexec/arch/arm/crashdump-arm.c=C2=A0 | 40 +-----------------------------<=
wbr>----------<br>
- kexec/arch/i386/crashdump-x86.<wbr>c | 29 -----------------------------<b=
r>
- kexec/kexec.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 2 ++<br>
- kexec/symbols.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 41 ++++++++++++++++++++++++++++++<wbr>+++++++++++<br>
- 5 files changed, 45 insertions(+), 68 deletions(-)<br>
- create mode 100644 kexec/symbols.c<br>
-<br>
-diff --git a/kexec/Makefile b/kexec/Makefile<br>
-index 39f365f..2b4fb3d 100644<br>
---- a/kexec/Makefile<br>
-+++ b/kexec/Makefile<br>
-@@ -26,6 +26,7 @@ KEXEC_SRCS_base +=3D kexec/kernel_version.c<br>
- KEXEC_SRCS_base +=3D kexec/lzma.c<br>
- KEXEC_SRCS_base +=3D kexec/zlib.c<br>
- KEXEC_SRCS_base +=3D kexec/kexec-xen.c<br>
-+KEXEC_SRCS_base +=3D kexec/symbols.c<br>
-<br>
- KEXEC_GENERATED_SRCS +=3D $(PURGATORY_HEX_C)<br>
-<br>
-diff --git a/kexec/arch/arm/crashdump-<wbr>arm.c b/kexec/arch/arm/crashdum=
p-<wbr>arm.c<br>
-index 4a89b5e..245c21a 100644<br>
---- a/kexec/arch/arm/crashdump-<wbr>arm.c<br>
-+++ b/kexec/arch/arm/crashdump-<wbr>arm.c<br>
-@@ -73,48 +73,10 @@ static struct crash_elf_info elf_info =3D {<br>
-<br>
- extern unsigned long long user_page_offset;<br>
-<br>
--/* Retrieve kernel _stext symbol virtual address from /proc/kallsyms */<b=
r>
--static unsigned long long get_kernel_stext_sym(void)<br>
--{<br>
--=C2=A0 =C2=A0 =C2=A0 const char *kallsyms =3D &quot;/proc/kallsyms&quot;;=
<br>
--=C2=A0 =C2=A0 =C2=A0 const char *stext =3D &quot;_stext&quot;;<br>
--=C2=A0 =C2=A0 =C2=A0 char sym[128];<br>
--=C2=A0 =C2=A0 =C2=A0 char line[128];<br>
--=C2=A0 =C2=A0 =C2=A0 FILE *fp;<br>
--=C2=A0 =C2=A0 =C2=A0 unsigned long long vaddr =3D 0;<br>
--=C2=A0 =C2=A0 =C2=A0 char type;<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 fp =3D fopen(kallsyms, &quot;r&quot;);<br>
--=C2=A0 =C2=A0 =C2=A0 if (!fp) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Ca=
nnot open %s\n&quot;, kallsyms);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
--=C2=A0 =C2=A0 =C2=A0 }<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 while(fgets(line, sizeof(line), fp) !=3D NULL) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long long addr;=
<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(line, &quot;%=
Lx %c %s&quot;, &amp;addr, &amp;type, sym) !=3D 3)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 continue;<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp(sym, stext) =
=3D=3D 0) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 dbgprintf(&quot;kernel symbol %s vaddr =3D %#llx\n&quot;, stext, addr);=
<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 vaddr =3D addr;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 }<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 fclose(fp);<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 if (vaddr =3D=3D 0)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Ca=
nnot get kernel %s symbol address\n&quot;, stext);<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 return vaddr;<br>
--}<br>
--<br>
- static int get_kernel_page_offset(struct kexec_info *info,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct crash_elf_in=
fo *elf_info)<br>
- {<br>
--=C2=A0 =C2=A0 =C2=A0 unsigned long long stext_sym_addr =3D get_kernel_ste=
xt_sym();<br>
-+=C2=A0 =C2=A0 =C2=A0 unsigned long long stext_sym_addr =3D get_kernel_sym=
(&quot;_stext&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (stext_sym_addr =3D=3D 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (user_page_offse=
t !=3D (-1ULL)) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0elf_info-&gt;page_offset =3D user_page_offset;<br>
-diff --git a/kexec/arch/i386/crashdump-<wbr>x86.c b/kexec/arch/i386/crashd=
ump-<wbr>x86.c<br>
-index ab833d4..abf82a5 100644<br>
---- a/kexec/arch/i386/crashdump-<wbr>x86.c<br>
-+++ b/kexec/arch/i386/crashdump-<wbr>x86.c<br>
-@@ -102,35 +102,6 @@ static int get_kernel_paddr(struct kexec_info *UNUSED=
(info),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
- }<br>
-<br>
--/* Retrieve kernel symbol virtual address from /proc/kallsyms */<br>
--static unsigned long long get_kernel_sym(const char *symbol)<br>
--{<br>
--=C2=A0 =C2=A0 =C2=A0 const char *kallsyms =3D &quot;/proc/kallsyms&quot;;=
<br>
--=C2=A0 =C2=A0 =C2=A0 char sym[128];<br>
--=C2=A0 =C2=A0 =C2=A0 char line[128];<br>
--=C2=A0 =C2=A0 =C2=A0 FILE *fp;<br>
--=C2=A0 =C2=A0 =C2=A0 unsigned long long vaddr;<br>
--=C2=A0 =C2=A0 =C2=A0 char type;<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 fp =3D fopen(kallsyms, &quot;r&quot;);<br>
--=C2=A0 =C2=A0 =C2=A0 if (!fp) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Ca=
nnot open %s\n&quot;, kallsyms);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
--=C2=A0 =C2=A0 =C2=A0 }<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 while(fgets(line, sizeof(line), fp) !=3D NULL) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(line, &quot;%=
Lx %c %s&quot;, &amp;vaddr, &amp;type, sym) !=3D 3)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 continue;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp(sym, symbol) =
=3D=3D 0) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 dbgprintf(&quot;kernel symbol %s vaddr =3D %16llx\n&quot;, symbol, vadd=
r);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return vaddr;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--=C2=A0 =C2=A0 =C2=A0 }<br>
--<br>
--=C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Cannot get kernel %s symbol ad=
dress\n&quot;, symbol);<br>
--=C2=A0 =C2=A0 =C2=A0 return 0;<br>
--}<br>
--<br>
- /* Retrieve info regarding virtual address kernel has been compiled for a=
nd<br>
-=C2=A0 * size of the kernel from /proc/kcore. Current /proc/kcore parsing =
from<br>
-=C2=A0 * from kexec-tools fails because of malformed elf notes. A kernel p=
atch has<br>
-diff --git a/kexec/kexec.h b/kexec/kexec.h<br>
-index 9194f1c..b4fafad 100644<br>
---- a/kexec/kexec.h<br>
-+++ b/kexec/kexec.h<br>
-@@ -312,4 +312,6 @@ int xen_kexec_load(struct kexec_info *info);<br>
- int xen_kexec_unload(uint64_t kexec_flags);<br>
- void xen_kexec_exec(void);<br>
-<br>
-+extern unsigned long long get_kernel_sym(const char *text);<br>
-+<br>
- #endif /* KEXEC_H */<br>
-diff --git a/kexec/symbols.c b/kexec/symbols.c<br>
-new file mode 100644<br>
-index 0000000..ea6e327<br>
---- /dev/null<br>
-+++ b/kexec/symbols.c<br>
-@@ -0,0 +1,41 @@<br>
-+#include &lt;stdio.h&gt;<br>
-+#include &lt;string.h&gt;<br>
-+#include &quot;kexec.h&quot;<br>
-+<br>
-+/* Retrieve kernel symbol virtual address from /proc/kallsyms */<br>
-+unsigned long long get_kernel_sym(const char *text)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 const char *kallsyms =3D &quot;/proc/kallsyms&quot;;=
<br>
-+=C2=A0 =C2=A0 =C2=A0 char sym[128];<br>
-+=C2=A0 =C2=A0 =C2=A0 char line[128];<br>
-+=C2=A0 =C2=A0 =C2=A0 FILE *fp;<br>
-+=C2=A0 =C2=A0 =C2=A0 unsigned long long vaddr =3D 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 char type;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 fp =3D fopen(kallsyms, &quot;r&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (!fp) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Ca=
nnot open %s\n&quot;, kallsyms);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 while (fgets(line, sizeof(line), fp) !=3D NULL) {<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long long addr;=
<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sscanf(line, &quot;%=
Lx %c %s&quot;, &amp;addr, &amp;type, sym) !=3D 3)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 continue;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (strcmp(sym, text) =
=3D=3D 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 dbgprintf(&quot;kernel symbol %s vaddr =3D %#llx\n&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 text,=
 addr);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 vaddr =3D addr;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 fclose(fp);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (vaddr =3D=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;Ca=
nnot get kernel %s symbol address\n&quot;, text);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 return vaddr;<br>
-+}<br>
---<br>
-1.9.1<br>
-<br>
diff --git a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0002-ppc-Fix-<wbr>f=
ormat-warning-with-die.patch b/meta/recipes-kernel/kexec/<wbr>kexec-tools/0=
002-ppc-Fix-<wbr>format-warning-with-die.patch<br>
deleted file mode 100644<br>
index 6a1c06d..0000000<br>
--- a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0002-ppc-Fix-<wbr>format-w=
arning-with-die.patch<br>
+++ /dev/null<br>
@@ -1,43 +0,0 @@<br>
-From 1c956fc8c6b6324d8d38bba5f9e60a<wbr>018051c6f5 Mon Sep 17 00:00:00 200=
1<br>
-From: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.com">jussi=
.kukkonen@intel.com</a>&gt;<br>
-Date: Thu, 16 Mar 2017 15:39:06 +0200<br>
-Subject: [PATCH 2/2] ppc: Fix format warning with die()<br>
-<br>
-Enable compiling kexec-tools for ppc with -Werror=3Dformat-security.<br>
-<br>
-Signed-off-by: Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om">jussi.kukkonen@intel.com</a>&gt;<br>
-Upstream-Status: Submitted [Mailing list]<br>
----<br>
- kexec/arch/ppc/kexec-elf-ppc.c=C2=A0 =C2=A0 | 2 +-<br>
- kexec/arch/ppc/kexec-uImage-<wbr>ppc.c | 2 +-<br>
- 2 files changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/kexec/arch/ppc/kexec-elf-<wbr>ppc.c b/kexec/arch/ppc/kexec-el=
f-<wbr>ppc.c<br>
-index 291f06d..ad43ad1 100644<br>
---- a/kexec/arch/ppc/kexec-elf-<wbr>ppc.c<br>
-+++ b/kexec/arch/ppc/kexec-elf-<wbr>ppc.c<br>
-@@ -453,7 +453,7 @@ out:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tmp_cmdline)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(command_line);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (error_msg)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 die(error_msg);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 die(&quot;%s&quot;, erro=
r_msg);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return result;<br>
- }<br>
-diff --git a/kexec/arch/ppc/kexec-uImage-<wbr>ppc.c b/kexec/arch/ppc/kexec=
-uImage-<wbr>ppc.c<br>
-index 5eec6e4..e8f7adc 100644<br>
---- a/kexec/arch/ppc/kexec-uImage-<wbr>ppc.c<br>
-+++ b/kexec/arch/ppc/kexec-uImage-<wbr>ppc.c<br>
-@@ -306,7 +306,7 @@ out:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tmp_cmdline)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free(command_line);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (error_msg)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 die(error_msg);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 die(&quot;%s&quot;, erro=
r_msg);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
- }<br>
-<br>
---<br>
-2.11.0<br>
-<br>
diff --git a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0003-arm64-<wbr>ide=
ntify-PHYS_OFFSET-<wbr>correctly.patch b/meta/recipes-kernel/kexec/<wbr>kex=
ec-tools/0003-arm64-<wbr>identify-PHYS_OFFSET-<wbr>correctly.patch<br>
deleted file mode 100644<br>
index 1a1c317..0000000<br>
--- a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0003-arm64-<wbr>identify-P=
HYS_OFFSET-<wbr>correctly.patch<br>
+++ /dev/null<br>
@@ -1,76 +0,0 @@<br>
-From 16df170ad4808d12acd5e919ac4f6e<wbr>7f33a247b3 Mon Sep 17 00:00:00 200=
1<br>
-From: AKASHI Takahiro &lt;<a href=3D"mailto:takahiro.akashi@linaro.org">ta=
kahiro.akashi@linaro.org</a>&gt;<br>
-Date: Thu, 1 Sep 2016 10:57:42 +0900<br>
-Subject: [PATCH 3/9] arm64: identify PHYS_OFFSET correctly<br>
-<br>
-Due to the kernel patch, commit e7cd190385d1 (&quot;arm64: mark reserved<b=
r>
-memblock regions explicitly in iomem&quot;), the current code will not be =
able<br>
-to identify the correct value of PHYS_OFFSET if some &quot;reserved&quot; =
memory<br>
-region, which is likely to be UEFI runtime services code/data, exists at<b=
r>
-an address below the first &quot;System RAM&quot; regions.<br>
-<br>
-This patch fixes this issue.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://git.linaro.org/people/takahi=
ro.akashi/kexec-tools.git" rel=3D"noreferrer" target=3D"_blank">https://git=
.linaro.org/<wbr>people/takahiro.akashi/kexec-<wbr>tools.git</a>]<br>
-<br>
-Signed-off-by: AKASHI Takahiro &lt;<a href=3D"mailto:takahiro.akashi@linar=
o.org">takahiro.akashi@linaro.org</a>&gt;<br>
-Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@w=
indriver.com</a>&gt;<br>
----<br>
- kexec/arch/arm64/iomem.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 7 +++++++<br>
- kexec/arch/arm64/kexec-arm64.c | 12 ++++++++++--<br>
- 2 files changed, 17 insertions(+), 2 deletions(-)<br>
- create mode 100644 kexec/arch/arm64/iomem.h<br>
-<br>
-diff --git a/kexec/arch/arm64/iomem.h b/kexec/arch/arm64/iomem.h<br>
-new file mode 100644<br>
-index 0000000..7fd66eb<br>
---- /dev/null<br>
-+++ b/kexec/arch/arm64/iomem.h<br>
-@@ -0,0 +1,7 @@<br>
-+#ifndef IOMEM_H<br>
-+#define IOMEM_H<br>
-+<br>
-+#define SYSTEM_RAM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;System =
RAM\n&quot;<br>
-+#define IOMEM_RESERVED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;reserved\n&quot;<br>
-+<br>
-+#endif<br>
-diff --git a/kexec/arch/arm64/kexec-<wbr>arm64.c b/kexec/arch/arm64/kexec-=
<wbr>arm64.c<br>
-index 2e8839a..8ac811d 100644<br>
---- a/kexec/arch/arm64/kexec-<wbr>arm64.c<br>
-+++ b/kexec/arch/arm64/kexec-<wbr>arm64.c<br>
-@@ -21,6 +21,7 @@<br>
- #include &quot;crashdump-arm64.h&quot;<br>
- #include &quot;dt-ops.h&quot;<br>
- #include &quot;fs2dt.h&quot;<br>
-+#include &quot;iomem.h&quot;<br>
- #include &quot;kexec-syscall.h&quot;<br>
- #include &quot;arch/options.h&quot;<br>
-<br>
-@@ -475,7 +476,14 @@ static int get_memory_ranges_iomem_cb(<wbr>void *data=
, int nr, char *str,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D (struct memory_range *)data + nr;<br>
--=C2=A0 =C2=A0 =C2=A0 r-&gt;type =3D RANGE_RAM;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (!strncmp(str, SYSTEM_RAM, strlen(SYSTEM_RAM)))<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;type =3D RANGE_RAM=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 else if (!strncmp(str, IOMEM_RESERVED, strlen(IOMEM_=
RESERVED)))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r-&gt;type =3D RANGE_RES=
ERVED;<br>
-+=C2=A0 =C2=A0 =C2=A0 else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0r-&gt;start =3D base;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0r-&gt;end =3D base + length - 1;<br>
-<br>
-@@ -494,7 +502,7 @@ static int get_memory_ranges_iomem_cb(<wbr>void *data,=
 int nr, char *str,<br>
- static int get_memory_ranges_iomem(struct memory_range *array,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int *count)<br>
- {<br>
--=C2=A0 =C2=A0 =C2=A0 *count =3D kexec_iomem_for_each_line(&quot;<wbr>Syst=
em RAM\n&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 *count =3D kexec_iomem_for_each_line(<wbr>NULL,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0get_memory_ranges_i=
omem_cb, array);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!*count) {<br>
---<br>
-1.9.1<br>
-<br>
diff --git a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0004-arm64-kdump-<w=
br>identify-memory-regions.patch b/meta/recipes-kernel/kexec/<wbr>kexec-too=
ls/0004-arm64-kdump-<wbr>identify-memory-regions.patch<br>
deleted file mode 100644<br>
index 66600f3..0000000<br>
--- a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0004-arm64-kdump-<wbr>iden=
tify-memory-regions.patch<br>
+++ /dev/null<br>
@@ -1,202 +0,0 @@<br>
-From 48a4c7874d8264ddbfaec2e9858d78<wbr>66a2d2eb60 Mon Sep 17 00:00:00 200=
1<br>
-From: AKASHI Takahiro &lt;<a href=3D"mailto:takahiro.akashi@linaro.org">ta=
kahiro.akashi@linaro.org</a>&gt;<br>
-Date: Wed, 5 Aug 2015 13:16:30 +0900<br>
-Subject: [PATCH 4/9] arm64: kdump: identify memory regions<br>
-<br>
-The following regions need to be identified for later use:<br>
- a) memory regions which belong to the 1st kernel<br>
- b) usable memory reserved for crash dump kernel<br>
-<br>
-We go through /proc/iomem to find out a) and b) which are marked<br>
-as &quot;System RAM&quot; and &quot;Crash kernel&quot;, respectively.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://git.linaro.org/people/takahi=
ro.akashi/kexec-tools.git" rel=3D"noreferrer" target=3D"_blank">https://git=
.linaro.org/<wbr>people/takahiro.akashi/kexec-<wbr>tools.git</a>]<br>
-<br>
-Signed-off-by: AKASHI Takahiro &lt;<a href=3D"mailto:takahiro.akashi@linar=
o.org">takahiro.akashi@linaro.org</a>&gt;<br>
-Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@w=
indriver.com</a>&gt;<br>
----<br>
- kexec/arch/arm64/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=
=A02 +<br>
- kexec/arch/arm64/crashdump-<wbr>arm64.c | 100 +++++++++++++++++++++++++++=
+++<wbr>++++++-<br>
- kexec/arch/arm64/crashdump-<wbr>arm64.h |=C2=A0 14 +++++-<br>
- kexec/arch/arm64/iomem.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
=C2=A01 +<br>
- 4 files changed, 114 insertions(+), 3 deletions(-)<br>
-<br>
-diff --git a/kexec/arch/arm64/Makefile b/kexec/arch/arm64/Makefile<br>
-index 74b677f..2d4ae0e 100644<br>
---- a/kexec/arch/arm64/Makefile<br>
-+++ b/kexec/arch/arm64/Makefile<br>
-@@ -6,6 +6,8 @@ arm64_FS2DT_INCLUDE +=3D \<br>
-<br>
- arm64_DT_OPS +=3D kexec/dt-ops.c<br>
-<br>
-+arm64_MEM_REGIONS =3D kexec/mem_regions.c<br>
-+<br>
- arm64_CPPFLAGS +=3D -I $(srcdir)/kexec/<br>
-<br>
- arm64_KEXEC_SRCS +=3D \<br>
-diff --git a/kexec/arch/arm64/crashdump-<wbr>arm64.c b/kexec/arch/arm64/cr=
ashdump-<wbr>arm64.c<br>
-index d2272c8..dcaca43 100644<br>
---- a/kexec/arch/arm64/crashdump-<wbr>arm64.c<br>
-+++ b/kexec/arch/arm64/crashdump-<wbr>arm64.c<br>
-@@ -1,5 +1,13 @@<br>
- /*<br>
-=C2=A0 * ARM64 crashdump.<br>
-+ *=C2=A0 =C2=A0 =C2=A0partly derived from arm implementation<br>
-+ *<br>
-+ * Copyright (c) 2014-2016 Linaro Limited<br>
-+ * Author: AKASHI Takahiro &lt;<a href=3D"mailto:takahiro.akashi@linaro.o=
rg">takahiro.akashi@linaro.org</a>&gt;<br>
-+ *<br>
-+ * This program is free software; you can redistribute it and/or modify<b=
r>
-+ * it under the terms of the GNU General Public License version 2 as<br>
-+ * published by the Free Software Foundation.<br>
-=C2=A0 */<br>
-<br>
- #define _GNU_SOURCE<br>
-@@ -10,12 +18,102 @@<br>
- #include &quot;kexec.h&quot;<br>
- #include &quot;crashdump.h&quot;<br>
- #include &quot;crashdump-arm64.h&quot;<br>
-+#include &quot;iomem.h&quot;<br>
- #include &quot;kexec-arm64.h&quot;<br>
- #include &quot;kexec-elf.h&quot;<br>
-+#include &quot;mem_regions.h&quot;<br>
-<br>
--struct memory_ranges usablemem_rgns =3D {};<br>
-+/* memory ranges on crashed kernel */<br>
-+static struct memory_range crash_memory_ranges[CRASH_MAX_<wbr>MEMORY_RANG=
ES];<br>
-+static struct memory_ranges crash_memory_rgns =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 .size =3D 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 .max_size =3D CRASH_MAX_MEMORY_RANGES,<br>
-+=C2=A0 =C2=A0 =C2=A0 .ranges =3D crash_memory_ranges,<br>
-+};<br>
-+<br>
-+/* memory range reserved for crashkernel */<br>
-+struct memory_range crash_reserved_mem;<br>
-+struct memory_ranges usablemem_rgns =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 .size =3D 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 .max_size =3D 1,<br>
-+=C2=A0 =C2=A0 =C2=A0 .ranges =3D &amp;crash_reserved_mem,<br>
-+};<br>
-+<br>
-+/*<br>
-+ * iomem_range_callback() - callback called for each iomem region<br>
-+ * @data: not used<br>
-+ * @nr: not used<br>
-+ * @str: name of the memory region<br>
-+ * @base: start address of the memory region<br>
-+ * @length: size of the memory region<br>
-+ *<br>
-+ * This function is called once for each memory region found in /proc/iom=
em.<br>
-+ * It locates system RAM and crashkernel reserved memory and places these=
 to<br>
-+ * variables, respectively, crash_memory_ranges and crash_reserved_mem.<b=
r>
-+ */<br>
-+<br>
-+static int iomem_range_callback(void *UNUSED(data), int UNUSED(nr),<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *str, unsigned long long base,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long long length)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 if (strncmp(str, CRASH_KERNEL, strlen(CRASH_KERNEL))=
 =3D=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return mem_regions_add(&=
amp;usablemem_<wbr>rgns,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base, length, RA=
NGE_RAM);<br>
-+=C2=A0 =C2=A0 =C2=A0 else if (strncmp(str, SYSTEM_RAM, strlen(SYSTEM_RAM)=
) =3D=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return mem_regions_add(&=
amp;crash_memory_<wbr>rgns,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0base, length, RA=
NGE_RAM);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+}<br>
-<br>
- int is_crashkernel_mem_reserved(<wbr>void)<br>
- {<br>
-+=C2=A0 =C2=A0 =C2=A0 if (!crash_reserved_mem.end)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kexec_iomem_for_each_lin=
e(<wbr>NULL, iomem_range_callback, NULL);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 return crash_reserved_mem.start !=3D crash_reserved_=
mem.end;<br>
-+}<br>
-+<br>
-+/*<br>
-+ * crash_get_memory_ranges() - read system physical memory<br>
-+ *<br>
-+ * Function reads through system physical memory and stores found memory<=
br>
-+ * regions in crash_memory_ranges.<br>
-+ * Regions are sorted in ascending order.<br>
-+ *<br>
-+ * Returns 0 in case of success and -1 otherwise (errno is set).<br>
-+ */<br>
-+static int crash_get_memory_ranges(void)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* First read all memory regions that can be co=
nsidered as<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* system memory including the crash area.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 =C2=A0 if (!usablemem_rgns.size)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kexec_iomem_for_each_lin=
e(<wbr>NULL, iomem_range_callback, NULL);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 /* allow only a single region for crash dump kernel =
*/<br>
-+=C2=A0 =C2=A0 =C2=A0 if (usablemem_rgns.size !=3D 1) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D EINVAL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 dbgprint_mem_range(&quot;Reserved memory range&quot;=
, &amp;crash_reserved_mem, 1);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (mem_regions_exclude(&amp;crash_<wbr>memory_rgns,=
 &amp;crash_reserved_mem)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Error: Number of crash memory ranges excedeed the max limit\n&quo=
t;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 errno =3D ENOMEM;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* Make sure that the memory regions are sorted=
.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 =C2=A0 mem_regions_sort(&amp;crash_<wbr>memory_rgns);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 dbgprint_mem_range(&quot;Coredump memory ranges&quot=
;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0crash_memory_rgns.ranges, crash_memory_rgns.size);<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
- }<br>
-diff --git a/kexec/arch/arm64/crashdump-<wbr>arm64.h b/kexec/arch/arm64/cr=
ashdump-<wbr>arm64.h<br>
-index f33c7a2..07a0ed0 100644<br>
---- a/kexec/arch/arm64/crashdump-<wbr>arm64.h<br>
-+++ b/kexec/arch/arm64/crashdump-<wbr>arm64.h<br>
-@@ -1,12 +1,22 @@<br>
- /*<br>
-=C2=A0 * ARM64 crashdump.<br>
-+ *<br>
-+ * Copyright (c) 2014-2016 Linaro Limited<br>
-+ * Author: AKASHI Takahiro &lt;<a href=3D"mailto:takahiro.akashi@linaro.o=
rg">takahiro.akashi@linaro.org</a>&gt;<br>
-+ *<br>
-+ * This program is free software; you can redistribute it and/or modify<b=
r>
-+ * it under the terms of the GNU General Public License version 2 as<br>
-+ * published by the Free Software Foundation.<br>
-=C2=A0 */<br>
-<br>
--#if !defined(CRASHDUMP_ARM64_H)<br>
-+#ifndef CRASHDUMP_ARM64_H<br>
- #define CRASHDUMP_ARM64_H<br>
-<br>
- #include &quot;kexec.h&quot;<br>
-<br>
-+#define CRASH_MAX_MEMORY_RANGES=C2=A0 =C2=A0 =C2=A0 =C2=A032<br>
-+<br>
- extern struct memory_ranges usablemem_rgns;<br>
-+extern struct memory_range crash_reserved_mem;<br>
-<br>
--#endif<br>
-+#endif /* CRASHDUMP_ARM64_H */<br>
-diff --git a/kexec/arch/arm64/iomem.h b/kexec/arch/arm64/iomem.h<br>
-index 7fd66eb..20cda87 100644<br>
---- a/kexec/arch/arm64/iomem.h<br>
-+++ b/kexec/arch/arm64/iomem.h<br>
-@@ -2,6 +2,7 @@<br>
- #define IOMEM_H<br>
-<br>
- #define SYSTEM_RAM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;System =
RAM\n&quot;<br>
-+#define CRASH_KERNEL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Crash kernel=
\n&quot;<br>
- #define IOMEM_RESERVED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;reserved\n&quot;<br>
-<br>
- #endif<br>
---<br>
-1.9.1<br>
-<br>
diff --git a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0005-arm64-kdump-<w=
br>add-elf-core-header-segment.<wbr>patch b/meta/recipes-kernel/kexec/<wbr>=
kexec-tools/0005-arm64-kdump-<wbr>add-elf-core-header-segment.<wbr>patch<br=
>
deleted file mode 100644<br>
index fe535b6..0000000<br>
--- a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0005-arm64-kdump-<wbr>add-=
elf-core-header-segment.<wbr>patch<br>
+++ /dev/null<br>
@@ -1,191 +0,0 @@<br>
-From 769da25627cebb2a53caee5d5be78a<wbr>32d376adc1 Mon Sep 17 00:00:00 200=
1<br>
-From: AKASHI Takahiro &lt;<a href=3D"mailto:takahiro.akashi@linaro.org">ta=
kahiro.akashi@linaro.org</a>&gt;<br>
-Date: Wed, 5 Aug 2015 13:45:15 +0900<br>
-Subject: [PATCH 5/9] arm64: kdump: add elf core header segment<br>
-<br>
-Elf core header contains the information necessary for the coredump of<br>
-the 1st kernel, including its physcal memory layout as well as cpu registe=
r<br>
-states at the panic.<br>
-The segment is allocated inside the reserved memory of crash dump kernel.<=
br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://git.linaro.org/people/takahi=
ro.akashi/kexec-tools.git" rel=3D"noreferrer" target=3D"_blank">https://git=
.linaro.org/<wbr>people/takahiro.akashi/kexec-<wbr>tools.git</a>]<br>
-<br>
-Signed-off-by: AKASHI Takahiro &lt;<a href=3D"mailto:takahiro.akashi@linar=
o.org">takahiro.akashi@linaro.org</a>&gt;<br>
-Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@w=
indriver.com</a>&gt;<br>
----<br>
- kexec/arch/arm64/crashdump-<wbr>arm64.c | 96 ++++++++++++++++++++++++++++=
++<wbr>++++++++<br>
- kexec/arch/arm64/crashdump-<wbr>arm64.h |=C2=A0 3 ++<br>
- kexec/arch/arm64/iomem.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =
2 +<br>
- kexec/arch/arm64/kexec-elf-<wbr>arm64.c | 10 ++++<br>
- 4 files changed, 111 insertions(+)<br>
-<br>
-diff --git a/kexec/arch/arm64/crashdump-<wbr>arm64.c b/kexec/arch/arm64/cr=
ashdump-<wbr>arm64.c<br>
-index dcaca43..8346131 100644<br>
---- a/kexec/arch/arm64/crashdump-<wbr>arm64.c<br>
-+++ b/kexec/arch/arm64/crashdump-<wbr>arm64.c<br>
-@@ -39,6 +39,39 @@ struct memory_ranges usablemem_rgns =3D {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.ranges =3D &amp;crash_reserved_mem,<br>
- };<br>
-<br>
-+struct memory_range elfcorehdr_mem;<br>
-+<br>
-+static struct crash_elf_info elf_info =3D {<br>
-+=C2=A0 =C2=A0 =C2=A0 .class=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D ELFCLAS=
S64,<br>
-+#if (__BYTE_ORDER =3D=3D __LITTLE_ENDIAN)<br>
-+=C2=A0 =C2=A0 =C2=A0 .data=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D EL=
FDATA2LSB,<br>
-+#else<br>
-+=C2=A0 =C2=A0 =C2=A0 .data=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D EL=
FDATA2MSB,<br>
-+#endif<br>
-+=C2=A0 =C2=A0 =C2=A0 .machine=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D EM_AARCH64,<=
br>
-+};<br>
-+<br>
-+/*<br>
-+ * Note: The returned value is correct only if !CONFIG_RANDOMIZE_BASE.<br=
>
-+ */<br>
-+static uint64_t get_kernel_page_offset(void)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 int i;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (elf_info.kern_vaddr_start =3D=3D UINT64_MAX)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return UINT64_MAX;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 /* Current max virtual memory range is 48-bits. */<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 for (i =3D 48; i &gt; 0; i--)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(elf_info.kern_vadd=
r_start &amp; (1UL &lt;&lt; i)))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (i &lt;=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return UINT64_MAX;<br>
-+=C2=A0 =C2=A0 =C2=A0 else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return UINT64_MAX &lt;&l=
t; i;<br>
-+}<br>
-+<br>
- /*<br>
-=C2=A0 * iomem_range_callback() - callback called for each iomem region<br=
>
-=C2=A0 * @data: not used<br>
-@@ -62,6 +95,10 @@ static int iomem_range_callback(void *UNUSED(data), int=
 UNUSED(nr),<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (strncmp(str, SYSTEM_RAM, strlen(SYSTEM=
_RAM)) =3D=3D 0)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return mem_regions_=
add(&amp;crash_memory_<wbr>rgns,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base, length, R=
ANGE_RAM);<br>
-+=C2=A0 =C2=A0 =C2=A0 else if (strncmp(str, KERNEL_CODE, strlen(KERNEL_COD=
E)) =3D=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_info.kern_paddr_star=
t =3D base;<br>
-+=C2=A0 =C2=A0 =C2=A0 else if (strncmp(str, KERNEL_DATA, strlen(KERNEL_DAT=
A)) =3D=3D 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_info.kern_size =3D b=
ase + length - elf_info.kern_paddr_start;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
- }<br>
-@@ -115,5 +152,64 @@ static int crash_get_memory_ranges(void)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dbgprint_mem_range(&quot;Coredump memory ranges=
&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 crash_memory_rgns.ranges, crash_memory_rgns.size);<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* For additional kernel code/data segment.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* kern_paddr_start/kern_size are determined in=
 iomem_range_callback<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 =C2=A0 elf_info.kern_vaddr_start =3D get_kernel_sym(&quot;_=
text&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (!elf_info.kern_vaddr_start)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elf_info.kern_vaddr_star=
t =3D UINT64_MAX;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 return 0;<br>
-+}<br>
-+<br>
-+/*<br>
-+ * load_crashdump_segments() - load the elf core header<br>
-+ * @info: kexec info structure<br>
-+ *<br>
-+ * This function creates and loads an additional segment of elf core head=
er<br>
-+ : which is used to construct /proc/vmcore on crash dump kernel.<br>
-+ *<br>
-+ * Return 0 in case of success and -1 in case of error.<br>
-+ */<br>
-+<br>
-+int load_crashdump_segments(struct kexec_info *info)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 unsigned long elfcorehdr;<br>
-+=C2=A0 =C2=A0 =C2=A0 unsigned long bufsz;<br>
-+=C2=A0 =C2=A0 =C2=A0 void *buf;<br>
-+=C2=A0 =C2=A0 =C2=A0 int err;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* First fetch all the memory (RAM) ranges that=
 we are going to<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0* pass to the crash dump kernel during panic.<=
br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 err =3D crash_get_memory_ranges();<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (err)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 elf_info.page_offset =3D get_kernel_page_offset();<b=
r>
-+=C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;%s: page_offset:=C2=A0 =C2=A0%016llx=
\n&quot;, __func__,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 elf_info.page_offset);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 err =3D crash_create_elf64_headers(<wbr>info, &amp;e=
lf_info,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 crash_memory_rgns.ranges, crash_memory_rgns.size,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &amp;buf, &amp;bufsz, ELF_CORE_HEADER_ALIGN);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (err)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return err;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 elfcorehdr =3D add_buffer_phys_virt(info, buf, bufsz=
, bufsz, 0,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crash_reserved_mem.start=
, crash_reserved_mem.end,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -1, 0);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 elfcorehdr_mem.start =3D elfcorehdr;<br>
-+=C2=A0 =C2=A0 =C2=A0 elfcorehdr_mem.end =3D elfcorehdr + bufsz - 1;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;%s: elfcorehdr 0x%llx-0x%llx\n&quot;=
, __func__,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 elfcorehdr_mem.start, elfcorehdr_mem.end);<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
- }<br>
-diff --git a/kexec/arch/arm64/crashdump-<wbr>arm64.h b/kexec/arch/arm64/cr=
ashdump-<wbr>arm64.h<br>
-index 07a0ed0..da75a2d 100644<br>
---- a/kexec/arch/arm64/crashdump-<wbr>arm64.h<br>
-+++ b/kexec/arch/arm64/crashdump-<wbr>arm64.h<br>
-@@ -18,5 +18,8 @@<br>
-<br>
- extern struct memory_ranges usablemem_rgns;<br>
- extern struct memory_range crash_reserved_mem;<br>
-+extern struct memory_range elfcorehdr_mem;<br>
-+<br>
-+extern int load_crashdump_segments(struct kexec_info *info);<br>
-<br>
- #endif /* CRASHDUMP_ARM64_H */<br>
-diff --git a/kexec/arch/arm64/iomem.h b/kexec/arch/arm64/iomem.h<br>
-index 20cda87..d4864bb 100644<br>
---- a/kexec/arch/arm64/iomem.h<br>
-+++ b/kexec/arch/arm64/iomem.h<br>
-@@ -2,6 +2,8 @@<br>
- #define IOMEM_H<br>
-<br>
- #define SYSTEM_RAM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;System =
RAM\n&quot;<br>
-+#define KERNEL_CODE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Kernel =
code\n&quot;<br>
-+#define KERNEL_DATA=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Kernel =
data\n&quot;<br>
- #define CRASH_KERNEL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Crash kernel=
\n&quot;<br>
- #define IOMEM_RESERVED=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &quot;reserved\n&quot;<br>
-<br>
-diff --git a/kexec/arch/arm64/kexec-elf-<wbr>arm64.c b/kexec/arch/arm64/ke=
xec-elf-<wbr>arm64.c<br>
-index daf8bf0..c70a37a 100644<br>
---- a/kexec/arch/arm64/kexec-elf-<wbr>arm64.c<br>
-+++ b/kexec/arch/arm64/kexec-elf-<wbr>arm64.c<br>
-@@ -119,6 +119,16 @@ int elf_arm64_load(int argc, char **argv, const char =
*kernel_buf,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dbgprintf(&quot;%s: PE format:=C2=A0 =C2=A0 =C2=
=A0 %s\n&quot;, __func__,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(arm64_header_check=
_pe_sig(<wbr>header) ? &quot;yes&quot; : &quot;no&quot;));<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 if (info-&gt;kexec_flags &amp; KEXEC_ON_CRASH) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* create and initialize=
 elf core header segment */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D load_crashdum=
p_segments(info);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (result) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 dbgprintf(&quot;%s: Creating eflcorehdr failed.\n&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __fun=
c__);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto exit;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* load the kernel */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D elf_exec_load(&amp;ehdr, info);<br>
-<br>
---<br>
-1.9.1<br>
-<br>
diff --git a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0006-arm64-kdump-<w=
br>set-up-kernel-image-segment.<wbr>patch b/meta/recipes-kernel/kexec/<wbr>=
kexec-tools/0006-arm64-kdump-<wbr>set-up-kernel-image-segment.<wbr>patch<br=
>
deleted file mode 100644<br>
index 4149551..0000000<br>
--- a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0006-arm64-kdump-<wbr>set-=
up-kernel-image-segment.<wbr>patch<br>
+++ /dev/null<br>
@@ -1,137 +0,0 @@<br>
-From 4079c93ac5453ef5f7889ab64920c1<wbr>e9427690ef Mon Sep 17 00:00:00 200=
1<br>
-From: AKASHI Takahiro &lt;<a href=3D"mailto:takahiro.akashi@linaro.org">ta=
kahiro.akashi@linaro.org</a>&gt;<br>
-Date: Tue, 17 Feb 2015 16:06:55 +0900<br>
-Subject: [PATCH 6/9] arm64: kdump: set up kernel image segment<br>
-<br>
-On arm64, we can use the same kernel image as 1st kernel, but<br>
-we have to modify the entry point as well as segments&#39; addresses<br>
-in the kernel&#39;s elf header in order to load them into correct places.<=
br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://git.linaro.org/people/takahi=
ro.akashi/kexec-tools.git" rel=3D"noreferrer" target=3D"_blank">https://git=
.linaro.org/<wbr>people/takahiro.akashi/kexec-<wbr>tools.git</a>]<br>
-<br>
-Signed-off-by: AKASHI Takahiro &lt;<a href=3D"mailto:takahiro.akashi@linar=
o.org">takahiro.akashi@linaro.org</a>&gt;<br>
-Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@w=
indriver.com</a>&gt;<br>
----<br>
- kexec/arch/arm64/crashdump-<wbr>arm64.c | 23 +++++++++++++++++++++++<br>
- kexec/arch/arm64/crashdump-<wbr>arm64.h |=C2=A0 1 +<br>
- kexec/arch/arm64/kexec-arm64.c=C2=A0 =C2=A0 =C2=A0| 25 ++++++++++++++++++=
++-----<br>
- kexec/arch/arm64/kexec-elf-<wbr>arm64.c | 10 +++++++++-<br>
- 4 files changed, 53 insertions(+), 6 deletions(-)<br>
-<br>
-diff --git a/kexec/arch/arm64/crashdump-<wbr>arm64.c b/kexec/arch/arm64/cr=
ashdump-<wbr>arm64.c<br>
-index 8346131..9517329 100644<br>
---- a/kexec/arch/arm64/crashdump-<wbr>arm64.c<br>
-+++ b/kexec/arch/arm64/crashdump-<wbr>arm64.c<br>
-@@ -213,3 +213,26 @@ int load_crashdump_segments(struct kexec_info *info)<=
br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
- }<br>
-+<br>
-+/*<br>
-+ * e_entry and p_paddr are actually in virtual address space.<br>
-+ * Those values will be translated to physcal addresses by<br>
-+ * using virt_to_phys().<br>
-+ * So let&#39;s get ready for later use so the memory base (phys_offset)<=
br>
-+ * will be correctly replaced with crash_reserved_mem.start.<br>
-+ */<br>
-+void modify_ehdr_for_crashdump(<wbr>struct mem_ehdr *ehdr)<br>
-+{<br>
-+=C2=A0 =C2=A0 =C2=A0 struct mem_phdr *phdr;<br>
-+=C2=A0 =C2=A0 =C2=A0 int i;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 ehdr-&gt;e_entry +=3D - arm64_mem.phys_offset + cras=
h_reserved_mem.start;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; ehdr-&gt;e_phnum; i++) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 phdr =3D &amp;ehdr-&gt;e=
_phdr[i];<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (phdr-&gt;p_type !=3D=
 PT_LOAD)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 continue;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 phdr-&gt;p_paddr +=3D<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 (-arm64_mem.phys_offset + crash_reserved_mem.start);<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+}<br>
-diff --git a/kexec/arch/arm64/crashdump-<wbr>arm64.h b/kexec/arch/arm64/cr=
ashdump-<wbr>arm64.h<br>
-index da75a2d..382f571 100644<br>
---- a/kexec/arch/arm64/crashdump-<wbr>arm64.h<br>
-+++ b/kexec/arch/arm64/crashdump-<wbr>arm64.h<br>
-@@ -21,5 +21,6 @@ extern struct memory_range crash_reserved_mem;<br>
- extern struct memory_range elfcorehdr_mem;<br>
-<br>
- extern int load_crashdump_segments(struct kexec_info *info);<br>
-+extern void modify_ehdr_for_crashdump(<wbr>struct mem_ehdr *ehdr);<br>
-<br>
- #endif /* CRASHDUMP_ARM64_H */<br>
-diff --git a/kexec/arch/arm64/kexec-<wbr>arm64.c b/kexec/arch/arm64/kexec-=
<wbr>arm64.c<br>
-index 8ac811d..cec4e41 100644<br>
---- a/kexec/arch/arm64/kexec-<wbr>arm64.c<br>
-+++ b/kexec/arch/arm64/kexec-<wbr>arm64.c<br>
-@@ -307,12 +307,27 @@ unsigned long arm64_locate_kernel_segment(<wbr>struc=
t kexec_info *info)<br>
- {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long hole;<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 hole =3D locate_hole(info,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arm64_mem.text_offset + =
arm64_mem.image_size,<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MiB(2), 0, ULONG_MAX, 1)=
;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (info-&gt;kexec_flags &amp; KEXEC_ON_CRASH) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long hole_end;<=
br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hole =3D (crash_reserved=
_mem.start &lt; mem_min ?<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mem_min : crash_reserved_mem.start);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hole =3D _ALIGN_UP(hole,=
 MiB(2));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hole_end =3D hole + arm6=
4_mem.text_offset + arm64_mem.image_size;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((hole_end &gt; mem_m=
ax) ||<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (hole_end =
&gt; crash_reserved_mem.end)) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 dbgprintf(&quot;%s: Crash kernel out of range\n&quot;, __func__);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 hole =3D ULONG_MAX;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 } else {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hole =3D locate_hole(inf=
o,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 arm64_mem.text_offset + arm64_mem.image_size,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 MiB(2), 0, ULONG_MAX, 1);<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 if (hole =3D=3D ULONG_MAX)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbgprintf(&quot;%s: loca=
te_hole failed\n&quot;, __func__);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hole =3D=3D ULONG_MA=
X)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 dbgprintf(&quot;%s: locate_hole failed\n&quot;, __func__);<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return hole;<br>
- }<br>
-diff --git a/kexec/arch/arm64/kexec-elf-<wbr>arm64.c b/kexec/arch/arm64/ke=
xec-elf-<wbr>arm64.c<br>
-index c70a37a..842ce21 100644<br>
---- a/kexec/arch/arm64/kexec-elf-<wbr>arm64.c<br>
-+++ b/kexec/arch/arm64/kexec-elf-<wbr>arm64.c<br>
-@@ -9,6 +9,7 @@<br>
- #include &lt;stdlib.h&gt;<br>
- #include &lt;linux/elf.h&gt;<br>
-<br>
-+#include &quot;crashdump-arm64.h&quot;<br>
- #include &quot;kexec-arm64.h&quot;<br>
- #include &quot;kexec-elf.h&quot;<br>
- #include &quot;kexec-syscall.h&quot;<br>
-@@ -105,7 +106,8 @@ int elf_arm64_load(int argc, char **argv, const char *=
kernel_buf,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0arm64_mem.vp_offset =3D _ALIGN_DOWN(ehdr.e_entr=
y, MiB(2));<br>
--=C2=A0 =C2=A0 =C2=A0 arm64_mem.vp_offset -=3D kernel_segment - get_phys_o=
ffset();<br>
-+=C2=A0 =C2=A0 =C2=A0 if (!(info-&gt;kexec_flags &amp; KEXEC_ON_CRASH))<br=
>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arm64_mem.vp_offset -=3D=
 kernel_segment - get_phys_offset();<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dbgprintf(&quot;%s: kernel_segment: %016lx\n&qu=
ot;, __func__, kernel_segment);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dbgprintf(&quot;%s: text_offset:=C2=A0 =C2=A0 %=
016lx\n&quot;, __func__,<br>
-@@ -127,6 +129,12 @@ int elf_arm64_load(int argc, char **argv, const char =
*kernel_buf,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0__func__);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0goto exit;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* offset addresses=
 in order to fit vmlinux<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (elf_exec) into =
crash kernel&#39;s memory<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 modify_ehdr_for_crashdum=
p(&amp;<wbr>ehdr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* load the kernel */<br>
---<br>
-1.9.1<br>
-<br>
diff --git a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0007-arm64-kdump-<w=
br>set-up-other-segments.patch b/meta/recipes-kernel/kexec/<wbr>kexec-tools=
/0007-arm64-kdump-<wbr>set-up-other-segments.patch<br>
deleted file mode 100644<br>
index 2745466..0000000<br>
--- a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0007-arm64-kdump-<wbr>set-=
up-other-segments.patch<br>
+++ /dev/null<br>
@@ -1,35 +0,0 @@<br>
-From 07ad14e12665221d754fde8e47c32a<wbr>c18c24586a Mon Sep 17 00:00:00 200=
1<br>
-From: AKASHI Takahiro &lt;<a href=3D"mailto:takahiro.akashi@linaro.org">ta=
kahiro.akashi@linaro.org</a>&gt;<br>
-Date: Fri, 31 Jul 2015 20:01:39 +0900<br>
-Subject: [PATCH 7/9] arm64: kdump: set up other segments<br>
-<br>
-We make sure that all the other segments, initrd and device-tree blob,<br>
-also be loaded into the reserved memory of crash dump kernel.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://git.linaro.org/people/takahi=
ro.akashi/kexec-tools.git" rel=3D"noreferrer" target=3D"_blank">https://git=
.linaro.org/<wbr>people/takahiro.akashi/kexec-<wbr>tools.git</a>]<br>
-<br>
-Signed-off-by: AKASHI Takahiro &lt;<a href=3D"mailto:takahiro.akashi@linar=
o.org">takahiro.akashi@linaro.org</a>&gt;<br>
-Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@w=
indriver.com</a>&gt;<br>
----<br>
- kexec/arch/arm64/kexec-arm64.c | 5 ++++-<br>
- 1 file changed, 4 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/kexec/arch/arm64/kexec-<wbr>arm64.c b/kexec/arch/arm64/kexec-=
<wbr>arm64.c<br>
-index cec4e41..78a0035 100644<br>
---- a/kexec/arch/arm64/kexec-<wbr>arm64.c<br>
-+++ b/kexec/arch/arm64/kexec-<wbr>arm64.c<br>
-@@ -374,7 +374,10 @@ int arm64_load_other_segments(<wbr>struct kexec_info =
*info,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Put the other segments after the image. */<b=
r>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0hole_min =3D image_base + arm64_mem.image_size;=
<br>
--=C2=A0 =C2=A0 =C2=A0 hole_max =3D ULONG_MAX;<br>
-+=C2=A0 =C2=A0 =C2=A0 if (info-&gt;kexec_flags &amp; KEXEC_ON_CRASH)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hole_max =3D crash_reser=
ved_mem.end;<br>
-+=C2=A0 =C2=A0 =C2=A0 else<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hole_max =3D ULONG_MAX;<=
br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (arm64_opts.initrd) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0initrd_buf =3D slur=
p_file(arm64_opts.initrd, &amp;initrd_size);<br>
---<br>
-1.9.1<br>
-<br>
diff --git a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0008-arm64-kdump-<w=
br>add-DT-properties-to-crash-<wbr>dump-kernel-s.patch b/meta/recipes-kerne=
l/kexec/<wbr>kexec-tools/0008-arm64-kdump-<wbr>add-DT-properties-to-crash-<=
wbr>dump-kernel-s.patch<br>
deleted file mode 100644<br>
index 31c3d85..0000000<br>
--- a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0008-arm64-kdump-<wbr>add-=
DT-properties-to-crash-<wbr>dump-kernel-s.patch<br>
+++ /dev/null<br>
@@ -1,150 +0,0 @@<br>
-From 23bf7ac189cc3b87ceb9d1d3b69b5c<wbr>4815354add Mon Sep 17 00:00:00 200=
1<br>
-From: AKASHI Takahiro &lt;<a href=3D"mailto:takahiro.akashi@linaro.org">ta=
kahiro.akashi@linaro.org</a>&gt;<br>
-Date: Wed, 27 Jan 2016 13:38:39 +0900<br>
-Subject: [PATCH 8/9] arm64: kdump: add DT properties to crash dump kernel&=
#39;s<br>
- dtb<br>
-<br>
-We pass the following properties to crash dump kernel:<br>
-linux,elfcorehdr: elf core header segment,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0same as &quo=
t;elfcorehdr=3D&quot; kernel parameter on other archs<br>
-linux,usable-memory-range: usable memory reserved for crash dump kernel<br=
>
-<br>
-Upstream-Status: Backport [<a href=3D"https://git.linaro.org/people/takahi=
ro.akashi/kexec-tools.git" rel=3D"noreferrer" target=3D"_blank">https://git=
.linaro.org/<wbr>people/takahiro.akashi/kexec-<wbr>tools.git</a>]<br>
-<br>
-Signed-off-by: AKASHI Takahiro &lt;<a href=3D"mailto:takahiro.akashi@linar=
o.org">takahiro.akashi@linaro.org</a>&gt;<br>
-Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@w=
indriver.com</a>&gt;<br>
----<br>
- kexec/arch/arm64/kexec-arm64.c=C2=A0 =C2=A0 =C2=A0| 76 ++++++++++++++++++=
++++++++++++<wbr>+++++---<br>
- kexec/arch/arm64/kexec-elf-<wbr>arm64.c |=C2=A0 5 ---<br>
- 2 files changed, 71 insertions(+), 10 deletions(-)<br>
-<br>
-diff --git a/kexec/arch/arm64/kexec-<wbr>arm64.c b/kexec/arch/arm64/kexec-=
<wbr>arm64.c<br>
-index 78a0035..a8fb64f 100644<br>
---- a/kexec/arch/arm64/kexec-<wbr>arm64.c<br>
-+++ b/kexec/arch/arm64/kexec-<wbr>arm64.c<br>
-@@ -128,9 +128,6 @@ int arch_process_options(int argc, char **argv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case OPT_INITRD:<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0arm64_opts.initrd =3D optarg;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case OPT_PANIC:<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 die(&quot;load-panic (-p) not supported&quot;);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 break;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break; /* Ignore core and unknown options. */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-@@ -285,8 +282,12 @@ on_success:<br>
-=C2=A0 * setup_2nd_dtb - Setup the 2nd stage kernel&#39;s dtb.<br>
-=C2=A0 */<br>
-<br>
--static int setup_2nd_dtb(struct dtb *dtb, char *command_line)<br>
-+static int setup_2nd_dtb(struct dtb *dtb, char *command_line, int on_cras=
h)<br>
- {<br>
-+=C2=A0 =C2=A0 =C2=A0 char *new_buf;<br>
-+=C2=A0 =C2=A0 =C2=A0 int new_size;<br>
-+=C2=A0 =C2=A0 =C2=A0 int nodeoffset;<br>
-+=C2=A0 =C2=A0 =C2=A0 uint64_t range[2];<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int result;<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D fdt_check_header(dtb-&gt;buf);<br>
-@@ -298,8 +299,72 @@ static int setup_2nd_dtb(struct dtb *dtb, char *comma=
nd_line)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D set_bootargs(dtb, command_line);<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 /* remove those anyway */<br>
-+=C2=A0 =C2=A0 =C2=A0 nodeoffset =3D fdt_path_offset(dtb-&gt;buf, &quot;/c=
hosen&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 fdt_delprop(dtb-&gt;buf, nodeoffset, &quot;linux,cra=
shkernel-base&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 fdt_delprop(dtb-&gt;buf, nodeoffset, &quot;linux,cra=
shkernel-size&quot;);<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 if (on_crash) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nodeoffset =3D fdt_path_=
offset(dtb-&gt;buf, &quot;/chosen&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fdt_delprop(dtb-&gt;buf,=
 nodeoffset, &quot;linux,elfcorehdr&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fdt_delprop(dtb-&gt;buf,=
 nodeoffset, &quot;linux,usable-memory-range&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_size =3D fdt_totalsi=
ze(dtb-&gt;buf)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 + 2 * (sizeof(struct fdt_property)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 + FDT_TAGALIGN(=
sizeof(range)))<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 + strlen(&quot;linux,elfcorehdr&quot;) + 1<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 + strlen(&quot;linux,usable-memory-<wbr>range&quot;) + 1;<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 new_buf =3D xmalloc(new_=
size);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D fdt_open_into=
(dtb-&gt;buf, new_buf, new_size);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (result) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 dbgprintf(&quot;%s: fdt_open_into failed: %s\n&quot;, __func__,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fdt_strerror(result));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 result =3D -ENOSPC;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto on_error;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 range[0] =3D cpu_to_be64=
(elfcorehdr_mem.<wbr>start);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 range[1] =3D cpu_to_be64=
(elfcorehdr_mem.end<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - elfcorehdr_mem.start + 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nodeoffset =3D fdt_path_=
offset(new_buf, &quot;/chosen&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D fdt_setprop(n=
ew_buf, nodeoffset, &quot;linux,elfcorehdr&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void *)range, sizeof(range));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (result) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 dbgprintf(&quot;%s: fdt_setprop failed: %s\n&quot;, __func__,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fdt_strerror(result));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 result =3D -EINVAL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto on_error;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 range[0] =3D cpu_to_be64=
(crash_reserved_<wbr>mem.start);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 range[1] =3D cpu_to_be64=
(crash_reserved_<wbr>mem.end<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - crash_reserved_mem.start + 1);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nodeoffset =3D fdt_path_=
offset(new_buf, &quot;/chosen&quot;);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D fdt_setprop(n=
ew_buf, nodeoffset,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;linux,usable-memory-range&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (void *)range, sizeof(range));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (result) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 dbgprintf(&quot;%s: fdt_setprop failed: %s\n&quot;, __func__,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fdt_strerror(result));<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 result =3D -EINVAL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto on_error;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fdt_pack(new_buf);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb-&gt;buf =3D new_buf;=
<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb-&gt;size =3D fdt_tot=
alsize(new_buf);<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dump_reservemap(dtb);<br>
-<br>
-+<br>
-+=C2=A0 =C2=A0 =C2=A0 return result;<br>
-+<br>
-+on_error:<br>
-+=C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;kexec: %s failed.\n&quot;, __f=
unc__);<br>
-+=C2=A0 =C2=A0 =C2=A0 if (new_buf)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free(new_buf);<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return result;<br>
- }<br>
-<br>
-@@ -366,7 +431,8 @@ int arm64_load_other_segments(<wbr>struct kexec_info *=
info,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 result =3D setup_2nd_dtb(&amp;dtb, command_line);<br=
>
-+=C2=A0 =C2=A0 =C2=A0 result =3D setup_2nd_dtb(&amp;dtb, command_line,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 info-&gt;kexec_flags &amp; KEXEC_ON_CRASH);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (result)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EFAILED;<br=
>
-diff --git a/kexec/arch/arm64/kexec-elf-<wbr>arm64.c b/kexec/arch/arm64/ke=
xec-elf-<wbr>arm64.c<br>
-index 842ce21..b17a31a 100644<br>
---- a/kexec/arch/arm64/kexec-elf-<wbr>arm64.c<br>
-+++ b/kexec/arch/arm64/kexec-elf-<wbr>arm64.c<br>
-@@ -47,11 +47,6 @@ int elf_arm64_load(int argc, char **argv, const char *k=
ernel_buf,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int result;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0int i;<br>
-<br>
--=C2=A0 =C2=A0 =C2=A0 if (info-&gt;kexec_flags &amp; KEXEC_ON_CRASH) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stderr, &quot;ke=
xec: kdump not yet supported on arm64\n&quot;);<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EFAILED;<br>
--=C2=A0 =C2=A0 =C2=A0 }<br>
--<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D build_elf_exec_info(kernel_<wbr>buf,=
 kernel_size, &amp;ehdr, 0);<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (result &lt; 0) {<br>
---<br>
-1.9.1<br>
-<br>
diff --git a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0009-arm64-kdump-<w=
br>Add-support-for-binary-image-<wbr>files.patch b/meta/recipes-kernel/kexe=
c/<wbr>kexec-tools/0009-arm64-kdump-<wbr>Add-support-for-binary-image-<wbr>=
files.patch<br>
deleted file mode 100644<br>
index 8b1c018..0000000<br>
--- a/meta/recipes-kernel/kexec/<wbr>kexec-tools/0009-arm64-kdump-<wbr>Add-=
support-for-binary-image-<wbr>files.patch<br>
+++ /dev/null<br>
@@ -1,52 +0,0 @@<br>
-From 5a4958f01a793c3e7f440f5bae7566<wbr>6a4349cc50 Mon Sep 17 00:00:00 200=
1<br>
-From: Pratyush Anand &lt;<a href=3D"mailto:panand@redhat.com">panand@redha=
t.com</a>&gt;<br>
-Date: Thu, 14 May 2015 11:25:37 +0530<br>
-Subject: [PATCH 9/9] arm64: kdump: Add support for binary image files<br>
-<br>
-This patch adds support to use binary image ie arch/arm64/boot/Image with<=
br>
-kdump.<br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://git.linaro.org/people/takahi=
ro.akashi/kexec-tools.git" rel=3D"noreferrer" target=3D"_blank">https://git=
.linaro.org/<wbr>people/takahiro.akashi/kexec-<wbr>tools.git</a>]<br>
-<br>
-Signed-off-by: Pratyush Anand &lt;<a href=3D"mailto:panand@redhat.com">pan=
and@redhat.com</a>&gt;<br>
-[<a href=3D"mailto:takahiro.akashi@linaro.org">takahiro.akashi@linaro.org<=
/a>: a bit reworked]<br>
-Signed-off-by: AKASHI Takahiro &lt;<a href=3D"mailto:takahiro.akashi@linar=
o.org">takahiro.akashi@linaro.org</a>&gt;<br>
-Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@w=
indriver.com</a>&gt;<br>
----<br>
- kexec/arch/arm64/kexec-image-<wbr>arm64.c | 12 ++++++++++++<br>
- 1 file changed, 12 insertions(+)<br>
-<br>
-diff --git a/kexec/arch/arm64/kexec-<wbr>image-arm64.c b/kexec/arch/arm64/=
kexec-<wbr>image-arm64.c<br>
-index 960ed96..982e431 100644<br>
---- a/kexec/arch/arm64/kexec-<wbr>image-arm64.c<br>
-+++ b/kexec/arch/arm64/kexec-<wbr>image-arm64.c<br>
-@@ -4,7 +4,9 @@<br>
-<br>
- #define _GNU_SOURCE<br>
-<br>
-+#include &quot;crashdump-arm64.h&quot;<br>
- #include &quot;kexec-arm64.h&quot;<br>
-+#include &quot;kexec-syscall.h&quot;<br>
- #include &lt;limits.h&gt;<br>
-<br>
- int image_arm64_probe(const char *kernel_buf, off_t kernel_size)<br>
-@@ -58,6 +60,16 @@ int image_arm64_load(int argc, char **argv, const char =
*kernel_buf,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0dbgprintf(&quot;%s: PE format:=C2=A0 =C2=A0 =C2=
=A0 %s\n&quot;, __func__,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(arm64_header_check=
_pe_sig(<wbr>header) ? &quot;yes&quot; : &quot;no&quot;));<br>
-<br>
-+=C2=A0 =C2=A0 =C2=A0 if (info-&gt;kexec_flags &amp; KEXEC_ON_CRASH) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* create and initialize=
 elf core header segment */<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D load_crashdum=
p_segments(info);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (result) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 dbgprintf(&quot;%s: Creating eflcorehdr failed.\n&quot;,<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __fun=
c__);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 goto exit;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-+=C2=A0 =C2=A0 =C2=A0 }<br>
-+<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0/* load the kernel */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0add_segment_phys_virt(info, kernel_buf, kernel_=
size,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0kernel_segment + arm64_mem.text_offset,<br>
---<br>
-1.9.1<br>
-<br>
diff --git a/meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.14=
.bb" rel=3D"noreferrer" target=3D"_blank">ke<wbr>xec-tools_2.0.14.bb</a> b/=
meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.15.bb" rel=3D"n=
oreferrer" target=3D"_blank">ke<wbr>xec-tools_2.0.15.bb</a><br>
similarity index 63%<br>
rename from meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.14.=
bb" rel=3D"noreferrer" target=3D"_blank">kexe<wbr>c-tools_2.0.14.bb</a><br>
rename to meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.15.bb=
" rel=3D"noreferrer" target=3D"_blank">kexe<wbr>c-tools_2.0.15.bb</a><br>
index 0f6398f1..6bd9025 100644<br>
--- a/meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.14.bb" re=
l=3D"noreferrer" target=3D"_blank">ke<wbr>xec-tools_2.0.14.bb</a><br>
+++ b/meta/recipes-kernel/kexec/<a href=3D"http://kexec-tools_2.0.15.bb" re=
l=3D"noreferrer" target=3D"_blank">ke<wbr>xec-tools_2.0.15.bb</a><br>
@@ -5,26 +5,13 @@ EXTRA_OECONF =3D &quot; --with-zlib=3Dyes&quot;<br>
=C2=A0SRC_URI +=3D &quot;${KERNELORG_MIRROR}/linux/<wbr>utils/kernel/kexec/=
kexec-<wbr>tools-${PV}.tar.gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-powerpc-change-=
<wbr>the-memory-size-limit.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-purgatory-Pass-=
r-<wbr>directly-to-linker.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-vmcore-dmesg-<wbr>De=
fine-_GNU_SOURCE.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-kexec-exntend-the-<w=
br>semantics-of-kexec_iomem_for_<wbr>each_.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-kexec-generalize-<wb=
r>and-rename-get_kernel_stext_<wbr>sym.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0003-arm64-identify-<wbr>=
PHYS_OFFSET-correctly.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-arm64-kdump-<wbr>ide=
ntify-memory-regions.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-arm64-kdump-add-<wbr=
>elf-core-header-segment.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0006-arm64-kdump-set-<wbr=
>up-kernel-image-segment.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0007-arm64-kdump-set-<wbr=
>up-other-segments.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0008-arm64-kdump-add-<wbr=
>DT-properties-to-crash-dump-<wbr>kernel-s.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0009-arm64-kdump-Add-<wbr=
>support-for-binary-image-<wbr>files.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0010-kexec-ARM-Fix-a=
dd_<wbr>buffer_phys_virt-align-issue.<wbr>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-x86-x86_64-Fix-<wbr>=
format-warning-with-die.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-ppc-Fix-format-<wbr>=
warning-with-die.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://kexec-x32.patch \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Disable-PIE-<wb=
r>during-link.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-arm64-Disable-PIC.<w=
br>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;<wbr>b2b2c5e6b29d467d6e99d587fb6b7c<wbr>f5&quot;=
<br>
-SRC_URI[sha256sum] =3D &quot;<wbr>b3e69519d2acced256843b1e8f1ecf<wbr>a00d9=
b54fa07449ed78f05b9193f23<wbr>9370&quot;<br>
+SRC_URI[md5sum] =3D &quot;<wbr>78906fdc255656fa2b9996c8acb3ef<wbr>62&quot;=
<br>
+SRC_URI[sha256sum] =3D &quot;<wbr>42dbd0dab9964cd1ed89fa4571c8d1<wbr>3191e=
b7132b361ade5ac44517c91ec<wbr>b97e&quot;<br>
<br>
=C2=A0SECURITY_PIE_CFLAGS_remove =3D &quot;-fPIE -pie&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.7.4<br>
<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></blockquote></div><br></div>

--94eb2c0c07b0bb561f055d751f53--
