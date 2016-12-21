Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 18899731B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 13:06:29 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2016 05:06:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,383,1477983600"; d="scan'208";a="45358587"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 21 Dec 2016 05:06:30 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 3C0E56A4080;
	Wed, 21 Dec 2016 05:05:41 -0800 (PST)
Date: Wed, 21 Dec 2016 15:06:16 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Message-ID: <20161221130616.GB9628@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1482179865.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
	<20161220130651.GA16237@linux.intel.com>
	<017801d25b0c$fbd79330$f386b990$@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <017801d25b0c$fbd79330$f386b990$@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/4] selftest/wic: extending test coverage for WIC script options
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
X-List-Received-Date: Wed, 21 Dec 2016 13:06:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 20, 2016 at 04:04:06PM -0600, Jair Gonzalez wrote:
> > -----Original Message-----
> > From: Ed Bartosh [mailto:ed.bartosh@linux.intel.com]
> > Sent: Tuesday, December 20, 2016 7:07 AM
> > To: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH v2 0/4] selftest/wic: extending test
> coverage
> > for WIC script options
> > 
> > On Mon, Dec 19, 2016 at 03:07:30PM -0600, Jair Gonzalez wrote:
> > > Changed in V2:
> > >
> > > The original patch was splitted and updated according to the
> discussion on:
> > > http://lists.openembedded.org/pipermail/openembedded-core/2016-
> > Decembe
> > > r/130131.html
> > > NOTE: The WKS_FILE entry deletion was ommitted from this patch set as
> > > it was introduced on the first patch by mistake.
> > >
> > > The following changes since commit
> > 573c646d4cc62dcd0c230381df4940bdf314d495:
> > >
> > >   bitbake: BBHandler: use with instead of open/close (2016-12-16
> > > 10:23:24 +0000)
> > >
> > > are available in the git repository at:
> > >
> > >   git://git.yoctoproject.org/poky-contrib jairglez/wictest
> > >
> > > http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jairglez/wict
> > > est
> > >
> > > Jair Gonzalez (4):
> > >   selftest/wic: adding Testopia ID numbers to test cases missing it
> > >   selftest/wic: code cleanup
> > >   selftest/wic: reorganizing test methods by functionality
> > >   selftest/wic: extending test coverage for WIC script options
> > >
> > >  meta/lib/oeqa/selftest/wic.py | 370
> > > +++++++++++++++++++++++++++---------------
> > >  1 file changed, 238 insertions(+), 132 deletions(-)
> > >
> > 
> > Thank you for the updated patchset!
> > It looks good to me.
> > 
> > BTW, did you measure its impact on the test run time?
> > 
> > --
> > Regards,
> > Ed
> 
> Hi Ed,
> 
> Thanks. Regarding the impact, I tested it on my local machine after cleaning
> the cache, sstate-cache, downloads and tmp directories, and the difference
> between them was about 130 seconds after I applied my commits:
> Before:
> Ran 28 tests in 4446.939s
> After:
> Ran 39 tests in 4578.604s
> Difference:
> 131.665s
> 
> I also tried with a source repository with existing cache and the difference
> was about 70 seconds:
> Before:
> Ran 28 tests in 272.170s
> After:
> Ran 39 tests in 339.637s
> Difference:
> 67.467s
> 

Hi Jair,

Thanks. The difference is acceptable from my point of view.

--
Regards,
Ed

