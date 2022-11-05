Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEA7C433FE
	for <webhook@archiver.kernel.org>; Sat,  5 Nov 2022 17:59:35 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web12.8550.1667671169662489064
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Nov 2022 10:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=OVoEn+uO;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.45, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f45.google.com with SMTP id q9so20862213ejd.0
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 10:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t3uzLzgruK7Ps1yUaT0rR5DJzfkd5qpw7n8dWYXHV+Y=;
        b=OVoEn+uOxXsKrLJ7qPg8RPtEXaQ0ktYjNBbWizNBso+2HJk2Y0RCiMzpn7kXc2Hq86
         gjuFw8J3Xukk/mJ5rAQXJCPIpwIlgN0rXai6P9eWXBr/aeQNKmNW3GbV//JskXUGz4O8
         CPeDPUrx1O/xSZkh+yXew9IqkEu9w8vOaS/slND1rDkQkYSy5XgeBbh9E1+uUovmjyuh
         L4KbBXkFNx2gZuzqN7bAT5B7k28t62Fry5iGJ0itHnMd/eHSgWZ3lYirJkGPswTawY02
         2fTUwZm4zM+2WB13d+r/uNkYIiUySSKa+XqvCUvr+OQC+rXUz94CssPxaolBIoNwvnZ+
         iQGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3uzLzgruK7Ps1yUaT0rR5DJzfkd5qpw7n8dWYXHV+Y=;
        b=i1gnyYaqrZPOGBXcq+ZC/81ebVU2HCg45iYfRP7M2JeV37X6FTVSOSkJe4155q23Av
         dgfSVW/GDrEIgnoN46BAnXnvsuHQCgxxY53bB4CDYOB9ixNd/6VrtYR8pYv7Bsf/WFic
         WosO8Q88f9zzIpYwH4BiBwSYkhaZN5r1xKgaR/mGyih5Ob3+SWRCqOjIBQwIAk3o+OV0
         p3guMZQwXcfPWaBLIsP4/ZFdmbJKBwO83gHg+m7UYySayFe75ezmDk8HEyga4dvFiUBI
         c+jrUW/33IaihpFlsf0BJyg5d2q4lIWiBWlRrdz0TjBSbdUUfMMaYCeZFrXovf6SGgGv
         0BOA==
X-Gm-Message-State: ACrzQf07V60fncQh25GCfwzEkgR0CC7DnYQvtvU0K/x+nytLm5OTBnp0
	pjXFjORjgnLGEnQ8LkJ0eqTkjnbEg6RCOobJsjRqbA==
X-Google-Smtp-Source: AMsMyM5MTZkcdBXbIpO7Wvpqg9xw/zzrYcaCB5p/dSo9z55h9cAB196YGBcWKlgG7HWF4eQd2Ew1/uwzzg5NweB0MBc=
X-Received: by 2002:a17:907:7e9f:b0:7ad:b389:1145 with SMTP id
 qb31-20020a1709077e9f00b007adb3891145mr37436412ejc.92.1667671167803; Sat, 05
 Nov 2022 10:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221105154203.273684-1-pkj@axis.com> <20221105154203.273684-2-pkj@axis.com>
In-Reply-To: <20221105154203.273684-2-pkj@axis.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Sat, 5 Nov 2022 07:59:17 -1000
Message-ID: <CAOSpxdZzGOPfcesAm0ykhcatZCMUwLUBjLudauD1J1Kod1UFFw@mail.gmail.com>
Subject: Re: [OE-core] [langdale][PATCH 2/2] externalsrc.bbclass: Remove a
 trailing slash from ${B}
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Nov 2022 17:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172754

I've already got these first two patches in stable/langdale-nut:

https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/langdale-nut

And your 3/3 seems to be identical to 2/3.  Am I missing something?

Steve

On Sat, Nov 5, 2022 at 5:42 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>
> The trailing slash in ${B} caused -fdebug-prefix-map=${B}=... to not
> match as intended, resulting in ${TMPDIR} ending up in files in
> ${PN}-dbg when externalsrc was in use, which in turn triggered buildpath
> QA warnings.
>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/classes/externalsrc.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/externalsrc.bbclass b/meta/classes/externalsrc.bbclass
> index 5905342589..75fb91bcb0 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -61,7 +61,7 @@ python () {
>          if externalsrcbuild:
>              d.setVar('B', externalsrcbuild)
>          else:
> -            d.setVar('B', '${WORKDIR}/${BPN}-${PV}/')
> +            d.setVar('B', '${WORKDIR}/${BPN}-${PV}')
>
>          local_srcuri = []
>          fetch = bb.fetch2.Fetch((d.getVar('SRC_URI') or '').split(), d)
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172748): https://lists.openembedded.org/g/openembedded-core/message/172748
> Mute This Topic: https://lists.openembedded.org/mt/94828874/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

