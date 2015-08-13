Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id A18B173D64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 09:59:17 +0000 (UTC)
Received: by lbcbn3 with SMTP id bn3so23956010lbc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 02:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=8WkeALux0aRNkZDbg4e0QRrkPbN557vbsq39hcVlTNo=;
	b=OMDL7JjF1skgiRYvC/U9305fWiEpWBI2W0XcAB7oSy8WWd+6oAApD2c+5quB+/g4VH
	0DEaEQbP5ncZf7U2IK73jK3b4Uqsyqy4dkMLpeX3lTK9DkrAS9LPRfu1EUS9eFrKOSlB
	uYD56gdRp8snJlyu7FPN/ldaZdZok91Tk9V7+m7lfyt1/fFCBtszux7NJm9D3kOZHMd/
	G0NcijMle4kvM6OP9MrJwJRFAHXemzpxdSQndiq8o5O6BnRM9fRhx8Bb2TsDEH5CFofA
	39d98blqmwtfIlvdeDj7RrYQKb5qfUuKCnmXTqYStTeHgNT3mhzAHFpjE/1QRqQCrvgt
	k86Q==
X-Gm-Message-State: ALoCoQk+82SIxK67kxrKEOMTVZDm4LQ8keAw1K1sxjYha3gU10/lcvFvTuI9mWh9ZpbasztbdO7G
X-Received: by 10.152.170.130 with SMTP id am2mr35897542lac.54.1439459956284; 
	Thu, 13 Aug 2015 02:59:16 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84]) by smtp.gmail.com with ESMTPSA id
	jc10sm421296lac.12.2015.08.13.02.59.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Aug 2015 02:59:15 -0700 (PDT)
Date: Thu, 13 Aug 2015 11:59:14 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20150813095914.GF15357@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <CAMKF1srWcMoRui4kqRY5vCdLd-SPQ+EMihTci=NUghHsnGiBqQ@mail.gmail.com>
	<55C477AE.8030308@balister.org> <55C4A405.6050209@linux.intel.com>
	<55C637DB.9010106@balister.org> <55C8956D.9080508@linux.intel.com>
	<55C8F83F.4010003@balister.org> <55C9F7F2.2060502@linux.intel.com>
	<CAMKF1soCEwGMkVfHsMzp3Wt49LKQusLC8jTrYygCSsBgjHZQQw@mail.gmail.com>
	<CAJTo0LYXHLBF52jmfLF4azE-BSKj2F=9-G=8MXcFo36FgE6+0A@mail.gmail.com>
	<55CB5D0D.8050006@windriver.com>
MIME-Version: 1.0
In-Reply-To: <55CB5D0D.8050006@windriver.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
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
X-List-Received-Date: Thu, 13 Aug 2015 09:59:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Mark Hatle <mark.hatle@windriver.com> [150812 16:50]:

> On 8/11/15 3:36 PM, Burton, Ross wrote:

> > Or more usefully, reboot it.  Philip, you're turning into Koen!  Alex, if
> > someone on this list asks what Poky is, 99% of the time they're trolling.  :)

> > The original and unanswered question was "should oe-core continue to maintain
> > GPLv2 recipes where upstream has moved to GPLv3 or should those recipes move to
> > a standalone layer" with various implied questions:

> > - If the v2 recipes move to a separate layer, who own/maintains/tests it?
> > - Should there be v2 recipes for every recipe that has moved to v3, or only (as
> > is now) the "more-core" recipes (currently YP tests that core-image-base builds
> > without GPLv3, nothing else more complicated)
> > - Should meta-gplv2 only contain recipes from oe-core, or all layers?  If other
> > layers decide to hold both v3 and v2 recipes (not that I'm aware any have), what
> > makes oe-core special?

> > I'm torn, Richard is torn.  Neither of those are useful to forming a decision. 
> > Does anyone else have any *useful* feedback?

> Not sure how useful, but I can give what I remember as the history behind the
> GPLv2 work and my opinion as someone who has a lot of customers who don't want
> GPLv3 software on the target.

I'm basically agreeing with Mark, as quite often, customers want a
non-GPLv3 image (and this is one of the strong selling points during
training sessions on OpenEmbedded / Yocto Project, that we have the
INCOMPATIBLE_LICENSE option). And having that option, and testing it,
requires that we have at least enough for a core-image-minimal to be
built and deployed.

I'm also using non-GPLv3 builds internally, for the same reasons...

From reading earlier discussions, when recipe updates are proposed,
which replaces GPLv2-versions with GPLv3-versions, there usually are a
few people complaining (if they notice the change).

> Originally when this work was proposed (keeping older GPLv2 software in oe-core)
> the decision was made to keep a small core set of components.  Things that the
> system wouldn't work without.  I.e. coreutils, util-linux, gettext, etc..  I
> believe the bar was set just above core-image-minimal.

> Anything more then a small (busybox or discrete component) filesystem can
> require GPLv3 and at that point it's up to others to figure out how they want to
> deal with it.

> So based on the original theory here, parted (GPLv2) is right on the edge of
> small system or not.  It wasn't originally included because were were not
> considering (embedded) systems that would have to be partition at runtime.  (I
> did much of the original scoping for GPLv2 components... so at least that is why
> I left it off the list.)

> (opinion part) That however doesn't mean we have to just reject this as being
> out of scope, but I think it does push this more toward the "not part of
> oe-core" side of things.

Sure, we need to revise that "core" part, and which of the components
are required in order to really state that we can support non-GPLv3
builds. Both as SW migrates from GPLv2 -> GPLv3, but also as HW and
system changes, as that might make new applications "really core".

> As someone who has a lot of customers that need non-GPLv2 components for various
> reasons, I would like an ecosystem for components above and beyond what is
> allowed into oe-core for contributed things like this older version of parted,
> but not concern is bit-rot.  If it's in oe-core, it's (generally) being used and
> tested and we get discussions like this... if it's shifted off into another
> layer, that layer needs a maintainer or it's going to fall away.

Yep, it's that part, the testing of non-GPLv3 builds that's so
attrictive to a lot of potential new-comers.

> So I honestly don't want to move any of the existing GPLv2 items out of oe-core
> at this time.. possibly someday, but not now.  

I have to agree with Mark here; the GPLv2 components in oe-core should
really stay in core at this time. (And for quite some time)

> Additional (old) GPLv2 versions
> really should be able to go somewhere and be shared, but I don't have a good
> idea as to "where".  This is an opportunity for a new layer to focus on
> non-oe-core GPLv2 or possibly a layer as part of meta-openembedded.  (I'm not
> sure though Martin wants to take on that, even if it turns out to be minimal
> additional work.)

Sure, a meta-legacy or meta-gplv2 layer for the rest of non-core
applications and libraries would likely be a good idea. The main
question is as always, can we get enough to help maintain that stuff.

> (rant part)
> In the end for people who can't use GPLv3 for whatever reason, there really
> should be a coordinated effort to either update old versions of software (GPLv2)
> or simply replace the items with BSD/MIT or other appropriately sourced and
> licensed code.  I just don't see much coordination beyond oe-core (and the Yocto
> Project) for this kind of work -- and the most I'm willing to sign up for is to
> keep what we have functional for as long as my customers need it.

Cheers,
Anders

-- 
Anders Darander
ChargeStorm AB / eStorm AB

