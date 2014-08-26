Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2634C70F5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 08:00:29 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 26 Aug 2014 01:00:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="377019617"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2014 00:56:05 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id 2A5B62C8001;
	Tue, 26 Aug 2014 00:59:31 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Aug 2014 13:05:40 +0300
Message-Id: <1409047544-7026-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH 0/4] Create target sdk manifest file and use it for automated sdk testing
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
X-List-Received-Date: Tue, 26 Aug 2014 08:00:34 -0000

In order to automatically determine what packages are present in the target sdk, we needed a target sdk manifest file, similar to the one created for machine images rootfs. 
Also, in order to enable the testsdk task to skip modules, some changes and additions had to be made.

Corneliu Stoicescu (4):
  classes/populate_sdk_base.bbclass: add a manifest for target sdk
  classes/testimage.bbclass: add more fields to the sdk TestContext
  oeqa/oetest.py: enable sdk tests to use hasFeature and hasPackage
    methods.
  oeqa/sdk/buildsudoku.py: add setUpModule method to run only when gtk+
    in installed.

 meta/classes/populate_sdk_base.bbclass | 12 ++++++++++++
 meta/classes/testimage.bbclass         |  8 ++++++++
 meta/lib/oeqa/oetest.py                |  4 ++--
 meta/lib/oeqa/sdk/buildsudoku.py       |  4 ++++
 4 files changed, 26 insertions(+), 2 deletions(-)

-- 
1.8.3.2


