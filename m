Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06BDC433EF
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 16:22:45 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web09.30008.1653322964150083888
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 09:22:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oKnxbmgM;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id 11so10648061qtp.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 09:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pbHWhdSdpYK8aVWo07H8TgkQ2eYDWEY6ry6gYkdmXbY=;
        b=oKnxbmgMcl72URsAnS+9yoRA+2PW9P/0kNm4LhjecnM5hv4EUce3aDXJrl+SIsm3lY
         /43RxXPFGF3oT32N1Mvjd0Nfamvvz1rVsV6GrXrJTcEfmoo83SlRH+hemtXoICttiEXX
         Z8UHPMEzuDr4MVTbrG7ZM5kwwaikB1efNdF+L6I4f3DY3UGPUO7XUlIqJDnpaIr0ORuo
         aJ+TTj3Nr8rFIN2gWs9Aq12ehskGl/hbQnz8amZxdkQswEaVtwt9zTJgJPyO9jr2zjmg
         U4Ca80q6M28SLxpSXJP2fW2Ob8fst1yTsUTD8L4gPz/kC3zDj6vlpVtDu5iYaIIgYRfi
         OjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pbHWhdSdpYK8aVWo07H8TgkQ2eYDWEY6ry6gYkdmXbY=;
        b=yt/jJyFhGqSlIZJsZOu8dxV44B+XrDybl9DfhfuzCx6fcWQwnip0aSXMJapA0v7pOn
         9/lIQNvmI8gGTLXaBIGaikFFIFdB2cPWyf9xc2Dwj3VevZsejhK3O16D55fYVVHw8rWw
         ouCZfg/6Mqath7PKekbebB+lXqZB9AvSx3c0N1qerjd721EpHIodbwzrivcQ0O14c7Hi
         qMpmrTf4u+JW1rTivSd+VpPhyvd3R8GYMAH6v38vRajKgrC5MNq9zHEI5Dot23m4TV9f
         iBAEgeilqeLU4wXgCdDsK9ZIeLmhymEmo+wyFFLmhPIJCO/RjW7lIgcd9zyQ7D7m3dvj
         POmA==
X-Gm-Message-State: AOAM531fRvNnkn8WmKyJ/VJFzAEZv+Hm75CHi5CbecXMJ9CY1o/zyXXU
	OUt1YyJB49X4+UkRIym4ZQmUxZ6lLwwXiaKmQ3s=
X-Google-Smtp-Source: 
 ABdhPJxUgIE4GR5RI835mBK3SqJ6HEhqi1LvifCqCm9VPTDo8lnxL2U8jRs8QYnm/m/mKgSyrFZsrtXQIRl8STW06e8=
X-Received: by 2002:ac8:574d:0:b0:2f3:b4aa:700f with SMTP id
 13-20020ac8574d000000b002f3b4aa700fmr16770148qtx.54.1653322963165; Mon, 23
 May 2022 09:22:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220523133419.2216713-1-jiaqing.zhao@linux.intel.com>
 <CANNYZj-Mvf2vCdMQipyhPxnfBxB-rLniGBhckkj8ELOc+ZvLQA@mail.gmail.com>
 <37b2c6e6-6f5a-ea40-2349-b03f1d5599d1@linux.intel.com>
In-Reply-To: <37b2c6e6-6f5a-ea40-2349-b03f1d5599d1@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 23 May 2022 09:22:17 -0700
Message-ID: 
 <CAMKF1spzgWPD0HZLR9sbtffgF0WFD64VMjGmEzB9UQ4Tgu=JeQ@mail.gmail.com>
Subject: Re: [oe-core] [PATCH] systemd: Correct
 0001-pass-correct-parameters-to-getdents64.patch
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 16:22:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166039

On Mon, May 23, 2022 at 7:21 AM Jiaqing Zhao
<jiaqing.zhao@linux.intel.com> wrote:
>
> It's an musl-specific issue I believe.
>
> man page defines it as [1]
>         ssize_t getdents64(int fd, void *dirp, size_t count)
>
> But in musl, it's an alias of getdents [2]
>         int getdents(int fd, struct dirent *buf, size_t len)
>
> Shall we report to musl instead of systemd?
>
> [1] https://man7.org/linux/man-pages/man2/getdents.2.html
> [2] https://elixir.bootlin.com/musl/v1.2.3/source/src/linux/getdents.c
>

