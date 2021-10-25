Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A5EC433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 17:59:40 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.498.1635184778198214647
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 10:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Xrp/9Ayn;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.53,
 mailfrom: steve@sakoman.com)
Received: by mail-wm1-f53.google.com with SMTP id m42so11481239wms.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 10:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GRnPeTmxocKFKaVWhlCFe+1KlTkXQyUJ5cL1jOXSvuU=;
        b=Xrp/9Ayn9cs6rsfieXUFH7mm+gKNb9Jg7sY79R1XFS2C5y/LK5HyMXHORTrdfx73HD
         MbFjEN1zwFIApAP+LKhBK2R886MsstuHKbORDDJDERPMOKa6jHQHavQDhvy0+QDoRbtS
         d+JQpW1FGyiJuBnFxSa522QP1SPZokD5S+uxVoy3tf4BX27V2AF0FWozQV3xHAqE92lh
         T0RTeiF3kvu2ypWIzgptbyLF96AFnIBgr1Ndo/8OqeozQ+3CtfUJ8RNlxt6GuGnH/Nuk
         KOuiRZzg1zPGw3e/uNFUqZDO/C5+1L0Qlha+U23UR8DSEjuLPlfWfDfqQJKGztkX2UN6
         rwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GRnPeTmxocKFKaVWhlCFe+1KlTkXQyUJ5cL1jOXSvuU=;
        b=L5mGl+3EhgKMfClyMWeSnQdwAID6MYuBRcFrTLCjBDOHGELq2Ms1mIs5lF9s2JrIDg
         NyqOQtduZachu8CiruOYQzGhVPFyN6MkAWBklyivduqTAFPyV3HHZAJt0QTMp017i2th
         cPPnJtjbjBY3jHN2LXmAhBmai+VLPzRfTiggWjmttFu2M71uNolAJSTcryQs3MVu5a4t
         RgKNVzTQn3rpNpGTMPawR3w/jcEh/qzHga0riFXmdktFdhWytlgr7kaZNlRs3NUqxC/1
         yrTS7fB6EqFWHsVeM9Qk9QVc6PvKm9eayxZRttyFFYxN/J8WYyAUPf+9DbSHJ2jrO0cC
         1hRg==
X-Gm-Message-State: AOAM532y6sWsiATQnGFlTfw68S3K+Dp4P+ibSHDB/x7sLc5a+XAnfNGq
	eJY85n0s2lss7fjVo6VZiZxT2fpi99QIQUa8IbEBXA==
X-Google-Smtp-Source: 
 ABdhPJwOb1/ofLbGAIf+DTa5L2c8pEBOkhfq0r1ws/Zll86iBSxQaBTxnfQzDvJ3MN2L59Vqm0U3384CI86XRR2oD74=
X-Received: by 2002:a1c:7f0a:: with SMTP id a10mr51919322wmd.60.1635184776395;
 Mon, 25 Oct 2021 10:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211025072857.910-1-flowergom@gmail.com>
 <16B153BAA3F7E703.19570@lists.openembedded.org>
In-Reply-To: <16B153BAA3F7E703.19570@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 25 Oct 2021 07:59:25 -1000
Message-ID: 
 <CAOSpxdaH_OL8u4zNZqATjc37rFeN_i9E6Nk16r7yWyuc649MLQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH v2] vim: fix 2021-3796
To: steve@sakoman.com
Cc: Minjae Kim <flowergom@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 17:59:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157353

On Mon, Oct 25, 2021 at 6:43 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> On Sun, Oct 24, 2021 at 9:29 PM Minjae Kim <flowergom@gmail.com> wrote:
> >
> > vim is vulnerable to Use After Free
> > Problem: Checking first character of url twice.
> >
> > reference:
> > https://github.com/vim/vim/commit/35a9a00afcb20897d462a766793ff45534810dc3
> >
> > Signed-off-by: Minjae Kim <flowergom@gmail.com>
> > ---
> >  .../vim/files/CVE-2021-3796.patch             | 50 +++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> >  create mode 100644 meta/recipes-support/vim/files/CVE-2021-3796.patch
>
> You don't seem to be adding the patch to the SRC_URI in the recipe!

I fixed that issue, but now once again the patch file fails to apply:

stdio: ERROR: vim-8.2-r0 do_patch: Applying patch
'CVE-2021-3796.patch' on target directory
'/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/vim/8.2-r0/git'
stdio: ERROR: Logfile of failure stored in:
/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/vim/8.2-r0/temp/log.do_patch.7612
stdio: ERROR: Task
(/home/pokybuild/yocto-worker/no-x11/build/meta/recipes-support/vim/vim_8.2.bb:do_patch)
failed with exit code '1'

Steve

>
> Steve
>
> >
> > diff --git a/meta/recipes-support/vim/files/CVE-2021-3796.patch b/meta/recipes-support/vim/files/CVE-2021-3796.patch
> > new file mode 100644
> > index 0000000000..666bd5c48b
> > --- /dev/null
> > +++ b/meta/recipes-support/vim/files/CVE-2021-3796.patch
> > @@ -0,0 +1,50 @@
> > +From 6d02e1429771c00046b48f26e53ca4123c3ce4e1 Mon Sep 17 00:00:00 2001
> > +From: Bram Moolenaar <Bram@vim.org>
> > +Date: Fri, 24 Sep 2021 16:01:09 +0800
> > +Subject: [PATCH] patch 8.2.3428: using freed memory when replacing
> > +
> > +Problem:    Using freed memory when replacing. (Dhiraj Mishra)
> > +Solution:   Get the line pointer after calling ins_copychar().
> > +
> > +Upstream-Status: Backport [https://github.com/vim/vim/commit/35a9a00afcb20897d462a766793ff45534810dc3]
> > +CVE: CVE-2021-3796
> > +
> > +Signed-off-by: Minjae Kim  <flowergom@gmail.com>
> > +---
> > + src/normal.c | 10 +++++++---
> > + 1 file changed, 7 insertions(+), 3 deletions(-)
> > +
> > +diff --git a/src/normal.c b/src/normal.c
> > +index c4963e621..305b514bc 100644
> > +--- a/src/normal.c
> > ++++ b/src/normal.c
> > +@@ -5009,19 +5009,23 @@ nv_replace(cmdarg_T *cap)
> > +           {
> > +               /*
> > +                * Get ptr again, because u_save and/or showmatch() will have
> > +-               * released the line.  At the same time we let know that the
> > +-               * line will be changed.
> > ++               * released the line. This may also happen in ins_copychar().
> > ++               * At the same time we let know that the line will be changed.
> > +                */
> > +-              ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
> > +               if (cap->nchar == Ctrl_E || cap->nchar == Ctrl_Y)
> > +               {
> > +                 int c = ins_copychar(curwin->w_cursor.lnum
> > +                                          + (cap->nchar == Ctrl_Y ? -1 : 1));
> > ++
> > ++                ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
> > +                 if (c != NUL)
> > +                   ptr[curwin->w_cursor.col] = c;
> > +               }
> > +               else
> > ++              {
> > ++                  ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
> > +                   ptr[curwin->w_cursor.col] = cap->nchar;
> > ++              }
> > +               if (p_sm && msg_silent == 0)
> > +                   showmatch(cap->nchar);
> > +               ++curwin->w_cursor.col;
> > +--
> > +2.17.1
> > +
> > --
> > 2.30.1 (Apple Git-130)
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157352): https://lists.openembedded.org/g/openembedded-core/message/157352
> Mute This Topic: https://lists.openembedded.org/mt/86572003/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

