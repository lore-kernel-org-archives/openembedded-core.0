Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-ob0-f195.google.com (mail-ob0-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 865F5606D0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 22:32:27 +0000 (UTC)
Received: by mail-ob0-f195.google.com with SMTP id wj2so1961656obc.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2016 15:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=aH0sag/p08EP0sbI0/qYdZ39LjznVuwOlsOZxxW8+tU=;
	b=WdktMspMe4hINBldAAeAyfdYQ0cJl2Ro4rYU+Dxr29EC1TP5DAQIb8poVP9nM3pGVo
	OFkBw9B9uoU+3PSh+PAHnmlpt/Of9/E5hzh+LWc2kHw7KqSQ2B6vKEwrWhLWY+lsMpeO
	2thfvVzaVVdk759EBMSPz2pr5iH2KWtPytlB5Qu4CCKIdvVvs7PE1QnT/yUoI1iXsUMa
	nRPqgrB9buYYigXOOZgwgURr4iJIyPtg9tcS51KiwyhfW0Sn/i0i1YOHscu/JwDTL/cq
	+TScMWvGO1BdCOiKIQNC8QpY1wE0wmm1k5qZdvYC48UQA8gf6gbHUxSCWpuLvMxQT/Xi
	i+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=aH0sag/p08EP0sbI0/qYdZ39LjznVuwOlsOZxxW8+tU=;
	b=Fp/1Touq5e8LU+IyCkRCvbiFEt6PaE7EAEd2vJx6A6K3ATVesPwjlYAf6PkLPuM7LT
	aHEZukqt83NSOZEAZcenf18wNWLvDMvGSYZ1UwZBtkyIyzKbsptADpRT83wN8L/h+dgv
	OgNSkypaQ81f9Zaw7/CgxhJitfv4fPJ8A3IgT6WsUpWF7rWIWHX0h7Utx5Fhx9+vuSyq
	Y8zqz8K85KnlOjbBCsZdSndtLl7t+VKGiW8dXEw4TYAuLEl56DCjjHvzjBXSH9Oq8zXG
	6pL1dw7ZG0Ev7KPqPejp0m4z9Z+aInyZk/izLETVP8yh7yzpZNuejzW0/bAWwDtDjCGy
	GvBA==
X-Gm-Message-State: ALyK8tJvZWkeyGBnUumwqPOPMvhtX6dVgj1HYp5B1AtVjhYRy+RE75SWXwi9EJOo0LgdLEURs6AYUJ0Cso2HNg==
X-Received: by 10.157.14.203 with SMTP id 69mr7641063otj.191.1466375548021;
	Sun, 19 Jun 2016 15:32:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.129.164 with HTTP; Sun, 19 Jun 2016 15:32:27 -0700 (PDT)
In-Reply-To: <1466365213-23167-1-git-send-email-sarnold@vctlabs.com>
References: <1466365213-23167-1-git-send-email-sarnold@vctlabs.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
Date: Sun, 19 Jun 2016 15:32:27 -0700
Message-ID: <CAOLEWZWSs2pVWzNcQcjDR=xdYOFdh+JWk_ybesgNDMNPPR6M1A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qemu-native: set ld.bfd, fix cflags, and set some environment vars
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
X-List-Received-Date: Sun, 19 Jun 2016 22:32:28 -0000
Content-Type: text/plain; charset=UTF-8

Following this:

http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

and it still strips my " v3" from PATCH.  Is there another
document/prefix format I should be looking at?

Thanks, Steve

On Sun, Jun 19, 2016 at 12:40 PM, Stephen Arnold <sarnold@vctlabs.com> wrote:
> The main thing is build failures with gold linker, but qemu is also
> a little too aggressive at finding random tools on the build host, so
> we also set the build env for qemu-native and make sure it doesn't
> reset its own (hard-coded) cflags when we don't want it to.
>
> Signed-off-by: Stephen Arnold <sarnold@vctlabs.com>
>
> The cflags patch was imported from Gentoo Portage and has been
> manitained over several versions; this version was rebased against
> upstream qemu git.
>
> Upstream-Status: Inappropriate
>  - Patch addresses distribution maintenance and build environment
>    sanity.
>
> Signed-off-by: Stephen Arnold <nerdboy@gentoo.org>
> ---
>  meta/recipes-devtools/qemu/qemu.inc                | 13 +++++++--
>  .../qemu/qemu/qemu-2.6.0-cflags.patch              | 31 ++++++++++++++++++++++
>  meta/recipes-devtools/qemu/qemu_2.6.0.bb           |  1 +
>  3 files changed, 43 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/qemu-2.6.0-cflags.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index bf689bb..d5925fd 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -30,8 +30,12 @@ SRC_URI_append_class-native = "\
>
>  EXTRA_OECONF += "--target-list=${@get_qemu_target_list(d)} --disable-werror  --disable-bluez --disable-libiscsi --with-system-pixman --extra-cflags='${CFLAGS}'"
>
> -EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror \
> -                               "
> +EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disable-werror"
> +
> +EXTRA_OEMAKE_append_class-native = " LD='${LD}' AR='${AR}' OBJCOPY='${OBJCOPY}' LDFLAGS='${LDFLAGS}'"
> +
> +LDFLAGS_append_class-native = " -fuse-ld=bfd"
> +
>  export LIBTOOL="${HOST_SYS}-libtool"
>
>  do_configure_prepend_class-native() {
> @@ -40,6 +44,11 @@ do_configure_prepend_class-native() {
>         if [ ! -z "$BHOST_PKGCONFIG_PATH" ]; then
>                 export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$BHOST_PKGCONFIG_PATH
>         fi
> +
> +       # Alter target makefiles to accept CFLAGS set via env
> +       sed -i -r \
> +               -e 's/^(C|OP_C|HELPER_C)FLAGS=/\1FLAGS+=/' \
> +               "${S}"/Makefile "${S}"/Makefile.target
>  }
>
>  KVMENABLE = "--enable-kvm"
> diff --git a/meta/recipes-devtools/qemu/qemu/qemu-2.6.0-cflags.patch b/meta/recipes-devtools/qemu/qemu/qemu-2.6.0-cflags.patch
> new file mode 100644
> index 0000000..5b78edf
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/qemu-2.6.0-cflags.patch
> @@ -0,0 +1,31 @@
> +From 5d29baaf7a8c09f2f97231116e0f396b0402b23d Mon Sep 17 00:00:00 2001
> +From: Steve Arnold <stephen.arnold42@gmail.com>
> +Date: Sun, 19 Jun 2016 11:29:44 -0700
> +Subject: [PATCH] configure: remove hard-coded flags and let build env handle
> + it
> +
> +Apply distribution patch for handling debug and fortify source options.
> +
> +Signed-off-by: Steve Arnold <nerdboy@gentoo.org>
> +---
> + configure | 4 ----
> + 1 file changed, 4 deletions(-)
> +
> +diff --git a/configure b/configure
> +index 10cb212..6f1b10c 100755
> +--- a/configure
> ++++ b/configure
> +@@ -4539,10 +4539,6 @@ fi
> + if test "$gcov" = "yes" ; then
> +   CFLAGS="-fprofile-arcs -ftest-coverage -g $CFLAGS"
> +   LDFLAGS="-fprofile-arcs -ftest-coverage $LDFLAGS"
> +-elif test "$fortify_source" = "yes" ; then
> +-  CFLAGS="-O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 $CFLAGS"
> +-elif test "$debug" = "no"; then
> +-  CFLAGS="-O2 $CFLAGS"
> + fi
> +
> + ##########################################
> +--
> +2.8.1
> +
> diff --git a/meta/recipes-devtools/qemu/qemu_2.6.0.bb b/meta/recipes-devtools/qemu/qemu_2.6.0.bb
> index e391326..62c509b 100644
> --- a/meta/recipes-devtools/qemu/qemu_2.6.0.bb
> +++ b/meta/recipes-devtools/qemu/qemu_2.6.0.bb
> @@ -8,6 +8,7 @@ SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
>              file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
>              file://no-valgrind.patch \
>              file://pathlimit.patch \
> +            file://qemu-2.5.0-cflags.patch \
>             "
>  SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
>  SRC_URI[md5sum] = "ca3f70b43f093e33e9e014f144067f13"
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

