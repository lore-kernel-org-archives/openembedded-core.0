Return-Path: <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 548F977293
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 22:04:05 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 20 Dec 2016 14:04:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,380,1477983600"; d="scan'208";a="914560936"
Received: from unknown (HELO jairdejeMOBL3) ([10.219.17.161])
	by orsmga003.jf.intel.com with ESMTP; 20 Dec 2016 14:04:06 -0800
From: "Jair Gonzalez" <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
To: <ed.bartosh@linux.intel.com>
References: <cover.1482179865.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
	<20161220130651.GA16237@linux.intel.com>
In-Reply-To: <20161220130651.GA16237@linux.intel.com>
Date: Tue, 20 Dec 2016 16:04:06 -0600
Message-ID: <017801d25b0c$fbd79330$f386b990$@linux.intel.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AQENfEXZdq3vBWuYHf6ggoc4nGhIQAKDKCqFAo354V8=
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTVhODc2NTUtMzc1YS00YmRiLTk4M2ItOGZiN2MwODFlNDU0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6Iit4bmh1aU8rZHRnRTVJV3Axb3RHSVVvVndWaFN1cWE5blwvMG5TbGlkSTFrPSJ9
x-ctpclassification: CTP_IC
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
X-List-Received-Date: Tue, 20 Dec 2016 22:04:07 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

> -----Original Message-----
> From: Ed Bartosh [mailto:ed.bartosh@linux.intel.com]
> Sent: Tuesday, December 20, 2016 7:07 AM
> To: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH v2 0/4] selftest/wic: extending test
coverage
> for WIC script options
> 
> On Mon, Dec 19, 2016 at 03:07:30PM -0600, Jair Gonzalez wrote:
> > Changed in V2:
> >
> > The original patch was splitted and updated according to the
discussion on:
> > http://lists.openembedded.org/pipermail/openembedded-core/2016-
> Decembe
> > r/130131.html
> > NOTE: The WKS_FILE entry deletion was ommitted from this patch set as
> > it was introduced on the first patch by mistake.
> >
> > The following changes since commit
> 573c646d4cc62dcd0c230381df4940bdf314d495:
> >
> >   bitbake: BBHandler: use with instead of open/close (2016-12-16
> > 10:23:24 +0000)
> >
> > are available in the git repository at:
> >
> >   git://git.yoctoproject.org/poky-contrib jairglez/wictest
> >
> > http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jairglez/wict
> > est
> >
> > Jair Gonzalez (4):
> >   selftest/wic: adding Testopia ID numbers to test cases missing it
> >   selftest/wic: code cleanup
> >   selftest/wic: reorganizing test methods by functionality
> >   selftest/wic: extending test coverage for WIC script options
> >
> >  meta/lib/oeqa/selftest/wic.py | 370
> > +++++++++++++++++++++++++++---------------
> >  1 file changed, 238 insertions(+), 132 deletions(-)
> >
> 
> Thank you for the updated patchset!
> It looks good to me.
> 
> BTW, did you measure its impact on the test run time?
> 
> --
> Regards,
> Ed

Hi Ed,

Thanks. Regarding the impact, I tested it on my local machine after cleaning
the cache, sstate-cache, downloads and tmp directories, and the difference
between them was about 130 seconds after I applied my commits:
Before:
Ran 28 tests in 4446.939s
After:
Ran 39 tests in 4578.604s
Difference:
131.665s

I also tried with a source repository with existing cache and the difference
was about 70 seconds:
Before:
Ran 28 tests in 272.170s
After:
Ran 39 tests in 339.637s
Difference:
67.467s

Regards,
Jair


