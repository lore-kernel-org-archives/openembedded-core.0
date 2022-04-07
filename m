Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2C1C38A05
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:09 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.3049.1649360638788073192
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 12:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=b0mpdn53;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id t19so8997621qtc.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 12:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kGyJu8pawoj5am9qkfL5EJYqxx5VsI4i5uei3v2aZ/Q=;
        b=b0mpdn53LJm6TFYA6by4WTK7SE7kNARl2M0J7+J70Y+FewpsLTOc7abf06+LvTz1uz
         Y5FsUua7vLydpnjmf2f3BspCv6rr84iiK3QoqL7XdFkj6DG7/Yo9ZHowFfSZ1KRqemt6
         fnpqGGIN2y+0VvsQG34XAKlRGMYi5Daf7aTxpyFeA4J5nxodpK6gWT8mZDFg9p+ZHv/j
         MMqt49KpU1VaabFnJWrsim1K2qhB+jzsmuFSt7JgsEdGOjXArBRFDWGbUNjUF4PRhTRn
         3E1UYU7mns3ay0FJqV4ST1MfLXQuNsFrpukFI6iHuB082cp8QBq/atDFObtJJF2I/BCP
         tFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kGyJu8pawoj5am9qkfL5EJYqxx5VsI4i5uei3v2aZ/Q=;
        b=e10ge/YkhvUn+01y2m8LvAZti313dYaCA81uh0JUnUEF44ayT7ZfIFgsDUL/KXeS0j
         nJlMalx4tnhKsBucIAVJhQvjbw4LWeTajKuZ3+SlXi8obpXw5zcQuO3PRVOrRX0kyjf4
         8aKOLBDs7p7Ys3waS1LbxIxHKRMqtoaU7P3V8TIUhJJuF2fLUoD6U1i0Iyl9/BAc47bi
         NVKOVqw+sF7V4gAAuxc9P78aIipY0yKNu30ETXOq9uRtPRWKSGLDdG+pc9BqR9g6ZjLg
         RoFhB/xMzbtgIaTHJAkGkU0JMcZc6ypxUoKw9DMBrAess7u7c2WgUAcjB/AhhmifxqQE
         JM4w==
X-Gm-Message-State: AOAM532Q2JYQRvTHAtETyOcmfQed0rtycFC7tnq7f4hPFWpjXj/5h5yE
	+EpAfL7QwA4WCwHtDguD7PzvkYRWQAWZV99pkNQ=
X-Google-Smtp-Source: 
 ABdhPJz6ag5EcTaQGZK38c6Frlo3/ZLSrlxPPIluDM+Ym5x7TtTWbhPxANlEYFNhPhcNKGF6Q24K9j0O055ZS0a0xvc=
X-Received: by 2002:ac8:5842:0:b0:2e1:aa10:e7cd with SMTP id
 h2-20020ac85842000000b002e1aa10e7cdmr13444782qth.330.1649360637885; Thu, 07
 Apr 2022 12:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220407170029.3500874-1-alex@linutronix.de>
 <20220407170029.3500874-17-alex@linutronix.de>
In-Reply-To: <20220407170029.3500874-17-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Apr 2022 15:43:32 -0400
Message-ID: 
 <CAMKF1sqJLvgJh__jq2biOrkm_M6zw4ibkxP7u1s1rZPEbyLa3Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 17/17] python3-typing-extensions: upgrade
 3.10.0.0 -> 4.1.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164135

On Thu, Apr 7, 2022 at 1:01 PM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...ensions_3.10.0.0.bb => python3-typing-extensions_4.1.1.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-typing-extensions_3.10.0.0.bb => python3-typing-extensions_4.1.1.bb} (73%)
>
> diff --git a/meta/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb b/meta/recipes-devtools/python/python3-typing-extensions_4.1.1.bb
> similarity index 73%
> rename from meta/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb
> rename to meta/recipes-devtools/python/python3-typing-extensions_4.1.1.bb
> index a8e83fc824..6c80a8b237 100644
> --- a/meta/recipes-devtools/python/python3-typing-extensions_3.10.0.0.bb
> +++ b/meta/recipes-devtools/python/python3-typing-extensions_4.1.1.bb
> @@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f"
>  # The name on PyPi is slightly different.
>  PYPI_PACKAGE = "typing_extensions"
>
> -SRC_URI[sha256sum] = "50b6f157849174217d0656f99dc82fe932884fb250826c18350e159ec6cdf342"
> +SRC_URI[sha256sum] = "1a9462dcc3347a79b1f1c0271fbe79e844580bb598bafa1ed208b94da3cdcd42"
>
> -inherit pypi setuptools3
> +inherit pypi python_flit_core

has this module made a move to use flit instead of setuptools ? if so,
perhaps adding that info in commit might be good.

>
>  BBCLASSEXTEND = "native nativesdk"
>
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164133): https://lists.openembedded.org/g/openembedded-core/message/164133
> Mute This Topic: https://lists.openembedded.org/mt/90317738/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

