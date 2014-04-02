Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A2E4C6F573
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 08:47:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 02 Apr 2014 01:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,778,1389772800"; d="scan'208";a="512662525"
Received: from ryanpete-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.86])
	by fmsmga002.fm.intel.com with ESMTP; 02 Apr 2014 01:47:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <pb@pbcl.net>
Date: Wed, 02 Apr 2014 09:47:39 +0100
Message-ID: <2152356.Zkf82YNJds@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.3 (Linux/3.13.7-200.fc20.x86_64; KDE/4.12.3; x86_64; ; )
In-Reply-To: <1396387742.3038.34.camel@e130.pbcl.net>
References: <8672BB614B4CCA40A6B3BDD6FD82050B575445A7@COSNADEXC13.usr.ingenico.loc>
	<1396374702.2910.27.camel@ted>
	<1396387742.3038.34.camel@e130.pbcl.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: image.bbclass: USE_DEVFS is now useless
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
X-List-Received-Date: Wed, 02 Apr 2014 08:47:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 01 April 2014 22:29:02 Phil Blundell wrote:
> On Tue, 2014-04-01 at 18:51 +0100, Richard Purdie wrote:
> > On Tue, 2014-04-01 at 18:48 +0100, Phil Blundell wrote:
> > > Also note that the default for USE_DEVFS was (and is) 1, so the lack
> > > of this check is actually causing a difference in the default
> > > behaviour.  If there's no appetite for reinstating the USE_DEVFS
> > > mechanism per se then it seems like it would be a good idea to make
> > > the default IMAGE_DEVICE_TABLE be blank in order to restore the
> > > previous default of no /dev in the rootfs.
> > > 
> > > At present you get a somewhat arbitrary-seeming smattering of devices
> > > from meta/files/device_table-minimal.txt, including such anachronisms
> > > as /dev/ttySA0 and /dev/apm_bios.  It's hard to imagine that anybody
> > > actually wants this stuff in their rootfs in this day and age.
> > 
> > Can we kill apmd at the same time? Please? :)
> 
> I can't see why not.  I'd be surprised if there were many/any real users
> left, beyond possibly some legacy stuff in meta-handheld, and it
> definitely doesn't seem "core" by any reasonable interpretation of the
> term.
> 
> Apart from packagegrounds, the only recipe in oe-core that mentions a
> dependency on apmd is matchbox-panel (for the battery applet
> presumably); that dependency is conditional on having apm in
> MACHINE_FEATURES (which it isn't by default), and it seems a bit fishy
> anyway since I can't immediately think of a reason why matchbox-panel
> would need the actual daemon.
> 
> So, I think it should probably be safe to just rescind support for both
> apmd and the MACHINE_FEATURE apm in oe-core.  If meta-handheld, meta-oe
> or anybody else wants to keep apmd then they can do so in their own
> layers although I rather hope that nobody does.

I'm generally in favour of this too, however, one of the things that apmd 
provided was the ability to have scripts run on suspend/resume - is there a 
more modern mechanism that should replace this? zaurusd and opie currently 
rely on this (yeah, I know...)

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre

