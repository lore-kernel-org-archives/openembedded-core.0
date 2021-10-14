Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55B07C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 12:29:09 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web08.8668.1634214548134615546
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=khewI1Cq;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id d3so23487021edp.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 05:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kHs7u1YmGzfTYlNI/jMIP/0ZtG2gnafI5VoaAnD/8ho=;
        b=khewI1CqKaj+IAGik/9cIuZfCldyJfvP9Rw9eiiXXlOOusXQUgZbza+edaCxo4Latc
         3bw6QwmFtFScGruxiM7EtovNzkYAnE+LtgRKYi7LQY1waYS8ja79EnK6x4sIdhnWgEje
         bMMvLBOYEcpcqME6VrtXfihJ6VEugD3hSJB7QFwfDX53xmhALoLhvea6qZeLXdmdBLD2
         bFME33ftLdRNvQmd7xCHZ5qOY41azyKdVNn35mHnt4Ua3HGsU9UFsuFivdMlzHp3yO3a
         b9ab4v4QciEt1EwAuwhxdZCbaEsNje9ScWRrfs4qd1YoJ/xxWeh2w0xk7SkSwv82ywkX
         WYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kHs7u1YmGzfTYlNI/jMIP/0ZtG2gnafI5VoaAnD/8ho=;
        b=EEisuxO0Gt+nGFiy4MJ/Ud41D8a3q7xBgt6LbMBePqUbwm6nAOyfSd4Oq/FZr4oT/Y
         djD1MTPu2PsGgF4J1pkmcqssG+WeOJGZYcn+gZulXLA95EO3I/KGfEmd5IoFM0UmDjls
         cAucTuMlNehQKI0Xji0tPdOmcn/TQXthaSeISQVt/oeBvOSB9nwmK1FN7Hd/0Co5a6CK
         /vRsEqM3qCvf+p48MrEuuVVU9UNpGhAaqDQt+UpAtcz/dIJl3oml/VP5Qxw79M9AnayK
         DMy4A4YobjOEUx85nQBg6MZDtHP5AH+lwzouyuzVEG+wPbyWYEf9djzMjWk+XXi9V6+d
         QsPQ==
X-Gm-Message-State: AOAM532oCO9HDbZ2Yax5xNddDyJmvGVYenNceP9LqP+yCDqRLdCAmdEO
	pk/cc0uJahbvTvN+0jvTuwRk2+UejE6KZv0cbx8=
X-Google-Smtp-Source: 
 ABdhPJyJb4ZTidxlr5gTBBc1GpBpkgjxTQmulKEJ8gv/5hQe/kbYp8P81kpZHXXNV6124Pp3w5usqn9ijZFKi6s1vJM=
X-Received: by 2002:a05:6402:11ca:: with SMTP id
 j10mr8311239edw.223.1634214544738;
 Thu, 14 Oct 2021 05:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211014121025.2913401-1-richard.purdie@linuxfoundation.org>
 <20211014121025.2913401-7-richard.purdie@linuxfoundation.org>
In-Reply-To: <20211014121025.2913401-7-richard.purdie@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Oct 2021 08:28:53 -0400
Message-ID: 
 <CADkTA4MccXdOvzaEoHOX-wVj-iFsLRb7OsDpO+myowr3f0gT=w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/7] reproducible: Drop
 BUILD_REPRODUCIBLE_BINARIES
 variable
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 12:29:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156948

On Thu, Oct 14, 2021 at 8:10 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> We want things to be reproduicble and the variable doesn't really change
> much any more. Drop the remaining uses and make those code paths always
> active.

It wasn't clear to me from reading the patch.  What is the way that
someone would now get the current timestamp into a kernel build, if
that's the behaviour that they want ?

Bruce

