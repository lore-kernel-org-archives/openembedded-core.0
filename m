Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6AEF3606CB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2016 15:07:42 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP; 02 Dec 2016 07:06:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,287,1477983600"; d="scan'208";a="198300670"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 02 Dec 2016 07:06:07 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 741996A4080;
	Fri,  2 Dec 2016 07:05:22 -0800 (PST)
Date: Fri, 2 Dec 2016 17:05:36 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <20161202150536.GA23998@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1480069993.6873.98.camel@intel.com>
	<f1699a69-1949-9cb3-8bef-adf9b68f385b@mender.io>
	<20161125163103.GA4830@linux.intel.com>
	<e29489aa-8303-d8ac-be67-93d650d09f6d@mender.io>
	<20161128105236.GB15660@linux.intel.com>
	<ae35149f-dc2d-fea5-e59e-a65dd3dce0ec@mender.io>
	<20161128111825.GA16035@linux.intel.com>
	<420c72b7-b5dd-14f3-a4b0-c57eb3512252@mender.io>
	<20161130152923.GA4811@linux.intel.com>
	<6132a02c-5934-8680-5970-3455f5af1842@mender.io>
MIME-Version: 1.0
In-Reply-To: <6132a02c-5934-8680-5970-3455f5af1842@mender.io>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v1] wic: Add --exclude-path option to rootfs source plugin.
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
X-List-Received-Date: Fri, 02 Dec 2016 15:07:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 02, 2016 at 03:36:47PM +0100, Kristian Amlie wrote:
> On 30/11/16 16:29, Ed Bartosh wrote:
> >> ...
> > 
> > You're right. oe-selftest requires qemux86-64 target.
> > 
> > Even if you usually work in different environment it makes sense to run
> > oe-selftest to ensure that your changes don't breake it.
> > This is because our maintainers use oe-selftest results as one of the
> > acceptance criterias. It means that your changes would be be rejected anyway
> > if they break oe-selftest, so it's better to check it in advance.
> 
> This is taking some time due to unrelated issues, but in the meantime:
> 
> What are the thoughts on having a similar --exclude-path mechanism for
> the standard rootfs building? IOW, the do_image_ext4 and friends?

That's a great idea! If source rootfs direcotry contains only requred
content then we don't even need to change wic code. It's much better
then implementing the same functionality in wic and in oe code.

> Our usecase is that we use wic to build a complete image, using
> --exclude-path to group things into partitions. And then we want to
> build a regular ext4 image and use this as an update to the device, and
> in this case we want the same content as wic generates, but in a raw
> rootfs file instead.

--
Regards,
Ed

