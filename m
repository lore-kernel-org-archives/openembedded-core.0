Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id CD4816D2F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 05:13:47 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 21 Oct 2013 22:13:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="310915467"
Received: from akagikob-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.120.204])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Oct 2013 22:13:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 22 Oct 2013 06:13:46 +0100
Message-ID: <2023592.phK6gWF0Ci@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAMKF1sqtist2BpszV5AYEids7kYnWxxfu=becBYiAUaQs=PBpg@mail.gmail.com>
References: <526556B1.2010908@emagii.com>
	<CAMKF1sqtist2BpszV5AYEids7kYnWxxfu=becBYiAUaQs=PBpg@mail.gmail.com>
MIME-Version: 1.0
Cc: ulf@emagii.com, openembedded-core@lists.openembedded.org
Subject: Re: Using the correct "xserver-xf86-config_0.1.bbappend
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
X-List-Received-Date: Tue, 22 Oct 2013 05:13:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 21 October 2013 13:21:07 Khem Raj wrote:
> On Mon, Oct 21, 2013 at 9:30 AM, Ulf Samuelsson
> <openembedded-core@emagii.com> wrote:
> > Trying to build a systemd-gnome-image raspberrypi under Angstrom, with a
> > few extra layers.
> > 
> > This fails on "xserver-xf86-config_0.1.[bb|bbappend]"
> > 
> > The extra layer has BBPRIORITY = 20.
> > meta-beagleboard has BBPRIORITY = 8
> > meta-raspberrypi has BBPRIORITY = 6 (later changed to 120)
> > 
> > BBLAYERS are in the order meta-<extra layer> meta-beagleboard
> > meta-raspberrypi
> > 
> > It looks like bitbake will select the bbappend in the layer with the
> > highest priority,
> 
> Not really. All bbappends are selected the order or sequence of them
> is governed by how the layers line up in BBPATH

All bbappends for a recipe will be applied, in ascending layer priority order; 
BBPATH doesn't come into it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

