Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AC463787F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 15:00:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jan 2018 07:00:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,344,1511856000"; d="scan'208";a="192926943"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga005.jf.intel.com with ESMTP; 11 Jan 2018 07:00:45 -0800
From: rebecca.swee.fun.chang@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jan 2018 22:55:18 +0800
Message-Id: <cover.1515681706.git.rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.15.0
Subject: [PATCHv2 0/5] Enable wic in eSDK
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
X-List-Received-Date: Thu, 11 Jan 2018 15:00:45 -0000

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

Hi all,

Resend as v2 as I realized an issue with BUILDDIR being set
was not correct. I made the correction on Patch 4 by setting
BUILDDIR to sdkroot variable (eSDK base path) before we alter
the variable for bitbake executable file path.

Regards,
Rebecca

-----

Hi all,

As the subject called out: this patch series enable wic in eSDK.
The details of what I have done are documented within the commit message.
Basically wic requires an OE build environment, but we are using a
different environment setup script in eSDK. Hence, I have added some
code for wic to explicitly export bitbake variables within eSDK. I
have also make wic to use the shared code in scriptpath for oe lib
and bitbake path addition to sys.path.

I have run the changes on wic oe-selftest and the tests are passing.
What's next: I think it would better to have some test cases
for wic within eSDK if this series are merged.

Thanks.

Regards,
Rebecca


The following changes since commit 364f8bcfcbd04e722490f363ad36a15fb7066ba7:

  linux-firmware: Bump revision to 65b1c68c (2018-01-11 10:26:07 +0000)

are available in the Git repository at:

  git://push.yoctoproject.org/poky-contrib rebeccas/wic-dev

Chang Rebecca Swee Fun (5):
  scripts/wic: use scriptpath module to find bitbake path and oe lib
    path
  scripts/wic: append bitbake executable file path in eSDK environment
  scripts/wic: fix error of import wic module in eSDK environment
  scripts/wic: explicitly set BUILDDIR within eSDK
  classes/populate_sdk_ext: support wic in eSDK

 meta/classes/populate_sdk_ext.bbclass |  2 +-
 scripts/wic                           | 23 ++++++++++++++++++-----
 2 files changed, 19 insertions(+), 6 deletions(-)

-- 
2.15.0


