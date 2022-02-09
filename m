Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42A12C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 09:11:38 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web08.24304.1644397897638632741
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 01:11:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TCHjnrHj;
 spf=pass (domain: gmail.com, ip: 209.85.222.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id g18so958685uak.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 01:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=INr5pEtTgSZ4FUn8lgWROsQaGLPwQ/JAbS0erIAtukM=;
        b=TCHjnrHjcLpWUkwCuw9Pr89OT6U2Ggp5bcBfO3qSuGq5nF9Pm5JKAOefDil1kZUHTl
         qg5nwOVnWOU0+Ibn5K+ZuepWLmtoMA1Lg5o2HobHe8M1V82I/wsB+eZLuchW4F21+AfM
         x/B1hycqkNFMf+jYGtyx4fwFY8J1ZnyRY2uLwgOr7qxiq7BI8lB/MbDUv1pQwASl4EfS
         O8xwhzM8a8rpiJHHcsNHj4Oyf3Tl6Pukx/8bKT8dARBFfLznWc9QGNLYg+uo3pJVjW52
         DSFPUvjZDBgosEtgu1uhYoKOetGL2p9/rmi6pNnII8KbWOxA4mb61Q64mX/eX8zbHcLZ
         YJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=INr5pEtTgSZ4FUn8lgWROsQaGLPwQ/JAbS0erIAtukM=;
        b=2oHV03yeSSIq22lRL2WTBZE64+Df6iFnURhwoyO5X/zy6LXiO1zAmDisCaGx7vqzxu
         vG2XjEvPJuh6To7u1agzqctSvBnzYrxRyS3x6+fe5Wne1RTqxY6WZJTGx2pQACLAKx/7
         XtWFjXB8F7nph85P4yEZarKbpcYgQ4F8Z1s0pv2Rkxc7z2QWjzGrogBraq/Cm9ctnJ66
         4+dnAsnPZcB0tu/5CzhM0XEcMFyfEF14FkPLfGTSAyn5MaFFlohf1rFGIozmQ27uGDf3
         d0kHbd3WQakt4iHGA2NB18aq87EI5hdOVdDwP9KJiB57z4AiuFXk53NxO6nduqVxWiXk
         2mjA==
X-Gm-Message-State: AOAM530w4kA4IAPP5hV1Cu6fZsNwNItMeMMKAKshnZQ0/qVtOvV1CdL4
	hZnmNNTAB91S+/VkThw0BU5Hvt1r8zt4jLFYI0E=
X-Google-Smtp-Source: 
 ABdhPJyaxFEZJ+fRykGtFdE5jwJNi9BOotg+Z0OlpxxiqxYJypYeRblZGaHavnYCO4JeChgVfTRKnPgz/M11psntC94=
X-Received: by 2002:ab0:1d03:: with SMTP id j3mr461252uak.100.1644397896689;
 Wed, 09 Feb 2022 01:11:36 -0800 (PST)
MIME-Version: 1.0
References: <20220209051544.3280726-1-raj.khem@gmail.com>
In-Reply-To: <20220209051544.3280726-1-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 9 Feb 2022 10:11:24 +0100
Message-ID: 
 <CANNYZj94Kp=DF2Y6sSF8jF8zJajOjNS1mLWNZ0oJ3OyrDCSxkA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] perl: Help resolving WNOHANG and _exit in
 Posix module
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 09:11:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161543

Please submit upstream:
https://github.com/jib/ipc-cmd

Alex

On Wed, 9 Feb 2022 at 06:15, Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v4: Fix filepaths in release tarballs which are different than git repo
>
>  ...01-ipc-force-POSIX-WNOHANG-resolving.patch | 52 +++++++++++++++++++
>  meta/recipes-devtools/perl/perl_5.34.0.bb     |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta/recipes-devtools/perl/files/0001-ipc-force-POSIX-WNOHANG-resolving.patch
>
> diff --git a/meta/recipes-devtools/perl/files/0001-ipc-force-POSIX-WNOHANG-resolving.patch b/meta/recipes-devtools/perl/files/0001-ipc-force-POSIX-WNOHANG-resolving.patch
> new file mode 100644
> index 00000000000..3df15d4f08c
> --- /dev/null
> +++ b/meta/recipes-devtools/perl/files/0001-ipc-force-POSIX-WNOHANG-resolving.patch
> @@ -0,0 +1,52 @@
> +From 0d8c411ef7e8b4452007c77eee3d83d227b86bb4 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Tue, 8 Feb 2022 14:05:22 -0800
> +Subject: [PATCH] ipc: force POSIX::WNOHANG resolving
> +
> +It seems POSIX module is special and may not have autovivified (resolved) WNOHANG.
> +see [1]
> +
> +Fixes
> + Bareword "POSIX::WNOHANG" not allowed while "strict subs"
> +
> +[1] https://redmine.lighttpd.net/projects/lighttpd/repository/14/revisions/78eb0e39454ab3ca8e7ef77f1d014b50b3632fb9
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + cpan/IPC-Cmd/lib/IPC/Cmd.pm | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +--- a/cpan/IPC-Cmd/lib/IPC/Cmd.pm
> ++++ b/cpan/IPC-Cmd/lib/IPC/Cmd.pm
> +@@ -499,7 +499,7 @@ sub kill_gently {
> +         next;
> +     }
> +
> +-    my $waitpid = waitpid($pid, POSIX::WNOHANG);
> ++    my $waitpid = waitpid($pid, POSIX::WNOHANG());
> +
> +     if ($waitpid eq -1) {
> +         $child_finished = 1;
> +@@ -619,10 +619,10 @@ sub open3_run {
> +           #
> +           kill(-9, $$);
> +
> +-          POSIX::_exit 1;
> ++          POSIX::_exit(1);
> +         }
> +
> +-        my $waitpid = waitpid($pid, POSIX::WNOHANG);
> ++        my $waitpid = waitpid($pid, POSIX::WNOHANG());
> +
> +         # child finished, catch it's exit status
> +         if ($waitpid ne 0 && $waitpid ne -1) {
> +@@ -1005,7 +1005,7 @@ sub run_forked {
> +           $child_finished = 1;
> +         }
> +
> +-        my $waitpid = waitpid($pid, POSIX::WNOHANG);
> ++        my $waitpid = waitpid($pid, POSIX::WNOHANG());
> +
> +         # child finished, catch it's exit status
> +         if ($waitpid ne 0 && $waitpid ne -1) {
> diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
> index e4bcfe3ce69..48d755744fe 100644
> --- a/meta/recipes-devtools/perl/perl_5.34.0.bb
> +++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
> @@ -20,6 +20,7 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
>             file://aacd2398e766500cb5d83c4d76b642fcf31d997a.patch \
>             file://ea57297a58b8f10ab885c19eec48ea076116cc1f.patch \
>             file://5bc1e5fdd87aa205011512cd1e6cc655bcf677fd.patch \
> +           file://0001-ipc-force-POSIX-WNOHANG-resolving.patch \
>             "
>  SRC_URI:append:class-native = " \
>             file://perl-configpm-switch.patch \
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161535): https://lists.openembedded.org/g/openembedded-core/message/161535
> Mute This Topic: https://lists.openembedded.org/mt/89016040/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

