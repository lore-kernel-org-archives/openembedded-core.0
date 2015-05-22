Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D1194606E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 09:23:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 22 May 2015 02:23:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,474,1427785200"; d="scan'208";a="698799456"
Received: from gfois-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.27.18])
	by orsmga001.jf.intel.com with ESMTP; 22 May 2015 02:23:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 May 2015 10:23:44 +0100
Message-ID: <2515356.amYZ7kii2B@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/3.19.7-200.fc21.x86_64; KDE/4.14.7; x86_64; ; )
In-Reply-To: <2890246.OI3iG2a5pW@peggleto-mobl.ger.corp.intel.com>
References: <555ED05A.6050102@topic.nl>
	<CAJTo0Lb5HwZdVn0CdTWshR1xsOmoMoujuMJWW6pbYxDTEA4DvQ@mail.gmail.com>
	<2890246.OI3iG2a5pW@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Alexander Kanavin <alexander.kanavin@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: "packagegroup-core-qt4e" broken?
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
X-List-Received-Date: Fri, 22 May 2015 09:23:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 22 May 2015 10:17:14 Paul Eggleton wrote:
> On Friday 22 May 2015 09:56:32 Burton, Ross wrote:
> > On 22 May 2015 at 07:44, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> > > When building (just for having something on my display)
> > > "qt4e-demo-image",
> > > 
> > > it bailed out with the following error:
> > >  * satisfy_dependencies_for: Cannot satisfy the following dependencies
> > >  for
> > > 
> > > packagegroup-core-qt4e:
> > >  *      qt4-embedded-plugin-phonon-backend-gstreamer *
> > >  * opkg_install_cmd: Cannot install package packagegroup-core-qt4e.
> > > 
> > > I guess this is related to all the gstreamer changes lately?
> > 
> > I wonder how did the world build I did *yesterday* worked? :/
> 
> In order to see this you'd have to have actually installed this package into
> an image, but then a world build ought to have included qt4e-demo-image
> which should have included this, so I'm not sure either...

Oh wait, all images are excluded from world builds by way of 
EXCLUDE_FROM_WORLD = "1" in image.bbclass, I forgot about that. I guess 
there's your explanation.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

