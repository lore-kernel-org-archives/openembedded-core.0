Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F168A6067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 12:44:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jul 2016 05:44:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,351,1464678000"; d="scan'208";a="1015316027"
Received: from yocto-dev86.jf.intel.com ([10.7.198.60])
	by orsmga002.jf.intel.com with ESMTP; 12 Jul 2016 05:44:14 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jul 2016 05:45:00 -0700
Message-Id: <20160712124501.5216-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH V4] rootfs.py: allow removal of support packages
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
X-List-Received-Date: Tue, 12 Jul 2016 12:44:16 -0000

Changes from V3:
Split off of whitespace rather than comma.

Stephano Cetola (1):
  rootfs.py: allow removal of support packages

 meta/lib/oe/rootfs.py | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

-- 
2.9.0


