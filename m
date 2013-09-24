Return-Path: <ddalex@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4CD426CABA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 16:36:17 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 24 Sep 2013 09:36:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,971,1371106800"; d="scan'208";a="406504886"
Received: from adamian-desktop.isw.intel.com ([10.237.224.35])
	by fmsmga002.fm.intel.com with ESMTP; 24 Sep 2013 09:35:55 -0700
Received: by adamian-desktop.isw.intel.com (Postfix, from userid 1000)
	id 2C5255604B0; Tue, 24 Sep 2013 17:35:58 +0100 (BST)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2013 17:35:56 +0100
Message-Id: <cover.1380040307.git.alexandru.damian@intel.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 0/3] metadata additions for Webhob
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
X-List-Received-Date: Tue, 24 Sep 2013 16:36:17 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

These patches update the package.bbclass and documentation.conf with 
extra information that is gonna be used by Webhob to record 
package information and configuration files documentation.

The following changes since commit 0fc8317c6385eb1ed69ca4522ee6424c456dbb92:

  yocto-bsp: add 3.10/remove 3.8 kernel from templates (2013-09-24 12:01:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib webhob-poky/metachanges-2409
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=webhob-poky/metachanges-2409

Alexandru DAMIAN (2):
  package.bbclass: trigger event when collecting package info
  package: fire an event with file sizes

Belen Barros Pena (1):
  documentation.conf: update contents

 meta/classes/package.bbclass |  63 ++++----
 meta/conf/documentation.conf | 335 ++++++++++++++++++++++++++++++-------------
 2 files changed, 271 insertions(+), 127 deletions(-)

-- 
1.8.1.2


