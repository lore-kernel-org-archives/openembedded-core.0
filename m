Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C35FC4332F
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 11:35:29 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.34893.1699875326473628893
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Nov 2023 03:35:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RjGbqDnE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4079ed65471so35627495e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 03:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699875325; x=1700480125; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHwZObYbTTqe5WvxmvTDYkBtVK2JT5xb5MscoV6hLwE=;
        b=RjGbqDnES+YpO/SvBo8LhXEUNolu/iOBAM37VlKw+lUXXbmhQET56PYQ2v4oMidqSf
         ZVLT2MM5rwC9gQIFneeveWLHAUcVPRK/IGHjKpoPrgDjFrtFIg7YL4TnQ3LwY4ciXD9V
         tUahld5MHJde6XJ/tGOkwzXAE6bvDoKLbscBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699875325; x=1700480125;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tHwZObYbTTqe5WvxmvTDYkBtVK2JT5xb5MscoV6hLwE=;
        b=A0/QCKWARpm07PZaJJ+AT2WtcJdbgVOrr3q+ohqJ8zKOAgr49Aw1T/QxhC4NeHQDS5
         wKBU4UYtMu9motEeYK3G/P/SKSqFZW/UouOjYKWSuk54JDNTcshGS4MNpszxEZL9T4ci
         gAr7hvSw2d5SrGzpisV2EvNmQAa7dIiHK51TGk8EAzF/3ABd+9BOgncYkx/zN2mHBo7R
         T9/9xaPukkKjLZaVR4w8s4uKuA0C4o1xih4DhDpSDJB/BjvZTpv4eJEws0d2WKcDrYae
         zP13x9t95JLhNrjIeEtZ2Z1YBZva2yTgiFBoDmjDQOPKqV+X3yK3F4VZChI7HdV/Sxa8
         +7mg==
X-Gm-Message-State: AOJu0Yy0KJpn3so9XPCo0W+TmZS+eDgiv9k7hOVArff6zGKHgLnlv2jj
	V356P0r56vBR8rz9H10SzhkIhg==
X-Google-Smtp-Source: AGHT+IFxUF5ANEMm2s8IlFRlkTvrchMdVjst8ZhbqymyOcPZLp1TRFzRMQDIfw+vJ67TQxLxyWAcYw==
X-Received: by 2002:a1c:790b:0:b0:409:7aa9:a903 with SMTP id l11-20020a1c790b000000b004097aa9a903mr5277838wme.19.1699875324742;
        Mon, 13 Nov 2023 03:35:24 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f440:7406:36f8:870a? ([2001:8b0:aba:5f3c:f440:7406:36f8:870a])
        by smtp.gmail.com with ESMTPSA id g5-20020a5d46c5000000b0032f7e832cabsm5208353wrs.90.2023.11.13.03.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 03:35:24 -0800 (PST)
Message-ID: <238464863e9bdea94b8773983a8e79df07c30607.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH] curl-native: add missing ca-certificates.crt
 file
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Piotr =?UTF-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 13 Nov 2023 11:35:23 +0000
In-Reply-To: <20231110193716.2198635-1-p.lobacz@welotec.com>
References: <20231110193716.2198635-1-p.lobacz@welotec.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Nov 2023 11:35:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190465

On Fri, 2023-11-10 at 20:37 +0100, Piotr =C5=81obacz wrote:
> By default curl is being configured with:
>=20
> --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt
>=20
> which causes an issue for native build, when calling
> curl-native command, as certificates file is missing.
>=20
> This commit fixes the issue.
>=20
> Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
> ---
>  meta/recipes-support/curl/curl_8.4.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-support/curl/curl_8.4.0.bb b/meta/recipes-suppo=
rt/curl/curl_8.4.0.bb
> index 5f97730bf4..165a116139 100644
> --- a/meta/recipes-support/curl/curl_8.4.0.bb
> +++ b/meta/recipes-support/curl/curl_8.4.0.bb
> @@ -130,7 +130,9 @@ PACKAGES =3D+ "lib${BPN}"
> =20
>  FILES:lib${BPN} =3D "${libdir}/lib*.so.*"
>  RRECOMMENDS:lib${BPN} +=3D "ca-certificates"
> +DEPENDS:append:class-native =3D " ca-certificates-native"
> =20
> +SYSROOT_DIRS:append =3D" /etc/ssl/certs"
>  FILES:${PN} +=3D "${datadir}/zsh"
> =20
>  inherit multilib_script

Adding the dependency I can understand but the SYSROOT_DIRS append
would need to be in the ca-certificates recipe to be of any use as I
understand it?

Also, wouldn't a +=3D instead of a append work for SYSROOT_DIRS?

Cheers,

Richard

