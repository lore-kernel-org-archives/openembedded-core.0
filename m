Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D5DC64ED8
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 09:21:41 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.86258.1677489699831306486
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Feb 2023 01:21:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UkEh21El;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id s22so7602526lfi.9
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 01:21:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677489698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7iHEOpHoTxyzYxK2QHPkUAKlORf4ovL6vGSI5NXjOUI=;
        b=UkEh21ElrCvG+o/IepSYPk0Uw9QF+m+2jvqYGNCIDyCjXfpolbwnalAeUA/5rYpvOG
         SvhLJa4vRCr0Z+0tHpXTQF6bt9sNbAEj95OOcv8evOQWr8WhPLpeDcfF9a64ErgWsQHM
         Sd72xnya3d2mgcxjb3yA3b/pa7J+dhNyoLpJXisDWQ1g4dXDSCBKtMY9rNy2U6JQLzOH
         5w4wwqquK3ozTIhWc4KEK8M4sh7zZWBnMqK+Za2p/9kh/Rp2bvzxa6SwfBpt6bivEeD9
         GYoHZyKCUfA0rhXhQhbQN3w7FwXHn+nWk566Zx/BR+t5HjpV48O2E4Pkl733wsWujYUD
         9w7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677489698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7iHEOpHoTxyzYxK2QHPkUAKlORf4ovL6vGSI5NXjOUI=;
        b=XJ4a3vE6YC7af/m/tXeY4PRJzqe2lgffI6X0QGTCbWrkKKLZkxtMK9JI0AjHsZh9qN
         s9c69TMzhXtq4X7XVtnLyj7FViQniftI+bC9AO8bHobx1THzsI3a9vJj2cRdnkxKxpML
         Ar7yFS5lrswRBSwad4bUyOI97eS6+9478rX1IY7kU4e+kbvwm08hyvuhxzAkfG3CadWZ
         8zaWm4XODLcOut5IDH4XltuthehE5PBtFn3jmHCjT37Rqycuc8uWNd1L4Bb7VBRRWiPS
         +CgiojVDIOxvWjvQBgqKnEjcZET4ZOF2bjQDyiuOKc/v2RsbGIk8XnsUNJPOKGrL0ivO
         0fwQ==
X-Gm-Message-State: AO0yUKX1ZGVk6zvzxZ53UoUFEwsB0g/5g2XT4nen6sm08qQmf+eRxHB5
	bz1HMYuq4MbWkygXbUDU6pZOclICBEkax4KxyKhOxLmQ
X-Google-Smtp-Source: AK7set9qQaYSYARx54xKItgWbeWTaKDZVCLgbXHKn2Vg2q2WQFlocL8cVVm40JXWw0icl05F007JdCMszLZhyaC73qU=
X-Received: by 2002:ac2:4c0a:0:b0:4db:f4b:a552 with SMTP id
 t10-20020ac24c0a000000b004db0f4ba552mr7339217lfq.13.1677489697657; Mon, 27
 Feb 2023 01:21:37 -0800 (PST)
MIME-Version: 1.0
References: <20230227032020.6248-1-vkumbhar@mvista.com>
In-Reply-To: <20230227032020.6248-1-vkumbhar@mvista.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 Feb 2023 10:21:26 +0100
Message-ID: <CANNYZj-KB1_xQuY5gRrrO3FmAE2dqi3=DET5Rs5FkNYmg9CWCQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] rpm: update 4.17.1 -> 4.18
To: vkumbhar <vkumbhar@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Feb 2023 09:21:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177778

You have to backport the fix I'm afraid. Stable releases do not allow
major upgrades like that.

Alex

On Mon, 27 Feb 2023 at 04:20, vkumbhar <vkumbhar@mvista.com> wrote:
>
> (From OE-Core rev: 5bef402da334595ed9302b8bca1acdf5e88bfe11)
>
> This will fix #CVE-2021-35938 rpm: races with chown/chmod/capabilities calls during installation
>
> upstream branch=rpm-4.18: git://github.com/rpm-software-management/rpm
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>  ...When-cross-installing-execute-package-scriptlets-wit.patch | 2 +-
>  .../rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch | 3 +--
>  meta/recipes-devtools/rpm/{rpm_4.17.1.bb => rpm_4.18.bb}      | 4 ++--
>  3 files changed, 4 insertions(+), 5 deletions(-)
>  rename meta/recipes-devtools/rpm/{rpm_4.17.1.bb => rpm_4.18.bb} (99%)
>
> diff --git a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
> index 2a0069cafe..13d01faa0e 100644
> --- a/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-When-cross-installing-execute-package-scriptlets-wit.patch
> @@ -53,7 +53,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>
>       if (rc != RPMRC_FAIL) {
>         if (script_type & RPMSCRIPTLET_EXEC) {
> --          rc = runExtScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
> +-          rc = runExtScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, script->nextFileFunc);
>  +          if (getenv("RPM_NO_CHROOT_FOR_SCRIPTS") != NULL) {
>  +              rpmChrootOut();
>  +              rc = runExtScript(plugins, prefixes, script->descr, lvl, scriptFd, &args, script->body, arg1, arg2, &script->nextFileFunc);
> diff --git a/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch b/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch
> index 9783396639..cab54c3fb6 100644
> --- a/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch
> +++ b/meta/recipes-devtools/rpm/files/0001-tools-Add-error.h-for-non-glibc-case.patch
> @@ -20,11 +20,10 @@ diff --git a/tools/elfdeps.c b/tools/elfdeps.c
>  index d205935bb..3a8945b33 100644
>  --- a/tools/elfdeps.c
>  +++ b/tools/elfdeps.c
> -@@ -5,10 +5,14 @@
> +@@ +5,14 @@
>   #include <unistd.h>
>   #include <stdlib.h>
>   #include <fcntl.h>
> --#include <error.h>
>   #include <errno.h>
>   #include <popt.h>
>   #include <gelf.h>
> diff --git a/meta/recipes-devtools/rpm/rpm_4.17.1.bb b/meta/recipes-devtools/rpm/rpm_4.18.bb
> similarity index 99%
> rename from meta/recipes-devtools/rpm/rpm_4.17.1.bb
> rename to meta/recipes-devtools/rpm/rpm_4.18.bb
> index 9b6446f265..724dbbe70a 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.17.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.18.bb
> @@ -24,7 +24,7 @@ HOMEPAGE = "http://www.rpm.org"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=c4eec0c20c6034b9407a09945b48a43f"
>
> -SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.17.x;protocol=https \
> +SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.18.x;protocol=https \
>             file://environment.d-rpm.sh \
>             file://0001-Do-not-add-an-unsatisfiable-dependency-when-building.patch \
>             file://0001-Do-not-read-config-files-from-HOME.patch \
> @@ -43,7 +43,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.17.x;protoc
>             "
>
>  PE = "1"
> -SRCREV = "5bef402da334595ed9302b8bca1acdf5e88bfe11"
> +SRCREV = "ea0d77c52e176e2876fdb1d07ad41e9e2635a93e"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177769): https://lists.openembedded.org/g/openembedded-core/message/177769
> Mute This Topic: https://lists.openembedded.org/mt/97259257/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

