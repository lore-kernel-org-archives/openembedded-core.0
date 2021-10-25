Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAF9C433F5
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 16:43:21 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web08.592.1635180199921410111
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 09:43:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=yuatRlxO;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.47,
 mailfrom: steve@sakoman.com)
Received: by mail-wm1-f47.google.com with SMTP id
 j2-20020a1c2302000000b0032ca9b0a057so568625wmj.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Oct 2021 09:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7/3CfEgyzqx/SpNh834btdnJh+WtlOczqNMAoDG9iOI=;
        b=yuatRlxOeq+ieBCytLGmJ0bUuxg+XIW6088TWjIyXXp62rMiVytvR75eZ+AfWF39Qx
         /xE+b5DfbXsP/vNd7HCfZK2Li9V8jG/3OjYH7Rc1pnHwrujJcR+bvc0c+qLvvvb5O8EG
         W0C00QqcMJ/B4BGoe5CG6Q/a8VGj9Su7yiQ2YSpUrKYaV7HG3HAiakgxkX/18NoKZe0m
         7g8gpbUzotdV5OthmfdGuvGmZ7JFuGF5+TH2EX5DYW9qsEI5Z9iohp2fau/WTyNR6rS/
         ikGQCW4sXD6cynPkeqn1wng99+hzfsOwaD2VIri++TnT94LMmyKCNAgmm8qidexoFbY3
         8i2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7/3CfEgyzqx/SpNh834btdnJh+WtlOczqNMAoDG9iOI=;
        b=QWOqLJ7SDxV7n+lL/qUk3g3OKMiTrTa8ZR2BqYNJqsWL+hN9Myyqh6Y96lr1swRLc1
         XJXcbXN/yleXSnLTc+RPjMYg+eRzeZbqVu2OevUd0dxBaxZskBzn3fjYTHPrsk9Tudj0
         aktOD/eco2IFJsn5NFQw25v8hvm7zdo3D+GPH7r/Oh9oHqypg+J/ausl/2EXDOz+0X53
         YxCMeq2t4v5JbjHvGoq8dmmfxzZ5eZZvQBuCwx36mPWgxxzyWKPjHgazzoTniVQWXMeZ
         EOgTZPSCRT5E/9OZKzhv5//7zR6j9u/r4UnEGNPPAASRW79IDV1AMvbM8iTiNJsa6HhA
         dr4g==
X-Gm-Message-State: AOAM533LCunG9osTGHzdOE5ZkLXHtMmU7opGWOdAz0syDm3FgzwVE6Lb
	0SYUeB4LcL9j1N94NhDIKjdQBFNr5UzoffQHrunwzQ==
X-Google-Smtp-Source: 
 ABdhPJwCSlH31Y1/dmMAYxDfBhu4fCTBI77UWNqH/spm+dRocbwP18PYS+4bQRQQced7LgyFSIl5SRysl5XWDaqSlns=
X-Received: by 2002:a1c:14f:: with SMTP id 76mr992095wmb.28.1635180197860;
 Mon, 25 Oct 2021 09:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211025072857.910-1-flowergom@gmail.com>
In-Reply-To: <20211025072857.910-1-flowergom@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 25 Oct 2021 06:43:06 -1000
Message-ID: 
 <CAOSpxdb_h_P0SR7e3eUc1oShAiUS8_VNWa2kVakHSewyV4RnUw@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH v2] vim: fix 2021-3796
To: Minjae Kim <flowergom@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Oct 2021 16:43:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157352

On Sun, Oct 24, 2021 at 9:29 PM Minjae Kim <flowergom@gmail.com> wrote:
>
> vim is vulnerable to Use After Free
> Problem: Checking first character of url twice.
>
> reference:
> https://github.com/vim/vim/commit/35a9a00afcb20897d462a766793ff45534810dc3
>
> Signed-off-by: Minjae Kim <flowergom@gmail.com>
> ---
>  .../vim/files/CVE-2021-3796.patch             | 50 +++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 meta/recipes-support/vim/files/CVE-2021-3796.patch

You don't seem to be adding the patch to the SRC_URI in the recipe!

Steve

>
> diff --git a/meta/recipes-support/vim/files/CVE-2021-3796.patch b/meta/recipes-support/vim/files/CVE-2021-3796.patch
> new file mode 100644
> index 0000000000..666bd5c48b
> --- /dev/null
> +++ b/meta/recipes-support/vim/files/CVE-2021-3796.patch
> @@ -0,0 +1,50 @@
> +From 6d02e1429771c00046b48f26e53ca4123c3ce4e1 Mon Sep 17 00:00:00 2001
> +From: Bram Moolenaar <Bram@vim.org>
> +Date: Fri, 24 Sep 2021 16:01:09 +0800
> +Subject: [PATCH] patch 8.2.3428: using freed memory when replacing
> +
> +Problem:    Using freed memory when replacing. (Dhiraj Mishra)
> +Solution:   Get the line pointer after calling ins_copychar().
> +
> +Upstream-Status: Backport [https://github.com/vim/vim/commit/35a9a00afcb20897d462a766793ff45534810dc3]
> +CVE: CVE-2021-3796
> +
> +Signed-off-by: Minjae Kim  <flowergom@gmail.com>
> +---
> + src/normal.c | 10 +++++++---
> + 1 file changed, 7 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/normal.c b/src/normal.c
> +index c4963e621..305b514bc 100644
> +--- a/src/normal.c
> ++++ b/src/normal.c
> +@@ -5009,19 +5009,23 @@ nv_replace(cmdarg_T *cap)
> +           {
> +               /*
> +                * Get ptr again, because u_save and/or showmatch() will have
> +-               * released the line.  At the same time we let know that the
> +-               * line will be changed.
> ++               * released the line. This may also happen in ins_copychar().
> ++               * At the same time we let know that the line will be changed.
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
> +               }
> +               else
> ++              {
> ++                  ptr = ml_get_buf(curbuf, curwin->w_cursor.lnum, TRUE);
> +                   ptr[curwin->w_cursor.col] = cap->nchar;
> ++              }
> +               if (p_sm && msg_silent == 0)
> +                   showmatch(cap->nchar);
> +               ++curwin->w_cursor.col;
> +--
> +2.17.1
> +
> --
> 2.30.1 (Apple Git-130)
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157332): https://lists.openembedded.org/g/openembedded-core/message/157332
> Mute This Topic: https://lists.openembedded.org/mt/86572003/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

