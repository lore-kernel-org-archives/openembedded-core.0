Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2F49376104
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 13:13:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 27 Oct 2015 06:13:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,205,1444719600"; d="scan'208";a="804306157"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga001.jf.intel.com with ESMTP; 27 Oct 2015 06:13:36 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Oct 2015 15:16:33 +0200
Message-Id: <cover.1445951045.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [jethro][master][PATCH 0/1] Fix multilib connectivity issues
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
X-List-Received-Date: Tue, 27 Oct 2015 13:13:39 -0000

The following patch moves a connman setup script to the correct
place and happens to avoid YOCTO #8550 making wired setup work in
multilib qemu image again.

It does not fix the multilib bugs that were found during the
investigation:
* YOCTO #8586 multilib build includes 32bit connman without reason
* YOCTO #8570 problems with gdk-pixbuf and pango loading on multilib


The following changes since commit 505a82673ac2487df5ea343a6422c2fc47018831:

  build-appliance-image: Update to jethro head revision (2015-10-21 23:13:11 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/connman-wired
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/connman-wired

Jussi Kukkonen (1):
  connman: Move wired-setup to ${datadir}

 meta/recipes-connectivity/connman/connman-conf.bb | 6 +++---
 meta/recipes-connectivity/connman/connman.inc     | 4 ++--
 meta/recipes-connectivity/connman/connman/connman | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.1.4


