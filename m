Return-Path: <jose.perez.carranza@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 922177309A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 21:03:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 14:03:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,319,1496127600"; d="scan'208";a="1148719727"
Received: from yctb06.ostc.intel.com ([10.54.69.60])
	by orsmga001.jf.intel.com with ESMTP; 06 Jul 2017 14:03:07 -0700
From: jose.perez.carranza@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 14:03:06 -0700
Message-Id: <cover.1499373694.git.jose.perez.carranza@linux.intel.com>
X-Mailer: git-send-email 2.12.0
MIME-Version: 1.0
Subject: [PATCH 0/2] Add lzip test instead of iptables for runtime
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
X-List-Received-Date: Thu, 06 Jul 2017 21:03:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

This series is created to replace iptables tests for lzip test and avoid conflicts with images built with “musl”. A two separate patches were sent before related to this, one for SDK [1] and other one to add changes to testimage.bbclass[2], the second one itself doe not works, hence in this series the second patch is included and also the complement fully apply the test on runtime.

Patch [1] is still applicable and does not conflicts with this series.

  1-  https://patchwork.openembedded.org/patch/141496/
  2-  https://patchwork.openembedded.org/patch/141620/

The following changes since commit 754c03006943a219ffd417c36ab909b464f57f67:

  local.conf.sample: drop image-swab reference (2017-07-06 15:03:10 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jperez/bug11713
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jperez/bug11713

Jose Perez Carranza (1):
  oeqa/runtime: Replace buildiptables for buildlzip on runtime tests

Khem Raj (1):
  testimage: Use the renamed buildlzip

 meta/classes/testimage.bbclass                                 | 6 +++---
 meta/lib/oeqa/runtime/cases/{buildiptables.py => buildlzip.py} | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/lib/oeqa/runtime/cases/{buildiptables.py => buildlzip.py} (89%)

-- 
2.12.0


