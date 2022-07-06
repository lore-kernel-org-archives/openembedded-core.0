Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CA2C43334
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 16:50:54 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.8612.1657126243094171723
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 09:50:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=p2fKdb7E;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.45,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f45.google.com with SMTP id d2so28171289ejy.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 09:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZX35dwdxNibOulsL8twRH3L6ludiHGS7dKv/Phs8AG4=;
        b=p2fKdb7EFAAYxFxOnSzokZxsUahhnhtt4H7EvJ/4nWR7keF/jX7aXxP6OB/NaO8fzu
         UPAsqtfqLKRKAyRV4ybwSP61dAkvO3j6tzb95Q8Y1SvZh97sikAJGTAcRdDRZ2NgL5K0
         9GD75Y2s67tXAMQeRDc40gFQgDpFGZJWfrYaNoa3S2Rh392cOFDcXDSNj2eu15mY1fi0
         yWG+PJGtiivM2RCADDa0PfVkbb9e25RA6P7Cn1odyY7xJit5n+pXm1Gc1vNTSOhT/nEa
         GSxIVOOkpC9CU9bzq/XvH/EkBW/0y6gOfvWy3VNssZRBQXxP6QQpy1mMZ2ilJ9My558k
         FYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZX35dwdxNibOulsL8twRH3L6ludiHGS7dKv/Phs8AG4=;
        b=ZAdfozNJ7eZSGzupKkzPPsKliRxh3IG6BBTFT99w+iDnAfeLMvEMFtF5KtzOcvOSdA
         uhPaTUm4SMI+59O4+0JX2knsw7Eke5wqmUPQNQ7qTDkiWSXpPy9ahgqOUFP7qOlt4G/G
         UYzdvMjRMnGSCsXShzat+mreDuhnsb/HLicQSeR1rcWyOvhpVFTBAJDlGd9v1hHsk7PQ
         nzHMb3bgGQtMjXO5kVunA0A6mqPeO/1/ETMkcFv/WPILI4Cu+rufC6NU69CXryAG/5Mu
         awsOPRnpRyYkq9k6SExBmR0gfqB1FVDY91WZ2efyijrLE4eH3yAw3SSPjr+/7o8Sy34y
         cplA==
X-Gm-Message-State: AJIora+BPJa0N4LYTUZVZR5CQoBdGT9SpdxaVRNQzIsNU7/C/UoTnAVT
	8vL0w7kjA+d6gjU/JpcCFXfA6jzOoyDy/+uTxepfc/1wfKKSk1HX
X-Google-Smtp-Source: 
 AGRyM1s1lz0GyMUzc4RDXF9n+ZaWXx37/YSzi+1sadC+U1Aj+ZRFv1B1KvFFcxRYsog0WE/SQGcszCsQr7qVJUoBvsE=
X-Received: by 2002:a17:907:6da2:b0:726:3ebd:9c9a with SMTP id
 sb34-20020a1709076da200b007263ebd9c9amr40545004ejc.628.1657126241335; Wed, 06
 Jul 2022 09:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220706022720.1410652-1-mingli.yu@windriver.com>
In-Reply-To: <20220706022720.1410652-1-mingli.yu@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 6 Jul 2022 06:50:29 -1000
Message-ID: 
 <CAOSpxdbeRrd44FiGgUqeA58yqx-OoYmKq9rMeAQki4NMqXK+-w@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] vim: 8.2.5083 -> 9.0.0005
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 16:50:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167738

This patch is already in the set currently out for review:

https://lists.openembedded.org/g/openembedded-core/message/167569

I'll be sending out the pull request later today, so it should appear
in kirkstone in the next day or so.

Steve

On Tue, Jul 5, 2022 at 4:27 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> The license checksum changed due to a major version change in the referenced file.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 89f34d8aa4f4572d048dbb732ca4c83d443157fb)
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../vim/{vim-tiny_8.2.bb => vim-tiny_9.0.bb}                | 0
>  meta/recipes-support/vim/vim.inc                            | 6 +++---
>  meta/recipes-support/vim/{vim_8.2.bb => vim_9.0.bb}         | 0
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-support/vim/{vim-tiny_8.2.bb => vim-tiny_9.0.bb} (100%)
>  rename meta/recipes-support/vim/{vim_8.2.bb => vim_9.0.bb} (100%)
>
> diff --git a/meta/recipes-support/vim/vim-tiny_8.2.bb b/meta/recipes-support/vim/vim-tiny_9.0.bb
> similarity index 100%
> rename from meta/recipes-support/vim/vim-tiny_8.2.bb
> rename to meta/recipes-support/vim/vim-tiny_9.0.bb
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
> index 06707dbe11..b85f34d6c8 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -11,7 +11,7 @@ RSUGGESTS:${PN} = "diffutils"
>
>  LICENSE = "Vim"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=6b30ea4fa660c483b619924bc709ef99 \
> -                    file://runtime/doc/uganda.txt;md5=daf48235bb824c77fe8ae88d5f575f74"
> +                    file://runtime/doc/uganda.txt;md5=001ef779f422a0e9106d428c84495b4d"
>
>  SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
>             file://disable_acl_header_check.patch \
> @@ -21,8 +21,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
>             file://racefix.patch \
>             "
>
> -PV .= ".5083"
> -SRCREV = "db77c49401145d76441fbb3d22a1d7d987681c13"
> +PV .= ".0005"
> +SRCREV = "040674129f3382822eeb7b590380efa5228124a8"
>
>  # Remove when 8.3 is out
>  UPSTREAM_VERSION_UNKNOWN = "1"
> diff --git a/meta/recipes-support/vim/vim_8.2.bb b/meta/recipes-support/vim/vim_9.0.bb
> similarity index 100%
> rename from meta/recipes-support/vim/vim_8.2.bb
> rename to meta/recipes-support/vim/vim_9.0.bb
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167685): https://lists.openembedded.org/g/openembedded-core/message/167685
> Mute This Topic: https://lists.openembedded.org/mt/92199399/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

