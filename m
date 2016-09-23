Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AB73B6060F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 09:17:55 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP; 23 Sep 2016 02:17:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,381,1470726000"; d="scan'208";a="12525167"
Received: from yleow-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.155.25])
	by orsmga005.jf.intel.com with ESMTP; 23 Sep 2016 02:17:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 21:17:51 +1200
Message-Id: <cover.1474622251.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/1] nativesdk-qemu-helper: drop old Zaurus flash tools
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
X-List-Received-Date: Fri, 23 Sep 2016 09:17:56 -0000

A minor cleanup for nativesdk-qemu-helper.


The following changes since commit 7e0f95bf359bc3b5bb1578024a993e184de155cd:

  base.bbclass: Drop unnecessary dirs setting (2016-09-22 11:08:23 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/nativesdk-qemu-helper
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/nativesdk-qemu-helper

Paul Eggleton (1):
  nativesdk-qemu-helper: drop old Zaurus flash tools

 .../qemu/nativesdk-qemu-helper_1.0.bb              |  11 -
 meta/recipes-devtools/qemu/qemu-helper/raw2flash.c | 370 ---------------------
 2 files changed, 381 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/qemu-helper/raw2flash.c

-- 
2.5.5


