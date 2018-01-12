Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A4B697884F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jan 2018 11:02:19 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jan 2018 03:02:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,348,1511856000"; 
   d="scan'208";a="9077134"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga007.fm.intel.com with ESMTP; 12 Jan 2018 03:02:20 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id A856F58057E;
	Fri, 12 Jan 2018 03:02:19 -0800 (PST)
Date: Fri, 12 Jan 2018 11:20:59 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: rebecca.swee.fun.chang@intel.com
Message-ID: <20180112092059.3sja5c337jinx4nv@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1515681706.git.rebecca.swee.fun.chang@intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1515681706.git.rebecca.swee.fun.chang@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20170421 (1.8.2)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 0/5] Enable wic in eSDK
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
X-List-Received-Date: Fri, 12 Jan 2018 11:02:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 11, 2018 at 10:55:18PM +0800, rebecca.swee.fun.chang@intel.com wrote:
> Hi all,
> 
> As the subject called out: this patch series enable wic in eSDK.
> The details of what I have done are documented within the commit message.
> Basically wic requires an OE build environment, but we are using a
> different environment setup script in eSDK. Hence, I have added some
> code for wic to explicitly export bitbake variables within eSDK. I
> have also make wic to use the shared code in scriptpath for oe lib
> and bitbake path addition to sys.path.
> 
> I have run the changes on wic oe-selftest and the tests are passing.
> What's next: I think it would better to have some test cases
> for wic within eSDK if this series are merged.
> 

Would it make sense to cover this new functionality by tests?

> 
> The following changes since commit 364f8bcfcbd04e722490f363ad36a15fb7066ba7:
> 
>   linux-firmware: Bump revision to 65b1c68c (2018-01-11 10:26:07 +0000)
> 
> are available in the Git repository at:
> 
>   git://push.yoctoproject.org/poky-contrib rebeccas/wic-dev
> 
> Chang Rebecca Swee Fun (5):
>   scripts/wic: use scriptpath module to find bitbake path and oe lib
>     path
>   scripts/wic: append bitbake executable file path in eSDK environment
>   scripts/wic: fix error of import wic module in eSDK environment
>   scripts/wic: explicitly set BUILDDIR within eSDK
>   classes/populate_sdk_ext: support wic in eSDK
> 
>  meta/classes/populate_sdk_ext.bbclass |  2 +-
>  scripts/wic                           | 23 ++++++++++++++++++-----
>  2 files changed, 19 insertions(+), 6 deletions(-)
> 
> -- 
> 2.15.0
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
--
Regards,
Ed

