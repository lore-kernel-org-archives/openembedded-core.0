Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB45C54ED1
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 11:53:29 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.50018.1748346805066156633
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 04:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FtZC/svb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so30029905e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 04:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748346803; x=1748951603; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rlm97GKOOL7Flm+KOiJLkXmOaeMYayloQzgowUI0WM=;
        b=FtZC/svb/B4HVYC5EvK3Ko63fvjbyfQ6mqLr+nd27Qjr2OFvNxOQnOggu6wNz2oUTW
         2/q8CBRGb20HPwjBA36H54MiD8CsVatCmmMddth8tI7URzWCP1oCgPnwdyISZB9tjUH3
         EQ/y9maig+dWKvCCLSUZlM2exWtx8ZtIA2uzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748346803; x=1748951603;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7rlm97GKOOL7Flm+KOiJLkXmOaeMYayloQzgowUI0WM=;
        b=ohnerDlZzHYgLTw5QEWOeUeaQupRPmcqvFkZuRe5d7pKWUXbJ1uQMCmUhhq+0DGG40
         uz1rM06fFg8wSZnZ046t3WFcQiMq6NDr+WJfYH922cYWKjeRD9406KTh3bD2gAieQb5+
         +LpdE1J4C1WHVIuK1/06C2eoOwsB/yAOi+aRkrgJnbiUNe309XKVN4jqBXd48U+q5Z3w
         EPCgj5Hr94U601tycq/nRQD4C0MF6WNu2Rnfee/1Vbd8iKNKdFbJhj5GUBqxEfIAJQF1
         iiMAXuom+lYD6a+9CLAjM59p2xlAomcTn0ZaVtlS1E7ZCDQnzsr2H3/+iShwxy8chdMV
         Fg2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUh9Yqqe0Fbt51ZWdPC6Eul51Kw3zGiYkAQQt0+CEfNHzhzSaaVR+htOxsYg7xdqxmMbEdhOO2ZKf2MXuZDz1uhRg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw1o1C+foF/drc8wI/WB0yMRHys+DZoqu9O9/0I/hPb2TK8eQYj
	FgMlBlrrUSo7Sr6/g8fm2jxMJFHnseaKOoP4ZQLnInQKSki52R2SZbjFMuPZoxKQpxM=
X-Gm-Gg: ASbGnctpW8c1b5u7DukcUdwcvKNeXm98dp5PZCtSLvHsjya30n1RScnMZ7ZKYJwY0WA
	Y0lNyl/EC3AVCsmUkNzfXo+V9TN3jvxOWVtdZTuwJWQv6UQ/kGkQU9jo+DUEaFib5Bi+BlGlJFN
	nRnAyE8jWJsoV7lFl4P0tCzPN9rUyHmHLkL/AoDfbDZc5aNua8oZMxK3OxBngKcljCSa0RFiWtc
	ciO3lFKWzTEOjBCZ9oVpWaJx8pXTLzKqH4fo+C3LOmmEARbqYC1Zi8xxDtNlUwuaSsxtK6gxprP
	jJrhE0OostEXn7zvQIRWs13hhoMjwCoSVuZ9tsWNyY/TROMBRiTTiA9av89EwrZx/ZZQrGveBZE
	XMtF8mQ+liG3wtEcv5Ec+gPtTaZgHgYZQrcLzt36z
X-Google-Smtp-Source: AGHT+IHSG9zZY8PurbMnbZ7vOn9OcLtqbsOOtzfTTuKKUJaw9kqZvLgh/auXcl8KRsC5XZO02GEnYg==
X-Received: by 2002:a05:600c:1e8e:b0:43d:683:8caa with SMTP id 5b1f17b1804b1-44c91dcb66bmr135641085e9.15.1748346803268;
        Tue, 27 May 2025 04:53:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6923:f643:8186:933b? ([2001:8b0:aba:5f3c:6923:f643:8186:933b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f78b2f19sm262097415e9.32.2025.05.27.04.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 04:53:21 -0700 (PDT)
Message-ID: <233e873f04683cf93055707ce37235bc8d9a2742.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 2/4] qemuarm64.conf: allow overriding
 QB_OPT_APPEND
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Tue, 27 May 2025 12:53:20 +0100
In-Reply-To: <20250527090758.540188-2-mikko.rapeli@linaro.org>
References: <20250527090758.540188-1-mikko.rapeli@linaro.org>
	 <20250527090758.540188-2-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 11:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217298

On Tue, 2025-05-27 at 12:07 +0300, Mikko Rapeli via lists.openembedded.org =
wrote:
> It enables qemu USB support which causes a reset
> loop currently with u-boot.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0meta/conf/machine/qemuarm64.conf | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm=
64.conf
> index d310445a34..f086729641 100644
> --- a/meta/conf/machine/qemuarm64.conf
> +++ b/meta/conf/machine/qemuarm64.conf
> @@ -20,7 +20,7 @@ QB_SMP ?=3D "-smp 4"
> =C2=A0QB_CPU_KVM =3D "-cpu host -machine gic-version=3D3"
> =C2=A0# For graphics to work we need to define the VGA device as well as =
the necessary USB devices
> =C2=A0QB_GRAPHICS =3D "-device virtio-gpu-pci"
> -QB_OPT_APPEND =3D "-device qemu-xhci -device usb-tablet -device usb-kbd"
> +QB_OPT_APPEND ?=3D "-device qemu-xhci -device usb-tablet -device usb-kbd=
"
> =C2=A0# Virtio Networking support
> =C2=A0QB_TAP_OPT =3D "-netdev tap,id=3Dnet0,ifname=3D@TAP@,script=3Dno,do=
wnscript=3Dno"
> =C2=A0QB_NETWORK_DEVICE =3D "-device virtio-net-pci,netdev=3Dnet0,mac=3D@=
MAC@"

I am very worried about merging patches specifically to disable usb
(here and in the selftest) since that is something we expect to work to
allow the graphics images to work properly.

Is there an upstream discussion about why usb causes the hang and/or
any estimate on when it might get fixed? I'm partly tempted to revert
the uboot version instead of this.

Cheers,

Richard

