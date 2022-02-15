Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDAB7C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Feb 2022 16:26:40 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.11680.1644942399545010007
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 08:26:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dZ0NR++9;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id fh9so18131985qvb.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Feb 2022 08:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lRePKaIcdZbfpEv4Zms2r8pYdGAqokpQSgLXmg34EGw=;
        b=dZ0NR++9l47sFT9apg9MkvEwhn6RaXomdtAX7AHTke5BxU++Q3+pNVSBbnVT5Gugre
         GH/WnnNQw1921AY+LMdVLQipXzfzMv9oUPlYhqM/8GhksWD9RFAWOt4XQI3+gcUTg+yV
         mopKirQAATwr/PE4jX7DzlwjF+E7MwwJmrPH/bjXXAcQIsu4Xj5S5+NnNxbw+oaMZrdM
         e+zbrUvk6LBiX0XRPiIlqzv369LVV5Wmj3ODv15RvvozO0nBnhtQHEMkWFL8JnclLzmW
         eGs3sCkBguuIC9kUp0nbQF8dKkF6hpiEdHBO3SyNK7vBx8wSKeBKNuuLXoBXKrXqiFyU
         IcEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lRePKaIcdZbfpEv4Zms2r8pYdGAqokpQSgLXmg34EGw=;
        b=cQqFmCiAMULItl/OR+FhL0g4rg2sReKT6//6ixdXYVYU/c7u3RETIUg8DGErewI5Eu
         0istTw87MlUTA5U2+wMscKm51l37MYkVhtFb+EDbjiixMlbqpph08TFoKZNGzy1bFF2E
         AqMCtoS4xIsdhOEDju5fycybpxsywqt6HhRdUbsGlf6lV/S1GnevQFjy3ClyhaPgIlMw
         9fK+EV1rQyjlrMlYjOOPSPUfEkiZGdzReXCdbTLDywmswsS2x1CH5YyCUR4LbH146yQE
         GUbXGA2FykQ/9gXVboYInyeTwGdTCw3Tey+y/kKPOYzA9nxJRojj7yjPI2voWic2vEsh
         gzuA==
X-Gm-Message-State: AOAM532vCxfa+eJonTCMgBonvlI5h8Fdd0DJlCeOwIj1NMCSyqfnd2OD
	K2M62abv5AC2BKjPnzbpOJiZw59lmHkyFQSY2J8=
X-Google-Smtp-Source: 
 ABdhPJyjZOrzLmUQan2eR2qjRntVSLXgPgV5ipus5my8ueT+V70KFH0MQSqs+NHdAHcpsBHIFBeu8IZJ9JoT8AkT9uY=
X-Received: by 2002:a05:6214:509a:: with SMTP id
 kk26mr3434895qvb.24.1644942398594;
 Tue, 15 Feb 2022 08:26:38 -0800 (PST)
MIME-Version: 1.0
References: 
 <AM9PR09MB464241300636B9ED5F4BFF23A8349@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB464241300636B9ED5F4BFF23A8349@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Feb 2022 08:26:12 -0800
Message-ID: 
 <CAMKF1soXpT8K3Nu41QZM__d6sbdrYGu5z41bq4L60kjzvOasnA@mail.gmail.com>
Subject: Re: [PATCH] gmp: fix EXTRA_OECONF for mipsarchr6
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Feb 2022 16:26:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161755

On Tue, Feb 15, 2022 at 4:41 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
>
> previously used mipsarchr6:append created an empty set for
> EXTRA_OECONF and then appended --disable-assembly
> while it should be just added to the existing var value.
> Without this patch gmp will be configured without
> --enable-cxx=detect for mipsarchr6 targets
>
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/recipes-support/gmp/gmp_6.2.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/gmp/gmp_6.2.1.bb b/meta/recipes-support/gmp/gmp_6.2.1.bb
> index e61582afdf..33f439eca9 100644
> --- a/meta/recipes-support/gmp/gmp_6.2.1.bb
> +++ b/meta/recipes-support/gmp/gmp_6.2.1.bb
> @@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "eae9326beb4158c386e39a356818031bd28f3124cf915f8c5b1dc4c7a3
>  acpaths = ""
>
>  EXTRA_OECONF += " --enable-cxx=detect"
> -EXTRA_OECONF:mipsarchr6:append = " --disable-assembly"
> +EXTRA_OECONF:append:mipsarchr6 = " --disable-assembly"

yes the keywords were wrongly arranged. Thanks for fixing it.

>
>  PACKAGES =+ "libgmpxx"
>  FILES:libgmpxx = "${libdir}/libgmpxx${SOLIBS}"
> --
> 2.25.1
>

