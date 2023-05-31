Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36B6C77B73
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 22:03:53 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.124.1685570628893703482
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 15:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=SWUz47cL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f603ff9c02so1641255e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 15:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685570627; x=1688162627;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZqIy+Pihq7AMGJjVLSYPaaEvQ53P/Oskm7GFyDzJ/H4=;
        b=SWUz47cLAVfJRAwdauBWZf30kCGrr+FCbabiL5lCtinq5IMPNajl5vac4IdiSZE9Lk
         RrlvLU7umHPBrMDcACIYuyuwaT2IMG0hbww27HBsA70HHqoO14sNpxInm1kX9Nyl2nO6
         GBuEVP7ZNiMej4IZBMro1fQ68oKdBhj7VejuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685570627; x=1688162627;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZqIy+Pihq7AMGJjVLSYPaaEvQ53P/Oskm7GFyDzJ/H4=;
        b=dzg80pkhDuZx+3Ou/9FyEVJ7QTtsFX76QJJfMuUcAkO4J3cS/IS9xq6bLqNfgfnyLm
         mTFyl/bNQ+06b25NQGHqj7AzaAoBohjUNVPljZ23I/Jd1ReYJmiXbpxev8ll/Vp2oe7G
         iGkSSchM/dBaFRovF2gQ6h0FB/49DDUzRCpw1G0jFkfhiKq3EoMWPYQDot3t5dLf3mlW
         lKFK9yf0JNNIn/ZpO5V1v4s1b1TykngmG9T0Wr4tSoFWb3VylcZ0hlW438b9TiPtrlU+
         3cKm8fpYX53gmxNNl7LZKwaElmoyCAwhTkSroFOhZ49dWTr4vcufOsrP10RCDnS5qT3w
         2TEA==
X-Gm-Message-State: AC+VfDwgS6dBPN3niyELjWmzh2pEMmVo8r43bnAKc3v1YebUGn2RrT4O
	SSAhfyN5u/InTX0S5FX6tc+Gow==
X-Google-Smtp-Source: ACHHUZ6I76Y+aU5M5KTjiv6zD8QkaYSV31xE2L+GKE+2kC8eKCGAxzHccW2v++WUx6G3SO2fhFFs2Q==
X-Received: by 2002:a05:600c:1182:b0:3f6:f56:9ad with SMTP id i2-20020a05600c118200b003f60f5609admr419015wmf.13.1685570627219;
        Wed, 31 May 2023 15:03:47 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5363:779f:9df8:62e7? ([2001:8b0:aba:5f3c:5363:779f:9df8:62e7])
        by smtp.gmail.com with ESMTPSA id n10-20020a05600c294a00b003f6d564db48sm69537wmd.4.2023.05.31.15.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 15:03:46 -0700 (PDT)
Message-ID: <14b5ba3f7ba79aa1cfa5c50f8458596951adcfb1.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/9] kernel/linux-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 31 May 2023 23:03:45 +0100
In-Reply-To: <cover.1685558432.git.bruce.ashfield@gmail.com>
References: <cover.1685558432.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 22:03:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182038

Hi Bruce,

On Wed, 2023-05-31 at 14:48 -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> Richard,
>=20
> Here's my consolidated queue. I've had some of these in testing for quite
> a while, as I didn't want to send them right before release or before my
> vacation last week.
>=20
> Most are -stable updates to 6.1 and finally bumping the -dev recipe to
> show that we've been testing 6.4 for quite some time.
>=20
> The make-mod-scripts rmwork fix was discussed at lenght on the list, and
> has been tested by myself and people seeing the issues. But with all the
> races and issues we've seen in that area for years, I'll keep a close eye
> out for AB issues.
>=20
> I've factored things a bit around enabling PAHOLE, I don't expect it
> to cause issues since it isn't on by default .. but you never know with
> these sorts of changes.
>=20
> I also have a bump for the refernece BSPs (sent to the appropriate
> list shortly) and a documentation commit for the PAHOLE tweaks (also
> sent to that list shortly, once we agree on the this change).

Thanks for the updates!

I put these in for testing (along with some other changes) and there
was an issue, probably the same thing showing up but I've not dug into
it:

https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/7159
https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/7197
https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/6093/ste=
ps/11/logs/stdio

Cheers,

Richard

