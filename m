Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFEAC433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 20:30:51 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web09.3504.1637785849929446476
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 12:30:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y6jqljL/;
 spf=pass (domain: gmail.com, ip: 209.85.222.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id 132so4598212qkj.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 12:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f3caiX91Aq2ji5kgApiUnRWuevnqoBOmZRqeDbl2WKg=;
        b=Y6jqljL/3Iu5xii9saUpm3IBur8VXO9KYLTJDE/olEl6OwKivYuisTdyAa6dFR+V7r
         A3PPuc8esjvAdoPgg/IxHJL7n1CKcub24CcglgGtl6JCSf1MCWruyOQaHVxppoWTuM00
         ao39bzenZkNlvpZhxvBkclDm6rzDYTUGZdUCLd1wdo/FTVW4uPH14pGfNCJucM3urs5+
         yspK8fXwv/gDBXHwHcmHZz8G/YkBs0y/NNREaMrBZ6j63j8/efVBKcXSxyMR++Tuugu0
         /jYNoyXTjRV8t9hgO3aMLkzv/T7BlQIhO++xGw23FxHLUeoUnXTSOSaE2O7BRcUfNZGE
         8oTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f3caiX91Aq2ji5kgApiUnRWuevnqoBOmZRqeDbl2WKg=;
        b=ErbY1Ey8YozVdIv9KsWfLyhLfGABF113sN58x1ITwYowN5b5TZDoOEEUQLlePdD57H
         crGtEhJO7pv5Gv/seQqsOmbw3XRhROoeT4soBZw6jTK/Vknmzue7HV3z7aEuSq9QSPra
         5No9IVpfLbLvlfVTMK7dgYReXtbQO1Pk6bEQPnjE1hfiEoScBmXwt1Bss0D+OYTUorj7
         1q50Punz1qq/4pz9LE0qbBzIaEI3V8lC6lBfnOUOKSEun51p1HIOnjPzX9xDVS0dgpXE
         WrrWmklSXtCgqgSSRo2LETEn+/iqVis6Xo6PYmS3gzYWM6mzespN4W1cphf5W3zxZ1c+
         rDIg==
X-Gm-Message-State: AOAM530oN6Y3zq7dgs72Fn5DuQ3++Ef5oh7LPEK4UejR9nVpTXLkLIC5
	LHn10vxmtIeWJYAu4+586i9TAfzhxiw47vlFZsc=
X-Google-Smtp-Source: 
 ABdhPJyTPBIxmxpTl6Um6WGwAjU1gub8f5TrztXrAxLO7bxOEZK7oU/Ms5rCRR3ilZFSz85bhd+beLlk+ONnLdZAKs0=
X-Received: by 2002:a37:747:: with SMTP id 68mr9243308qkh.227.1637785848460;
 Wed, 24 Nov 2021 12:30:48 -0800 (PST)
MIME-Version: 1.0
References: <20211124080828.530981-1-alex@linutronix.de>
 <20211124080828.530981-16-alex@linutronix.de>
In-Reply-To: <20211124080828.530981-16-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Nov 2021 12:30:22 -0800
Message-ID: 
 <CAMKF1sozMYfMSMS77dnQh8mwNOGP4ybVALBpVgBN82jOZZsh_g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 16/21] cmake: update 3.21.4 -> 3.22.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 20:30:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158743

This is breaking llvm/libcxx

https://errors.yoctoproject.org/Errors/Details/617887/

On Wed, Nov 24, 2021 at 12:08 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  .../cmake/{cmake-native_3.21.4.bb => cmake-native_3.22.0.bb}    | 0
>  meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
>  .../recipes-devtools/cmake/{cmake_3.21.4.bb => cmake_3.22.0.bb} | 0
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/cmake/{cmake-native_3.21.4.bb => cmake-native_3.22.0.bb} (100%)
>  rename meta/recipes-devtools/cmake/{cmake_3.21.4.bb => cmake_3.22.0.bb} (100%)
>
> diff --git a/meta/recipes-devtools/cmake/cmake-native_3.21.4.bb b/meta/recipes-devtools/cmake/cmake-native_3.22.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/cmake/cmake-native_3.21.4.bb
> rename to meta/recipes-devtools/cmake/cmake-native_3.22.0.bb
> diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
> index 8b1b0db30d..2cd8193d6f 100644
> --- a/meta/recipes-devtools/cmake/cmake.inc
> +++ b/meta/recipes-devtools/cmake/cmake.inc
> @@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
>             file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
>  "
>
> -SRC_URI[sha256sum] = "d9570a95c215f4c9886dd0f0564ca4ef8d18c30750f157238ea12669c2985978"
> +SRC_URI[sha256sum] = "998c7ba34778d2dfdb3df8a695469e24b11e2bfa21fbe41b361a3f45e1c9345e"
>
>  UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-devtools/cmake/cmake_3.21.4.bb b/meta/recipes-devtools/cmake/cmake_3.22.0.bb
> similarity index 100%
> rename from meta/recipes-devtools/cmake/cmake_3.21.4.bb
> rename to meta/recipes-devtools/cmake/cmake_3.22.0.bb
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158672): https://lists.openembedded.org/g/openembedded-core/message/158672
> Mute This Topic: https://lists.openembedded.org/mt/87277248/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

