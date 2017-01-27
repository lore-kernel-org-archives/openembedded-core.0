Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 54D76773FE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 15:32:23 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id j18so62976351ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 07:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=DKffbwWbP9+Mwk539McF/DtZaEo0lQEttjuHOgfCgl0=;
	b=pXxZtcU0DaiY9X4nLQoQe0dsqf97XwzD0zqks5c0wcJ9tWCR5aTH2fOXQsHJmAuhk5
	CS1RXLrYHVLNNpALjpxVzgGiT0e8KfWoI9GAkfhWrwABayH38YHAj8QzEYS/U0kEELlw
	C0ml+vzzf0MwRf14Go725VBwpgtklyIQ39W6WzGm6ewWNleVybjO/rwIymjftwb4yvVm
	5o+XmN9zMJ0cdaCRsX2GdSZBY8A1Q9QxsHOFtGMb8f65ZW5wHSyo2k4Cq4Kv9RYjp1Uq
	xkkAZxEUoHSbStSb1CKonQc/sbNj3EWj6xyhymlR4OY/JeTSgpOQ+Lj/+Aw2z0NPMGoo
	G31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=DKffbwWbP9+Mwk539McF/DtZaEo0lQEttjuHOgfCgl0=;
	b=MOvShJmBpthwWzbqGji/X6EdrYxYNmr5ZywNb78lJFIl9avUn5QUlfqCJiBhajQo4U
	Dg/RUhroruHQ0pPL5XahSgBnmMIGrYnFoSAeVM66RNakvknbokZTap8TBU4EUpLVX2uk
	giWkWbdxicJ4mk6qpqGxxg8oc04ifzikeTMWltiMi4AAzaOMDNsQ3bjXsgNzZgy1c/D1
	HIr14WN4tLAurEcUgSWw0XHlcSeDUwnEkqeLtcGRHkpwA8mVeT3nowKRGP3L2RATrHk3
	HuO6DOGompykFuf28nXMyT1og3pv/gRkVGcdvXChq9pX3LWT28nkDHS+ZdXIH7WrFS1b
	AKgw==
X-Gm-Message-State: AIkVDXK/hrz1bgyCpS8sGprOa0l7vPQ9Ao+qQgb/Ecxw56lfx1KBFxwGDPic/xwMOnsgdGJ4
X-Received: by 10.107.19.131 with SMTP id 3mr8249392iot.198.1485531144413;
	Fri, 27 Jan 2017 07:32:24 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DB2E.dip0.t-ipconnect.de. [93.232.219.46])
	by smtp.gmail.com with ESMTPSA id
	c100sm1389342itd.20.2017.01.27.07.32.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jan 2017 07:32:23 -0800 (PST)
Message-ID: <1485531141.20333.116.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Date: Fri, 27 Jan 2017 16:32:21 +0100
In-Reply-To: <1485487510.41148.67.camel@ranerica-desktop>
References: <cover.bbc01c1227afdba3edc41dc7d7356f56e51be400.1484921498.git-series.patrick.ohly@intel.com>
	<9d68428a1d2b7234a1a7ea6057e3b027e454db61.1484921498.git-series.patrick.ohly@intel.com>
	<1485156197.41148.8.camel@ranerica-desktop>
	<1485157551.20333.14.camel@intel.com>
	<1485487510.41148.67.camel@ranerica-desktop>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 05/12] ovmf: deploy firmware in image directory
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
X-List-Received-Date: Fri, 27 Jan 2017 15:32:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-01-26 at 19:25 -0800, Ricardo Neri wrote:
> On Mon, 2017-01-23 at 08:45 +0100, Patrick Ohly wrote:
> > > On the other hand, this is a new recipe and this may not be super
> > > critical. Especially if you meant that only OVMF will not support
> > > installing bios.bin in sysroot. Maybe all is needed is some
> > > clarification in the commit message.
> > 
> > Care to suggest something? ;-) To me, "traditional usage of ovmf ...
> > is
> > no longer supported" already says that this is a statement about ovmf,
> > not the bios parameter, so I'm not sure how to reword this.
> 
> Perhaps specifying what "traditional usage" means, both when using
> runqemu or qemu directly. I think this is useful as you devoted a fair
> amount of effort to enable your work in qemu. Mentioning the qemu
> features could be useful to people using qemu directly.

I've tried to make the commit message more useful in V5.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




