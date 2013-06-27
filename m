Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 4F22960780
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 22:43:17 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 27 Jun 2013 15:43:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,955,1363158000"; d="scan'208";a="356926298"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.111])
	by fmsmga001.fm.intel.com with ESMTP; 27 Jun 2013 15:44:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2013 15:43:13 -0700
Message-Id: <1372372997-1604-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/4] Updated mc patch and enable udev-cache
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
X-List-Received-Date: Thu, 27 Jun 2013 22:43:17 -0000

This patch set brings the mc helpers files back and packages
them.  It also enables the udev-cache code since there is a
boot time speed up.

Sau!


Saul Wold (4):
  mc: Don't remove libdir and split helpers into packages
  packagegroups: Update for split mc packages
  packagegroup-core-basic: remove hardcode udev
  packagegroup-core-boot: used udev-cache for sysvinit

 .../packagegroups/packagegroup-core-boot.bb        |  1 +
 .../packagegroups/packagegroup-self-hosted.bb      |  4 ++++
 meta/recipes-extended/mc/mc_4.8.8.bb               | 22 +++++++++++++++++++++-
 .../packagegroups/packagegroup-core-basic.bb       |  5 ++++-
 .../packagegroups/packagegroup-core-lsb.bb         |  4 ++++
 5 files changed, 34 insertions(+), 2 deletions(-)

-- 
1.8.1.4


