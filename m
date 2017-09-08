Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id A9CC1781FB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 13:35:04 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id c85so1336062ywa.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 06:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=owJwBDlFiegDcf4A+fOibDZtBfJmzloPU8EVcmP/Ofo=;
	b=jzI2vwpRJeZtyF26Uby/Amkv/rQ7mEtucpB5bhpDf7e1E1GoNWPE39CneX73IoKcn8
	VNW3OWLtrusufEEMoe8M3PHbTCRUwsfynV6oJPtoH4TlJ2sXp5sJwkGpcNhVYjDtGTtI
	cRtAllThrmjmHYAwpLkOPdFf+FkXUQ1pGZlMGEzFrGkHpxuO+Ruzf4OdwJYArvCORCcq
	6H93r0Xda79TJcNkMcS9RC57D/hqjQrvqsSCErEXpYt04wvKD8Vt6o3g5WkzHFRMp+uA
	FVAKu1K8AWOUPZ57baIrdz5IZveucuJcahYbVW3RiCH9VrdW+fpH4H/fHJ/HakKhJvil
	Fe6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=owJwBDlFiegDcf4A+fOibDZtBfJmzloPU8EVcmP/Ofo=;
	b=FpvXVWOJ/Ed6k7IQReEBkmJZNiqCoo9Ff/96ZEiIWHmJTWWVCzx8jG5kJr+nDa0tGo
	xQ72UavX4h8E6SRp4DqDL3u7niTerP9j2o/UkB2PnWfAnE61iNLZJfnavPPwxOReXvJY
	6eZaLj6P/1SlYkFUTvkOLMKgFxX+M9S6ZWEp7uT+h6Hydh2P1A8yqP9FeBSX1QcBafez
	cMKoRFpFp7mk5pyXElHEgS4qhqJ9eyda5GBS2AoZ72HRB1RxepwINUSFDwCW7A9NoJa8
	E7l8rztFtUwcEZ1K32WlC7zpZniRGE+9OPJ4/L5fLA1JupnfdSwSZBDh1nz5xnqIw8E8
	B9Iw==
X-Gm-Message-State: AHPjjUjRJPm0em3q+xkhhG0GiIlIt++P3J0c6nURob2Yki8zKoSOsrd9
	TVad5kBlBT7rr8LYjf8=
X-Received: by 10.37.160.38 with SMTP id x35mr2478673ybh.325.1504877705573;
	Fri, 08 Sep 2017 06:35:05 -0700 (PDT)
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com.
	[209.85.218.48]) by smtp.gmail.com with ESMTPSA id
	n186sm688080ywn.12.2017.09.08.06.35.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 06:35:04 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f48.google.com with SMTP id r20so14786924oie.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 06:35:04 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QCXpDFiUOh93ciCYnX9kT5Czf1s8QckrIPamRgX+d055mzG3WTeJj4vXMeC+syrBDo2ucenz21y8Ce6Y0KyxN0=
X-Received: by 10.202.56.194 with SMTP id f185mr2601231oia.249.1504877703904; 
	Fri, 08 Sep 2017 06:35:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Fri, 8 Sep 2017 06:35:03 -0700 (PDT)
