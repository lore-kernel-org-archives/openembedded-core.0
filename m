Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2ECC371A99
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 20:43:06 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Sep 2017 13:43:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,441,1500966000"; d="scan'208";a="156343345"
Received: from scchinx-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.101])
	by fmsmga006.fm.intel.com with ESMTP; 26 Sep 2017 13:43:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Sep 2017 09:42:23 +1300
Message-Id: <cover.1506458497.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [pyro][PATCH 0/2] Backports for pyro to fix eSDK / initramfs interaction
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
X-List-Received-Date: Tue, 26 Sep 2017 20:43:07 -0000

The following changes since commit 404a04a862a71a5a0fb1c20b6bc9fc9c8b2bb98c:

  image.bbclass: Sorted ctypes to avoid basehash error (2017-09-22 17:52:58 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/pyro-esdk-initramfs-fix-oe
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/pyro-esdk-initramfs-fix-oe

Ming Liu (1):
  image.bbclass: drop initramfs bundle related code

Paul Eggleton (1):
  classes: drop image dependencies on TOPDIR variable

 meta/classes/image.bbclass               | 12 ------------
 meta/classes/image_types_wic.bbclass     |  2 +-
 meta/classes/qemuboot.bbclass            |  1 +
 meta/classes/rootfs-postcommands.bbclass |  1 +
 4 files changed, 3 insertions(+), 13 deletions(-)

-- 
2.9.5


