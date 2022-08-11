Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655B7C19F2A
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 15:52:10 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.8216.1660233125900293518
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 08:52:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j+v5rsAG;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id d14so26064907lfl.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 08:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=1ju6oBQwkOvSwckVB6jC6pHybofiCawrmtcNVZdCc6c=;
        b=j+v5rsAGTL/sxeX9aMFDumscM+5oPWzZC5wLTp6nhh2vQZJZlNFWQJ1nb6tOrIvs7c
         aeT0OXnbIF1SWNpWRgrpu/PFtY07Bs3mZlLmBWTGRQbrYK/1WUbwGlDmLHrMchaQphfk
         dIeC+KUpM0HtqmlRrXA9LPzojdgOb90p1fkz84R2fJnABK97dbpjZzNZPWYRzLMNsjTb
         eU1K4ifS41xafMkdXlMsYf0HNYjOwPH+q5DUFl6i0w3BppMm7b3VCPOYk2U0Mg3ZHULR
         oFXdhWFyaKQUqZVDJ5x6VX00FW9v0E7GbIPiMcHpkolT3ntYeXaDLZ4YDYXJx8+Be7nl
         S+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=1ju6oBQwkOvSwckVB6jC6pHybofiCawrmtcNVZdCc6c=;
        b=PK3hlRoROGdC8jAnmk4IyXaJEY9AxRPWtdYxQ913XpQYhJDw4FRuDqFjjkL6kKyhux
         rw5KumB56MPeEilDpy9JajAzKydpWzDum1lpRZbmm6PfwBeJbjJrz04P2sfXSUB8J895
         yNqrxVr01RGdVptJ1/oGSwq9BaLEjW1374xoA3OYe073CCGzHnqKTqJKFFRrh82/T7wE
         oiqXcrChFpaelyRPivpWBANxpeyVPyXlDC93d1IR2zhqdFJ6wQFjrAGeu0XxPN/bv3S+
         HJVbMLIoX1TmEv0HqitPRQ62RawWVWRbDeqSQ8l9RWkdCkbJqt961v/2SdFgbfklS2x9
         LRgg==
X-Gm-Message-State: ACgBeo2JSqJ5HZY0iK47m0aJR+EWgfVBow7FyRCj0NGVj9afgm88rv3G
	XvxxLKCtbB8ZxQJn50A7bXhmI0YSprVrcXt/nTE=
X-Google-Smtp-Source: 
 AA6agR6uyBzCE1OHmj9ry+JUKlsneGq02QFRrvCuD+LVxhIzAuAtqD+xKkLKvp6PE8wdsqEf/SAAE/FCNOiEA7K+/to=
X-Received: by 2002:a05:6512:3455:b0:48b:c5c:6689 with SMTP id
 j21-20020a056512345500b0048b0c5c6689mr12462332lfr.673.1660233123634; Thu, 11
 Aug 2022 08:52:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220811154005.4084669-1-trini@konsulko.com>
In-Reply-To: <20220811154005.4084669-1-trini@konsulko.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 11 Aug 2022 17:51:52 +0200
Message-ID: 
 <CANNYZj82WqbCr2MktnE8GrowoRiXL=W2GGOVpgzgi9Ud9YJJOg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemux86-64: Allow higher tunes
To: Tom Rini <trini@konsulko.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Joshua Watt <JPEWhacker@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 15:52:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169250

This is less useful than it may seem, and merely moves the supported
CPU from circa-2006 core 2 to circa-2008 core i7. You won't get AVX or
anything newer, which requires adding these instructions to qemu
usermode (a project I'd like to do if I had the time).

Alex

On Thu, 11 Aug 2022 at 17:40, Tom Rini <trini@konsulko.com> wrote:
>
> Back in 0be64e54a0e6 ("qemux86: Allow higher tunes") we moved the
> qemux86 machine to using the core-i7 tune file, for maximum flexibility
> and to allow for enabling advanced processor features if desired or
> required by various packagess, without changing the default tune. Do the
> same now for qemux86-64.
>
> Cc: Joshua Watt <JPEWhacker@gmail.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
>  meta/conf/machine/qemux86-64.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
> index 901353499c81..864086791179 100644
> --- a/meta/conf/machine/qemux86-64.conf
> +++ b/meta/conf/machine/qemux86-64.conf
> @@ -10,7 +10,7 @@ PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
>
>  require conf/machine/include/qemu.inc
>  DEFAULTTUNE ?= "core2-64"
> -require conf/machine/include/x86/tune-core2.inc
> +require conf/machine/include/x86/tune-corei7.inc
>  require conf/machine/include/x86/qemuboot-x86.inc
>
>  UBOOT_MACHINE ?= "qemu-x86_64_defconfig"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169248): https://lists.openembedded.org/g/openembedded-core/message/169248
> Mute This Topic: https://lists.openembedded.org/mt/92961093/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

