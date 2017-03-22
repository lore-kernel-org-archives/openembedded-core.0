Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C007377A8D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 12:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490184671; x=1521720671;
	h=date:from:to:cc:subject:message-id:reply-to:references:
	mime-version:in-reply-to;
	bh=wfkLT5boQQhqxeRw9oTvEQ6Z25RqaW5w/F+QO9GZhuo=;
	b=pTMQtrt+U71R54DgL9dF9jEVKvEQu1NPGHhiBi8zUcoe1Qd7dfhal2q4
	eyKhTN12dm2ci/jUrzrhougTvTkziA==;
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2017 05:11:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,205,1486454400"; d="scan'208";a="78158624"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 22 Mar 2017 05:11:11 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 73B4E2C8002;
	Wed, 22 Mar 2017 05:11:04 -0700 (PDT)
Date: Wed, 22 Mar 2017 14:10:58 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Maciej Borzecki <maciej.borzecki@rndity.com>
Message-ID: <20170322121058.GA29465@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <20170317144027.GA22297@linux.intel.com>
	<cover.1490095649.git.maciej.borzecki@rndity.com>
MIME-Version: 1.0
In-Reply-To: <cover.1490095649.git.maciej.borzecki@rndity.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 0/5] wic: selftest: enhancements for non-x86 MACHINE support & fixed-size tests
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
X-List-Received-Date: Wed, 22 Mar 2017 12:11:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Maciej,

The patchset looks great! Thank you!


On Tue, Mar 21, 2017 at 12:35:00PM +0100, Maciej Borzecki wrote:
> v4 of a series with enhancements and new test cases for wic selftest.
> The enhancements allow for running wic selftest for non-x86 MACHINE,
> such as qemuarm (the whole series was verified on qemux86-64 and
> qemuarm).
> 
> The first patch adds a machine independent kickstart file - wictestdisk.
> Most of test cases build a disk image using one of the kickstart files
> shipped in Poky (mostly directdisk. These are usually x86 oriented due
> to use of syslinux and cannot be used when running with non-x86
> compatible MACHINE. On the other hand, the image built during tests does
> not need to be bootable (with exception of TCs that verify if the image
> is indeed bootable).
> 
> Patch 2 introduces wictestdisk in test cases where its use is possible.
> 
> Patch 3 adds only_for_arch() convenience decorator and applies it to test
> cases where x86 specific image must be used. In the end, only 13 TCs are
> skipped on qemuarm.
> 
> Changes from previous version:
> - renamed onlyForArch() to only_for_arch(), changed input arguments to
>   take image name and list of compatible architectures
> - pylint fixes
> 
> Patch 4 removes some assumptions about kernel image type.
> 
> Patch 5 adds tests for --fixed-size partition flags.
> 
> Changes from previous version:
> - pylint fixes
> 
> Maciej Borzecki (5):
>   selftest: wictestdisk: machine agnostic WKS for use with selftest
>   selftest: wic: replace directdisk with wictestdisk where possible
>   wic: selftest: avoid COMPATIBLE_HOST issues
>   wic: selftest: do not assume bzImage kernel image
>   wic: selftest: add tests for --fixed-size partition flags
> 
>  meta-selftest/wic/wictestdisk.wks |   7 ++
>  meta/lib/oeqa/selftest/wic.py     | 171 ++++++++++++++++++++++++++++++--------
>  2 files changed, 144 insertions(+), 34 deletions(-)
>  create mode 100644 meta-selftest/wic/wictestdisk.wks
> 
> -- 
> 2.9.3
> 

-- 
--
Regards,
Ed

