Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6CAC17808D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 23:11:36 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jun 2017 16:11:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,366,1493708400"; d="scan'208";a="1184998605"
Received: from unknown (HELO localhost.localdomain) ([10.252.131.195])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jun 2017 16:11:32 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Jun 2017 16:10:25 -0700
Message-Id: <20170620231029.90760-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.13.1
MIME-Version: 1.0
Subject: [PATCH v4 0/4] fix runtime testing using systemd-boot targe
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
X-List-Received-Date: Tue, 20 Jun 2017 23:11:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I'm sending this on behalf of Zeeshan Ali <zeenix@gmail.com>. One of
the patches required a rebase and he is on vacation. This fixes
[YOCTO #11524].

Erik Botö (4):
  sshcontrol.py: in copy_to() always use scp
  masterimage.py: fix stop()
  masterimage.py: rename parameter "params" in start() to
    "extra_bootparams"
  masterimage.py: fix issue with calling reboot on masterimage/DUT

 meta/lib/oeqa/controllers/masterimage.py | 6 +++---
 meta/lib/oeqa/utils/sshcontrol.py        | 9 +++------
 2 files changed, 6 insertions(+), 9 deletions(-)

-- 
2.13.1


