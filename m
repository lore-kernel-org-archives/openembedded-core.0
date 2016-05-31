Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9F3B57713C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 May 2016 20:59:04 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2016 13:59:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,397,1459839600"; d="scan'208";a="966079832"
Received: from yocto-dev86.jf.intel.com ([10.7.198.60])
	by orsmga001.jf.intel.com with ESMTP; 31 May 2016 13:59:04 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2016 13:59:53 -0700
Message-Id: <1464728394-8841-1-git-send-email-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.8.2
Subject: [PATCHv3] systemd: allow add users as a rootfs postprocess cmd
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
X-List-Received-Date: Tue, 31 May 2016 20:59:04 -0000

Changes since last revision:
remove bbwarn

Stephano Cetola (1):
  systemd: allow add users as a rootfs postprocess cmd

 meta/classes/rootfs-postcommands.bbclass | 43 +++++++++++++++-----------------
 1 file changed, 20 insertions(+), 23 deletions(-)

-- 
2.8.2


