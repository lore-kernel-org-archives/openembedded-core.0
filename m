Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4849F76710
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 14:16:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 18 Sep 2015 07:16:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,553,1437462000"; d="scan'208";a="792533277"
Received: from thomasda-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.18])
	by fmsmga001.fm.intel.com with ESMTP; 18 Sep 2015 07:16:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Sep 2015 15:16:11 +0100
Message-Id: <cover.1442585757.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/1] Remove already merged patch
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
X-List-Received-Date: Fri, 18 Sep 2015 14:16:20 -0000

The following changes since commit 72682d72b52355c3fed947167ca3c6064340ead1:

  autotools.bbclass: mkdir ${B} -> mkdir -p ${B} (2015-09-16 22:17:19 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/qt4-remove-merged-patch
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/qt4-remove-merged-patch

Paul Eggleton (1):
  qt4: remove already merged patch

 meta/recipes-qt/qt4/qt4-4.8.7.inc                  |  1 -
 .../0028-Don-t-crash-on-broken-GIF-images.patch    | 47 ----------------------
 2 files changed, 48 deletions(-)
 delete mode 100644 meta/recipes-qt/qt4/qt4-4.8.7/0028-Don-t-crash-on-broken-GIF-images.patch

-- 
2.1.0


