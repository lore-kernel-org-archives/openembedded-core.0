Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7DB27605BA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 12:11:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 18 May 2016 05:11:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,329,1459839600"; d="scan'208";a="983659519"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 18 May 2016 05:11:45 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2016 15:11:28 +0300
Message-Id: <cover.1463572706.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] openssh upgrade and CVE fix
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
X-List-Received-Date: Wed, 18 May 2016 12:11:47 -0000

The CVE fix should apply for at least Krogoth and Jethro as well.

The following changes since commit 7707cf6562e6a477ea953743a2d9aba682d90949:

  sdk-manual: Fixed three broken links to sections within manual. (2016-05-17 21:35:00 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/openssh
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/openssh

Jussi Kukkonen (2):
  openssh: Upgrade 7.1p2 -> 7.2p2
  openssh: Backport fix for CVE-2015-8325

 .../openssh/openssh/CVE-2015-8325.patch            |  39 +++
 .../openssh/openssh/CVE-2016-1907_2.patch          |  65 ----
 .../openssh/openssh/CVE-2016-1907_3.patch          | 329 ---------------------
 .../openssh/CVE-2016-1907_upstream_commit.patch    |  33 ---
 .../openssh/openssh/CVE-2016-3115.patch            |  84 ------
 .../openssh/{openssh_7.1p2.bb => openssh_7.2p2.bb} |   9 +-
 6 files changed, 42 insertions(+), 517 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-8325.patch
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_2.patch
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_3.patch
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-1907_upstream_commit.patch
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2016-3115.patch
 rename meta/recipes-connectivity/openssh/{openssh_7.1p2.bb => openssh_7.2p2.bb} (95%)

-- 
2.1.4