>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/image-prelink.bbclass    | 13 ++-----
>  meta/classes/image.bbclass            | 14 +++----
>  meta/classes/kernel.bbclass           | 54 +++++++++++++--------------
>  meta/conf/bitbake.conf                |  1 -
>  meta/lib/oe/sstatesig.py              |  2 +-
>  meta/recipes-core/busybox/busybox.inc | 10 ++---
>  6 files changed, 41 insertions(+), 53 deletions(-)
>
> diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
> index 0da094a5518..8158eeaf4ca 100644
> --- a/meta/classes/image-prelink.bbclass
> +++ b/meta/classes/image-prelink.bbclass
> @@ -46,17 +46,12 @@ prelink_image () {
>         dynamic_loader=${@get_linuxloader(d)}
>
>         # prelink!
> -       if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
> -               bbnote " prelink: BUILD_REPRODUCIBLE_BINARIES..."
> -               if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
> -                       export PRELINK_TIMESTAMP=`git log -1 --pretty=%ct `
> -               else
> -                       export PRELINK_TIMESTAMP=$REPRODUCIBLE_TIMESTAMP_ROOTFS
> -               fi
> -               ${STAGING_SBINDIR_NATIVE}/prelink --root ${IMAGE_ROOTFS} -am -N -c ${sysconfdir}/prelink.conf --dynamic-linker $dynamic_loader
> +       if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
> +               export PRELINK_TIMESTAMP=`git log -1 --pretty=%ct `
>         else
> -               ${STAGING_SBINDIR_NATIVE}/prelink --root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf --dynamic-linker $dynamic_loader
> +               export PRELINK_TIMESTAMP=$REPRODUCIBLE_TIMESTAMP_ROOTFS
>         fi
> +       ${STAGING_SBINDIR_NATIVE}/prelink --root ${IMAGE_ROOTFS} -am -N -c ${sysconfdir}/prelink.conf --dynamic-linker $dynamic_loader
>
>         # Remove the prelink.conf if we had to add it.
>         if [ "$dummy_prelink_conf" = "true" ]; then
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index c2f32320278..2fa69a40d10 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -651,17 +651,15 @@ ROOTFS_PREPROCESS_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge'
>  POPULATE_SDK_PRE_TARGET_COMMAND += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', 'create_merged_usr_symlinks_sdk; ', '',d)}"
>
>  reproducible_final_image_task () {
> -    if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
> +    if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
> +        REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}" log -1 --pretty=%ct 2>/dev/null` || true
>          if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
> -            REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}" log -1 --pretty=%ct 2>/dev/null` || true
> -            if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
> -                REPRODUCIBLE_TIMESTAMP_ROOTFS=`stat -c%Y ${@bb.utils.which(d.getVar("BBPATH"), "conf/bitbake.conf")}`
> -            fi
> +            REPRODUCIBLE_TIMESTAMP_ROOTFS=`stat -c%Y ${@bb.utils.which(d.getVar("BBPATH"), "conf/bitbake.conf")}`
>          fi
> -        # Set mtime of all files to a reproducible value
> -        bbnote "reproducible_final_image_task: mtime set to $REPRODUCIBLE_TIMESTAMP_ROOTFS"
> -        find  ${IMAGE_ROOTFS} -print0 | xargs -0 touch -h  --date=@$REPRODUCIBLE_TIMESTAMP_ROOTFS
>      fi
> +    # Set mtime of all files to a reproducible value
> +    bbnote "reproducible_final_image_task: mtime set to $REPRODUCIBLE_TIMESTAMP_ROOTFS"
> +    find  ${IMAGE_ROOTFS} -print0 | xargs -0 touch -h  --date=@$REPRODUCIBLE_TIMESTAMP_ROOTFS
>  }
>
>  systemd_preset_all () {
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 4acec1877e0..3dd9b4446db 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -324,21 +324,20 @@ addtask bundle_initramfs after do_install before do_deploy
>
>  kernel_do_compile() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> -       if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
> -               # kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
> -               # be set....
> -               if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
> -                       # The source directory is not necessarily a git repository, so we
> -                       # specify the git-dir to ensure that git does not query a
> -                       # repository in any parent directory.
> -                       SOURCE_DATE_EPOCH=`git --git-dir="${S}/.git" log -1 --pretty=%ct 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
> -               fi
> -
> -               ts=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH`
> -               export KBUILD_BUILD_TIMESTAMP="$ts"
> -               export KCONFIG_NOTIMESTAMP=1
> -               bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
> +       # kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
> +       # be set....
> +       if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
> +               # The source directory is not necessarily a git repository, so we
> +               # specify the git-dir to ensure that git does not query a
> +               # repository in any parent directory.
> +               SOURCE_DATE_EPOCH=`git --git-dir="${S}/.git" log -1 --pretty=%ct 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
>         fi
> +
> +       ts=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH`
> +       export KBUILD_BUILD_TIMESTAMP="$ts"
> +       export KCONFIG_NOTIMESTAMP=1
> +       bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
> +
>         # The $use_alternate_initrd is only set from
>         # do_bundle_initramfs() This variable is specifically for the
>         # case where we are making a second pass at the kernel
> @@ -364,21 +363,20 @@ kernel_do_compile() {
>
>  do_compile_kernelmodules() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> -       if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
> -               # kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
> -               # be set....
> -               if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
> -                       # The source directory is not necessarily a git repository, so we
> -                       # specify the git-dir to ensure that git does not query a
> -                       # repository in any parent directory.
> -                       SOURCE_DATE_EPOCH=`git --git-dir="${S}/.git" log -1 --pretty=%ct 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
> -               fi
> -
> -               ts=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH`
> -               export KBUILD_BUILD_TIMESTAMP="$ts"
> -               export KCONFIG_NOTIMESTAMP=1
> -               bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
> +       # kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not
> +       # be set....
> +       if [ "${SOURCE_DATE_EPOCH}" = "" -o "${SOURCE_DATE_EPOCH}" = "0" ]; then
> +               # The source directory is not necessarily a git repository, so we
> +               # specify the git-dir to ensure that git does not query a
> +               # repository in any parent directory.
> +               SOURCE_DATE_EPOCH=`git --git-dir="${S}/.git" log -1 --pretty=%ct 2>/dev/null || echo "${REPRODUCIBLE_TIMESTAMP_ROOTFS}"`
>         fi
> +
> +       ts=`LC_ALL=C date -d @$SOURCE_DATE_EPOCH`
> +       export KBUILD_BUILD_TIMESTAMP="$ts"
> +       export KCONFIG_NOTIMESTAMP=1
> +       bbnote "KBUILD_BUILD_TIMESTAMP: $ts"
> +
>         if (grep -q -i -e '^CONFIG_MODULES=y$' ${B}/.config); then
>                 oe_runmake -C ${B} ${PARALLEL_MAKE} modules CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 1db9b3fc051..790f2f7a8c4 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -636,7 +636,6 @@ SDE_DIR = "${WORKDIR}/source-date-epoch"
>  SDE_FILE = "${SDE_DIR}/__source_date_epoch.txt"
>  SDE_DEPLOYDIR = "${WORKDIR}/deploy-source-date-epoch"
>
> -BUILD_REPRODUCIBLE_BINARIES = "1"
>  export PYTHONHASHSEED = "0"
>  export PERL_HASH_SEED = "0"
>  export SOURCE_DATE_EPOCH ?= "${@get_source_date_epoch_value(d)}"
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index c2e3e2f4f58..038404e377a 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -489,7 +489,7 @@ def OEOuthashBasic(path, sigfile, task, d):
>      include_timestamps = False
>      include_root = True
>      if task == "package":
> -        include_timestamps = d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1'
> +        include_timestamps = True
>          include_root = False
>      extra_content = d.getVar('HASHEQUIV_HASH_VERSION')
>
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 808c3dc7009..622325aabb3 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -110,9 +110,8 @@ python () {
>  }
>
>  do_prepare_config () {
> -       if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
> -               export KCONFIG_NOTIMESTAMP=1
> -       fi
> +       export KCONFIG_NOTIMESTAMP=1
> +
>         sed -e '/CONFIG_STATIC/d' \
>                 < ${WORKDIR}/defconfig > ${S}/.config
>         echo "# CONFIG_STATIC is not set" >> .config
> @@ -143,9 +142,8 @@ do_configure () {
>
>  do_compile() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> -       if [ "${BUILD_REPRODUCIBLE_BINARIES}" = "1" ]; then
> -               export KCONFIG_NOTIMESTAMP=1
> -       fi
> +       export KCONFIG_NOTIMESTAMP=1
> +
>         if [ "${BUSYBOX_SPLIT_SUID}" = "1" -a x`grep "CONFIG_FEATURE_INDIVIDUAL=y" .config` = x ]; then
>                 # split the .config into two parts, and make two busybox binaries
>                 if [ -e .config.orig ]; then
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156943): https://lists.openembedded.org/g/openembedded-core/message/156943
> Mute This Topic: https://lists.openembedded.org/mt/86310659/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

