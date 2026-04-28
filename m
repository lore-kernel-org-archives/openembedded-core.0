Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F6CFF886D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 14:02:14 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13802.1777384929989119902
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2026 07:02:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PgRCq3NU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so98561595e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 07:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777384928; x=1777989728; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Otcriz+PC17DwuT4u/qc9mnDVzx5F7maLLCxsASWeRY=;
        b=PgRCq3NUVbIWlLWBs9LBK4cIAxBHqi/IE1Nuu0yoMJ5rl0PWJNxHPesMzBHs9mhIdG
         y32xJYVP3wWPlDHDE3AQwULY7h2EdjYKhMMXHuxhKa6J2ZaaPFLkPyVu4NajdxNyKFK4
         7+6ki9UugIW1Y65k0wO7ogQDYPsnwfiLQJTVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777384928; x=1777989728;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Otcriz+PC17DwuT4u/qc9mnDVzx5F7maLLCxsASWeRY=;
        b=tL0MXqdUSImvMVjNT/fpekB0Lw/jktTY5ADkdOHPKKxtSYx2l06Z6aYXsuiLS6FA7t
         DP7H2HQWlWZznNgyxp5xga1rErVpFxiyIoh7Mf4/G0fvmKrZJcYUBKcPSWGRfNvaWekS
         82KFrq6P1cwjW10+cXDXpu7EgYJhG6tfbnZVbYw0TCfFILXVVMxKN8ezuJFjMqC7Jban
         mO5slvCA5cBuUSyxVWs6o894wQpsGEXsDkkaaQhptpzP4baJiFiCSkfIq+1ILlrgLuUr
         5iIJIHdiiCSrgentffIijS3ehVNALAmcZ+lgJr8HREYPydP4Wv1E/cM/qJ7qrNwZqWa5
         8cOw==
X-Forwarded-Encrypted: i=1; AFNElJ+W0yO/Gxb79Lz4ijYNrNcmQ2sStYgc+iT267t6LdRbb8spytHqM7sQHBeuZZPw1t2NaitaIL9SlgqdA3lKsAcmdw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YycvJkOHnVdnXwJPpSMTjiaL8Tj9NVY1RpbkDFMMUBNP1ryWjrs
	9BEI7WtIg+UNC8Dsr87Bu9SE2j2mTQfR+BQArIBoCratMT/gRMpHLmfSiSq5DRLgktU=
X-Gm-Gg: AeBDiesKEk6rHPVrue05+636x1Zz8lUIbrQsTMLUx7tKgXFwkjN7sJigwEavTwI+Jwv
	LTzL5OHLqPyu0HaRzZ9Lcei7dxBhvcU042GUkNIDYtt7+nJyTnTFB6eHfRrnLxhT/PFlZ8uFBF3
	0hEHPTXh0jD4FHa2XGKwVp2DRwrBhRvoJqCTBCos+OBH3RMOx/h3V95Mji9U9hkiIOmPF7m5eqE
	kmvjbv+FrjsW1kmflFKWbw3gLJPD6cAqx5k1BrXCnjWPXCK0KrpY7ZFRjoioHJXIhqelhgYm1Xm
	NdTpql2zPYGmM3yABY927GnbJZyWjDulnrSCdiI+oWigKXmQn0SMNBi1RTZvFh0n/p/DDjL6jjh
	AGGHpPVEfpfcU3HgUzkppr/4jTcrWGGJl8ZqP9FhTwIwqnP2s8mt6XN5tWZcWiDMJTC4sbrpJ6M
	sbr+C6fhgDybC22rSgiWABVGGJAaFhgcx9iO9DpoBQYy3Qm0VJaQEPtdR7qaPYVio3R27JtNzZt
	HFLKpW+7LgYUh+blMXWj19pBmo=
X-Received: by 2002:a05:600c:1d0a:b0:471:700:f281 with SMTP id 5b1f17b1804b1-48a77b2272cmr54433325e9.25.1777384927970;
        Tue, 28 Apr 2026 07:02:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d7fe:f02f:1ae8:3ae9? ([2001:8b0:aba:5f3c:d7fe:f02f:1ae8:3ae9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a77afa168sm58848685e9.7.2026.04.28.07.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 07:02:07 -0700 (PDT)
Message-ID: <229a76fb8726c0c1f2813e1fd006b937c22f9a97.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] pseudo: Specify the version in the recipe
 filename
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.kjellerstedt@axis.com, openembedded-core@lists.openembedded.org
Date: Tue, 28 Apr 2026 15:02:06 +0100
In-Reply-To: <20260426142850.2195902-1-pkj@axis.com>
References: <20260426142850.2195902-1-pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2026 14:02:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236065

On Sun, 2026-04-26 at 16:28 +0200, Peter Kjellerstedt via lists.openembedde=
d.org wrote:
> The last updates have been cut from tagged releases, and this allows for
> using versioned bbappends.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
> =C2=A0meta/recipes-devtools/pseudo/{pseudo_git.bb =3D> pseudo_1.9.5.bb} |=
 1 -
> =C2=A01 file changed, 1 deletion(-)
> =C2=A0rename meta/recipes-devtools/pseudo/{pseudo_git.bb =3D> pseudo_1.9.=
5.bb} (99%)
>=20
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-de=
vtools/pseudo/pseudo_1.9.5.bb
> similarity index 99%
> rename from meta/recipes-devtools/pseudo/pseudo_git.bb
> rename to meta/recipes-devtools/pseudo/pseudo_1.9.5.bb
> index 8c16aa7135..225d6c3f67 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_1.9.5.bb
> @@ -13,7 +13,6 @@ SRC_URI:append:class-nativesdk =3D " \
> =C2=A0SRC_URI[prebuilt.sha256sum] =3D "ed9f456856e9d86359f169f46a70ad7be4=
190d6040282b84c8d97b99072485aa"
> =C2=A0
> =C2=A0SRCREV =3D "0bad85523ff71f1a84cea5fdf72e7f560c4aeed4"
> -PV =3D "1.9.5"
> =C2=A0
> =C2=A0# largefile and 64bit time_t support adds these macros via compiler=
 flags globally
> =C2=A0# remove them for pseudo since pseudo intercepts some of the functi=
ons which will be

I have a slight preference not to do this for that recipe since we have
used pre-release versions of pseudo and this just makes it harder for
upgrade pre-testing too.

Cheers,

Richard

