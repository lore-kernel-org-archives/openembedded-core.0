Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 37462786F0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 17:06:45 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id f136so5205387lff.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 09:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q39v7Vj6NNHOAdBnRavfr4y9YskigsGue/ClCDz5A1k=;
	b=l3CD0SGhEAtuU1bXPz1nQHWbPxD6Ha1jbqtsbGqn1dVfyUipTDmsw9/DplE6Ba3X3L
	wYteFHBjoJDH1qmB6mBtErpudo2JXwwg8I0wz9uyL4htmVNbpfGr0MqM9a+TYfh6Eyvv
	a9ws9UJ9FRzR1nBQR0ANH4t2jsZzO8Q9PU5VGfL1jmlWUPEvil2AxQqUNypiDG6xavzk
	3KXU3BxlpwexJk82FOESFV9v5eJy+MdiXwHxOyxVe7ZwFMBVUfEfkGO9pEeizf9LAzg8
	AkSbn2Q2MOpnD/8/e2XNefBAWUsqM5th+yRvnP89HAJ+wy5dOOJPc51DKMa24qmHKxPw
	So0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q39v7Vj6NNHOAdBnRavfr4y9YskigsGue/ClCDz5A1k=;
	b=EWRCJgQUnFILBxDhwsD8ETxunrY6pWzgHdWFXp4NoMfa5ew2tOXrVQ8dd099MYVjQ9
	LdjkbU2qKjxYAocVgA32JYn+vpE1Y9NcWzON5CSmHRYi6NQFgGlzyaOJkQc6DOQo36cO
	p0g+/4Sg4OAsHuLOKhRKnx9WKrgrAQLaYDdnbeSEoPB5Q/4xGEZ3DuvQNaz7DXAKMo3k
	8jDCr/yypxR54yQbd3k0QAlXxa8CPV4xj7Rii/Xu3aVHmiAVEIOa5nDigGyITJmVcAxG
	H0JAwKtu7B0MIixTC3EZTB/yp4/nLa3U0KFHwvg4hkoNitOElEdOJxUMuLow7LWskF/U
	TSmA==
X-Gm-Message-State: APf1xPBv0MwnWCF9F2uOrxVan3QNZEkXPo+h6wQSWB0F7iA175wykX2x
	FmLFnGQJi3REGK63ub90SKXbw5j/XfboGjXeRWOFjg==
X-Google-Smtp-Source: AH8x224Ytj6yjFJY93FGl+WLRETqhKKrWmevtNJyAuSR+dKcxHaxfQd/6jA07O+F3QP8VMUlf/DeLoU3ugqmL3r6kM4=
X-Received: by 10.46.86.74 with SMTP id k71mr227689ljb.28.1519146406536; Tue,
	20 Feb 2018 09:06:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Tue, 20 Feb 2018 09:06:45 -0800 (PST)
In-Reply-To: <20180220164126.13123-1-jsbronder@cold-front.org>
References: <20180220164126.13123-1-jsbronder@cold-front.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 20 Feb 2018 12:06:45 -0500
Message-ID: <CADkTA4PYMiMCKSE-rua7pjHaYgg_U3caan=Sy_i6r2Agc-8vUQ@mail.gmail.com>
To: Justin Bronder <jsbronder@cold-front.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: module: module-base: depend on elfutils-native
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
X-List-Received-Date: Tue, 20 Feb 2018 17:06:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 20, 2018 at 11:41 AM, Justin Bronder
<jsbronder@cold-front.org> wrote:
> libelf is required for CONFIG_STACK_VALIDATION which is required by
> CONFIG_UNWINDER_ORC (the default in 4.14+).

As you'll see in the discussion about adding bison-native, we don't want to add
these version specific dependencies globally.

>
> We also need to update the module classes to pass HOSTCC and HOSTCPP

This is already covered in my v3 "make-modules-script" changes.

Bruce

> just like the kernel class already does.  Otherwise the test for libelf
> in the kernel Makefile fails.
> ---
>  meta/classes/kernel.bbclass      | 2 +-
>  meta/classes/module-base.bbclass | 1 +
>  meta/classes/module.bbclass      | 4 +++-
>  3 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 5cdff581ef..d3a7e1e1cb 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -4,7 +4,7 @@ KERNEL_PACKAGE_NAME ??= "kernel"
>  KERNEL_DEPLOYSUBDIR ??= "${@ "" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else d.getVar("KERNEL_PACKAGE_NAME") }"
>
>  PROVIDES += "${@ "virtual/kernel" if (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
> -DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native"
> +DEPENDS += "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native elfutils-native"
>  PACKAGE_WRITE_DEPS += "depmodwrapper-cross"
>
>  do_deploy[depends] += "depmodwrapper-cross:do_populate_sysroot"
> diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
> index f851b85163..3b56e04534 100644
> --- a/meta/classes/module-base.bbclass
> +++ b/meta/classes/module-base.bbclass
> @@ -23,5 +23,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>  do_make_scripts() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>         make CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> +                  HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" \
>                    -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} scripts
>  }
> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index 78d1b21dbd..89dee2dae8 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -1,10 +1,12 @@
>  inherit module-base kernel-module-split pkgconfig
>
> +DEPENDS += "elfutils-native"
> +
>  addtask make_scripts after do_prepare_recipe_sysroot before do_configure
>  do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
>  do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
>
> -EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
> +EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR} HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
>
>  MODULES_INSTALL_TARGET ?= "modules_install"
>  MODULES_MODULE_SYMVERS_LOCATION ?= ""
> --
> 2.13.6
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

