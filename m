Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A2B277844B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Nov 2017 18:13:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Nov 2017 10:13:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,353,1505804400"; 
   d="scan'208";a="4057100"
Received: from scetola-mac01.jf.intel.com ([10.54.74.141])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2017 10:13:09 -0800
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Nov 2017 10:13:02 -0800
Message-Id: <20171106181306.3042-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.14.2
MIME-Version: 1.0
Subject: [PATCH 0/4] fix runtime tests with systemd-boot
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
X-List-Received-Date: Mon, 06 Nov 2017 18:13:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

These patches fell through the cracks of 2.4. I've checked with the
QA team and they are still relevant. Ping me with any questions.

I will be backporting these to rocko as well.

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


