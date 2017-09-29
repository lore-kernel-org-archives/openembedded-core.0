Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 26CA5779C6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 14:22:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 29 Sep 2017 07:22:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,452,1500966000"; d="scan'208";a="1200439299"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 29 Sep 2017 07:22:48 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id D42B45802BB;
	Fri, 29 Sep 2017 07:22:47 -0700 (PDT)
Date: Fri, 29 Sep 2017 17:21:02 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20170929142102.int56ejorufnkh4v@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1506531609-5917-1-git-send-email-trini@konsulko.com>
	<20170929111621.is7opcm5chmk5czu@linux.intel.com>
	<20170929123652.GV3112@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20170929123652.GV3112@bill-the-cat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20170421 (1.8.2)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image_types: Fix bmaptool support for RSS
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
X-List-Received-Date: Fri, 29 Sep 2017 14:22:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 29, 2017 at 08:36:52AM -0400, Tom Rini wrote:
> On Fri, Sep 29, 2017 at 02:16:21PM +0300, Ed Bartosh wrote:
> > On Wed, Sep 27, 2017 at 01:00:09PM -0400, Tom Rini wrote:
> > > With RSS we need to ensure that when making a bmap image that the
> > > python3 that we created is found via /usr/bin/env rather than the host
> > > python3.  Otherwise we're relying on the build host to have bmaptool
> > > support installed.
> > > 
> > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > ---
> > > I played around with a few ways to try and fix this problem, and this
> > > was the best I could come up with.  Once this is in we need this in pyro
> > > as well as it's broken there too.
> > > ---
> > >  meta/classes/image_types.bbclass | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> > > index 61dca626311e..3ff960e3a889 100644
> > > --- a/meta/classes/image_types.bbclass
> > > +++ b/meta/classes/image_types.bbclass
> > > @@ -311,3 +311,6 @@ DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso"
> > >  # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
> > >  # images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hdddirect, hddimg, iso, etc.
> > >  IMAGE_TYPES_MASKED ?= ""
> > > +
> > > +# bmap requires python3 to be in the PATH
> > > +EXTRANATIVEPATH += "${@'python3-native' if d.getVar('IMAGE_FSTYPES').find('bmap') else ''}"
> > 
> > +1
> > 
> > Would ...find('.bmap') be a bit more safe?
> 
> Could be.  Do I need to v2 or can someone just fix up while applying?

Please send v2.

--
Regards,
Ed

