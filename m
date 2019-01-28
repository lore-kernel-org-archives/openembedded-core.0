Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 184CC6BC01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 17:26:50 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q18so18973827wrx.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 09:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=Px+5Fp8+xxPfdFoPnfC2O7n3WJ40bYL/HU8gVjf26To=;
	b=BBy4ACOKsTon1OnQw7mTVRb5WG9EnHvzOSHawhWA73lumWQ7JASCbf8t0xUGuthRme
	78hjL4pqk22/WzUmwPIokG19bPRfcPZV0hP8NmBo9NqhTWtK6LA4Vsf7v52RUZEAEFmv
	M7Q89iLbjr+w8M33K2FLxu3aN1hcO1AQUVU50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Px+5Fp8+xxPfdFoPnfC2O7n3WJ40bYL/HU8gVjf26To=;
	b=q8/fwJoGlneIA3++8cIE+YS38okxsePUO9Kqe6Fa+gUbbgu3rSD7xUMChyd8AJM2L5
	nJ0Bjj+YCHCJZUVBsWvC+gMn0qQSIEGZx5jMVKAA6Qyc89cNu8sQwgzWvPm2PHV4JvE9
	gbrDENw05xRZLmVYX+TXD6ZZfLNhcyZsEYehm8c747TQYrjF/mO07B+OuN+ebIczjaFN
	+BXb2wD/g8pLA9s+o5pOIXbVSANFpQM7Cdihnr96cRMUFDukvq56lMJ4oQjU02/IUnFm
	0RMyE3HYSD1YC0ajavNbkfdufms0Bzg/ZCaF9t8G7SKmBeuaCYOfC1jcaZibMQSBHemm
	UeqQ==
X-Gm-Message-State: AJcUukehyIwlGw1uXpA49wy02DLFHRaIS3JY3u4uSojP7y+nRhvClYeL
	1P/aI33HNUcC8RbgLkS3JrvEWVp4Jsc=
X-Google-Smtp-Source: ALg8bN40WK9ORZ87CP2Q9qHvFxf5lFVGDUBoXXMFM91r7IUx96whcgnHEqwGNhx9r1bOEXboKN1N0A==
X-Received: by 2002:adf:f0c5:: with SMTP id x5mr21705239wro.77.1548696411722; 
	Mon, 28 Jan 2019 09:26:51 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id i192sm44954wmg.7.2019.01.28.09.26.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 28 Jan 2019 09:26:50 -0800 (PST)
Message-ID: <0f341f2157a9560145fd2184a9b84098372f5e6c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonas Bonn <jonas@norrbonn.se>, openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 17:26:50 +0000
In-Reply-To: <c386e07d5c75dfb9040e78caa2e5c3089c525873.camel@linuxfoundation.org>
References: <20190127093821.4803-1-jonas@norrbonn.se>
	<9649a5c523c4f0809c9f73a9c5326eead5ae12d5.camel@linuxfoundation.org>
	<c4b576fc-741a-0fac-efdd-738bf7e9c141@norrbonn.se>
	<c386e07d5c75dfb9040e78caa2e5c3089c525873.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH v3 0/5] systemd patches
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
X-List-Received-Date: Mon, 28 Jan 2019 17:26:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-01-28 at 14:31 +0000, Richard Purdie wrote:
> On Mon, 2019-01-28 at 15:26 +0100, Jonas Bonn wrote:
> > Hi,
> > 
> > On 28/01/2019 14:55, Richard Purdie wrote:
> > > Unfortunately this series failed in testing:
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/72/builds/226
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/167
> > > 
> > > so it looks like it may need some tweaks before we can merge it.
> > 
> > OK.  You'll have to bear with me here as I'm not familiar with
> > looking at the buildbot output.  From what I can see, the failure
> > is
> > when it attempts to boot the image... is that correct?  In what way
> > does it fail... where do I find that?
> 
> Yes, these tests are trying to boot images under qemu. You can see
> the
> output from boot process and it looks like it starts an interactive
> dialog with the user (or attempts to) for setup. The key piece in the
> various logs would appear to be:
> 
>  DEBUG: Last 25 lines of text:
> >          Starting First Boot Wizard...
> >          Starting Rebuild Hardware Database...
> >          Starting Apply Kernel Variables...
> >          Mounting NFSD configuration filesystem...
> > 
> > Welcome to your new installation of Poky (Yocto Project Reference
> Distro) 2.6+snapshot-20190126 (master)!
> > Please configure a few basic system settings:
> > 
> > -- Press any key to proceed --[[0;32m  OK  [0m] Started Journal
> Service.
> 
> (from 
> https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/257192/raw)
> 
> 
> > When I build locally this all runs fine.  So what should I be
> > building locally in order to see a failure like buildbot sees?
> 
> Add INHERIT += "testimage" to local.conf and then
> 
> "bitbake core-image-sato -c testimage"
> 
> You'll need a tun/tap device setup so that "runqemu <machine>
> <imagename>"works.

FWIW testing narrowed it down to the machine id patch causing this.

Cheers,

Richard


