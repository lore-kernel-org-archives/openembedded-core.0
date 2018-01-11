Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 308C878848
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 05:46:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Jan 2018 21:46:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,343,1511856000"; 
   d="scan'208";a="8890780"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga008.fm.intel.com with ESMTP; 10 Jan 2018 21:46:43 -0800
From: rebecca.swee.fun.chang@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jan 2018 13:41:10 +0800
Message-Id: <cover.1515648396.git.rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/5] Enable wic in eSDK
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
X-List-Received-Date: Thu, 11 Jan 2018 05:46:43 -0000

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

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


The following changes since commit 205cfd702190026e64eed9cae27c05ff62d1637e:

  bitbake: fetch2/__init__: Disable pseudo in runfetchcmd() (2018-01-08 08:48:54 +0000)

are available in the git repository at:

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
2.7.4


