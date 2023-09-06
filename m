Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FEFEB8FB6
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 08:06:40 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.3557.1693987599890646113
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 01:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=aGQ8VUn+;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-500a8b2b73eso5279471e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 01:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693987598; x=1694592398; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sEixjcGVlJgmHko7HvnW/fipABL7uHCQgGKRLgVFmi4=;
        b=aGQ8VUn+nm+MhgaqOFQOKD7tQf6lpPk5nl1CJBzlZtFp9AcL0Tm8EPWRZhUssaczXo
         PIOo50else2KdFu+ru8xHdsP1F9/cdKCOuD2MkgyByYfuHY5i2PBLgTCQxyW/+9NF352
         GZ0diWWUBoHo+r9WXlpH92OlCgAu9jIHy0uKNTtN5JEyD8xRYIK9WK+PXPgRgnjIzf2W
         PmHasiP9vs50fwiGWST9hFEjBORrgk/XXX/f4neu/qCOgm+t9zcCFpKiTYyoszTUkfn1
         756WYimEsuwJtoW0G7adP5HMAC913X54qcp8OBwTUefckkvUaRygothecjoKjd0G2U7u
         8VKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693987598; x=1694592398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sEixjcGVlJgmHko7HvnW/fipABL7uHCQgGKRLgVFmi4=;
        b=iP1YlErisMc5gEYr0yBo3LcwT0DSpMRF00xE7LxLVa2kpXSQAghqUc5/f/MO5Q1Iv9
         2jZfqCyOvSjkonheC6FPuZce7ajy8dQ18iCGCah+KNy44Llx7/sce6TRtXUqnBqXx4W0
         4rM4iZLUzgsQJKDqwPTlURsN3QkW3BvZFYdlRG1Plqw72J5xlBm6pnT1Mb6C2pXpPfIG
         SXZ5S1/rrSXQDBxj8jjMjuMj+scHLzpAMhoPxVsvccorH7bwYjqAuAf6shtrqbEhyMW3
         q5NsRCzC10GeOqvYkIpP53yj/akmQpMKDeWS6np97QZvlnx4U6ZpkMaepjOd7zLAwZBE
         NyhQ==
X-Gm-Message-State: AOJu0YyzxezxeOIdumdvFa9SmOd5oIDPhkroUaQiDM2t+SEoH1ZGx9Jt
	d8IEl4KBTQ9FCUQQBYkZxz9CaH1zsyHfJyx9LjY=
X-Google-Smtp-Source: AGHT+IHXON9LoGKv3UzNuzo6EZD1mcAyN//y1qlQGSEu3uE/t1ppp0kp2g0+2JoDUHfWKCVXo2cLhDLvld79RVbcMxg=
X-Received: by 2002:a05:6512:2108:b0:500:9f7b:e6a6 with SMTP id
 q8-20020a056512210800b005009f7be6a6mr1475856lfr.45.1693987597632; Wed, 06 Sep
 2023 01:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <1693983363-16998-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1693983363-16998-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 6 Sep 2023 10:06:26 +0200
Message-ID: <CANNYZj9DjDPRx_ZQmFe+-c3U87y7vy4gjSiUqMJz-DqN8KOboQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] librepo: upgrade 1.15.2 -> 1.16.0
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 08:06:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187284

On Wed, 6 Sept 2023 at 08:56, wangmy <wangmy@fujitsu.com> wrote:
> 0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
> removed since it's included in 1.16.0

> -From 25113b34bc1aae377d7bf447e69528783e2c177e Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Fri, 30 Dec 2016 18:23:27 +0200
> -Subject: [PATCH] Set gpgme variables with pkg-config, not with cmake module
> - (which doesn't work properly)
> -
> -Upstream-Status: Inappropriate [gpgme upstream does not have pkg-config support and is not interested in it]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>

It is most definitely not included and thus cannot be removed, as seen here:

https://github.com/rpm-software-management/librepo/blob/master/CMakeLists.txt#L37C1-L41C18

IF (USE_GPGME)
    FIND_PACKAGE(Gpgme REQUIRED)
ELSE (USE_GPGME)
    PKG_CHECK_MODULES(RPM REQUIRED rpm>=4.18.0)
ENDIF (USE_GPGME)

We can *probably* remove the patch, but then gpgme dependency needs to
be removed as well from the recipe, and the reasoning in commit
message needs to explain that.

Alex

