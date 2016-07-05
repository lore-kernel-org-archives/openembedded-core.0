Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7049C60119
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2016 12:18:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jul 2016 05:18:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,579,1459839600"; d="scan'208";a="989425217"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.30.71])
	by orsmga001.jf.intel.com with ESMTP; 05 Jul 2016 05:18:35 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2016 13:18:29 +0100
Message-Id: <cover.1467718852.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/2] Pseudo upgrade
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
X-List-Received-Date: Tue, 05 Jul 2016 12:18:38 -0000

This series upgrades pseudo to the latest master branch and includes an
additional patch to fix some issues observed in pseudo_db.c

We hope to resolve [YOCTO #9112] and [YOCTO #9317] with this series.

Regards,

Joshua

The following changes since commit 53fcfe4348a2ca727844f2b0bd3fca2902cbdda0:

  lib/oeqa: add Galculator to SDK and runtime tests (2016-07-01 16:08:54 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib joshuagl/pseudo
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=joshuagl/pseudo

Joshua Lock (2):
  pseudo: drop recipe for old 1.6.7 version
  pseudo: upgrade to 1.8.0

 meta/recipes-devtools/pseudo/files/db-fixes.patch  | 49 +++++++++++++
 .../pseudo/files/handle-remove-xattr.patch         | 36 ---------
 .../pseudo/files/moreretries.patch                 | 12 +--
 .../pseudo/pseudo/obey-ldflags.patch               | 50 -------------
 .../pseudo/pseudo-glibc-rtld-next-workaround.patch | 85 ----------------------
 meta/recipes-devtools/pseudo/pseudo_1.6.7.bb       | 19 -----
 meta/recipes-devtools/pseudo/pseudo_1.7.5.bb       | 23 ------
 meta/recipes-devtools/pseudo/pseudo_1.8.0.bb       | 19 +++++
 8 files changed, 74 insertions(+), 219 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/db-fixes.patch
 delete mode 100644 meta/recipes-devtools/pseudo/files/handle-remove-xattr.patch
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo/obey-ldflags.patch
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo/pseudo-glibc-rtld-next-workaround.patch
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.6.7.bb
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.7.5.bb
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.8.0.bb

-- 
2.7.4


