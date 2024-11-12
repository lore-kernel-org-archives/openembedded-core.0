Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8FCED597BC
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 23:25:10 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.100761.1731453903750461190
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 15:25:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J/pBHLZp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43169902057so51084235e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 15:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1731453902; x=1732058702; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TaTQDxa1jjvL3zTywbwyeDK4hePzGSSihFwyYb78zG0=;
        b=J/pBHLZpvMDpQ7fEMnXS5LCiHYeUFpfra2TP5ayv8hPhWvdMVIDO+EamPE6f5EBpg3
         bI7y+GsUyvyXEpm7Xq327Kydrj5M6fecT9lptCFxArUvk8DLOjsCUTUGiPovmgirdMPH
         0kA388wOx3JMNkMqiuDgRGRWwenbDx6FO+Kg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731453902; x=1732058702;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TaTQDxa1jjvL3zTywbwyeDK4hePzGSSihFwyYb78zG0=;
        b=ouEAtWDYKnUs+Ha2MWN0HXZSb99w6HG8dlbqlqm8VZbDdKgmMKUE6YXbWDhqnDPkYo
         5NhO0w8SE24vdtFlCbnu6gIiicMgYIud1DoUN0m8VVOJ7BByQRtfsESLPgoYQZzKYzCt
         CoeNzn0l+fkfO//JT+4Z292V3epURrR3X0pgf3fvh7Rg5YBDW9bSG/vNnxqqsF5xU53R
         pA9v6yAi/RWMr/v/32TFTzvJ6B0EZRxNkJyKsMZlkT7I2PhdmBxX3yT+rG4Jxmp0avtL
         xmknj3BJFrCJyCtIAXU4S+XoAA6MufoIIQZk/hy7v55vplQ+jkSnVTNHPuM7/xqTXJcr
         Fi9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX67d++nRp0uy34GpJCnwfpFX+eG4YAfOPOF81oL5UU9ydFRt+5HevaTx5UbsRDqo8uAWxwj/7/67eWGe3nkJJnbA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzf1j+3m+CbRI9hMow/m373arjhTXBjiLbnYOwceyVEwF1wiOtl
	yFELt2izubs0s+v9otXJU69fIUkgCMrS6L4kXenK97+k9xo1CXh4y2BbnmQ7OYY=
X-Google-Smtp-Source: AGHT+IGvt0klRcqVYmyeNOkMroTfl33CwrGwT7PTwqqOocBB2ABHOEftaDxw2IfQy/pOcS0NUdpMYw==
X-Received: by 2002:a05:600c:1d10:b0:432:c774:2e2b with SMTP id 5b1f17b1804b1-432cd47da06mr32743375e9.32.1731453902091;
        Tue, 12 Nov 2024 15:25:02 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a6be:fa93:c5eb:7a4c? ([2001:8b0:aba:5f3c:a6be:fa93:c5eb:7a4c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d5541824sm2596695e9.31.2024.11.12.15.25.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 15:25:01 -0800 (PST)
Message-ID: <3323f398b89cd4f4ce522350164dd1ee51c48618.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 8/8] core-image-weston: use
 virtual-x-terminal-emulator instead of matchbox-terminal
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Tue, 12 Nov 2024 23:25:00 +0000
In-Reply-To: <18072EC876211D71.19665@lists.openembedded.org>
References: <20241108170156.2057761-1-ross.burton@arm.com>
		 <20241108170156.2057761-8-ross.burton@arm.com>
	 <18072EC876211D71.19665@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 23:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207070

On Tue, 2024-11-12 at 09:33 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Fri, 2024-11-08 at 17:01 +0000, Ross Burton via
> lists.openembedded.org wrote:
> > Don't hardcode matchbox-terminal, but use the alternative.
> >=20
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> > =C2=A0meta/recipes-graphics/images/core-image-weston.bb | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/meta/recipes-graphics/images/core-image-weston.bb
> > b/meta/recipes-graphics/images/core-image-weston.bb
> > index 62305cc1cee..d5248cf480b 100644
> > --- a/meta/recipes-graphics/images/core-image-weston.bb
> > +++ b/meta/recipes-graphics/images/core-image-weston.bb
> > @@ -7,6 +7,6 @@ LICENSE =3D "MIT"
> > =C2=A0inherit core-image
> > =C2=A0
> > =C2=A0CORE_IMAGE_BASE_INSTALL +=3D "gtk+3-demo"
> > -CORE_IMAGE_BASE_INSTALL +=3D
> > "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'weston-xwayland
> > matchbox-terminal', '', d)}"
> > +CORE_IMAGE_BASE_INSTALL +=3D
> > "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'weston-xwayland
> > virtual-x-terminal-emulator', '', d)}"
> > =C2=A0
> > =C2=A0QB_MEM =3D "-m 512"
> >=20
>=20
> This breaks one of the selftests:
>=20
> https://valkyrie.yoctoproject.org/#/builders/54/builds/382/steps/14/logs/=
stdio
>=20
> ERROR: core-image-weston-1.0-r0 do_rootfs: Package rxvt-unicode
> cannot be installed into the image because it has incompatible
> license(s): GPL-3.0-only

Even with this patch dropped, the series still fails in the no-x11
build:

https://valkyrie.yoctoproject.org/#/builders/25/builds/411/steps/11/logs/st=
dio

Cheers,

Richard

