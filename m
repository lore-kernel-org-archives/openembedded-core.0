Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 587607844B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 08:50:51 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2018 00:50:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,407,1515484800"; d="scan'208";a="204669776"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by orsmga005.jf.intel.com with ESMTP; 01 Mar 2018 00:50:51 -0800
Date: Thu, 1 Mar 2018 10:53:54 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <20180301085354.GA16642@mbabyjoh-desk.ger.corp.intel.com>
References: <cover.1519783331.git.bruce.ashfield@windriver.com>
	<800a060ed6aa52970d0672be3b63acf046abf522.1519783331.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
In-Reply-To: <800a060ed6aa52970d0672be3b63acf046abf522.1519783331.git.bruce.ashfield@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] linux-yocto/4.14/4.15: yaffs2 fixes
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
X-List-Received-Date: Thu, 01 Mar 2018 08:50:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bruce,

On Tue, Feb 27, 2018 at 09:06:54PM -0500, Bruce Ashfield wrote:
> Integrating the following fixes for yaffs2:
> 
>   9f9649fffac9 yaffs2: Adjust the timer callback and init functions
>   0ef24a829eee yaffs2: include rawnand.h instead of nand.h
> 
> Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  4 ++--
>  meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |  4 ++--
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  4 ++--
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |  4 ++--
>  meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 18 +++++++++---------
>  meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 18 +++++++++---------
>  6 files changed, 26 insertions(+), 26 deletions(-)
<snip>

For MIPS, KernelModuleTest fails in autobuilder ( probably due to this change - haven't bisected it)

https://autobuilder.yocto.io/builders/nightly-mips/builds/806/steps/Running%20Sanity%20Tests/logs/stdio

RESULTS - kernelmodule.KernelModuleTest.test_kernel_module - Testcase 1541: FAILED

NOTE: ======================================================================
| NOTE: FAIL: test_kernel_module (kernelmodule.KernelModuleTest)
| NOTE: ----------------------------------------------------------------------
| NOTE: Traceback (most recent call last):
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
|     return func(*args, **kwargs)
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
|     return func(*args, **kwargs)
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
|     return func(*args, **kwargs)
|   File "/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-mips/build/meta/lib/oeqa/runtime/cases/kernelmodule.py", line 40, in test_kernel_module
|     self.assertEqual(status, 0, msg='\n'.join([cmd, output]))
| AssertionError: 2 != 0 : cd /usr/src/kernel && make scripts
| arch/mips/Makefile:240: arch/mips/Kbuild.platforms: No such file or directory
| make: *** No rule to make target 'arch/mips/Kbuild.platforms'.  Stop.

Best Regards,
Maxin

