Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 23300757C4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 15:49:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 11 Jun 2015 08:49:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,595,1427785200"; d="scan'208";a="709295931"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga001.jf.intel.com with ESMTP; 11 Jun 2015 08:49:43 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jun 2015 07:45:45 +0000
Message-Id: <cover.1434008015.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/2] Fixes rpm: CVE-2014-8118 & CVE-2013-6435
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
X-List-Received-Date: Thu, 11 Jun 2015 15:49:50 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Backport fixes for rpm: CVE-2014-8118 & CVE-2013-6435

These two patches only apply on RPM 4.11.2 (already present on RPM 5.4.*). 

https://bugzilla.yoctoproject.org/show_bug.cgi?id=7181

The following changes since commit 062678c4ab88fa94ed38efa6520c3b4e2d88ca73:

  sysvinit: Only enable recipe in builds where its applicable (2015-06-10 12:03:19 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/rpm-vulnerabilities
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/rpm-vulnerabilities

Leonardo Sandoval (2):
  rpm: Fix CVE-2014-8118
  rpm: Fix CVE-2013-6435

 .../rpm/rpm/rpm-CVE-2013-6435.patch                | 109 +++++++++++++++++++++
 .../rpm/rpm/rpm-CVE-2014-8118.patch                |  43 ++++++++
 meta/recipes-devtools/rpm/rpm_4.11.2.bb            |   2 +
 3 files changed, 154 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-CVE-2013-6435.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-CVE-2014-8118.patch

-- 
1.8.4.5


