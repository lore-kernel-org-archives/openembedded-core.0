Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B97DEC6FA82
	for <webhook@archiver.kernel.org>; Sat,  3 Sep 2022 21:54:11 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.7714.1662242046165152999
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Sep 2022 14:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=I9FHbr9c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id az27so6611784wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Sep 2022 14:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date;
        bh=Gms1K2jXOBRhkEAkcwlDft+uCUVFi0/Q8TLHAEkg7Wk=;
        b=I9FHbr9cxp5DIzj7LzAU1HHZNppSnD0powo3xZlDAMxZ1MVsfR93oxZUgM2r0xiD/F
         GU3WbSrDju0b/kcDZsU258bZXTUUlxqp8WxkTMap0oTJw/Vg5cnY904n7MsFVuF430tN
         BPgJF5295fwxmroYzooL2C2Gn+xWo06rOp2o4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date;
        bh=Gms1K2jXOBRhkEAkcwlDft+uCUVFi0/Q8TLHAEkg7Wk=;
        b=DIbL8wM89OZomKAnBLeiyYEjOhnmTEkFmBh7ZG5VCZM4vC4d+hD8IRg2wNViXeSGsp
         fPv38iYY1nezEEA2EraycHCDrmn244mwcgwRmENBjn8kBfkVoHZx2aAWUqWWuRuz3N8h
         zBFGB7LbLARf4HONlJDNzvERTHKybb+T2DkU5DCiBYKmPAUAuCMFGtg/KarQULyZwYoX
         5N+3+eXhG4/tGq3Hw8VWNfEcg5+sXfe7oC/F6OoDsFdvfqrDpPy8zxGxpKpkoWVvkFtD
         0HPlXb8tLR8YgrtM35yXMdzqQeKAULdL+GGc9pFUzJ025FcehVIcjVahx1lIs9U/zK7G
         jlVQ==
X-Gm-Message-State: ACgBeo0PZYsHaw8iiM1sbRRtWOZkceLi2qvVeBLIGxTTb1637Mjj0L35
	Mth7ysO3EzprqvGI6n7lMccdTg==
X-Google-Smtp-Source: 
 AA6agR7ed6B7lqfvs38Lbo1YkFhytOhT8WJxG4B7YAXoltYCriHbQ/9T0L2KsxYeVPiqq0Qji9WinQ==
X-Received: by 2002:a05:6000:1f99:b0:226:e714:c7b2 with SMTP id
 bw25-20020a0560001f9900b00226e714c7b2mr12273380wrb.229.1662242044566;
        Sat, 03 Sep 2022 14:54:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:36b4:f352:d112:e6e?
 ([2001:8b0:aba:5f3c:36b4:f352:d112:e6e])
        by smtp.gmail.com with ESMTPSA id
 u18-20020a05600c19d200b003a5a5069107sm12676041wmq.24.2022.09.03.14.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Sep 2022 14:54:04 -0700 (PDT)
Message-ID: 
 <220679d0e3253221aae25368e6ea4583d55e883f.camel@linuxfoundation.org>
Subject: Re: [PATCH v2] core-image: Exclude openssh complementary packages
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Pavel Zhukov <pavel@zhukoff.net>,
	openembedded-core@lists.openembedded.org
Date: Sat, 03 Sep 2022 22:54:02 +0100
In-Reply-To: <20220828195405.8213-1-pavel@zhukoff.net>
References: <20220828195405.8213-1-pavel@zhukoff.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Sep 2022 21:54:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170271

On Sun, 2022-08-28 at 21:54 +0200, Pavel Zhukov wrote:
> Openssh (main) package may be marked for installation via complementary
> packages mechanism as a dependency of openssh-ptest
> and this causes conflict with dropbear [Yocto #14858] [1].
> Excluding openssh complementary packages if ssh-server-dropbear is in
> DISTRO_FEATURES fixes this issue.
> To install openssh complementary packages in the images with
> ssh-server-dropbear they may be added manually into the list because
> they will be excluded from the installation even if corresonding class
> (dev-pkg or dbg-pkgs) inherited.
>=20
> [1]
> Error:
>  Problem: problem with installed package dropbear-2020.81-r0.core2_64
>   - package dropbear-2020.81-r0.core2_64 conflicts with openssh provided =
by openssh-8.9p1-r0.core2_64
>   - package openssh-8.9p1-r0.core2_64 conflicts with dropbear provided by=
 dropbear-2020.81-r0.core2_64
>   - package openssh-ptest-8.9p1-r0.core2_64 requires openssh, but none of=
 the providers can be installed
>   - conflicting requests
> (try to add '--allowerasing' to command line to replace conflicting packa=
ges or '--skip-broken' to skip uninstallable packages)
>=20
> Signed-off-by: Pavel Zhukov <pavel@zhukoff.net>
> ---
>  meta/classes-recipe/core-image.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes-recipe/core-image.bbclass b/meta/classes-recipe=
/core-image.bbclass
> index 4b5f2c99c4b..fa38ae876d0 100644
> --- a/meta/classes-recipe/core-image.bbclass
> +++ b/meta/classes-recipe/core-image.bbclass
> @@ -78,5 +78,6 @@ CORE_IMAGE_BASE_INSTALL =3D '\
>  CORE_IMAGE_EXTRA_INSTALL ?=3D ""
> =20
>  IMAGE_INSTALL ?=3D "${CORE_IMAGE_BASE_INSTALL}"
> +PACKAGE_EXCLUDE_COMPLEMENTARY:append =3D "{@ openssh if 'ssh-server-drop=
bear' in d.getVar('IMAGE_FEATURES')}"

This doesn't seem to be correct syntax, e.g. no $ before {@ and I'm not
sure that is valid python?

Cheers,

Richard





