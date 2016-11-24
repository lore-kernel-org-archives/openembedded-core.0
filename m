Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id CB78D71A01
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 16:21:36 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id x94so86426678ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 08:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=fsL6rS9AzVXzE5jWGZvEDphqZyMJVeru9fM+BVmXwUo=;
	b=dGPlw93E3SR9s/KWrZwi/Tue2fy04ju0uvEqshx85x4jk3IXmNssaOwHb4FoIz0qd+
	H3lMnDaOOIO74crgMWkUCtnUX8KGilMLJTMKXl03J4eOFG1QJkBpZVXkbSFEDQ+6wvHY
	H6l+obBgU9Uf1X0oBbjlZuZe/lsL+A92S5O9xBdMgUAspI8y1LgkMaH+l95fvN3mYfSI
	yMUC7tIFQk5sSNUBsD+Fcvpoti2QuN1mzi9QITb7qNYhlKP4U+XMA9GhOEOSWsSa3mKk
	kdq29mL0UGAN0zSaRVQM5n+ydYgCAmWCZAFzO587ifV2RuccE9Fwc5Lr/qLy46QAv6sn
	X00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=fsL6rS9AzVXzE5jWGZvEDphqZyMJVeru9fM+BVmXwUo=;
	b=lrnfsAanDTSUYPe0e3V75FxYTpEFV55dw0OoX0YYk980v6tOmhTeebFgI6mB47t5iX
	FpW7JZYrHN63ORHJqUOQpF3AzPDcokUw74bja5xrGjh/M0CV+5PCC+rjZjO8UN5wansV
	dFes7hOKD9ZipWzl536mU5Mp3K1gnb35xMn/xRPj8/ZLD1XZkMWeaHIUQzdIwrR4LFxx
	46HelSPZA1inuawAUOJwxim24mDZqCGrFuuYISqMgOkP+KW5T7tFqBUv5/014s/Ypzm6
	MT8/PML/lCFcJHq4g/mdYd8tfF4mwfgSagq5oQLjTGnFIitiz4L6Z+NoG1rLO1lx1weC
	ykhA==
X-Gm-Message-State: AKaTC03XDkPsLTaOywr7uSQYQlsfwtQCrhg/OzOZpwyF+QQm0GKU5Jc/cTXKo6WT+Vb0Qx0H
X-Received: by 10.36.91.85 with SMTP id g82mr2870699itb.23.1480004497551;
	Thu, 24 Nov 2016 08:21:37 -0800 (PST)
Received: from pohly-mobl1 (p5DE8D035.dip0.t-ipconnect.de. [93.232.208.53])
	by smtp.gmail.com with ESMTPSA id e13sm1945047itd.4.2016.11.24.08.21.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Nov 2016 08:21:36 -0800 (PST)
Message-ID: <1480004493.6873.51.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Date: Thu, 24 Nov 2016 17:21:33 +0100
In-Reply-To: <23608ccc-ebaa-f2a6-6b39-02121e7b4287@mender.io>
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
	<1bac8afc-7037-3891-7e3a-5a590dbed9e2@opendreambox.org>
	<23608ccc-ebaa-f2a6-6b39-02121e7b4287@mender.io>
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
X-List-Received-Date: Thu, 24 Nov 2016 16:21:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-11-24 at 16:51 +0100, Kristian Amlie wrote:
> On 24/11/16 16:28, Andreas Oberritter wrote:
> > Note that in a shell, "data/*" doesn't include "data/.*". So this syntax
> > avoids the confusing rsync syntax in trade for another one. I'd prefer
> > the rsync flavour, because "behaves like rsync" is easier to remember
> > than "behaves like a shell glob, but differently". Confusion could be
> > prevented with good documentation, FWIW.
> 
> This is turning into a bit of a bikeshed discussion. I have a slight
> preference for the glob version, because I think it's less surprising,
> but I'm fine either way.
> 
> I count myself and Ed in favor of glob version, Ulrich and Andreas in
> favor of rsync version. Patrick, you wanna be tie breaker? :-)

But I said I was undecided ;-} Okay, I vote for the rsync flavor.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




