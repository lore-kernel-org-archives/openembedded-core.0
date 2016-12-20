Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9A4BB73190
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 13:07:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 20 Dec 2016 05:07:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,378,1477983600"; d="scan'208";a="800450239"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Dec 2016 05:07:05 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id F06766A4006;
	Tue, 20 Dec 2016 05:06:15 -0800 (PST)
Date: Tue, 20 Dec 2016 15:06:51 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Jair Gonzalez <jair.de.jesus.gonzalez.plascencia@linux.intel.com>
Message-ID: <20161220130651.GA16237@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1482179865.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1482179865.git.jair.de.jesus.gonzalez.plascencia@linux.intel.com>
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
X-List-Received-Date: Tue, 20 Dec 2016 13:07:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 19, 2016 at 03:07:30PM -0600, Jair Gonzalez wrote:
> Changed in V2:
> 
> The original patch was splitted and updated according to the discussion on:
> http://lists.openembedded.org/pipermail/openembedded-core/2016-December/130131.html
> NOTE: The WKS_FILE entry deletion was ommitted from this patch set as it
> was introduced on the first patch by mistake.
> 
> The following changes since commit 573c646d4cc62dcd0c230381df4940bdf314d495:
> 
>   bitbake: BBHandler: use with instead of open/close (2016-12-16 10:23:24 +0000)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib jairglez/wictest
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jairglez/wictest
> 
> Jair Gonzalez (4):
>   selftest/wic: adding Testopia ID numbers to test cases missing it
>   selftest/wic: code cleanup
>   selftest/wic: reorganizing test methods by functionality
>   selftest/wic: extending test coverage for WIC script options
> 
>  meta/lib/oeqa/selftest/wic.py | 370 +++++++++++++++++++++++++++---------------
>  1 file changed, 238 insertions(+), 132 deletions(-)
> 

Thank you for the updated patchset!
It looks good to me.

BTW, did you measure its impact on the test run time?

--
Regards,
Ed

