Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
	[209.85.166.51])
	by mail.openembedded.org (Postfix) with ESMTP id B26727D1D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 14:54:31 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id d201so1956052iof.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 07:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=rR1ieiXR5E+FRQar+UoaBazBicp3jICTYyXkXsBTcXA=;
	b=ofDDuiTxGnNmA8RpIjhy+r2NjiuGJFzUx5586S4Yb4IOubUOkvr8ePFHUFKatn6WcA
	2tsDZAQNeUFdxUSAqCItclhY4TwMbmRZfAf19yXnAs3OUlKVKNOJmm5z0HzIQ9zWF7dF
	N23FAliLoz1oWBedYb+f//uxnS/2VSq+aw/Vl3sqWk6fxw2lzO+zvRCpCK062pIRGS3N
	NdpYzxzeNj5tcsKitvzgsDcOYEUA1hkKLlnAybIobCNnlJYGnFabzA1MPDNXaDWm4i0I
	S/SeO/tFBM6S2f02AI+D5+XUO75aOF9sOBx8zyBoFIPAvzg8wQmUG98qTgDCkeLxwC3Q
	lHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=rR1ieiXR5E+FRQar+UoaBazBicp3jICTYyXkXsBTcXA=;
	b=EolOa971yewaCrznTFB/fH2XnKsD7YPUg2941bXsFIr1LyU+YLeVcZ9yu5fCgmoimR
	ADIISiMwgPkxSTJgV8BmWe1C/Wi6KGGyCEU8Lf98fHlrBe9ry/EX43E5jvoc+mTJSItQ
	Z/v0YhoAlEP6RmFK7NAIGr9luj2L2vj/8Sr7w3W2RA7AMm3+BSY8x1kBCeop/9tQwb08
	5Mi+x4VnJB6LPq3gmAOPXJ73X/2vTYnSPa509g5j6FL7RbN3e9S+xcJXeKBsq4iBSY/2
	JsZAvoC/z4hf9smr0N3dkP000Y2X+DB809DYDJ5oyT596Irqep7Nv1IzzO2IB5TZldK2
	qoGw==
X-Gm-Message-State: APjAAAXOp0Tu2dBVKm3qoSl/H197zRP1NmtgSrSV0qI18VjDEKuzFf4E
	xC5N5IbNdSui81FXt8ZifhEkHUM1spVEzX3aXYp3SA==
X-Google-Smtp-Source: APXvYqwd7MYaGpr/Ln7wDzMWIIVxoYvgtBUKAU5GqrS3zbjdhTOF+6Y/VbMmGsu7NyqFT7NX9HxIUsHFCYh9ZlKk1PQ=
X-Received: by 2002:a6b:3c05:: with SMTP id k5mr4542702iob.270.1553871272781; 
	Fri, 29 Mar 2019 07:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190326102919.7348-1-schnitzeltony@gmail.com>
	<CAJTo0La2G+3qUPzXOC6B0Mjwr70ygPuttHuNzfV85GRy3pZYpQ@mail.gmail.com>
	<CANNYZj8Ds1A5o-C7tQspQgWc=7rT1FaMD1ALpPMKmi51pMn5ag@mail.gmail.com>
	<CAJTo0Laq_H-C+-S5zNU+4c5urQ5Y2Hy4oSe63EoQZotnLkFsDw@mail.gmail.com>
	<CALbNGRTJYpi90K4VYtSfTq7kJj1Fukvu_iGGx=D-n6hDrNH7Pg@mail.gmail.com>
	<CAJTo0LYQHcaAg=ikVDWSQjBTgTOwTTRmtpKnNUvbuK0UjRuJWA@mail.gmail.com>
	<CALbNGRRu-VFXsZVLU9HeQx232-oDPxRVDKG4EjCvaXhLe87QSA@mail.gmail.com>
In-Reply-To: <CALbNGRRu-VFXsZVLU9HeQx232-oDPxRVDKG4EjCvaXhLe87QSA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 29 Mar 2019 14:54:21 +0000
Message-ID: <CAJTo0Lar4HWEaQVZFiUCcvBnnjcam8smPsnR0MrLWgHaSsXFCA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk+3: add librsvg to DEPENDS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Mar 2019 14:54:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 29 Mar 2019 at 14:51, Andreas M=C3=BCller <schnitzeltony@gmail.com>=
 wrote:
> * The patch you just sent: Doesn't adwaita-icon-theme need a rdepend
> on librsvg then? If so it is another allarch rdepending on arch
> recipe...

RDEPEND? No.  The theme just contains PNGs and SVGs.

Ross

