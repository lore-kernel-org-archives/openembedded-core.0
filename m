Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8F08779C7C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 12:36:12 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id b6so3044488wrq.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 04:36:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=QRoKTa/sgv511LPJVrQLRYpoDfFvZJAIwUceGEe1yDw=;
	b=cQhqbVWKm1ojhnDc79dWyyb9+KzY/p2dSPyLul2sym4U7eZrXuiPr05uOVOuyRnPhy
	yOffzoYf1s52Bq8t0QOvLTt5K/cU0Yj7pjqPFH7ndIr7SSJS2Air1tgaF4bjU/SY6ugq
	8uI39/dDR0lVl3w+wrcthhFaz9Jgp5YEAQiQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=QRoKTa/sgv511LPJVrQLRYpoDfFvZJAIwUceGEe1yDw=;
	b=lD2e7wBLH/DhXXgEg2R3Yf6c8hPYlPowjwYnh/uitcO1L5/z/umWBrc9/L33os3/nR
	2DYISM7LGhwqAQd/hCnEEMsrSDTnQVEo0Kxsro0RAhhJA8yHC8zebwyhN0FCEU5Zgp2Y
	4LRHpRoU7N69C2m5xF/UAnvwdtCzWLLiUO2TFtmSHjsEDFKuXxUQCiXzx0nnx/179T2P
	IOuQLI2XJEY5peqoy249Bt4qAzgwZ56iD00xg4rYOEKoHGvXY8XF6zw13D4Uc7QHqruY
	oWF+mabY83UoBY1hRm93kr6rIbPiaQNZ9CRDSZxdYLXibwSzmacxqakhsogt8nkY2vn9
	2wbQ==
X-Gm-Message-State: APjAAAUiXgt75oh/1lxad4/L8G4Zc8a9eIUgE9/5W3JukuflVG0JzxD2
	CXRCPMdlMe1wcW5IcPc9hfzgtw==
X-Google-Smtp-Source: APXvYqy8U/6pLJnq/Bk+3Uvf2lmhQpQgPweOcK66gDtCNmau2wtQxxEdJIaDEgjwVYh8fCv9pGPBMQ==
X-Received: by 2002:a5d:4687:: with SMTP id u7mr4856250wrq.176.1579610173133; 
	Tue, 21 Jan 2020 04:36:13 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id n3sm49237048wrs.8.2020.01.21.04.36.11
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 21 Jan 2020 04:36:12 -0800 (PST)
Message-ID: <4e3bf60b3f87b1c87a0fdb5016239414429bf499.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: JH <jupiter.hce@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 21 Jan 2020 12:36:11 +0000
In-Reply-To: <CAA=hcWS5w_QTmUMZBBMpj-H+iyBcqc=6h3RoZwdpVYU7gpyaMw@mail.gmail.com>
References: <CAA=hcWS5w_QTmUMZBBMpj-H+iyBcqc=6h3RoZwdpVYU7gpyaMw@mail.gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: Could oe-core be infected by virus?
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
X-List-Received-Date: Tue, 21 Jan 2020 12:36:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-01-21 at 22:21 +1100, JH wrote:
> Hi,
> 
> I have been using thud version to build imx6 image for about a year,
> it was all good until my last image built at Mon Dec 23 2019.
> 
> The image was booted fine in the first and second times, then in the
> third time, it broken, the boot could not be completed. The wired
> thing was that image injected so many new messages, including
> "Welcome
> to OpenEmbedded nodistro.0!" I have never seen in previous built
> image
> boot. Here are new messages in booting, which were never seen in good
> normal image booting:
> 
> ..................
> 
> [    0.440012] No ATAGs?

Those messages all look fairly normal parts of system boot up so I very
much doubt any virus is involved.

I suspect many of these have always been there but maybe directed to
different consoles which you weren't using.

Something has probably changed on the device with the bootloader to
kernel handoff and its changed the kernel boot parameters and console
setup. This is now printing things on the console you've not seen
before.

The no ATAGS may or may not be related, I don't know what your system
did differently.

So if it was me, I'd be looking at how the bootloader and/or kernel
commandline has changed with your last update.

Cheers,

Richard


