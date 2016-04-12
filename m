Return-Path: <william.c.randle@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 58BE86FF9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 22:11:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 12 Apr 2016 15:11:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,476,1455004800"; d="scan'208";a="931097357"
Received: from wcrandle-mobl1.jf.intel.com ([10.24.0.173])
	by orsmga001.jf.intel.com with ESMTP; 12 Apr 2016 15:11:08 -0700
From: Bill Randle <william.c.randle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 15:10:50 -0700
Message-Id: <1460499052-14368-1-git-send-email-william.c.randle@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/2] rootfs post processing cleanup
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
X-List-Received-Date: Tue, 12 Apr 2016 22:11:06 -0000

Bill Randle (2):
  rootfs.py: apply ROOTFS_POSTINSTALL_COMMAND to all package formats
  image.bbclass: add DEB_{PRE,POST}_PROCESS_COMMANDS to rootfs_command_variables list

 meta/classes/image.bbclass | 2 +-
 meta/lib/oe/rootfs.py      | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.5.0


