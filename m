Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 16FEA60190
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 12:56:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jul 2017 05:56:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,303,1496127600"; d="scan'208";a="1147311840"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 03 Jul 2017 05:56:14 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id BB01C58028D;
	Mon,  3 Jul 2017 05:56:13 -0700 (PDT)
Date: Mon, 3 Jul 2017 15:44:24 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Message-ID: <20170703124424.GA5790@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20170630175330.33908-1-alejandro.hernandez@linux.intel.com>
	<20170703083602.GA5532@linux.intel.com>
	<1499074073.5259.74.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <1499074073.5259.74.camel@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bootimg-efi.py: Use IMGDEPLOYDIR instead of DEPLOY_DIR_IMAGE for initrd
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
X-List-Received-Date: Mon, 03 Jul 2017 12:56:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 03, 2017 at 11:27:53AM +0200, Patrick Ohly wrote:
> On Mon, 2017-07-03 at 11:36 +0300, Ed Bartosh wrote:
> > On Fri, Jun 30, 2017 at 10:53:30AM -0700, Alejandro Hernandez wrote:
> > > When using wic to create an image from a certain build, wic is expecting
> > > to find initrd at the final destination of our images (DEPLOY_DIR_IMAGE),
> > > which is wrong, since the initrd file has not been copied to the final
> > > directory yet,
> > 
> > Is it possible to ensure that initrd is deployed before wic is run by
> > making do_image_wic depend on initrd deploy task?
> 
> Not in this case, because both do_image_wic and do_image_cpio share the
> same deploy task.

Now I understand what's going on here. Basically Alejandro is trying to
use one format of the same image in another. It's like trying to put
.wic image inside ext2 image or something similar.

I believe it doesn't fit current design of oe image creation system.
I'd suggest to use different image recipes to achieve this.

--
Regards,
Ed

