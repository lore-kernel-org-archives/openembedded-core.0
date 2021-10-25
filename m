Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2699C433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 18:51:12 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.1230.1635187871212272145
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 11:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Un+9ZGNx;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.54,
 mailfrom: steve@sakoman.com)
Received: by mail-wr1-f54.google.com with SMTP id e4so14560364wrc.7
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 11:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VbHexJ3PoE5MoftHEVqOHs++dCa9fL/A1UI/aMylqds=;
        b=Un+9ZGNxuOtvJ+oJbtU0nm+4fkXvYmj+w/x02q+XBIMx7fQU1J+NnsKPvBhJIxS9wT
         Fjj9Qs2sOzjFV+GgMdf5/WnfeM5CVjk9/RJo905QdV6ZhAbiihu9iHW0s8PHK8J3fpsq
         VYGu+q1wPg2Sgh4EIFAn+0U2jcVM/vAtPxRfclGNEdOMLe48vfYQI6lFEgKzcBSfqSgT
         5QtHai91XMuvFzKgjmW68+3W3ogGZPK6Xl/YMkekKAt96UEaG292WPYyn45Zl5jAmXRr
         WGFPinlkS6Rq2bm6keCA0b2AmQtep6vrcEgr+qE/knAM90S+VdT6Ul5D38BNuxQVSFUt
         k2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VbHexJ3PoE5MoftHEVqOHs++dCa9fL/A1UI/aMylqds=;
        b=gt5DMGyVYbV4sHtOfNS3KgMoXvt87BtcSgu0QcZWdlD+LDgrhBd+c+MUNgQcGg0w3w
         EPH0yNC3tspnGA3EFt/V/1GwyvmMdmjyittRurD76mII2bINAbZsX2dJ/LmJQhB/0VCg
         IrueW2G5DWfRhS0xastYg2mo2FknQ6bYIYUgjfQdwXkpUff03pA4SnbFtVMVG+JP9Tdj
         5OU1w2qjzHXr+wOl/PlLzpHRRsnBbf5C3OqJCiBL65qeCg0d7bZAKvhYRvAWakzlh9Cc
         cLoUE9zJRp5o1ZRsZAn6d6nkSOi2quH5jgjvdZl0NyJm//iYyKP4TA040vvGAT2Dfkq/
         QxLA==
X-Gm-Message-State: AOAM530Uz1MD8152/c2bSeVBNf9Y3IO1Ym7a4P2YpIz0wvGHoKQmmPl/
	770sE9wLf3TTTXVGCXx3b+VhnhLUiTn/9kLQVQxWTA==
X-Google-Smtp-Source: 
 ABdhPJymN8S3XvCZm6XeTg66wQcy/ocbzsBbQeXcE9EjOjivXoqZE0SPNd56P7GA0vO2hfIQyv0K/MVoAa3UcpNgfP8=
X-Received: by 2002:adf:ebd0:: with SMTP id
 v16mr21068933wrn.291.1635187869335;
 Mon, 25 Oct 2021 11:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211025072857.910-1-flowergom@gmail.com>
 <16B153BAA3F7E703.19570@lists.openembedded.org>
 <16B157E496184ECA.20619@lists.openembedded.org>
In-Reply-To: <16B157E496184ECA.20619@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 25 Oct 2021 08:50:57 -1000
Message-ID: 
 <CAOSpxdb0EALiLZp-3Pu2G95uhYbYpiaxY1t57N8rfNy+vPvqOA@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH v2] vim: fix 2021-3796
To: steve@sakoman.com
Cc: Minjae Kim <flowergom@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 18:51:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157358

