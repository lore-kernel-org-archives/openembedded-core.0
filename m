Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 073806C138
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 09:25:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2018 01:25:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,265,1539673200"; d="scan'208";a="93126057"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga006.jf.intel.com with ESMTP; 22 Nov 2018 01:25:50 -0800
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 17:10:42 +0800
Message-Id: <1542877846-77570-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/4] Enable qemu slirp for testimage only
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
X-List-Received-Date: Thu, 22 Nov 2018 09:25:51 -0000

Changes:

[v2]
 - enable qemu slirp and like kvm, enable it only for testimage
 - QemuRunner by default has use_slirp=False, where oe-selftest
   will skipped all the new logic related to slirp

Yeoh Ee Peng (4):
  oeqa/qemu & runtime: qemu do not need ip input from external
  qemurunner: Add support for slirp
  oeqa/qemu: Add support for slirp
  testimage: Add support for slirp

 meta/classes/testimage.bbclass    |  5 +++++
 meta/lib/oeqa/core/target/qemu.py | 27 +++++++++++++++++++++------
 meta/lib/oeqa/runtime/context.py  |  2 +-
 meta/lib/oeqa/utils/qemurunner.py | 17 +++++++++++++----
 4 files changed, 40 insertions(+), 11 deletions(-)

-- 
2.7.4


