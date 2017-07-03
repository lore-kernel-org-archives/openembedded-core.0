Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id CF7896FFD8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 09:17:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Jul 2017 02:17:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,302,1496127600"; d="scan'208";a="1167501077"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jul 2017 02:17:56 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id BE97958056B;
	Mon,  3 Jul 2017 02:17:55 -0700 (PDT)
Date: Mon, 3 Jul 2017 12:06:06 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <20170703090606.GB5571@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20170630175330.33908-1-alejandro.hernandez@linux.intel.com>
	<1498848221.5259.13.camel@intel.com>
	<c36489e7-90fa-ebc5-afac-6a56525e2f35@linux.intel.com>
	<1498921790.5259.34.camel@intel.com>
	<6aef97ed-8284-039a-c780-c5b01ee8fe1a@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <6aef97ed-8284-039a-c780-c5b01ee8fe1a@linux.intel.com>
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
X-List-Received-Date: Mon, 03 Jul 2017 09:17:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 01, 2017 at 04:48:41PM -0500, Alejandro Hernandez wrote:
> 
> 
> > From the DESCRIPTION:
> >
> >         core-image-tiny-initramfs doesn't actually generate an image but
> >         rather generates boot and rootfs artifacts into a common
> >         location that can subsequently be picked up by external image
> >         generation tools such as wic.
> This is the old description, when it was though that we would have a common
> artifacts directory, which never happened due to some changes in wic
> last year

Can you elaborate on this please?


I'm still thinking that having a common artifacts directory is what we
should aim for. And DEPLOY_DIR_IMAGE is a good candidate for it as most
of artifacts are already there.

--
Regards,
Ed

