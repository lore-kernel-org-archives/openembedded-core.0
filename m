Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E7EC64ED6
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 13:35:07 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web11.22032.1677677705791191850
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 05:35:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QbxfcIGB;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id y14so6233277ilv.4
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 05:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFocXifNBwdU3/dk3cFbXAg6z63lj+feUS45fZrTc3k=;
        b=QbxfcIGB/1tyGKiqpRhRNiv2/UFmgBiy7Ai12T8/25acUyZgQ+Yh8UKJ53i94ya2Mo
         yjLc9GCRCprE9l5XOD46SHWXAchfIzSjvdRxf1+J/O6d4VENJVIWfk41CEK3hEIjiIdE
         4F5+nW/1g5kLZvkI63vfTNmgK/L40gskUtNjFFor3vZkeQTDtvQODGQ3wU4qM74FGtEi
         HylbxXMmPzlyQF6nL5KBrXsguvuo9BLAJ/bl3L8ssUSlIvu1nZzxrDSP+p58RTGil/hc
         FC0unjrDMLcCIgNhVr4oMBIdRZ8SQRX9KqQrGilCIWtXcWfTFjDKOnxvmqA1igtgEO1+
         UKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kFocXifNBwdU3/dk3cFbXAg6z63lj+feUS45fZrTc3k=;
        b=SecYg6OkPTtHrvqVtK+4ubP/DMZBB3BWWqILPW1JWyrAlara3I+tRjEBs+ESA9HJQL
         0yqrlzUrxzKRAR+wl1jiF7lFBbdkI/DXsNekSqqzRyK2K+b94s77Hcv6wmwMFnDXxqaQ
         aLq/3rB/T3SpsKKF3EpDqugiCINc5QiqYsTs3KS5zKV0HBtXvySRfhAU+cttW3fd1VQl
         0nZhUl/gP6BTLmxUYOk0Io76DUVxZyFqh5BCTrmDo1t2lVHX258iaCo9cP2MNURw1Z6u
         Yxu4oGeqkc4RcSxrZ4RO2sFrVnG9fYhn2n/SX5EMD9BLXy2aUzZ1l8oMOB4uFwUuXRkz
         fdOA==
X-Gm-Message-State: AO0yUKW71WizdSkTFcDi/YeWAybxQz5byekJln4cN6Za7I9mXqJB8pqx
	IGHZlmFA7XqbdaQmN0s15G6tU0LQzQiiwSopikY=
X-Google-Smtp-Source: AK7set8ng4qaXW/vXxtdRjqt0GCnaIafA5qDoAd1UzJma/UW5U29/JJcfPXT0B0xslNenz44JsnVh3oKoTEg81mUToU=
X-Received: by 2002:a92:7604:0:b0:317:b01:245 with SMTP id r4-20020a927604000000b003170b010245mr2953778ilc.0.1677677704766;
 Wed, 01 Mar 2023 05:35:04 -0800 (PST)
MIME-Version: 1.0
References: <20230301053005.3594047-1-raj.khem@gmail.com>
In-Reply-To: <20230301053005.3594047-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 1 Mar 2023 08:34:59 -0500
Message-ID: <CADkTA4PpuP63vZ7kvFBYVoZ0eVEes2D_T=4VYb7m+XtPT3SgZg@mail.gmail.com>
Subject: Re: [PATCH] kernel: Add kernel specific OBJDUMP
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 13:35:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177886

On Wed, Mar 1, 2023 at 12:30 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> This helps in switching toolchains cleanly for kernel build
> between gcc and clang
>
> Currently, some kernels allow building with clang but not all
> the distro might use clang as default system compiler but kernel
> may demand gcc which is provided via KERNEL_* variables, however
> kernel does use OBJCOPY at places during build and it maybe set
> to use llvm objcopy when using clang. That should be a deliberate
> setting when clang is used for kernel as well, otherwise it should
> use binutils provided objcopy

