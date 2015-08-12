Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8F4F5737F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 14:49:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7CEnoVj015229
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Aug 2015 07:49:50 -0700 (PDT)
Received: from Marks-MacBook-Pro-2.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Wed, 12 Aug 2015 07:49:50 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>
References: <1436426071-3790-1-git-send-email-leimaohui@cn.fujitsu.com>
	<56502.10.252.20.69.1436441609.squirrel@linux.intel.com>
	<CAP9ODKqHNtENns2SOk-C9S2hh1weyf15=n1V8Rxgs+Rh5rMJGw@mail.gmail.com>
	<CAJTo0Layj-AXfYMmvqjZ-ASSDx_PptbysS7tUiGDLAyPjLGN5A@mail.gmail.com>
	<CAJ86T=WJiNC5fJj+Vgj=4T-dS+E9_CvTw79nFLVuFETxrp1qdw@mail.gmail.com>
	<1436601450.3310.27.camel@linuxfoundation.org>
	<55BA134F.9010908@linux.intel.com>
	<CAJ86T=UHTjTA7S_4EV66VEUoaRhYmaYveVcfxbqzVJsxZ4s6dg@mail.gmail.com>
	<55BB5F06.4010901@linux.intel.com>
	<CAMKF1srWcMoRui4kqRY5vCdLd-SPQ+EMihTci=NUghHsnGiBqQ@mail.gmail.com>
	<55C477AE.8030308@balister.org> <55C4A405.6050209@linux.intel.com>
	<55C637DB.9010106@balister.org> <55C8956D.9080508@linux.intel.com>
	<55C8F83F.4010003@balister.org> <55C9F7F2.2060502@linux.intel.com>
	<CAMKF1soCEwGMkVfHsMzp3Wt49LKQusLC8jTrYygCSsBgjHZQQw@mail.gmail.com>
	<CAJTo0LYXHLBF52jmfLF4azE-BSKj2F=9-G=8MXcFo36FgE6+0A@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
X-Enigmail-Draft-Status: N1110
Organization: Wind River Systems
Message-ID: <55CB5D0D.8050006@windriver.com>
Date: Wed, 12 Aug 2015 09:49:49 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYXHLBF52jmfLF4azE-BSKj2F=9-G=8MXcFo36FgE6+0A@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: meta-gplv2? [Was Re: parted_1.8.6.bb: add parted that not GPLv3]
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
X-List-Received-Date: Wed, 12 Aug 2015 14:49:57 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 8/11/15 3:36 PM, Burton, Ross wrote:
> 
> On 11 August 2015 at 16:46, Khem Raj <raj.khem@gmail.com
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     can we freeze this thread please.
> 
> 
> Or more usefully, reboot it.  Philip, you're turning into Koen!  Alex, if
> someone on this list asks what Poky is, 99% of the time they're trolling.  :)
> 
> The original and unanswered question was "should oe-core continue to maintain
> GPLv2 recipes where upstream has moved to GPLv3 or should those recipes move to
> a standalone layer" with various implied questions:
> 
> - If the v2 recipes move to a separate layer, who own/maintains/tests it?
> - Should there be v2 recipes for every recipe that has moved to v3, or only (as
> is now) the "more-core" recipes (currently YP tests that core-image-base builds
> without GPLv3, nothing else more complicated)
> - Should meta-gplv2 only contain recipes from oe-core, or all layers?  If other
> layers decide to hold both v3 and v2 recipes (not that I'm aware any have), what
> makes oe-core special?
> 
> I'm torn, Richard is torn.  Neither of those are useful to forming a decision. 
> Does anyone else have any *useful* feedback?

Not sure how useful, but I can give what I remember as the history behind the
GPLv2 work and my opinion as someone who has a lot of customers who don't want
GPLv3 software on the target.

Originally when this work was proposed (keeping older GPLv2 software in oe-core)
the decision was made to keep a small core set of components.  Things that the
system wouldn't work without.  I.e. coreutils, util-linux, gettext, etc..  I
believe the bar was set just above core-image-minimal.

Anything more then a small (busybox or discrete component) filesystem can
require GPLv3 and at that point it's up to others to figure out how they want to
deal with it.

So based on the original theory here, parted (GPLv2) is right on the edge of
small system or not.  It wasn't originally included because were were not
considering (embedded) systems that would have to be partition at runtime.  (I
did much of the original scoping for GPLv2 components... so at least that is why
I left it off the list.)

(opinion part) That however doesn't mean we have to just reject this as being
out of scope, but I think it does push this more toward the "not part of
oe-core" side of things.

As someone who has a lot of customers that need non-GPLv2 components for various
reasons, I would like an ecosystem for components above and beyond what is
allowed into oe-core for contributed things like this older version of parted,
but not concern is bit-rot.  If it's in oe-core, it's (generally) being used and
tested and we get discussions like this... if it's shifted off into another
layer, that layer needs a maintainer or it's going to fall away.

So I honestly don't want to move any of the existing GPLv2 items out of oe-core
at this time.. possibly someday, but not now.  Additional (old) GPLv2 versions
really should be able to go somewhere and be shared, but I don't have a good
idea as to "where".  This is an opportunity for a new layer to focus on
non-oe-core GPLv2 or possibly a layer as part of meta-openembedded.  (I'm not
sure though Martin wants to take on that, even if it turns out to be minimal
additional work.)

(rant part)
In the end for people who can't use GPLv3 for whatever reason, there really
should be a coordinated effort to either update old versions of software (GPLv2)
or simply replace the items with BSD/MIT or other appropriately sourced and
licensed code.  I just don't see much coordination beyond oe-core (and the Yocto
Project) for this kind of work -- and the most I'm willing to sign up for is to
keep what we have functional for as long as my customers need it.

--Mark

> Ross
> 
> 


