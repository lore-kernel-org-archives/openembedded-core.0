Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9312C4332F
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 20:07:05 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web09.3194.1667506019109820882
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 13:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RZd57jjT;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id h12so3582751ljg.9
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 13:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7JUHoBfRDITY+JsDWEnSYUWcEAl8bYEHJOZzOM2bq+w=;
        b=RZd57jjTuDeYO9G+B8134/3zngr04ih3VeoOwhZ/7Ys1FtapFMq05p8nWgaXYMrXaY
         XSpTL/5DZqjA2bibqf+UgYR+DKPGT36Szi/hw0dEcAyPVCQu5yDVsf8a0Rr6XEjDF/n8
         +3NZ1SbBf4sgdAXFmWDrjySTNFTwMJFCwTQpaXGisqfrtejARuy/h0L5+mXfuewxmQ2f
         uoNrUcxn18on+AoUEOsQwEGcHxNXec/m10r5CMYHdW3FkhCZEpFp6QYyUOe07fsuGAm5
         8qwKmlF+veFRGlGirVnuuuVMzHb2bUvEd+xK23CSc1vU2ci0Wi/EmTPvOg/8OjH+bHUt
         op5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7JUHoBfRDITY+JsDWEnSYUWcEAl8bYEHJOZzOM2bq+w=;
        b=tKg1+0hF4qbp8Wnz4HI/p508ur5xcEuHj0iCaPQr9lhGy9L5i+AZHiTIeEr+3uaZld
         uQEcK+5RcrfJc503addbdBnrD1jfhZd0lP/HEXVQkHxhPbiaeAjBz9JfJBGBReQlKh18
         dcwnT8CmKlqqGuK6w1qPI0n/2Pkfu/P3P4nCPHah5WZQTQGUiqSio6+TPFyP8CdtNRBD
         8b5g4EYElKmBOwdOw+ycT6SUFudbgjbRvsnFDCFwjzQQVFWX0S6TzP5/DQdYpf/U94b0
         g2DFs9Ys5PaeaEScK0DjwZgCBITbXoxnY3eeimyuvXnWxI53ep8Yq9iCyg9csOFZBQ+Z
         9vMg==
X-Gm-Message-State: ACrzQf0dsudz/ic3zoJxGO7VmjnvYq2nBoQNYJs5FxRZGetlhHeXWFyl
	OHfDec9gsaXrYw4axSdyix70fw7nt+Y7qzAojMw=
X-Google-Smtp-Source: AMsMyM65wdB+UFBHdKXfZuTCqy2fCWXhZGTU+yRTw3vtl1HS+Yo5Enwaw6NZyE3T0fF8GHBgQhIYwi7WG17zoJdjAXE=
X-Received: by 2002:a2e:c4a:0:b0:277:3931:6dc9 with SMTP id
 o10-20020a2e0c4a000000b0027739316dc9mr12778934ljd.45.1667506016964; Thu, 03
 Nov 2022 13:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221103192958.29651-1-sakib.sajal@windriver.com>
In-Reply-To: <20221103192958.29651-1-sakib.sajal@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 3 Nov 2022 21:06:45 +0100
Message-ID: <CANNYZj_Dod5+PuQA4oeJxO73uj6xO242yZiA-w24oU6A9Pc-JQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] blktrace: ask for python3 specifically
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172654

This patch should be sent upstream first. Same as in your master submission.

Alex


On Thu, 3 Nov 2022 at 20:32, Sakib Sajal <sakib.sajal@windriver.com> wrote:
>
> python2 has been deprecated, use python3 instead
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  ...plot.py-ask-for-python3-specifically.patch | 35 +++++++++++++++++++
>  meta/recipes-kernel/blktrace/blktrace_git.bb  |  5 ++-
>  2 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-ask-for-python3-specifically.patch
>
> diff --git a/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-ask-for-python3-specifically.patch b/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-ask-for-python3-specifically.patch
> new file mode 100644
> index 0000000000..42412678f7
> --- /dev/null
> +++ b/meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-ask-for-python3-specifically.patch
> @@ -0,0 +1,35 @@
> +From c6776fb9c990830357e71a0e75805e7ce25877cc Mon Sep 17 00:00:00 2001
> +From: Sakib Sajal <sakib.sajal@windriver.com>
> +Date: Thu, 3 Nov 2022 12:29:59 -0400
> +Subject: [PATCH] bno_plot.py, btt_plot.py: ask for python3 specifically
> +
> +python2 has been deprecated, use python3 instead
> +
> +Upstream-Status: Inappropriate (OE-specific)
> +
> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> +---
> + btt/bno_plot.py | 2 +-
> + btt/btt_plot.py | 2 +-
> + 2 files changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/btt/bno_plot.py b/btt/bno_plot.py
> +index 3aa4e19..d7d7159 100644
> +--- a/btt/bno_plot.py
> ++++ b/btt/bno_plot.py
> +@@ -1,4 +1,4 @@
> +-#! /usr/bin/env python
> ++#! /usr/bin/env python3
> + #
> + # btt blkno plotting interface
> + #
> +diff --git a/btt/btt_plot.py b/btt/btt_plot.py
> +index 40bc71f..8620d31 100755
> +--- a/btt/btt_plot.py
> ++++ b/btt/btt_plot.py
> +@@ -1,4 +1,4 @@
> +-#! /usr/bin/env python
> ++#! /usr/bin/env python3
> + #
> + # btt_plot.py: Generate matplotlib plots for BTT generate data files
> + #
> diff --git a/meta/recipes-kernel/blktrace/blktrace_git.bb b/meta/recipes-kernel/blktrace/blktrace_git.bb
> index bba5e04504..c278e066c7 100644
> --- a/meta/recipes-kernel/blktrace/blktrace_git.bb
> +++ b/meta/recipes-kernel/blktrace/blktrace_git.bb
> @@ -9,12 +9,15 @@ LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
>
>  DEPENDS = "libaio"
> +RDEPENDS:${PN} = "python3"
>
>  SRCREV = "366d30b9cdb20345c5d064af850d686da79b89eb"
>
>  PV = "1.3.0+git${SRCPV}"
>
> -SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master"
> +SRC_URI = "git://git.kernel.dk/blktrace.git;branch=master \
> +           file://0001-bno_plot.py-btt_plot.py-ask-for-python3-specifically.patch \
> +           "
>
>  S = "${WORKDIR}/git"
>
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172652): https://lists.openembedded.org/g/openembedded-core/message/172652
> Mute This Topic: https://lists.openembedded.org/mt/94791449/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

