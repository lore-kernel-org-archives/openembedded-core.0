Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B265C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 14:29:55 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70949.1783002591700334119
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 07:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=e7pAmWed;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so13096945e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 07:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783002590; x=1783607390; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ieda1IqWdYyA9xwAfFNhbur3hnv5m4MXttAw02N6D4E=;
        b=e7pAmWedNl7BkPWZsGAGLBrSM9ZsBA3GjtKLG5BDFuXd3ZD6MMiPyvc2eKUhQXLK4G
         XVJEZaFYMwzIxANQVXNDNu0NdgrJ/HgXcbF8LlBthYo2xHwz7Ws4/HXctxATixsc7RdF
         Ajm/czbv/sxr1erLiGQWhJAe/DrQnEIsr9k5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783002590; x=1783607390;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ieda1IqWdYyA9xwAfFNhbur3hnv5m4MXttAw02N6D4E=;
        b=qqOw4l3aCPTKpe92nqRDPJxASr/ROAWHMMNYh80YovXK0RLm8ZxUUp0Rv5BO3HVHV7
         Hu1SxV9cG3g6fCF/2Or9Jhdh+RuzwPnTYNr8XIB9LGdfb3ZQ+2nYSh66YJV5X+Gy9kg/
         0/1NPIhpyYsCWi31m38gdKChAFYexP5F4vTo3JthoLd9OiQ8ydqSWU986QZ0WBfNEd6y
         osHj3bzq+2GRLACwvunt1y4hPKK9TCxMemmlPfvSkIRR0T1jDbN479cGsUSkulzisHTA
         WIrWrbU62+i0UVzCe8Me9ugHSGRyw0/2Oj+iguFirgh5ToACPHmDtdcRRKKaUU+rFeFv
         sjtg==
X-Forwarded-Encrypted: i=1; AFNElJ+foSrPhbtfwJlcb1qt3Q6nB+qciIG93bDIHnbQ2swcr/oSPOkLaefx7megKUDSJjdT5d4YtVvonrAT6ymkxs+hpw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwcOdqrpMD3XVpaIw1+EnmNVUDfysegPczPw0++i+BsfzUM4yGF
	fmfqsn+Adl74hD58w7XVs5HF9Fe/wNfZSPXhxHMIBoRPjhgTzvnZEQDQseUl8bKtd4Y+BecrxLP
	izrfYcZI=
X-Gm-Gg: AfdE7ckBz11CAt6t4qwrTzoR3HVt68nxC2LI7mCHCQNjD8R3UcbSrzinvd5tdS/zwmY
	QOBKT3Akn5fWXznvpslLXsHjcNcRvQhJLFijW/jf3xae3mMezYRR1zJ4MpvTMlrBzzBGlkD5+Oq
	mxHyA2Z0//BvyJQV9a2MnK90cwy7LEGVxTKUwKz7vAQJN+rub77bvR8tQIGJjfIZK+tdN53IJm4
	KhgF6CB8waFgKVwxfa+nSe/rfWreAXU2dFB4USBy2sNUlppKgJ8jgr/MosnzznPGgJz8HAx1Ygr
	aRx1I7LAmGXObBuNB4RpPJdXMDTQJNzGA/e0rdKErWaF1D5FXro8km5LYkYAEhD9hSBz00LtMKs
	rSKJKvhbMA4NKSF/oQOPjtaCgRzJlRayFYZUAwfhG9LJD/SdjNBy32ZsDkaHJVuyJt7oymnfeY1
	FtjeNRZNSS+m51l3+pmqewmfMF0tPt1ZV015SjMJfxbJWCFrgokLzpVQZULdRw8enNNl6p/Ri/Y
	glxBg==
X-Received: by 2002:a05:600d:c:b0:493:b8cd:2555 with SMTP id 5b1f17b1804b1-493c2b3a717mr81799305e9.3.1783002589866;
        Thu, 02 Jul 2026 07:29:49 -0700 (PDT)
Received: from localhost (2a01cb001331aa00c56cc01f8c3c1c95.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:c56c:c01f:8c3c:1c95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be493c24sm111463305e9.0.2026.07.02.07.29.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 07:29:49 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 16:29:49 +0200
Message-Id: <DJO5O1O01FQ5.3SGPT3FF1635A@smile.fr>
Subject: Re: [OE-core] [wrynose] [PATCH] apt: mark CVE-2011-3374 as
 not-applicable-config
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <adongare@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260629124712.1159-1-adongare@cisco.com>
In-Reply-To: <20260629124712.1159-1-adongare@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 14:29:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240057

On Mon Jun 29, 2026 at 2:47 PM CEST, Anil Dongare -X (adongare - E INFOCHIP=
S PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Anil Dongare <adongare@cisco.com>
>
> Details: https://security-tracker.debian.org/tracker/CVE-2011-3374
>
> CVE-2011-3374 describes a design flaw in the legacy apt-key trust model.
>
> This does not apply to the current apt recipe in OE-Core because it uses
> Debian vendor configuration. Debian security tracker notes this issue is =
not
> exploitable in Debian since no keyring URI is defined for the apt-key
> net-update path.
>
> Mark this CVE as not-applicable-config for the recipe. This is a
> configuration-based status, not a fixed-version status.
>
> Signed-off-by: Anil Dongare <adongare@cisco.com>
> ---
>  meta/recipes-devtools/apt/apt_3.0.3.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/apt/apt_3.0.3.bb b/meta/recipes-devtoo=
ls/apt/apt_3.0.3.bb
> index 08b6bac2e4..03da3fbcf1 100644
> --- a/meta/recipes-devtools/apt/apt_3.0.3.bb
> +++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
> @@ -34,6 +34,10 @@ UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/a/apt/"
>  # to express 'divisible by 4 plus 2' in regex (that I know of), let's ha=
rdcode a few.
>  UPSTREAM_CHECK_REGEX =3D "[^\d\.](?P<pver>((2\.2)|(2\.6)|(3\.0)|(3\.4)|(=
3\.8)|(4\.2))(\.\d+)+)\.tar"
> =20
> +# Not applicable: this OE-Core apt recipe uses Debian vendor configurati=
on,
> +# which does not define a keyring URI for the apt-key net-update path.
> +CVE_STATUS[CVE-2011-3374] =3D "not-applicable-config: OE-Core apt uses D=
ebian vendor configuration, which defines no keyring URI for the apt-key ne=
t-update path"
> +
>  inherit cmake perlnative bash-completion useradd
> =20
>  # User is added to allow apt to drop privs, will runtime warn without

Hello,

I had comments for the same patch on master:
https://lore.kernel.org/openembedded-core/DJO5LWEY6LIE.1FJOPKM3IY664@smile.=
fr/T/#mfee83a7c120b16ab7efedc871697001fa2156258

Please get the updated patch to merge on master first, and then, send
the backport requests for stables.

Regards,
--=20
Yoann Congal
Smile ECS