In-Reply-To: <20170906223125.21628-1-california.l.sullivan@intel.com>
References: <20170906223125.21628-1-california.l.sullivan@intel.com>
Date: Fri, 8 Sep 2017 10:35:03 -0300
X-Gmail-Original-Message-ID: <CAP9ODKocL2E6nH-kmJW11BDjcUCF8gCjknvtigTWcjUiA_FFHw@mail.gmail.com>
Message-ID: <CAP9ODKocL2E6nH-kmJW11BDjcUCF8gCjknvtigTWcjUiA_FFHw@mail.gmail.com>
To: California Sullivan <california.l.sullivan@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] initramfs-framework: split setup-live and install-efi into separate recipes
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
X-List-Received-Date: Fri, 08 Sep 2017 13:35:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 6, 2017 at 7:31 PM, California Sullivan
<california.l.sullivan@intel.com> wrote:
> Having these the initramfs-framework recipe forced initramfs-framework
> users to build several tools they didn't need, and made it more
> difficult to declare the recipe as allarch.
>
> Fixes [YOCTO #12024].
>
> v2 changes:
>   * fix SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS in layer.conf
>   * bump PR of initramfs-framework
>   * add allarch to setup-live and install-efi modules, as they're just
>     shell scripts
>
> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
> ---
> I think I agree with Otavio on the allarch discussion. Setup-live at the
> very least is applicable to everything, and while install-efi is
> unlikely to be used for anything that's not x86-based, it EFI on arm
> does technically exist.
>
> We can discuss it more if necessary.
>
>  meta/conf/layer.conf                               |  8 ++++----
>  .../initrdscripts/initramfs-framework_1.0.bb       | 22 +++-------------------
>  .../initramfs-module-install-efi_1.0.bb            | 20 ++++++++++++++++++++
>  .../initramfs-module-setup-live_1.0.bb             | 20 ++++++++++++++++++++
>  4 files changed, 47 insertions(+), 23 deletions(-)
>  create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
>  create mode 100644 meta/recipes-core/initrdscripts/initramfs-module-setup-live_1.0.bb
>
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
> index 04aa730..df457c2 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -50,12 +50,12 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>    docbook-xsl-stylesheets->perl \
>    ca-certificates->openssl \
>    initramfs-framework->${VIRTUAL-RUNTIME_base-utils} \
> -  initramfs-framework->dosfstools \
> -  initramfs-framework->e2fsprogs \
>    initramfs-framework->eudev \
> -  initramfs-framework->parted \
>    initramfs-framework->systemd \
> -  initramfs-framework->util-linux \
> +  initramfs-module-install-efi->dosfstools \
> +  initramfs-module-install-efi->e2fsprogs \
> +  initramfs-module-install-efi->parted \
> +  initramfs-module-install-efi->util-linux \
>    liberation-fonts->fontconfig \
>    cantarell-fonts->fontconfig \
>    gnome-icon-theme->librsvg \
> diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> index 77b2ff8..2afc37e 100644
> --- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> +++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
> @@ -3,7 +3,7 @@ LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>  RDEPENDS_${PN} += "${VIRTUAL-RUNTIME_base-utils}"
>
> -PR = "r3"
> +PR = "r4"
>
>  inherit allarch
>
> @@ -14,8 +14,7 @@ SRC_URI = "file://init \
>             file://udev \
>             file://e2fs \
>             file://debug \
> -           file://setup-live \
> -           file://install-efi.sh"
> +          "
>
>  S = "${WORKDIR}"
>
> @@ -27,9 +26,6 @@ do_install() {
>      install -m 0755 ${WORKDIR}/rootfs ${D}/init.d/90-rootfs
>      install -m 0755 ${WORKDIR}/finish ${D}/init.d/99-finish
>
> -    # setup-live
> -    install -m 0755 ${WORKDIR}/setup-live ${D}/init.d/80-setup-live
> -
>      # mdev
>      install -m 0755 ${WORKDIR}/mdev ${D}/init.d/01-mdev
>
> @@ -42,9 +38,6 @@ do_install() {
>      # debug
>      install -m 0755 ${WORKDIR}/debug ${D}/init.d/00-debug
>
> -    # install-efi
> -    install -m 0755 ${WORKDIR}/install-efi.sh ${D}/init.d/install-efi.sh
> -
>      # Create device nodes expected by some kernels in initramfs
>      # before even executing /init.
>      install -d ${D}/dev
> @@ -57,8 +50,7 @@ PACKAGES = "${PN}-base \
>              initramfs-module-e2fs \
>              initramfs-module-rootfs \
>              initramfs-module-debug \
> -            initramfs-module-setup-live \
> -            initramfs-module-install-efi"
> +           "
>
>  FILES_${PN}-base = "/init /init.d/99-finish /dev"
>
> @@ -78,10 +70,6 @@ SUMMARY_initramfs-module-udev = "initramfs support for udev"
>  RDEPENDS_initramfs-module-udev = "${PN}-base udev"
>  FILES_initramfs-module-udev = "/init.d/01-udev"
>
> -SUMMARY_initramfs-module-setup-live = "initramfs support for setup live"
> -RDEPENDS_initramfs-module-setup-live = "${PN}-base udev-extraconf"
> -FILES_initramfs-module-setup-live = "/init.d/80-setup-live"
> -
>  SUMMARY_initramfs-module-e2fs = "initramfs support for ext4/ext3/ext2 filesystems"
>  RDEPENDS_initramfs-module-e2fs = "${PN}-base"
>  FILES_initramfs-module-e2fs = "/init.d/10-e2fs"
> @@ -93,7 +81,3 @@ FILES_initramfs-module-rootfs = "/init.d/90-rootfs"
>  SUMMARY_initramfs-module-debug = "initramfs dynamic debug support"
>  RDEPENDS_initramfs-module-debug = "${PN}-base"
>  FILES_initramfs-module-debug = "/init.d/00-debug"
> -
> -SUMMARY_initramfs-module-install-efi = "initramfs support for installation option"
> -RDEPENDS_initramfs-module-install-efi = "${PN}-base parted e2fsprogs-mke2fs dosfstools util-linux-blkid"
> -FILES_initramfs-module-install-efi = "/init.d/install-efi.sh"
> diff --git a/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
> new file mode 100644
> index 0000000..541381b
> --- /dev/null
> +++ b/meta/recipes-core/initrdscripts/initramfs-module-install-efi_1.0.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "initramfs-framework module for installation option"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +RDEPENDS_${PN} = "initramfs-framework-base parted e2fsprogs-mke2fs dosfstools util-linux-blkid"
> +
> +PR = "r1"

Use 'r4' here as well or package feeds can break.

Other than that, I am fine with it.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

