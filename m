Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0BA387CBCC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 07:35:13 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id i16so1190228wrs.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 23:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=WBpu6osC7WWhjsIOZyBB1mr6EWh4jwun+/V/qxNw0Ag=;
	b=E7hwsjVSMfDZAxzers9Km1MmPSL/5nBDmu+pV4iJGRbVCFNT0ldv8ux//7/pHAxzI9
	qf7O65rjRolOPFnkwfwW610QcuBZs5NXVDfCBQT3HOaSTH3Vag/avJ8wrzKyRK2Lpvnp
	m1fT7uqFrXJE/baijtSN4XCVi4djRBUtqNM9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=WBpu6osC7WWhjsIOZyBB1mr6EWh4jwun+/V/qxNw0Ag=;
	b=WatE1L+d4w7A8iH0TBXONCNQ1XiMLFAmXIrb8r5fMNiCqS0Yxk9xaXpwk0bSHCYvw4
	9ayB6b0YKjCnvvd3ZYnY0jWak5Cx1L6Xg7ZWiRW4DJoV2KIPu6+OJS5Vu06n8MHU+Fx0
	kcOWBWh00Sgskw4eK1fGVnSNNdRnbJ5aDLibWmbJSoYDDnJeO1nz3SB3h+C63ioGLbG2
	WqQ1Ucn7+lCAE+usK1PAe+m+hTxIHq+or4w761QR0avcPo79+s3YLm1m35fN1Kxx6Y+S
	v/4F5nKivyhMYyM3p6S/1uqT1uqKRPe9xmphTWyFry8ARhprC3+9zIMIYNNR4IcIbkid
	wZsg==
X-Gm-Message-State: AHQUAuYT8tzqxKCJ7egumq1RcYCXBwLtB4sEaXdfvlEz0NvkUQyb0pZm
	nAiouKigkwkLyTkoJfm6oiUY0g==
X-Google-Smtp-Source: AHgI3IbtxOI3OovlwGqSdBnbi6bXwUYXDkCXB1bP85r5c6gBJzO5WEK+tsMxof5LO+flG+RJXZeIaQ==
X-Received: by 2002:adf:dc10:: with SMTP id t16mr1868542wri.40.1550820914734; 
	Thu, 21 Feb 2019 23:35:14 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	i74sm1267342wmg.48.2019.02.21.23.35.13
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 21 Feb 2019 23:35:13 -0800 (PST)
Message-ID: <255f8e465f5495754319c372b39b5f94293a8d5d.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Rich Persaud <persaur@gmail.com>
Date: Fri, 22 Feb 2019 07:35:12 +0000
In-Reply-To: <4C429FC4-E68A-4AFC-B8D6-61DFF45CE2AA@gmail.com>
References: <CAJTo0Lb9Aspc0Nu+H3eRzbQcOLDevn40hJ5Jnib1DKo8k4R2cA@mail.gmail.com>
	<20734cff-3215-7a9d-8bc1-87d7238876fb@windriver.com>
	<6F7B3258-B781-465F-AF58-E4E8EBA88012@gmail.com>
	<6673aa01794a9a5466969fa4a39d28b46649173d.camel@linuxfoundation.org>
	<4C429FC4-E68A-4AFC-B8D6-61DFF45CE2AA@gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Incorporating deploy artefacts from one multiconfig in another multiconfig
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
X-List-Received-Date: Fri, 22 Feb 2019 07:35:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-02-21 at 20:09 -0500, Rich Persaud wrote:
> > On Feb 21, 2019, at 18:51, Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > 
> > Multiconfig is meant to support this workflow. Unfortunately there
> > are
> > open bugs and people haven't the time to work on it so its stalled.
> > That said, the key pieces are already there.
> > 
> > A picture is worth a thousand words. I thought a demo might
> > interest
> > people and "prove" this can work.
> 
> Thank you for the patches and PoC.  We will test and are motivated to
> see this work.

I've been thinking about what Alejandro and I discussed and I think the
correct fix for the multiconfig code is to filter the BB_TASKDEPDATA at
source in bitbake to remove the multiconfig entries for other
multiconfigs. I'll try and work up a patch for that in the next day or
two as the hacks on my branch that do this are fragile right now.

> I will also be experimenting with the generation of "immutable
> infrastructure" from source code, to learn whether a single Packer.io
> template can be used to both:
> 
> (a) modify binary images, in the traditional Packer model, e.g. start
> a bitbake-generated image in a VM or container, make runtime
> configuration changes, then repack the machine image
> 
> (b) perform automated customization  of _inputs_ to bitbake recipes
> and package source code, such that a machine image built by bitbake +
> Packer template is equivalent to the image generated by Packer at
> runtime
> 
> If feasible, this would combine the agility of image customizations
> with the security of bitbake's reproducible builds and supply chain
> integrity.

(a) definitely sounds easier than (b). I've not used packer.io but I'd
be curious to see how that works out. People do find our image
customisation hard to get to grips with :(

Cheers,

Richard




