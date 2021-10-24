Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 349EBC433EF
	for <webhook@archiver.kernel.org>; Sun, 24 Oct 2021 17:17:12 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web09.21204.1635095830937217276
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Oct 2021 10:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=TjRXAdbJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.54,
 mailfrom: steve@sakoman.com)
Received: by mail-wr1-f54.google.com with SMTP id s19so8177755wra.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Oct 2021 10:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=veg6FGFzwHwd8rFy3Nys0cmHYYPOAa4sQLtofJj3kxE=;
        b=TjRXAdbJKZfRqQJCM2ORWsKL0eWeouamPXEsqbiYCmWF/Zk98V5KgoxkzwrW9mjfUR
         +xI4OHYPdor1n1rF+oh6BKWhJpxVEh6tLTa8e1x/KYrjwzufkwbPKir5Ksy9fjyJ2paR
         lHQ/JLjnTOTKwzEdJukP0BngvyXFSNM6hkGmOLllGaYx4qzits3D9/qop1WNGFLtb5+E
         wpFVBtyct86Y9/sOp7n2ciQ2fe7DJWjbtvBnrHBsob3jp12k6YBVvJIbulGgMgsVTsrq
         XV/GdTQSQ8YFchAAXex9EGurH70YaKFKaLeUiuh2UvE3V9qgBcLIjQR30mEMh2hsF+oJ
         nFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=veg6FGFzwHwd8rFy3Nys0cmHYYPOAa4sQLtofJj3kxE=;
        b=kQKUMTxxOxZhw7EswVbWTKf+X/M+Awal5L7B8K//HS/uL/KZdBvcPvZGPMAqFbrToB
         mcW79zmC6EHKwL+806/P2W7dOdLbjPLquyvuMAMjeZRvTs67tIfCTuMlURbnNe+hk+4l
         W5eba95uF0hC+iQ5e1rN4f/iOpjo5qkUvQrvHAkZb69moBc0eMc+dFESzCy87k/FMeoA
         Dtd3bkTp3pt4OTqKMsLBYOeY+n33/96JJaJrX/RMLyP2r4bsG+Ud1UYrY2ax7+6/reip
         0bJ9RrdpeNdAweNIFmtXvmbynEDYsgqL2enPjCeCBBBmNCFuldrBiaF61boWtPRdfdOH
         bpQQ==
X-Gm-Message-State: AOAM530Dl/nr32pXVB6XyneIAbB8tom7MdbW2Tj/x0OYh7ml1qqwbJUR
	xwa6W2jmEAtOGO8z0p67v2ox+4kUt6CkX3AA77CH0Q==
X-Google-Smtp-Source: 
 ABdhPJwhdkR3AFE1QrSV2fMIk2Q0HYEzW4doW8zAVDv6KRv2wQehVsYBgaBPJGaCQPQWaN1PoZWWK9DjMXtT1ByJ4X4=
X-Received: by 2002:adf:8bc4:: with SMTP id w4mr2797036wra.36.1635095829118;
 Sun, 24 Oct 2021 10:17:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211022034156.1551-1-flowergom@gmail.com>
In-Reply-To: <20211022034156.1551-1-flowergom@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 24 Oct 2021 07:16:57 -1000
Message-ID: 
 <CAOSpxdYTPVpwQ3LELVmRwdHo=WDnCRVFDwg4UQF1Yq_yYX0Q=g@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] vim: fix 2021-3796
To: Minjae Kim <flowergom@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Oct 2021 17:17:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157328

On Thu, Oct 21, 2021 at 5:42 PM Minjae Kim <flowergom@gmail.com> wrote:
>
> vim is vulnerable to Use After Free
> Problem: Checking first character of url twice.
>
> reference:
> https://github.com/vim/vim/commit/35a9a00afcb20897d462a766793ff45534810dc3

Missing your Signed-off-by:

The patch also fails to apply on dunfell:

stdio: ERROR: vim-native-8.2-r0 do_patch: Applying patch
'CVE-2021-3796.patch' on target directory
'/home/pokybuild/yocto-worker/reproducible-centos/build/build-st-2929716/tmp/work/x86_64-linux/vim-native/8.2-r0/git'
stdio: ERROR: Logfile of failure stored in:
/home/pokybuild/yocto-worker/reproducible-centos/build/build-st-2929716/tmp/work/x86_64-linux/vim-native/8.2-r0/temp/log.do_patch.2931142
stdio: ERROR: Task
(virtual:native:/home/pokybuild/yocto-worker/reproducible-centos/build/meta/recipes-support/vim/vim_8.2.bb:do_patch)
failed with exit code '1'
stdio: ERROR: vim-native-8.2-r0 do_patch: Applying patch
'CVE-2021-3796.patch' on target directory
'/home/pokybuild/yocto-worker/reproducible-centos/build/build-st-2929716/tmp/work/x86_64-linux/vim-native/8.2-r0/git'
stdio: ERROR: Logfile of failure stored in:
/home/pokybuild/yocto-worker/reproducible-centos/build/build-st-2929716/tmp/work/x86_64-linux/vim-native/8.2-r0/temp/log.do_patch.2931142
stdio: ERROR: Task
(virtual:native:/home/pokybuild/yocto-worker/reproducible-centos/build/meta/recipes-support/vim/vim_8.2.bb:do_patch)
failed with exit code '1'
stdio: ERROR: Command . ./oe-init-build-env; ${SCRIPTSDIR}/checkvnc;
OEQA_DEBUGGING_SAVED_OUTPUT=/srv/autobuilder/autobuilder.yoctoproject.org/pub/repro-fail/
DISPLAY=:1 oe-selftest -r reproducible -j 1 failed with exit code 1,
see errors above. (1635095597.6: 33.1)

