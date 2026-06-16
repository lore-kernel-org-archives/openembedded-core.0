Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CBC5CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 20:52:21 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.937.1781643136415935938
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 13:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=uKyOJ02j;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490ac357c55so47540135e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 13:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781643134; x=1782247934; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hv+bsOoF0VJs84pl4IsyUrdsBsuFudjFb0Nf4REVJDw=;
        b=uKyOJ02jTgjVeHDJR4YeScJvBQTfA4tQGWdF47Jj9Flro2Q5z556KvKeZ8EKAQLUxi
         ZHT5KYLr7XfwPNVVrQpRpP/I1uURqb+KDn8L/oQf/4MU/qrQL3H8p+qNtTKlVOx/uqwP
         MUkZTVu9Ze4FDXHiAtPP9VPipTPDY5QPXzYI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781643134; x=1782247934;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hv+bsOoF0VJs84pl4IsyUrdsBsuFudjFb0Nf4REVJDw=;
        b=HvuY/iDz6UEkLv8c1XP0hui3SI+2byxrTpV/rgn4LDuOYu1AkJTXw3Zp9sISiZ5eI7
         Z4GT6JQ/jvxdMdrI/vUVvwHzdd4ettNEtr7x8PbHfdvSQLRiL2Y7hRwajBNPg7tzXqrN
         jqpJdRJTfM2DSQMPXZ8ydGEucblzeZ9jsYRWCKxsvBmq/2NGmcWdN88z9JncxhfQ8CCK
         YvVMmfiZZ/Bhsg2tPYFBqGgFVRflWYv8kd7VU37sOGIlLDb+IOWv8DoQk0e/iApMctmo
         OA/ntstwUZpelUn4UulKg/x+P5ajETb3JJQ4JcIf76CWnowpUywKPPUD/nI2JEsYRW/k
         zP3A==
X-Forwarded-Encrypted: i=1; AFNElJ82YTTrWYUVjwjvNIJYMLx+QCYDuwA4jp9V7GbNWmPFxf3ZGINr3vZPAtsikmfqWfQLiFn6Pgu1BELDcATjzYwprQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxmyVpUXHsNP/iVTRl7i9KuWYySvpUixKRz3lVlKK1sA1Jw6huu
	0El3akxVgxyf8qg1WZaOVjyHpkvXxelgUEBo74rUubdgGU9+LmIpLnPc9F83AeTeXM0=
X-Gm-Gg: Acq92OH+qQNqOgMwtvgia8mY1EJBa6pn4QuRzqCkfIwhjlocT5XMMU5HrmdX/JqeiGP
	ev6MMR1ZRWIwTx8i2voj8fovoWpQkavrQIlu8E8Vs+TBzqIw8k8uOMD8brxMpqTlDfxGLAxATX6
	Asp9V9CRrs7Rt9TVemn3gilSjheJbmlrOD/5O0gMjAc/1hzhYiI/GWDMdMzPJuVl8nSUSA7cdAL
	3dFQes+A+9WSNK9F57Z08Z1k9OsbA0ucqrjvpgfLxIFcNCziwQhDUUviSvI69K26sfsKCswJYiO
	0F2141p466mjb1EZghgkHsL4mCCZuQsVlsBCboc1nI2/HuxsWP8sibPqdF9N0PUa5AGyOzsK9lm
	OV200xBaa+Yi9gzVsod/uRmEnTQVu2f/xfUm1PsC4JwbkBSPP5GNYm5deKMxZUtism4JrWY60Hi
	CRRCCE3TSsJNL9vBk0zW3z1u4VKU7IUKkbVKNJhO0i3LmRYoCj/Cg3Yep9kbPDg86an643LVRSz
	p/bNfLoN9Fb4bwx
X-Received: by 2002:a05:600c:8b16:b0:490:ae52:499c with SMTP id 5b1f17b1804b1-492333ca24dmr19034665e9.21.1781643134553;
        Tue, 16 Jun 2026 13:52:14 -0700 (PDT)
Received: from localhost (2a01cb001331aa00fdf7edbba0bd5f9d.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fdf7:edbb:a0bd:5f9d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a8eb30sm80916725e9.10.2026.06.16.13.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 13:52:14 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 22:52:13 +0200
Message-Id: <DJARS4H3NJRW.3IYS5C7IXM00@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH] python3: CVE-2026-3087 not applicable
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260603105132.872256-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260603105132.872256-1-adarsh.jagadish.kamini@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 20:52:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238963

On Wed Jun 3, 2026 at 12:51 PM CEST, Adarsh Jagadish Kamini via lists.opene=
mbedded.org wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> CVE link: https://nvd.nist.gov/vuln/detail/CVE-2026-3087
>
> The CVE is only applicable to Windows OS
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---

Hello,

Thanks for the patch, but I preferred to go with the 3.14.5 upgrade,
which includes the fix.

Regards,

>  meta/recipes-devtools/python/python3_3.14.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3_3.14.4.bb b/meta/recipe=
s-devtools/python/python3_3.14.4.bb
> index 71f590f630..84cd770f3b 100644
> --- a/meta/recipes-devtools/python/python3_3.14.4.bb
> +++ b/meta/recipes-devtools/python/python3_3.14.4.bb
> @@ -48,6 +48,8 @@ UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)=
+).tar"
> =20
>  CVE_PRODUCT =3D "python:python python_software_foundation:python cpython=
"
> =20
> +CVE_STATUS[CVE-2026-3087] =3D "not-applicable-platform: Issue only appli=
es on Windows"
> +
>  PYTHON_MAJMIN =3D "3.14"
> =20
>  S =3D "${UNPACKDIR}/Python-${PV}"


--=20
Yoann Congal
Smile ECS


