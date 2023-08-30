Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E858DC6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 13:19:12 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.13690.1693401546715732489
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 06:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QGNrrKOu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-401da71b7c5so14084225e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 06:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693401545; x=1694006345; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4/ZMCkrCflT2/6CCl6a3DWU34CoJ6v0TQtYsfvTEr0=;
        b=QGNrrKOuP6aBhw1dKJpNSgz+ScCF2cUDh9oH3LaNCpJOflJakzg4TfJInH8IFwtbRB
         0BQnW9+cHp22s0hkLvlgrGSnXWtrLfs1jV3BoMxjeQr/CqdT+yVPozwJAytMhY/lucKF
         yrgYeI3eZVElzHVZpNEcCxzOWlBFjb3Z/ZCkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693401545; x=1694006345;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U4/ZMCkrCflT2/6CCl6a3DWU34CoJ6v0TQtYsfvTEr0=;
        b=B0cqFCg/n/ZPhJA5OuqleWcKneyah8rBHluxBJkgOzkTdmIxsu1qpnUMkcPzez5a8j
         shq17SjJrdBXnL4nw/8PRVNfjcPlYKqcbzTijxFt0H8Ob0uWaK9Dm3ezgtI5/gnxpHMi
         0Z4x41HPefov5hDo5AzJ2hASRrjKNd4Zm7XCM4k5W2WNiYwqX/+vGeDd4+x5fFmsMv46
         BUHI+INEevcvqkRg7DFfdNnB1mV3wqQWCUIhIMiyl6b/wyLZpE1mCCDpbZ4TtHXG79FG
         GMmVgc+71hV4kiJpT+lpyFy206rUijlD1vzgjouSIQEYmne9Bjcse7WbRCBlXJr+XkHP
         o3Xg==
X-Gm-Message-State: AOJu0YzKAxFhvDYwggluK55D/0nGtQknzeRHVz+ZsKLo6U7irdmMGBYZ
	XGh+u5hDBiIt5IYmG61h58QP0A==
X-Google-Smtp-Source: AGHT+IEs9VZf85ZERkzsLkzJMqFZo1JgLwN9MpaPXcQ/1e64SmgwK1rzfZG2+8mra1vQAtRRMrHPCw==
X-Received: by 2002:a7b:cd86:0:b0:3fe:dbb9:1d84 with SMTP id y6-20020a7bcd86000000b003fedbb91d84mr1846348wmj.0.1693401545009;
        Wed, 30 Aug 2023 06:19:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:15ec:a052:9304:60a5? ([2001:8b0:aba:5f3c:15ec:a052:9304:60a5])
        by smtp.gmail.com with ESMTPSA id f3-20020a7bc8c3000000b00401c595fcc7sm2299417wml.11.2023.08.30.06.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 06:19:04 -0700 (PDT)
Message-ID: <6965c5634e674335fcfc02e2540d5c2e0bd1caf3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] update_mandb: Point to correct /etc/passwd
 with man
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Eil=EDs?= 'pidge' =?ISO-8859-1?Q?N=ED_Fhlannag=E1in?=
	 <pidge@baylibre.com>, openembedded-core@lists.openembedded.org
Date: Wed, 30 Aug 2023 14:19:03 +0100
In-Reply-To: <20230830123912.2052665-1-pidge@baylibre.com>
References: <20230830123912.2052665-1-pidge@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 13:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186888

On Wed, 2023-08-30 at 12:39 +0000, Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=
=A1in wrote:
> [YOCTO #15023]
>=20
> In this instance (do_populate_sdk with api-documentation turned on),
> pseudo is going to end up finding the passwd/groups files in
> recipe-sysroot-native which is incorrect and does not have man. The=20
> solution here should be to ensure that pseudo points to the passwd/groups=
=20
> files in recipe-sysroot (which does have man:man).
>=20
> Signed-off-by: Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibr=
e.com>
> ---
>  scripts/postinst-intercepts/update_mandb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/postinst-intercepts/update_mandb b/scripts/postinst-=
intercepts/update_mandb
> index a061bb426a6..6bc073bfff5 100644
> --- a/scripts/postinst-intercepts/update_mandb
> +++ b/scripts/postinst-intercepts/update_mandb
> @@ -13,4 +13,4 @@ PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D $D${bin=
dir}/mandb --config-file $C
> =20
>  rm -f $CONFIG
> =20
> -chown -R man:man $D${localstatedir}/cache/man/
> +PSEUDO_PASSWD=3D$D chown -R man:man $D${localstatedir}/cache/man/

Is there a more general problem here? Wouldn't this issue apply to
other postinst scripts too?

Cheers,

Richard

