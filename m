Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id B0EFF65CF3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 09:37:33 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id v14so17948795wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 02:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=aO33LR06H0gjCQkVBUgX4+N8+bH8mJ1w+wRG49maI8Y=;
	b=gU/5TXI2vBPWwV8hDgNjMOR/WC/St0p7t8j9wDGPAcBf5qhiQGn/7G62px6KquaQAs
	K5RYxtDA+yVYwMztOpbODOdQ4Z2VvOhZS3PWCeqqD/eSy4Xw4vcr7nkKlMy1w1BeVEob
	Y2TucTrz5ng5KCtS0lBdhwJ4KNnrRlAxgtowM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=aO33LR06H0gjCQkVBUgX4+N8+bH8mJ1w+wRG49maI8Y=;
	b=IsPWd62Sr4Ttd4u/NT8y6Zn+AC1buunpIrg7yR127iocE4reI+JfgS+2/HwW1S+NRk
	viSYlf0WgNn72apf/WOidXEZ7JCgjvnHu63vQo7GMpRRUC/nvJYMRIDlgaWh2vd9NNz1
	vPJ+CFgXF5qtFa21C9JUBZuF8camfEb5T7iHfW+lqAf1GF8Byxne2u4YTP2Z7IYPedWi
	GEK4IKix81ZsE4WR4e9fWlG4Dmybcm8/kSIKT5GeRr3aY8DL4eJtz9iUazFL0C68hBqS
	y4xgXG1vM+DqUGIxsCn5VbzLOsXLyaO5jjB0IoCimfCHe7D29bn+Cst0Fex5SdN5ScAx
	9sbg==
X-Gm-Message-State: APjAAAUR5GFUXdrrJ67Fya2yfmZb8BkBF2CCV5OyBtMwweiyk3A5DyGC
	qa7kZjPDu7yZHmLBGBVRlOXyqg==
X-Google-Smtp-Source: APXvYqxQGDkGvIIWiYt5GDxX47mA1D/dmivRse/g9imwbVGqk9wgga/tbXqVJOcZik1BhJhOQxquHA==
X-Received: by 2002:a1c:81c9:: with SMTP id c192mr1528717wmd.124.1556012254391;
	Tue, 23 Apr 2019 02:37:34 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o130sm13432059wmo.43.2019.04.23.02.37.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 23 Apr 2019 02:37:33 -0700 (PDT)
Message-ID: <d110e52007bc2f3fe015506613211d961a03d979.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Michael Scott <mike@foundries.io>, Khem Raj <raj.khem@gmail.com>, 
	Alistair Francis <alistair23@gmail.com>
Date: Tue, 23 Apr 2019 10:37:32 +0100
In-Reply-To: <88e820e3-d8b5-e57e-5362-4e36b4799461@foundries.io>
References: <20190413045641.3659-1-mike@foundries.io>
	<88e820e3-d8b5-e57e-5362-4e36b4799461@foundries.io>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel-fitimage: support RISC-V
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
X-List-Received-Date: Tue, 23 Apr 2019 09:37:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-04-19 at 10:41 -0700, Michael Scott wrote:
> On 4/12/19 9:56 PM, Michael Scott wrote:
> > Support RISC-V kernel image, using the "Image" target.
> > 
> > This change allows RISC-V support for fitImage via the following
> > flow: OpenSBI -> u-boot (as payload) -> Linux kernel (as fitImage
> > with ramdisk and dtb).
> > 
> > This was tested using QEMU RISC-V 64-bit.
> > 
> > Signed-off-by: Michael Scott <mike@foundries.io>
> > ---
> >   meta/classes/kernel-fitimage.bbclass | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/kernel-fitimage.bbclass
> > b/meta/classes/kernel-fitimage.bbclass
> > index 2517d75746..09abedff8e 100644
> > --- a/meta/classes/kernel-fitimage.bbclass
> > +++ b/meta/classes/kernel-fitimage.bbclass
> > @@ -8,7 +8,7 @@ python __anonymous () {
> >           d.setVar("DEPENDS", depends)
> >   
> >           uarch = d.getVar("UBOOT_ARCH")
> > -        if uarch == "arm64":
> > +        if uarch == "arm64" or uarch == "riscv":
> 
> I didn't see any response to this v2 patch.  Is this approach 
> acceptible?  RISC-V should not attempt to use zImage for fitImage as
> it now stands.

I think the v1 patch was merged. I'd take a patch to tweak the code to
the v2 version as it is slightly neater but its not essential.

Cheers,

Richard


