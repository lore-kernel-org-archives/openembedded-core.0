Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id CBC95601A5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 16:58:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 09 Nov 2017 08:58:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,370,1505804400"; 
   d="scan'208";a="3077228"
Received: from scetola-mac01.jf.intel.com ([10.54.74.124])
	by orsmga001.jf.intel.com with ESMTP; 09 Nov 2017 08:58:47 -0800
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 08:58:25 -0800
Message-Id: <20171109165829.41508-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.14.2
MIME-Version: 1.0
Subject: [rocko][PATCH 0/4] Backport masterimage fixes
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
X-List-Received-Date: Thu, 09 Nov 2017 16:58:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Backporting fixes since I never got these into 2.4.

Requested by erik.boto@pelagicore.com.

This fixes [YOCTO #11524]

Erik Botö (4):
  masterimage.py: fix issue with calling reboot on masterimage/DUT
  masterimage.py: fix stop()
  masterimage.py: rename parameter "params" in start() to
    "extra_bootparams"
  sshcontrol.py: in copy_to() always use scp

 meta/lib/oeqa/controllers/masterimage.py | 6 +++---
 meta/lib/oeqa/utils/sshcontrol.py        | 9 +++------
 2 files changed, 6 insertions(+), 9 deletions(-)

-- 
2.14.2


