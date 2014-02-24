Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6D5716EE66
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 16:06:22 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Feb 2014 08:06:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,535,1389772800"; d="scan'208";a="487168722"
Received: from mcmahond-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.208])
	by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2014 08:06:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2014 16:05:43 +0000
Message-Id: <cover.1393257867.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH 0/4] Misc core fixes
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
X-List-Received-Date: Mon, 24 Feb 2014 16:06:22 -0000

The following changes since commit 5eb0f6e03e5a543f7bad6fcf0cab4173cc8882d8:

  lz4: fix CC (2014-02-24 11:57:28 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/fixes4
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes4

Paul Eggleton (4):
  classes/sstate: fix taints being undone on execution of sstate tasks
  classes/package_tar: fix conflicts with package_deb / package_ipk
  classes/utility-tasks: make do_listtasks a little more friendly
  documentation.conf: add a few missing task descriptions

 meta/classes/package_tar.bbclass   |  7 ++++---
 meta/classes/sstate.bbclass        |  3 +++
 meta/classes/utility-tasks.bbclass | 17 ++++++++++++-----
 meta/conf/documentation.conf       |  4 ++++
 4 files changed, 23 insertions(+), 8 deletions(-)

-- 
1.8.5.3


