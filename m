Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2B83A6BF49
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 13:45:01 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Sep 2013 06:45:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,1021,1367996400"; d="scan'208";a="390939936"
Received: from unknown (HELO helios.localnet) ([10.252.123.76])
	by fmsmga001.fm.intel.com with ESMTP; 04 Sep 2013 06:45:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 04 Sep 2013 14:44:54 +0100
Message-ID: <1378304978.cEImkS9DJd@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-29-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <20130828082900.GG3544@jama>
References: <1365581101-3810-1-git-send-email-koen@dominion.thruhere.net>
	<20130828082900.GG3544@jama>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCHv2] bitbake.conf: include machine name in DEPLOY_DIR_IMAGE
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
X-List-Received-Date: Wed, 04 Sep 2013 13:45:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 28 August 2013 10:29:00 Martin Jansa wrote:
> On Wed, Apr 10, 2013 at 10:05:01AM +0200, Koen Kooi wrote:
> > This allows a clean seperation between all image outputs and making it
> > possible to have convinience symlinks to make it ready to deploy. And
> > while it isn't a valid reason, it must be mentioned: BSP layers which do
> > use convenience symlinks already don't step on files owned by others
> > anymore.
> > 
> > I assumed this was the default behaviour in OE-classic, but as it turns
> > out every DISTRO set it to deploy/images/$MACHINE on its own.
> > 
> > Code inspections shows that the all references to the image deploy dir in
> > classes and scripts in OE-core do the right thing and parse the
> > DEPLOY_DIR_IMAGE variable, except runqemu.
>
> Is there some reason why this patch didn't make it into 1.5?

I think it just got missed; looking at the changes made to runqemu I can see a 
couple of concerns (double execution of bitbake -e and one missed change to 
DEPLOY_DIR_IMAGE, albeit only in a message). I'm coming up with a revised 
version now.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

