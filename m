Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 77CF571A77
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2016 15:30:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 30 Nov 2016 07:29:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,574,1473145200"; d="scan'208";a="1092644393"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 30 Nov 2016 07:29:59 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id CCD7A6A4080;
	Wed, 30 Nov 2016 07:29:14 -0800 (PST)
Date: Wed, 30 Nov 2016 17:29:23 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <20161130152923.GA4811@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1480068955-17053-1-git-send-email-kristian.amlie@mender.io>
	<1480069993.6873.98.camel@intel.com>
	<f1699a69-1949-9cb3-8bef-adf9b68f385b@mender.io>
	<20161125163103.GA4830@linux.intel.com>
	<e29489aa-8303-d8ac-be67-93d650d09f6d@mender.io>
	<20161128105236.GB15660@linux.intel.com>
	<ae35149f-dc2d-fea5-e59e-a65dd3dce0ec@mender.io>
	<20161128111825.GA16035@linux.intel.com>
	<420c72b7-b5dd-14f3-a4b0-c57eb3512252@mender.io>
MIME-Version: 1.0
In-Reply-To: <420c72b7-b5dd-14f3-a4b0-c57eb3512252@mender.io>
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
X-List-Received-Date: Wed, 30 Nov 2016 15:30:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 30, 2016 at 02:30:12PM +0100, Kristian Amlie wrote:
> On 28/11/16 12:18, Ed Bartosh wrote:
> > I'd appreciate if you also do the following before sending v2:
> >  - check that your code doesn't regress pylint checks
> 
> Is there an official process here? Sorry, it's not very well documented.
No official process yet, I'm sorry. I can put it on wiki if it helps.

> Just running pylint3 manually on the scripts/lib/wic folder gives
> identical results, however, running on rootfs.py alone, the rating
> increases:
> 
>   Your code has been rated at 5.67/10 (previous run: 2.26/10, +3.41)
Looks good to me. Thanks.
Running pylint on the files you've changed before and after the changes should be enough.

> >  - add test case for your code to meta/lib/oeqa/selftest/wic.py
> >  - check that your code doesn't break oe-selftest --coverage -r wic and
> >    doesn't regress test coverage
> 
> In the interest of saving me some build time, am I correct in assuming
> that I need the "qemux86-64" MACHINE target for this to work? It appears
> to be dependent on syslinux which has COMPATIBLE_HOSTS set to non-arm
> only. Sorry, I'm a bit new to this framework.
> 

You're right. oe-selftest requires qemux86-64 target.

Even if you usually work in different environment it makes sense to run
oe-selftest to ensure that your changes don't breake it.
This is because our maintainers use oe-selftest results as one of the
acceptance criterias. It means that your changes would be be rejected anyway
if they break oe-selftest, so it's better to check it in advance.

--
Regards,
Ed

