Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EFF5C5518F
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 17:00:19 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21266.1785862814994578433
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Aug 2026 10:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GvfkUVQY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so210465e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 10:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785862813; x=1786467613; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6w3O5kwyKPmVkQXnO/ABmqKzFug6zGhb+SBmuA+mhsc=;
        b=GvfkUVQYdhtOTusH7A7dqLt9BEVIY+JJmtwDv4pb7SpKeGAdWlKK0SIYIz+5Fgzm2d
         g7RnJk5Cu21ypwASn3XYSEAcK+ed9Aq0mxH0uEPgku2PHF32+eW0+y+psmaLE3NMXBQn
         +SqWICrveyfZG+a7uCdxV1JgGQdqG0Xu0ajqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785862813; x=1786467613;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6w3O5kwyKPmVkQXnO/ABmqKzFug6zGhb+SBmuA+mhsc=;
        b=WrmICPzPbcgBaGI0NqsyfaQV5dGUZkaVQ1XSLIu+ApPwWBHtAGvjAKtVwrs8j1PCMw
         j47fXAx9VyA5ruSjRXlI6YGTUKKS2bFe7HZGgEd+ey9D3vrl9cpNHUt9pLg7Mbjr9H27
         PA9XO7iTgPjFLj2zf3YZMsUPdLfXTDk/VBmY1fXrXtnrga2sz+cAq2Hcp+JCeF8HbDOY
         F0gLyHBP6Wh3Jiidq/wRTgzyq7ZTIYalvSR7lOlm9eR+sfu5FGeuin/83f+8On3Z4Nzo
         BWSVL3DWCh/wWYy9M0SYhtqZZjRzRsLaMOMConWhS2NHhkDPF9v1+M9scx1yeaC8JmIv
         Os3g==
X-Gm-Message-State: AOJu0YxXJ6LtmJVtUN9XFqRFyEZC3LN5jhvNY+M/F5vEAGIsrYVnUyvh
	PeyiNRdSqYh2xYQM92XgPpkOIwiTF4dZUFxEPJTaB+Eyr4FnBmnQB+AP8urr1sL/dfRBOZTJOp9
	Mf4DU5gg=
X-Gm-Gg: AR+sD11jidq24ta8VXfbYxnjWwlPyoedyoDRB1GYp9DKmAeCp1wurshtFVvkVkyoS7j
	fcy0r3uronr7xra1ObcGqJ3JtsY0g/Lwf+mis0T+9huyFgNE5qGfGfNee+5jts2jieeUHOVtWpp
	YIbaJisTtECgQUdHgEVQjfxXcBxOMkHBaNLsaB859jE+8Pcddnebx1Ym0Et4I5mlAH9E/vAqfSc
	D95i8NdB1LcWBZmS8f73adBFtMPCGvg3JkBAibG/4sEXPS8kwOepQXDPhw5D7DFcGRcpify+IVa
	8AzVr6kvp14VfTCJN3JPAQmltmV9Lc33W/LOeDzzXwQuSbbDje5Z8oKkV4yJavQTZ6pFfr1w3qZ
	KELJIj8HNypQzAsgeX2VnWg1Qr613eJNtF3R+PqC39FS6pNZ7P2lV3UboG7ND402x6R49wMWIMi
	ZlYkJeY8njSy1469ZlXXIQ8N8MBwk4EYWTkm+sVobMLYa1JE6YvBNNVhbegOs+4kB+xArUB6Eul
	I9d9W3KlcI9OUD87Yk5OfpWLuqMa+VdVrQVvIeANqtOMfgm2if4lg==
X-Received: by 2002:a05:600c:8b33:b0:495:779a:ed33 with SMTP id 5b1f17b1804b1-4980c66c798mr404230225e9.7.1785862812750;
        Tue, 04 Aug 2026 10:00:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ce15:a763:9e16:7bb4? ([2001:8b0:aba:5f3c:ce15:a763:9e16:7bb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febfda0cbsm1247132f8f.6.2026.08.04.10.00.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 10:00:11 -0700 (PDT)
Message-ID: <722a9a0fbdf2124104d536d9c7e6ee1056ff0f18.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/9] libtool: 2.5.4 -> 2.6.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Date: Tue, 04 Aug 2026 18:00:10 +0100
In-Reply-To: <18C899AE0F118A3D.1990914@lists.openembedded.org>
References: <20260804122335.3094065-1-richard.purdie@linuxfoundation.org>
	 <18C899AE0F118A3D.1990914@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Aug 2026 17:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242790

On Tue, 2026-08-04 at 13:23 +0100, Richard Purdie via lists.openembedded.or=
g wrote:
> Drop one patch applied upstream, refresh another.
> Switch to xz compressed source tarball.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> =C2=A0.../{libtool-2.5.4.inc =3D> libtool-2.6.2.inc}=C2=A0 |=C2=A0 5 +--
> =C2=A0...-cross_2.5.4.bb =3D> libtool-cross_2.6.2.bb} |=C2=A0 0
> =C2=A0...ative_2.5.4.bb =3D> libtool-native_2.6.2.bb} |=C2=A0 0
> =C2=A0...3-libtool-remove-help2man-dependency.patch | 17 ++++----
> =C2=A0...r-static-libs-for-internal-compiler-.patch | 39 ----------------=
---
> =C2=A0.../{libtool_2.5.4.bb =3D> libtool_2.6.2.bb}=C2=A0=C2=A0=C2=A0 |=C2=
=A0 0
> =C2=A0...ol_2.5.4.bb =3D> nativesdk-libtool_2.6.2.bb} |=C2=A0 0
> =C2=A07 files changed, 10 insertions(+), 51 deletions(-)
> =C2=A0rename meta/recipes-devtools/libtool/{libtool-2.5.4.inc =3D> libtoo=
l-2.6.2.inc} (85%)
> =C2=A0rename meta/recipes-devtools/libtool/{libtool-cross_2.5.4.bb =3D> l=
ibtool-cross_2.6.2.bb} (100%)
> =C2=A0rename meta/recipes-devtools/libtool/{libtool-native_2.5.4.bb =3D> =
libtool-native_2.6.2.bb} (100%)
> =C2=A0delete mode 100644 meta/recipes-devtools/libtool/libtool/0005-libto=
ol-Check-for-static-libs-for-internal-compiler-.patch
> =C2=A0rename meta/recipes-devtools/libtool/{libtool_2.5.4.bb =3D> libtool=
_2.6.2.bb} (100%)
> =C2=A0rename meta/recipes-devtools/libtool/{nativesdk-libtool_2.5.4.bb =
=3D> nativesdk-libtool_2.6.2.bb} (100%)

This breaks libunwind on qemuriscv64:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/2034

Cheers,

Richard

