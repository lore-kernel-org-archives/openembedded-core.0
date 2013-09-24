Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id D51DD610FB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 14:45:16 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Sep 2013 07:45:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,970,1371106800"; d="scan'208";a="298757470"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.44])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Sep 2013 07:45:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2013 07:45:14 -0700
Message-Id: <1380033916-31464-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH 0/2] Add shutdown to group by default
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
X-List-Received-Date: Tue, 24 Sep 2013 14:45:17 -0000

Recently sysvinit added the useradd bbclass to add a shutdown 
group, this caused shadow to be added to the core-image-minimal
increasing it's size by about 1.3M.

Saul Wold (2):
  sysvinit: don't use useradd
  base-passwd: add shutdown group

 .../base-passwd/base-passwd-3.5.26/add_shutdown.patch | 19 +++++++++++++++++++
 meta/recipes-core/base-passwd/base-passwd_3.5.26.bb   |  4 +++-
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb        |  7 ++-----
 3 files changed, 24 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd-3.5.26/add_shutdown.patch

-- 
1.8.3.1


