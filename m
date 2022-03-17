Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E12C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 15:22:29 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.11682.1647530547301581170
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 08:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=V+NmwwkP;
 spf=pass (domain: burtonini.com, ip: 209.85.128.50,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f50.google.com with SMTP id
 m42-20020a05600c3b2a00b00382ab337e14so5133937wms.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 08:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XEeTCmGVQ0fri2zUgthn/C3XqtaniHY+q4X5/P3e5yY=;
        b=V+NmwwkPu62DOO7f0FFM3PimO6rxdpOhDwnzITJbk+YSe260+wR5jx+OZSfu53UhDY
         sQxsA+EPKTFUQ5uwHzpZV5OrhtWyw0gPB9FAh9fA0OGChvCJLFlU4CnSKCAP3YNzGzPD
         uHKTxRg1T4zaLQWCwreNaF9N+O8H6oSti6xMRM68JaGxtF8AnOrNHPosh3DV8oS1Beyd
         RbMzGb09vtqzakqLAvWHB6jPzaHH0XaJ4UTCE5KyITTu5M/q3L1/zKpVeKHYxKQCfY0Y
         nI/nOpgaS3vaOqPakARWc1S0qFSNHyRcNX5SXVdhZWLpmt4qN0FNGNRqJ6hFS9ZGJKCr
         JiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XEeTCmGVQ0fri2zUgthn/C3XqtaniHY+q4X5/P3e5yY=;
        b=xTItfNpSAXT+SjnuGk9G38I8kELHGB5keE04pNvYQkk06HtNxn0i242I0W5BWr8T+a
         DVDQ5fIPNg+DItTURR13Qkjesyw7hSGExfhCRQw1p7thJZ8z5VZ3yFeBoRDxz6EO+eAX
         8umEL2fZgqB/FcBG7TpeLdkD8t4IZm6kd0urU5ddaza4FHfftMNnreYYm45r0YS8ybaI
         K/78laAx/kPQvyT3JQsrWggijOS9Bigzb6uaeXfQQM1Yh5lcPSJ7gw503cAKvBFC3fGP
         ZdlSbzoyioHx2RQ82672/Wm85J728GMYHXxJ3v/JL8sj3W0l4tRs0rZn9leEf0U0KgP0
         t7Ng==
X-Gm-Message-State: AOAM53176ITDpDtGEsYV9DRYu9NYeudQhbZTZ/BcXxf7gRGUJ0zNRpud
	I0ZXez97pH0L5PUcXQVQm23yV1kmkENspkkk1HTdfw==
X-Google-Smtp-Source: 
 ABdhPJxVt7i0PNZOfuLfQW2wLSULKPcbTSaNtajhkpiZiAwz6h4OJGPnfvGyrDrSyxKEaCqx61s69DMWte5EGH2ku7U=
X-Received: by 2002:a05:600c:2219:b0:389:bc8b:ac48 with SMTP id
 z25-20020a05600c221900b00389bc8bac48mr11722222wml.14.1647530545618; Thu, 17
 Mar 2022 08:22:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220316222526.264261-1-raj.khem@gmail.com>
In-Reply-To: <20220316222526.264261-1-raj.khem@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 17 Mar 2022 15:22:14 +0000
Message-ID: 
 <CAAnfSTvpWwfUKUo7AHAuN_DdPZ2Qus88HG5rqvz6Et8_ZyabiQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-cryptography: Upgrade to 36.0.2
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 15:22:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163420

Note that python3-cryptography and -cryptography-vectors *need* to be
updated in lockstep:

FAIL: tests/test_utils.py::test_vector_version
    def test_vector_version():
>       assert cryptography.__version__ == cryptography_vectors.__version__
E       AssertionError: assert '36.0.2' == '36.0.1'

I'll send a corresponding upgrade shortly.

Ross

On Wed, 16 Mar 2022 at 22:25, Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...-cryptography_36.0.1.bb => python3-cryptography_36.0.2.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/python/{python3-cryptography_36.0.1.bb => python3-cryptography_36.0.2.bb} (96%)
>
> diff --git a/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
> similarity index 96%
> rename from meta/recipes-devtools/python/python3-cryptography_36.0.1.bb
> rename to meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
> index e33eaa50834..940df60d441 100644
> --- a/meta/recipes-devtools/python/python3-cryptography_36.0.1.bb
> +++ b/meta/recipes-devtools/python/python3-cryptography_36.0.2.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bf405a8056a6647e7d077b0e7bc36aba \
>                     "
>  LDSHARED += "-pthread"
>
> -SRC_URI[sha256sum] = "53e5c1dc3d7a953de055d77bef2ff607ceef7a2aac0353b5d630ab67f7423638"
> +SRC_URI[sha256sum] = "70f8f4f7bb2ac9f340655cbac89d68c527af5bb4387522a8413e841e3e6628c9"
>
>  SRC_URI += " \
>      file://run-ptest \
> @@ -42,7 +42,7 @@ SRC_URI += " \
>      crate://crates.io/indoc/0.3.6 \
>      crate://crates.io/instant/0.1.12 \
>      crate://crates.io/lazy_static/1.4.0 \
> -    crate://crates.io/libc/0.2.112 \
> +    crate://crates.io/libc/0.2.120 \
>      crate://crates.io/lock_api/0.4.5 \
>      crate://crates.io/num-integer/0.1.44 \
>      crate://crates.io/num-traits/0.2.14 \
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163362): https://lists.openembedded.org/g/openembedded-core/message/163362
> Mute This Topic: https://lists.openembedded.org/mt/89833574/1676615
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

