Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4A0C760721
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 08:58:38 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 29 Jul 2016 01:58:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,438,1464678000"; d="scan'208";a="741404079"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Jul 2016 01:58:39 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id A005A6A4080;
	Fri, 29 Jul 2016 01:58:26 -0700 (PDT)
Date: Fri, 29 Jul 2016 11:22:09 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160729082209.GA32340@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1469623667.git.ed.bartosh@linux.intel.com>
	<0dacdf96b1ac7c9c2bcd0071a0b8d88fcc6231d5.1469623667.git.ed.bartosh@linux.intel.com>
	<1469738564.9142.17.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1469738564.9142.17.camel@linuxfoundation.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 1/4] image.bbclass: fix dependency calculation when using conversion chaining
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
X-List-Received-Date: Fri, 29 Jul 2016 08:58:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 28, 2016 at 09:42:44PM +0100, Richard Purdie wrote:
> On Wed, 2016-07-27 at 15:51 +0300, Ed Bartosh wrote:
> > From: Patrick Ohly <patrick.ohly@intel.com>
> > 
> > When using conversion chaining (for example example: .dsk.vdi.xz),
> > the imagetypes_getdepends() did not properly detect all compression
> > commands (thus skipping the corresponding COMPRESS_DEPENDS) and
> > the base type, leading to missing dependencies of the image's
> > do_rootfs
> > task.
> > 
> > This is not a big problem in practice because in those cases where
> > conversion chaining is useful (as in the example above), the missing
> > dependency is qemu-native, which typically gets built anyway.
> > 
> > imagetypes_getdepends() had hard-coded special treatment for certain
> > image types. This gets replaced with setting the normal IMAGE_DEPENDS
> > variables for these types.
> > 
> > [YOCTO #9076]
> > 
> > Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> 
> This patch has come in multiple times and each time I look at it I ask
> that it be checked against changes that happened in parallel since I
> believe there is something "not right" in the merge. Its not an easy
> one to review as it makes several different kinds of changes.
> 
> I just spent a while comparing the changes and it removes the reference
> to IMAGE_FSTYPES_DEBUGFS so I do believe this patch *does* cause at
> least one regression. Whether there are other issues its really hard to
> say.
> 
> Can someone try and perhaps make the diff more obvious and split it up?
> 
Thank you for the review.

I'll try to split this patch later. For now I'm going to remove it from
the patchset.

--
Regards,
Ed

