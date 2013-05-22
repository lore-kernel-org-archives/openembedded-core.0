Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0E5DF60657;
	Wed, 22 May 2013 10:08:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 May 2013 03:08:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,718,1363158000"; d="scan'208";a="341605257"
Received: from unknown (HELO helios.localnet) ([10.255.12.181])
	by fmsmga002.fm.intel.com with ESMTP; 22 May 2013 03:08:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 22 May 2013 11:08:12 +0100
Message-ID: <57053358.LVqALflxil@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-21-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <20130522091738.GH32431@jama>
References: <40EC58CA-E878-4F77-8E39-4F8D86F48E29@dominion.thruhere.net>
	<CANyK_8cbVGMQkD7_KEd5KYTBxP+ZT5jY6VVVpdSAv_uY7JPY1w@mail.gmail.com>
	<20130522091738.GH32431@jama>
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [RFC] Layers, PRINC and bbappends
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
X-List-Received-Date: Wed, 22 May 2013 10:08:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 22 May 2013 11:17:38 Martin Jansa wrote:
> On Wed, May 22, 2013 at 09:47:39AM +0100, Paul Barker wrote:
> > I've just sent a patch to the yocto@ list to fix this but it's brought
> > up two things:
> > 
> > 1) In openembedded-core/meta/classes/image.bbclass SPLASH is set with
> > '?='. I'm overriding this with '=' in
> > meta-raspberrypi/conf/machine/raspberrypi.conf which means it can't be
> > overridden further in local.conf. Is this worth changing to '??=' in
> > image.bbclass, '?=' in the machine conf so that it can be overridden
> > with '=' in local.conf? Is my understanding of the overrides correct
> > here?
> 
> You can still use:
> SPLASH_forcevariable = "foo"
> SPLASH_your-distro = "foo"
> SPLASH_your-machine = "foo"
> or any other OVERRIDE in local.conf.

This is true; FWIW as the original author of that line in image.bbclass I
wouldn't object to changing it to ??= though.

Having said that, I would note that people are best advised not to try to set
too much from local.conf, especially when it's stuff that affects what is in the
final image. Anyone doing anything moderately custom should really have their
own distro config. FYI, we now have a section in the Yocto Project development
manual documenting this:

http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#creating-your-own-distribution

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

