Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (unknown [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B43BB6FAFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 20:32:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 May 2014 13:26:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,922,1392192000"; d="scan'208";a="547328539"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga002.jf.intel.com with ESMTP; 27 May 2014 13:31:36 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 May 2014 13:38:55 -0700
Message-Id: <cover.1401223100.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Darren Hart <dvhart@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 0/1] i2c-tools: Add i2c-tools to the core
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
X-List-Received-Date: Tue, 27 May 2014 20:32:10 -0000

The following changes since commit f3d62a9eb9c47356e6150fdd55f790c159e620c7:

  eglinfo: updated to compile with mesa10+ (2014-05-27 16:11:55 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib dvhart/i2c-tools
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=dvhart/i2c-tools

Darren Hart (1):
  i2c-tools: Add i2c-tools to the core

 meta/recipes-devtools/i2c-tools/files/Module.mk    |   72 ++++++++++++++++++++
 .../i2c-tools/i2c-tools-3.1.0/Module.mk            |   72 ++++++++++++++++++++
 meta/recipes-devtools/i2c-tools/i2c-tools_3.1.0.bb |   26 +++++++
 3 files changed, 170 insertions(+)
 create mode 100644 meta/recipes-devtools/i2c-tools/files/Module.mk
 create mode 100644 meta/recipes-devtools/i2c-tools/i2c-tools-3.1.0/Module.mk
 create mode 100644 meta/recipes-devtools/i2c-tools/i2c-tools_3.1.0.bb

-- 
1.7.9.5


