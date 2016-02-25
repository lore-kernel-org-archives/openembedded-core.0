Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 274CD77342
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 23:12:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Feb 2016 15:12:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="921333663"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga002.jf.intel.com with ESMTP; 25 Feb 2016 15:12:21 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 15:07:52 +0000
Message-Id: <cover.1456412549.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCHv2 0/2] Add initial capability to check CVEs for recipes
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
X-List-Received-Date: Thu, 25 Feb 2016 23:12:21 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This series add the cve-check-tool recipe, a tool used to identify
potentially vulnerable software through version matching. It will
check if a vulnerability has been addressed by a patch.

Also add the new cve-check class that will add a task for all recipes
to check for CVEs using cve-check-tool. This tool can be used by recipe,
mage (will generate an image report in deploy dir), and with "world"
and "universe"

To run it just inherit the class and enter:

bitbake -c cve_check <recipe>

Changes in v2:

- Set the explicit dependency of cve-check-tool-native:do_populate_cve_db
  in the cve-check class
- Squashed patch 2 into patch 1

The following changes since commit 23056103c949b498c23b47579e8dd57ce78e6ed9:

  uclibc: Do not use immediate expansion operator (2016-02-22 20:42:48 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug7515v2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug7515v2

Mariano Lopez (2):
  cve-check-tool: Add recipe
  cve-check.bbclass: Add class

 meta/classes/cve-check.bbclass                     | 248 +++++++++++++++++++++
 .../change_logic_cve_get_file_parent.patch         |  45 ++++
 .../cve-check-tool/cve-check-tool_5.6.bb           |  54 +++++
 3 files changed, 347 insertions(+)
 create mode 100644 meta/classes/cve-check.bbclass
 create mode 100644 meta/recipes-devtools/cve-check-tool/cve-check-tool/change_logic_cve_get_file_parent.patch
 create mode 100644 meta/recipes-devtools/cve-check-tool/cve-check-tool_5.6.bb

-- 
2.6.2