Probably a similar issue to the master version.

Thanks!

Steve
> ---
>  .../vim/files/CVE-2021-3796.patch             | 70 +++++++++++++++++++
>  meta/recipes-support/vim/vim.inc              |  1 +
>  2 files changed, 71 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2021-3796.patch
>
> diff --git a/meta/recipes-support/vim/files/CVE-2021-3796.patch b/meta/recipes-support/vim/files/CVE-2021-3796.patch
> new file mode 100644
> index 0000000000..08becb4d9a
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2021-3796.patch
> @@ -0,0 +1,70 @@
> +From 296bf20889e66e3235e199838c6e360db2c4166d Mon Sep 17 00:00:00 2001
> +From: Minjae Kim <flowergom@gmail.com>
> +Date: Fri, 22 Oct 2021 02:24:32 +0000
> +Subject: [PATCH] patch 8.2.3428: using freed memory when replacing
> +
> +Problem:    Using freed memory when replacing. (Dhiraj Mishra)
> +Solution:   Get the line pointer after calling ins_copychar().
> +
> +Upstream-Status: Accepted [https://github.com/vim/vim/commit/35a9a00afcb20897d462a766793ff45534810dc3]
> +CVE: CVE-2021-3796
> +Signed-off-by: Minjae Kim <flowergom@gmail.com>
> +---
> + src/normal.c              | 11 +++++++----
> + src/testdir/test_edit.vim | 12 ++++++++++++
> + 2 files changed, 19 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/normal.c b/src/normal.c
> +index c4963e621..277c92595 100644
> +--- a/src/normal.c
> ++++ b/src/normal.c
> +@@ -5009,19 +5009,22 @@ nv_replace(cmdarg_T *cap)
> +           {
> +               /*
> +                * Get ptr again, because u_save and/or showmatch() will have
> +-               * released the line.  At the same time we let know that the
> ++               * released the line. This may also happen in ins_copychar().
> ++               * At the same time we let know that the
> +                * line will be changed.
> +                */
> +-              ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
> +               if (cap->nchar == Ctrl_E || cap->nchar == Ctrl_Y)
> +               {
> +                 int c = ins_copychar(curwin->w_cursor.lnum
> +                                          + (cap->nchar == Ctrl_Y ? -1 : 1));
> ++
> ++                ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
> +                 if (c != NUL)
> +                   ptr[curwin->w_cursor.col] = c;
> +-              }
> +-              else
> ++              } else {
> +                   ptr[curwin->w_cursor.col] = cap->nchar;
> ++                  ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
> ++              }
> +               if (p_sm && msg_silent == 0)
> +                   showmatch(cap->nchar);
> +               ++curwin->w_cursor.col;
> +diff --git a/src/testdir/test_edit.vim b/src/testdir/test_edit.vim
> +index 4e29e7fe1..d7565e1ea 100644
> +--- a/src/testdir/test_edit.vim
> ++++ b/src/testdir/test_edit.vim
> +@@ -1519,3 +1519,15 @@ func Test_edit_noesckeys()
> +   bwipe!
> +   set esckeys
> + endfunc
> ++
> ++" Test for getting the character of the line below after "p"
> ++func Test_edit_put_CTRL_E()
> ++  set encoding=latin1
> ++  new
> ++  let @" = ''
> ++  sil! norm orggRx
> ++  sil! norm pr
> ++  call assert_equal(['r', 'r'], getline(1, 2))
> ++  bwipe!
> ++  set encoding=utf-8
> ++endfunc
> +--
> +2.17.1
> +
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
> index fc4e205b74..0973a368c0 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -19,6 +19,7 @@ SRC_URI = "git://github.com/vim/vim.git \
>             file://racefix.patch \
>             file://b7081e135a16091c93f6f5f7525a5c58fb7ca9f9.patch \
>            file://CVE-2021-3778.patch \
> +           file://CVE-2021-3796.patch \
>  "
>
>  SRCREV = "98056533b96b6b5d8849641de93185dd7bcadc44"
> --
> 2.30.1 (Apple Git-130)
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157293): https://lists.openembedded.org/g/openembedded-core/message/157293
> Mute This Topic: https://lists.openembedded.org/mt/86506415/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

