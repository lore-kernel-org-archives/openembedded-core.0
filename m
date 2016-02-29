Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 93D9C77264
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 11:49:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Feb 2016 03:49:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,520,1449561600"; d="scan'208";a="897369223"
Received: from gtan23-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.165.53])
	by orsmga001.jf.intel.com with ESMTP; 29 Feb 2016 03:49:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Mar 2016 00:48:22 +1300
Message-Id: <cover.1456746435.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/4] recipetool create improvements
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
X-List-Received-Date: Mon, 29 Feb 2016 11:49:05 -0000

Support for creating recipes for kernels, out-of-tree kernel modules,
and npm modules.


The following changes since commit 390bad905537820f49add855c95d726b5b55c8fa:

  sanity: Fix int verses string reference (2016-02-28 22:54:06 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/recipetool2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/recipetool2

Paul Eggleton (4):
  classes/module: allow substitution of the modules_install target name
  recipetool: create: add support for out-of-tree kernel modules
  recipetool: create: add basic support for generating linux kernel recipes
  recipetool: create: add basic support for new npm fetcher/class

 meta/classes/module.bbclass             |   4 +-
 scripts/lib/recipetool/create_kernel.py |  99 +++++++++++++++++++++
 scripts/lib/recipetool/create_kmod.py   | 152 ++++++++++++++++++++++++++++++++
 scripts/lib/recipetool/create_npm.py    |  48 ++++++++++
 4 files changed, 302 insertions(+), 1 deletion(-)
 create mode 100644 scripts/lib/recipetool/create_kernel.py
 create mode 100644 scripts/lib/recipetool/create_kmod.py
 create mode 100644 scripts/lib/recipetool/create_npm.py

-- 
2.5.0


