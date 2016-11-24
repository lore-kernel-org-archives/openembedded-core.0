Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id C21D271A8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 07:38:04 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id a124so65951717ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 23:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=efmGHx4g74KtY5X1gdbBTtIdcUv0j5YPCWuqmhbl7v4=;
	b=SqlLXBY6drtDl6XkqAeyW/qBLH3ezDT30hiwUGcCYE4FvtiiMWeUHQTRQgSSi6htzg
	1am6dZIAjXI4Xrg5IWjemDlAoT1CrzXoNVdWUYNEnvFeZY6OyDuXncS3dwrg5mZr6bPE
	xe8a3UXyH4S5kAm+WaZ1sFQyl2nVLvqrYyD864OXzNVs5aAXkyhUDVTlTyoHQeqx9rfg
	SgKq0651ZE7x5lWubxEBDndaivwXIkxRuvDcBn3xRuiCRSgYLeu29eUiYxvdChESG5pw
	7F4VxeIaFECFP9DQIehKQdeCWdXAGOTiRTDEZSKTs2hDPk9pe/5Z6ihGXj8fx/5lnqIw
	dryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=efmGHx4g74KtY5X1gdbBTtIdcUv0j5YPCWuqmhbl7v4=;
	b=lvowvo2dhxJtDTw9g2g1NFzwoEwCSy86aJ14vM5xz/pU90dPrZWQcQZ/lVK0Txuk5Q
	FuxkTedqi48s6wHKSEjftdGJA9xuYUmMTj0YxtTUaMH2gxep/1rHz3WERBQcLjllp0fH
	vSXUyA06eGmQxDndl8HDLRCQrfTt932fte23r1ZwyoFPWETK6tn7aTqJp2Fxyg4DeXlz
	kauvVYkEHdyycqxd+ECXAKSknUpanPhbm+y5OhJ+Y1hVpDwa+wH8jnk53IHNrz1mj9tC
	XmkBhPDkKht+bNPQC4T75oKym2qH5zug6MU+MpZdFzBgJftNESj9Iony6wSgH3jLTcgE
	e86g==
X-Gm-Message-State: AKaTC01i0Kq5wJBs7cdp843f4eVYe/o94Xc6jByBX628J8oDW8Sa7QZEqJJsuV4723xlydgL
X-Received: by 10.36.213.4 with SMTP id a4mr915634itg.0.1479973085696;
	Wed, 23 Nov 2016 23:38:05 -0800 (PST)
Received: from pohly-mobl1 (p5DE8D6D7.dip0.t-ipconnect.de. [93.232.214.215])
	by smtp.gmail.com with ESMTPSA id
	k198sm2314399itb.18.2016.11.23.23.38.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Nov 2016 23:38:04 -0800 (PST)
Message-ID: <1479973082.6873.8.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Ulrich =?ISO-8859-1?Q?=D6lmann?= <u.oelmann@pengutronix.de>, Eduard
	Bartosh <eduard.bartosh@intel.com>
Date: Thu, 24 Nov 2016 08:38:02 +0100
In-Reply-To: <20161124061543.e2xpgh7zjir3oynk@pengutronix.de>
References: <a90e8685-f087-5ee2-888b-aa537ebd94c4@mender.io>
	<1479813004.3239.19.camel@intel.com>
	<6913e4bf-96dc-eefa-d214-9df5cde181b8@mender.io>
	<20161123120816.GC12545@linux.intel.com>
	<5064cacc-e724-c7b8-9631-3d961c5a29f6@mender.io>
	<20161123132229.GA13863@linux.intel.com>
	<1479916616.31880.48.camel@intel.com>
	<20161124061543.e2xpgh7zjir3oynk@pengutronix.de>
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
X-List-Received-Date: Thu, 24 Nov 2016 07:38:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-11-24 at 07:15 +0100, Ulrich Ölmann wrote:
> On Wed, Nov 23, 2016 at 04:56:56PM +0100, Patrick Ohly wrote:
> > Excluding only the directory content but not the actual directory is
> > indeed a good point. I'm a bit undecided. When excluding only the
> > directory content, there's no way of building a rootfs without that
> > mount point, if that's desired. OTOH, when excluding also the directory,
> > the data would have to be staged under a different path in the rootfs
> > and the mount point would have to be a separate, empty directory.
> > 
> > I'm leaning towards excluding the directory content and keeping the
> > directory.
> 
> what about having both possibilities by leaning against the syntax that rsync
> uses to specify if a whole source directory or only it's contents shall be
> synced to some destination site (see [1])?

I like that idea.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




