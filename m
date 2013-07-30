Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 0566B6007C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 15:10:22 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Jul 2013 08:10:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,778,1367996400"; d="scan'208";a="275327904"
Received: from unknown (HELO helios.localnet) ([10.252.122.217])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Jul 2013 08:10:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 30 Jul 2013 16:09:58 +0100
Message-ID: <25949827.IjnmVXh6xo@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-26-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <51F7D1BB.8010405@windriver.com>
References: <1375136787-18139-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKrC8koJjy-1P82wJ5UrP8Yqp_sQhCFDqqjsGe_Gyv-NSQ@mail.gmail.com>
	<51F7D1BB.8010405@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 30 Jul 2013 15:10:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 30 July 2013 09:46:19 Mark Hatle wrote:
> I agree with the previous folks that the design of the distribution setting
> the one and true value is the right technical answer for this.  HOWEVER, in
> my experience, this is NOT what end users want.
> 
> They want a method similar to the one posted by Otavio in order to tailor
> the system.  End users never want to create a new distribution, they simply
> want to start with one and tweak it.

Then surely an easier solution would be to advocate copy-and-modify of an 
existing distro config, and if we're not setting the value of DISTRO_FEATURES 
explicitly there (which we aren't currently in poky.conf) then we should just 
do that in order to make that easier?

I honestly think building on an existing configuration value that is not 
immediately visible and might change when the user upgrades to a new version 
of the underlying distro is not a good thing to be encouraging people to do.

> So with that said, my opinion is to enable this code, allowing end users to
> tweak their distribution settings.  But make it a stated policy that
> distribution layers should only "set" the value of DISTRO_FEATURES, and
> should never modify/update this new EXTRA_DISTRO_FEATURES value.  (Of
> course, I doubt there is a way to police that, other then state it's
> policy.)

Yes but people will just ignore that. DISTRO_FEATURES_BACKFILL has already 
been abused for similar purposes :/

> This is the same type of reason that end users was a "don't install this
> package" feature as well. While anyone can write a new image recipe, nobody
> wants to, especially when they only want one or two less packages in their
> image.

Surely the primary motivation for having the "remove" functionality [1] is the 
case when you don't know how a particular package has got in via dependencies 
and you want it removed, and not the percieved difficulty of creating an image 
recipe?

Really if people write nothing else they should be writing their own image 
recipes, because it's trivially easy to do so (or at the very least, copy an 
existing one and modify it).

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=4079

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

