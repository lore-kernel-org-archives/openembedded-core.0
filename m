Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id C692B71AF0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 15:24:09 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id j65so84355166iof.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 07:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=mpOG8kvRbpc3F5Zy9t5XY2NC78cCquXR1O+uMtiH7DI=;
	b=0KerJhwnzLuHyi6dQGEnfekIboKDtbDCb2iUuVT+f5vhiztHaI8jKCzzLKPBUqfVPs
	bKBAMj82b2Z1pzduAfdsdmMaTWV0Gqy92blLU5evUaBBUO+6yTdrGD9yTtJgmWEk5Emg
	Ma/jzqjSa3LRhxFUC7g2mdyAWgWiHr2o9cvZydG3bP3nL8jA/AFmu7syW4Ni7Uvla5qq
	ciEVHniyc5uvNbc45SkYqx1V1feFf5qwg041xfcqLm+6ZvviBqX6INap09pPDPSBtQaA
	eg81lOcWgeW3rq2oCcpPvPenCTc5hf6UbNx2xJXRz/OX5ysZ56mFI/QZpN3lyU9lInaB
	ytJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=mpOG8kvRbpc3F5Zy9t5XY2NC78cCquXR1O+uMtiH7DI=;
	b=hQzbNle4bWOZ67UUtv4rNDhKfj4C+yZEm/yHMrLu8PcP4TTGIAvyrDSp++bKxf1wev
	5s9MJZ9LO3BcTkUiUZsNMHtXKq92lzfv3RRIO3htjpeu4qB/R4YUjMaIWzkvdRTSUSkW
	tzwc6KU7oUiFpl6R6ZC4UinyCgMQjWNC6a1fGYPcAGaW1/ZkMmDRMQaLZs5BlvjzQn8K
	sRGIoWuMYWX4VBURBcoB3ZABohQnsueQbkBbOKdw58nqgDmmC+FIGAeWk2qXRX9rhrlA
	dZTrX5SkY8sG5dQSseDDjCeenWuuOaCqtExVinaNH2cqETYez+lP/OlhaKItGgA+ahg7
	uWHQ==
X-Gm-Message-State: AKaTC00Ao/xodjxjIgij/nkz3xcCcDjwqG/VhBMNNaaattMXvgA/UuoXZF2a5AJ09iHBq9Nc
X-Received: by 10.107.158.76 with SMTP id h73mr2605719ioe.152.1480001051350;
	Thu, 24 Nov 2016 07:24:11 -0800 (PST)
Received: from pohly-mobl1 (p5DE8D035.dip0.t-ipconnect.de. [93.232.208.53])
	by smtp.gmail.com with ESMTPSA id
	f24sm13529390iod.21.2016.11.24.07.24.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Nov 2016 07:24:10 -0800 (PST)
Message-ID: <1480001047.6873.49.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: ed.bartosh@linux.intel.com
Date: Thu, 24 Nov 2016 16:24:07 +0100
In-Reply-To: <20161124145136.GA31813@linux.intel.com>
References: <1479813004.3239.19.camel@intel.com>
	<6913e4bf-96dc-eefa-d214-9df5cde181b8@mender.io>
	<20161123120816.GC12545@linux.intel.com>
	<5064cacc-e724-c7b8-9631-3d961c5a29f6@mender.io>
	<20161123132229.GA13863@linux.intel.com>
	<1479916616.31880.48.camel@intel.com>
	<20161124061543.e2xpgh7zjir3oynk@pengutronix.de>
	<fa1edaed-1498-160e-2015-8b7882c04877@mender.io>
	<20161124132315.GA14497@linux.intel.com>
	<1e1a7126-15dc-33be-a863-ea93063b554f@mender.io>
	<20161124145136.GA31813@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Contents of non-rootfs partitions
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
X-List-Received-Date: Thu, 24 Nov 2016 15:24:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-11-24 at 16:51 +0200, Ed Bartosh wrote:
> On Thu, Nov 24, 2016 at 03:43:18PM +0100, Kristian Amlie wrote:
> > On 24/11/16 14:23, Ed Bartosh wrote:
> > > Would this way be less intuitive?
> > > --exclude-path data/*
> > > --exclude-path data
> > > 
> > > We can go even further with it allowing any level of directories:
> > > --exclude-path data/tmp/*

Just to clarify, that is meant to also match data/tmp/.hidden-file,
right? I.e. fnmatch() without the special FNM_PERIOD flag.

> > > --exclude-path data/db/tmp
> > > ...
> > 
> > I agree, this is pretty unambiguous and easy to understand.
> > 
> > But this raises the question: Should we go all the way and support
> > wildcards? Which might make it a bit complicated. Maybe support only
> > pure '*' for now?
> 
> As it shouldn't be hard to implement I'd go for it.

Additional code implies additional testing. Remember that it also should
better be supported by mkfs.ext4 and friends.

I'd rather start simple and only add additional complexity when needed.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




