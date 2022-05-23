Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B50CC4332F
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 14:00:15 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.27915.1653314409966419941
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 07:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CupAsEhY;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id w14so25686777lfl.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 07:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=saQ8pFjR87HkXRygqExVeHbeoHMeba4wfzgWnsw4EMM=;
        b=CupAsEhY6NuDMlQP+3/WZebabhqT0RcyWLmnLamibq70hgKZUzLznXcBSyXG8+oSro
         k0sRfwJA6XuHsQN9mjUUJNis1AlOFZaTKiQklN2FIw3idrWdMU89LYCL3ihSSdLadf24
         3+xO0+kxjYM06GsPJuRWRFIOl6zAeMkJTGVPdySpgJEmPshblLoF409I+VkCgHA3ChJs
         s70Rwu0oy4vuPizrIcWYj70BtD4WL1c5HziWy8WW9pIOaiOoBJESTU0nkFBLRhZjyGoo
         B5r+j8CW0nwO9jPmGs8NF8cuyja7N6BT/oAz1ga7a++h3855OHNAgyvLNhsqSY2oFvS6
         MEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=saQ8pFjR87HkXRygqExVeHbeoHMeba4wfzgWnsw4EMM=;
        b=ai3TNEgS6aYvl3Biu1lnF3GJTM79iTyD+qhZOG2ZiaWgKRkcmKHTjcmW3IXuUliet7
         T3Btxa09SIPVB7ZP41hVb6UXeOt9qXvhmhN8+w3zbYOqaSgK4Wl79lHW+/l5lv/sFvZc
         idLrKY6W4e7UQ4ow5sP3mPIu1ThToWb+ZCSuenkrJzHhwyaDyErr65Ye7fLRnQc4gTvb
         RRL3nHr6IogZfbYPXa2u7ENr9EAOoluvSXg6gZp5bIfCen930j2cD03ojHUkagOdTIxI
         tD5LSpJQVLgkL4Mupq19ZrLBIiV16BUAt69LXOHvPe/cGqB9nvTdp3Yx6VFi+ZyF4zbC
         Nv+w==
X-Gm-Message-State: AOAM531s1RX8vg5bUCrrk+1F14dlZun5BU3kcaMRiPXOYY0B9fhpOBDK
	7Vvmfeh+fTc8ydD2//e9+zk80+IsATXAIxWqsAo=
X-Google-Smtp-Source: 
 ABdhPJzn0y/KZtBHct2LqVl/UCKNRNEDLB/ULAtOkGHIAzMSF+wvd2u1r7oGlEMNelNEe0Zx925m2L84MfMk+geTP+o=
X-Received: by 2002:a05:6512:304c:b0:478:67d5:6982 with SMTP id
 b12-20020a056512304c00b0047867d56982mr6919460lfb.380.1653314408125; Mon, 23
 May 2022 07:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220523133419.2216713-1-jiaqing.zhao@linux.intel.com>
In-Reply-To: <20220523133419.2216713-1-jiaqing.zhao@linux.intel.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 May 2022 15:59:56 +0200
Message-ID: 
 <CANNYZj-Mvf2vCdMQipyhPxnfBxB-rLniGBhckkj8ELOc+ZvLQA@mail.gmail.com>
Subject: Re: [oe-core] [PATCH] systemd: Correct
 0001-pass-correct-parameters-to-getdents64.patch
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 14:00:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166023

Inappropriate still means the issue needs to be reported to upstream,
can you do this please?

Alex

On Mon, 23 May 2022 at 15:34, Jiaqing Zhao <jiaqing.zhao@linux.intel.com> wrote:
>
> Current patch removes the uint8_t* cast in src/basic/recurse-dir.c:57
> to fix musl build, but it changes the value here as pointer arithmetic
> is type-depended in C. This patch corrects the behavior by adding an
> extra cast to struct dirent*.
>
> Also changes the patch's Upstream-Status to Inappropriate as it's musl-
> specific.
>
> Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> ---
>  ...0001-pass-correct-parameters-to-getdents64.patch | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch b/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
> index 028f50b243..9ebff9825a 100644
> --- a/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
> +++ b/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
> @@ -1,4 +1,4 @@
> -From 8c8899b4641125cfe8e7baee32e5c5f452545d2c Mon Sep 17 00:00:00 2001
> +From dab02796780f00d689cc1c7a0ba81abe7c5f28d0 Mon Sep 17 00:00:00 2001
>  From: Khem Raj <raj.khem@gmail.com>
>  Date: Fri, 21 Jan 2022 15:15:11 -0800
>  Subject: [PATCH] pass correct parameters to getdents64
> @@ -12,16 +12,16 @@ Fixes
>          n = getdents64(fd, &buffer, sizeof(buffer));
>                             ^~~~~~~
>
> -Upstream-Status: Pending
> +Upstream-Status: Inappropriate [musl specific]
>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> +Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
>  ---
>   src/basic/recurse-dir.c | 2 +-
>   src/basic/stat-util.c   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/src/basic/recurse-dir.c b/src/basic/recurse-dir.c
> -index efa1797b7b..797285e3be 100644
> +index efa1797b7b..03ff10ebe9 100644
>  --- a/src/basic/recurse-dir.c
>  +++ b/src/basic/recurse-dir.c
>  @@ -54,7 +54,7 @@ int readdir_all(int dir_fd,
> @@ -29,7 +29,7 @@ index efa1797b7b..797285e3be 100644
>                   assert(bs > de->buffer_size);
>
>  -                n = getdents64(dir_fd, (uint8_t*) de->buffer + de->buffer_size, bs - de->buffer_size);
> -+                n = getdents64(dir_fd, de->buffer + de->buffer_size, bs - de->buffer_size);
> ++                n = getdents64(dir_fd, (struct dirent*)((uint8_t*) de->buffer + de->buffer_size), bs - de->buffer_size);
>                   if (n < 0)
>                           return -errno;
>                   if (n == 0)
> @@ -46,3 +46,6 @@ index c2269844f8..7cd6c7fa42 100644
>           if (n < 0)
>                   return -errno;
>
> +--
> +2.34.1
> +
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166021): https://lists.openembedded.org/g/openembedded-core/message/166021
> Mute This Topic: https://lists.openembedded.org/mt/91288052/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