Makes sense to me. Not that I use it, but since the kernel already
provides the flexibility to vary objcopy, no concerns if we use it.

We always tend to find some lurking kernel "build" that we've missed
(i.e. a menu or mergeconfig), but those a) shouldn't use objcopy and
b) will be easy enough to fix.

Bruce

>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/classes-recipe/kernel-arch.bbclass                      | 3 +++
>  meta/classes-recipe/kernel-devicetree.bbclass                | 2 +-
>  meta/classes-recipe/kernel-uboot.bbclass                     | 2 +-
>  meta/classes-recipe/kernel-yocto.bbclass                     | 4 +++-
>  meta/classes-recipe/kernel.bbclass                           | 2 +-
>  meta/classes-recipe/module.bbclass                           | 5 +++--
>  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 3 ++-
>  meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb       | 4 ++--
>  8 files changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recip=
e/kernel-arch.bbclass
> index 777f900241..5877048916 100644
> --- a/meta/classes-recipe/kernel-arch.bbclass
> +++ b/meta/classes-recipe/kernel-arch.bbclass
> @@ -68,9 +68,12 @@ TARGET_LD_KERNEL_ARCH ?=3D ""
>  HOST_LD_KERNEL_ARCH ?=3D "${TARGET_LD_KERNEL_ARCH}"
>  TARGET_AR_KERNEL_ARCH ?=3D ""
>  HOST_AR_KERNEL_ARCH ?=3D "${TARGET_AR_KERNEL_ARCH}"
> +TARGET_OBJCOPY_KERNEL_ARCH ?=3D ""
> +HOST_OBJCOPY_KERNEL_ARCH ?=3D "${TARGET_OBJCOPY_KERNEL_ARCH}"
>
>  KERNEL_CC =3D "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-l=
d=3Dbfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=3D${STAGING_KERNEL_DIR}=3D${=
KERNEL_SRC_PATH} -fdebug-prefix-map=3D${STAGING_KERNEL_BUILDDIR}=3D${KERNEL=
_SRC_PATH}"
>  KERNEL_LD =3D "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
>  KERNEL_AR =3D "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
> +KERNEL_OBJCOPY =3D "${CCACHE}${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL=
_ARCH}"
>  TOOLCHAIN ?=3D "gcc"
>
> diff --git a/meta/classes-recipe/kernel-devicetree.bbclass b/meta/classes=
-recipe/kernel-devicetree.bbclass
> index b2117de805..4d0ecb1032 100644
> --- a/meta/classes-recipe/kernel-devicetree.bbclass
> +++ b/meta/classes-recipe/kernel-devicetree.bbclass
> @@ -68,7 +68,7 @@ do_compile:append() {
>
>         for dtbf in ${KERNEL_DEVICETREE}; do
>                 dtb=3D`normalize_dtb "$dtbf"`
> -               oe_runmake $dtb CC=3D"${KERNEL_CC} $cc_extra " LD=3D"${KE=
RNEL_LD}" ${KERNEL_EXTRA_ARGS}
> +               oe_runmake $dtb CC=3D"${KERNEL_CC} $cc_extra " LD=3D"${KE=
RNEL_LD}" OBJCOPY=3D"${KERNEL_OBJCOPY}" ${KERNEL_EXTRA_ARGS}
>         done
>  }
>
> diff --git a/meta/classes-recipe/kernel-uboot.bbclass b/meta/classes-reci=
pe/kernel-uboot.bbclass
> index 4aab02671e..30a85ccc28 100644
> --- a/meta/classes-recipe/kernel-uboot.bbclass
> +++ b/meta/classes-recipe/kernel-uboot.bbclass
> @@ -34,7 +34,7 @@ uboot_prep_kimage() {
>                 linux_comp=3D"${FIT_KERNEL_COMP_ALG}"
>         fi
>
> -       [ -n "${vmlinux_path}" ] && ${OBJCOPY} -O binary -R .note -R .com=
ment -S "${vmlinux_path}" linux.bin
> +       [ -n "${vmlinux_path}" ] && ${KERNEL_OBJCOPY} -O binary -R .note =
-R .comment -S "${vmlinux_path}" linux.bin
>
>         if [ "${linux_comp}" !=3D "none" ] ; then
>                 if [ "${linux_comp}" =3D "gzip" ] ; then
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-reci=
pe/kernel-yocto.bbclass
> index 7de99cff56..108b7e6752 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -455,7 +455,7 @@ do_kernel_configme() {
>                 bbfatal_log "Could not find configuration queue (${meta_d=
ir}/config.queue)"
>         fi
>
> -       CFLAGS=3D"${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC=3D"${BUILD_CC} $=
{BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}" CC=3D"${KERNEL_CC=
}" LD=3D"${KERNEL_LD}" ARCH=3D${ARCH} merge_config.sh -O ${B} ${config_flag=
s} ${configs} > ${meta_dir}/cfg/merge_config_build.log 2>&1
> +       CFLAGS=3D"${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC=3D"${BUILD_CC} $=
{BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}" CC=3D"${KERNEL_CC=
}" LD=3D"${KERNEL_LD}" OBJCOPY=3D"${KERNEL_OBJCOPY}" ARCH=3D${ARCH} merge_c=
onfig.sh -O ${B} ${config_flags} ${configs} > ${meta_dir}/cfg/merge_config_=
build.log 2>&1
>         if [ $? -ne 0 -o ! -f ${B}/.config ]; then
>                 bberror "Could not generate a .config for ${KMACHINE}-${L=
INUX_KERNEL_TYPE}"
>                 if [ ${KCONF_AUDIT_LEVEL} -gt 1 ]; then
> @@ -489,6 +489,7 @@ python do_config_analysis() {
>      env['PATH'] =3D "%s:%s%s" % (d.getVar('PATH'), s, "/scripts/util/")
>      env['LD'] =3D d.getVar('KERNEL_LD')
>      env['CC'] =3D d.getVar('KERNEL_CC')
> +    env['OBJCOPY'] =3D d.getVar('KERNEL_OBJCOPY')
>      env['ARCH'] =3D d.getVar('ARCH')
>      env['srctree'] =3D s
>
> @@ -550,6 +551,7 @@ python do_kernel_configcheck() {
>      env['PATH'] =3D "%s:%s%s" % (d.getVar('PATH'), s, "/scripts/util/")
>      env['LD'] =3D d.getVar('KERNEL_LD')
>      env['CC'] =3D d.getVar('KERNEL_CC')
> +    env['OBJCOPY'] =3D d.getVar('KERNEL_OBJCOPY')
>      env['ARCH'] =3D d.getVar('ARCH')
>      env['srctree'] =3D s
>
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index 4fbe84c4e4..3f9c6c00e6 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -234,7 +234,7 @@ UBOOT_LOADADDRESS ?=3D "${UBOOT_ENTRYPOINT}"
>  # Some Linux kernel configurations need additional parameters on the com=
mand line
>  KERNEL_EXTRA_ARGS ?=3D ""
>
> -EXTRA_OEMAKE +=3D ' CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}"'
> +EXTRA_OEMAKE +=3D ' CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" OBJCOPY=3D"$=
{KERNEL_OBJCOPY}"'
>  EXTRA_OEMAKE +=3D ' HOSTCC=3D"${BUILD_CC}" HOSTCFLAGS=3D"${BUILD_CFLAGS}=
" HOSTLDFLAGS=3D"${BUILD_LDFLAGS}" HOSTCPP=3D"${BUILD_CPP}"'
>  EXTRA_OEMAKE +=3D ' HOSTCXX=3D"${BUILD_CXX}" HOSTCXXFLAGS=3D"${BUILD_CXX=
FLAGS}" PAHOLE=3Dfalse'
>
> diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/mod=
ule.bbclass
> index d52d5e3098..b3b852be5f 100644
> --- a/meta/classes-recipe/module.bbclass
> +++ b/meta/classes-recipe/module.bbclass
> @@ -32,6 +32,7 @@ python do_devshell:prepend () {
>      os.environ['CC'] =3D d.getVar('KERNEL_CC')
>      os.environ['LD'] =3D d.getVar('KERNEL_LD')
>      os.environ['AR'] =3D d.getVar('KERNEL_AR')
> +    os.environ['OBJCOPY'] =3D d.getVar('KERNEL_OBJCOPY')
>      os.environ['O'] =3D d.getVar('STAGING_KERNEL_BUILDDIR')
>      kbuild_extra_symbols =3D d.getVar('KBUILD_EXTRA_SYMBOLS')
>      if kbuild_extra_symbols:
> @@ -45,7 +46,7 @@ module_do_compile() {
>         oe_runmake KERNEL_PATH=3D${STAGING_KERNEL_DIR}   \
>                    KERNEL_VERSION=3D${KERNEL_VERSION}    \
>                    CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" \
> -                  AR=3D"${KERNEL_AR}" \
> +                  AR=3D"${KERNEL_AR}" OBJCOPY=3D"${KERNEL_OBJCOPY}" \
>                    O=3D${STAGING_KERNEL_BUILDDIR} \
>                    KBUILD_EXTRA_SYMBOLS=3D"${KBUILD_EXTRA_SYMBOLS}" \
>                    ${MAKE_TARGETS}
> @@ -55,7 +56,7 @@ module_do_install() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>         oe_runmake DEPMOD=3Decho MODLIB=3D"${D}${nonarch_base_libdir}/mod=
ules/${KERNEL_VERSION}" \
>                    INSTALL_FW_PATH=3D"${D}${nonarch_base_libdir}/firmware=
" \
> -                  CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" \
> +                  CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" OBJCOPY=3D"${K=
ERNEL_OBJCOPY}" \
>                    O=3D${STAGING_KERNEL_BUILDDIR} \
>                    ${MODULES_INSTALL_TARGET}
>
> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb=
 b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> index 38282e58f1..28e0807d1d 100644
> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> @@ -27,7 +27,8 @@ EXTRA_OEMAKE +=3D " HOSTCXX=3D"${BUILD_CXX} ${BUILD_CXX=
FLAGS} ${BUILD_LDFLAGS}" CROS
>  do_configure() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>         for t in prepare scripts_basic scripts; do
> -               oe_runmake CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" AR=3D"=
${KERNEL_AR}" \
> +               oe_runmake CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" \
> +               AR=3D"${KERNEL_AR}" OBJCOPY=3D"${KERNEL_OBJCOPY}" \
>                 -C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR} $=
t
>         done
>  }
> diff --git a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb b/met=
a/recipes-kernel/systemtap/systemtap-uprobes_git.bb
> index 2181e45a8d..efe359ec32 100644
> --- a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
> +++ b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
> @@ -21,12 +21,12 @@ do_compile() {
>         then
>                 unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS CC LD CPP
>                 oe_runmake CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" \
> -                          AR=3D"${KERNEL_AR}" \
> +                          AR=3D"${KERNEL_AR}" OBJCOPY=3D"${KERNEL_OBJCOP=
Y}" \
>                            -C ${STAGING_KERNEL_DIR} scripts
>                 oe_runmake KDIR=3D${STAGING_KERNEL_DIR}   \
>                            M=3D"${S}/runtime/uprobes/" \
>                            CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" \
> -                          AR=3D"${KERNEL_AR}" \
> +                          AR=3D"${KERNEL_AR}" OBJCOPY=3D"${KERNEL_OBJCOP=
Y}" \
>                            -C "${S}/runtime/uprobes/"
>         fi
>  }
> --
> 2.39.2
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

