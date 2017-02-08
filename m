Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 02FF471D4E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 14:23:11 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 08 Feb 2017 06:23:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="62636770"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.16.172])
	by fmsmga005.fm.intel.com with ESMTP; 08 Feb 2017 06:23:10 -0800
Message-ID: <1486563789.3754.14.camel@linux.intel.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 08 Feb 2017 14:23:09 +0000
In-Reply-To: <d1db8f00-0628-233f-2793-a7240f3fa4ea@linux.intel.com>
References: <20170105163423.8776-1-joshua.g.lock@intel.com>
	<35878aed-24bd-6129-54bb-f1dd68bf09a8@linux.intel.com>
	<1b59a012-5943-d763-975f-764a6247121b@linux.intel.com>
	<1484315514.3828.2.camel@intel.com>
	<7e7e15bd-9481-efa8-80af-60300016575e@linux.intel.com>
	<1484321789.3828.7.camel@linux.intel.com>
	<d1db8f00-0628-233f-2793-a7240f3fa4ea@linux.intel.com>
X-Mailer: Evolution 3.22.4 (3.22.4-2.fc25) 
Mime-Version: 1.0
Subject: Re: [PATCH] zlib: update SRC_URI to fix fetching
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
X-List-Received-Date: Wed, 08 Feb 2017 14:23:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2017-01-13 at 17:53 +0200, Alexander Kanavin wrote:
> On 01/13/2017 05:36 PM, Joshua Lock wrote:
> 
> > Running checkpkg on the autobuilders won't really help as the
> > autobuilders rely on the bitbake invocation returning a non-zero
> > exit
> > code to determine whether to mark the build step as failed, and
> > that's
> > not the case when checkpkg doesn't find an update version.
> > 
> > If we regularly run checkpkg on the autobuilders how should we
> > detect
> > that a SRC_URI change has caused the upstream version check to
> > fail?
> 
> - run bitbake -c checkpkg world
> - inspect tmp/log/checkpkg.csv for lines with 'UNKNOWN' upstream
> status, 
> make a list of recipes that have it
> - compare that list against a stored list of exceptions (currently
> it 
> would have about 32 entries), if the lists don't match exactly, the 
> upstream version check has failed.
> 
> All of this can be wrapped in poky/scripts/upstream-check-all
> perhaps.

Thanks, I've filed a bug to track implementing this feature:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=11031

Joshua