I think it is worth reporting at both places.

Here the data buffer is filled with packed dirent
structures, not regular dirent structure, therefore a void* argument
like glibc is doing
probably makes more sense. But we have to reason it with musl community as well.

> On 2022-05-23 21:59, Alexander Kanavin wrote:
> > Inappropriate still means the issue needs to be reported to upstream,
> > can you do this please?
> >
> > Alex
> >
> > On Mon, 23 May 2022 at 15:34, Jiaqing Zhao <jiaqing.zhao@linux.intel.com> wrote:
> >>
> >> Current patch removes the uint8_t* cast in src/basic/recurse-dir.c:57
> >> to fix musl build, but it changes the value here as pointer arithmetic
> >> is type-depended in C. This patch corrects the behavior by adding an
> >> extra cast to struct dirent*.
> >>
> >> Also changes the patch's Upstream-Status to Inappropriate as it's musl-
> >> specific.
> >>
> >> Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> >> ---
> >>  ...0001-pass-correct-parameters-to-getdents64.patch | 13 ++++++++-----
> >>  1 file changed, 8 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch b/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
> >> index 028f50b243..9ebff9825a 100644
> >> --- a/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
> >> +++ b/meta/recipes-core/systemd/systemd/0001-pass-correct-parameters-to-getdents64.patch
> >> @@ -1,4 +1,4 @@
> >> -From 8c8899b4641125cfe8e7baee32e5c5f452545d2c Mon Sep 17 00:00:00 2001
> >> +From dab02796780f00d689cc1c7a0ba81abe7c5f28d0 Mon Sep 17 00:00:00 2001
> >>  From: Khem Raj <raj.khem@gmail.com>
> >>  Date: Fri, 21 Jan 2022 15:15:11 -0800
> >>  Subject: [PATCH] pass correct parameters to getdents64
> >> @@ -12,16 +12,16 @@ Fixes
> >>          n = getdents64(fd, &buffer, sizeof(buffer));
> >>                             ^~~~~~~
> >>
> >> -Upstream-Status: Pending
> >> +Upstream-Status: Inappropriate [musl specific]
> >>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> -
> >> +Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
> >>  ---
> >>   src/basic/recurse-dir.c | 2 +-
> >>   src/basic/stat-util.c   | 2 +-
> >>   2 files changed, 2 insertions(+), 2 deletions(-)
> >>
> >>  diff --git a/src/basic/recurse-dir.c b/src/basic/recurse-dir.c
> >> -index efa1797b7b..797285e3be 100644
> >> +index efa1797b7b..03ff10ebe9 100644
> >>  --- a/src/basic/recurse-dir.c
> >>  +++ b/src/basic/recurse-dir.c
> >>  @@ -54,7 +54,7 @@ int readdir_all(int dir_fd,
> >> @@ -29,7 +29,7 @@ index efa1797b7b..797285e3be 100644
> >>                   assert(bs > de->buffer_size);
> >>
> >>  -                n = getdents64(dir_fd, (uint8_t*) de->buffer + de->buffer_size, bs - de->buffer_size);
> >> -+                n = getdents64(dir_fd, de->buffer + de->buffer_size, bs - de->buffer_size);
> >> ++                n = getdents64(dir_fd, (struct dirent*)((uint8_t*) de->buffer + de->buffer_size), bs - de->buffer_size);
> >>                   if (n < 0)
> >>                           return -errno;
> >>                   if (n == 0)
> >> @@ -46,3 +46,6 @@ index c2269844f8..7cd6c7fa42 100644
> >>           if (n < 0)
> >>                   return -errno;
> >>
> >> +--
> >> +2.34.1
> >> +
> >> --
> >> 2.34.1
> >>
> >>
> >>
> >>
> >>
> >>
> >>
> >>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166033): https://lists.openembedded.org/g/openembedded-core/message/166033
> Mute This Topic: https://lists.openembedded.org/mt/91288052/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