On Mon, Oct 25, 2021 at 7:59 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> On Mon, Oct 25, 2021 at 6:43 AM Steve Sakoman via
> lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
> wrote:
> >
> > On Sun, Oct 24, 2021 at 9:29 PM Minjae Kim <flowergom@gmail.com> wrote:
> > >
> > > vim is vulnerable to Use After Free
> > > Problem: Checking first character of url twice.
> > >
> > > reference:
> > > https://github.com/vim/vim/commit/35a9a00afcb20897d462a766793ff45534810dc3
> > >
> > > Signed-off-by: Minjae Kim <flowergom@gmail.com>
> > > ---
> > >  .../vim/files/CVE-2021-3796.patch             | 50 +++++++++++++++++++
> > >  1 file changed, 50 insertions(+)
> > >  create mode 100644 meta/recipes-support/vim/files/CVE-2021-3796.patch
> >
> > You don't seem to be adding the patch to the SRC_URI in the recipe!
>
> I fixed that issue, but now once again the patch file fails to apply:
>
> stdio: ERROR: vim-8.2-r0 do_patch: Applying patch
> 'CVE-2021-3796.patch' on target directory
> '/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/vim/8.2-r0/git'
> stdio: ERROR: Logfile of failure stored in:
> /home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/vim/8.2-r0/temp/log.do_patch.7612
> stdio: ERROR: Task
> (/home/pokybuild/yocto-worker/no-x11/build/meta/recipes-support/vim/vim_8.2.bb:do_patch)
> failed with exit code '1'

Perhaps you are having some issues with your mailer that is corrupting
the patch?  I see that the master version is also having problems.

Do you have a git repo I could try pulling from?

Steve

>
> Steve
>
> >
> > Steve
> >
> > >
> > > diff --git a/meta/recipes-support/vim/files/CVE-2021-3796.patch b/meta/recipes-support/vim/files/CVE-2021-3796.patch
> > > new file mode 100644
> > > index 0000000000..666bd5c48b
> > > --- /dev/null
> > > +++ b/meta/recipes-support/vim/files/CVE-2021-3796.patch
> > > @@ -0,0 +1,50 @@
> > > +From 6d02e1429771c00046b48f26e53ca4123c3ce4e1 Mon Sep 17 00:00:00 2001
> > > +From: Bram Moolenaar <Bram@vim.org>
> > > +Date: Fri, 24 Sep 2021 16:01:09 +0800
> > > +Subject: [PATCH] patch 8.2.3428: using freed memory when replacing
> > > +
> > > +Problem:    Using freed memory when replacing. (Dhiraj Mishra)
> > > +Solution:   Get the line pointer after calling ins_copychar().
> > > +
> > > +Upstream-Status: Backport [https://github.com/vim/vim/commit/35a9a00afcb20897d462a766793ff45534810dc3]
> > > +CVE: CVE-2021-3796
> > > +
> > > +Signed-off-by: Minjae Kim  <flowergom@gmail.com>
> > > +---
> > > + src/normal.c | 10 +++++++---
> > > + 1 file changed, 7 insertions(+), 3 deletions(-)
> > > +
> > > +diff --git a/src/normal.c b/src/normal.c
> > > +index c4963e621..305b514bc 100644
> > > +--- a/src/normal.c
> > > ++++ b/src/normal.c
> > > +@@ -5009,19 +5009,23 @@ nv_replace(cmdarg_T *cap)
> > > +           {
> > > +               /*
> > > +                * Get ptr again, because u_save and/or showmatch() will have
> > > +-               * released the line.  At the same time we let know that the
> > > +-               * line will be changed.
> > > ++               * released the line. This may also happen in ins_copychar().
> > > ++               * At the same time we let know that the line will be changed.
> > > +                */
> > > +-              ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
> > > +               if (cap->nchar == Ctrl_E || cap->nchar == Ctrl_Y)
> > > +               {
> > > +                 int c = ins_copychar(curwin->w_cursor.lnum
> > > +                                          + (cap->nchar == Ctrl_Y ? -1 : 1));
> > > ++
> > > ++                ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
> > > +                 if (c != NUL)
> > > +                   ptr[curwin->w_cursor.col] = c;
> > > +               }
> > > +               else
> > > ++              {
> > > ++                  ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
> > > +                   ptr[curwin->w_cursor.col] = cap->nchar;
> > > ++              }
> > > +               if (p_sm && msg_silent == 0)
> > > +                   showmatch(cap->nchar);
> > > +               ++curwin->w_cursor.col;
> > > +--
> > > +2.17.1
> > > +
> > > --
> > > 2.30.1 (Apple Git-130)
> > >
> > >
> > >
> > >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157353): https://lists.openembedded.org/g/openembedded-core/message/157353
> Mute This Topic: https://lists.openembedded.org/mt/86572003/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

