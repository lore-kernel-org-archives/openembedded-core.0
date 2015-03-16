Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 659496AC43
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Mar 2015 14:27:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 16 Mar 2015 07:21:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,409,1422950400"; d="scan'208";a="692802093"
Received: from sgconnee-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.8.217])
	by fmsmga002.fm.intel.com with ESMTP; 16 Mar 2015 07:27:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Mar 2015 14:27:06 +0000
Message-Id: <cover.1426515937.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/2] Drop already applied patches
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
X-List-Received-Date: Mon, 16 Mar 2015 14:27:13 -0000

Drop some patches that were already applied upstream (quilt doesn't
complain about these, but devtool's attempted use of git/patch to apply
them will and we really should have dropped them on upgrade).


The following changes since commit fb29441216435b9bae47ca9cd42db5a6b1fe77d8:

  oeqa/parselogs: Skip hda opcode errors (2015-03-12 12:49:22 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/oldpatches
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/oldpatches

Paul Eggleton (2):
  opkg: drop already applied patch
  xf86-input-synaptics: drop already applied patch

 ...g_remove.c-avoid-remove-pkg-repeatly-with.patch | 39 --------------
 meta/recipes-devtools/opkg/opkg_0.2.4.bb           |  1 -
 .../always_include_xorg_server.h.patch             | 60 ----------------------
 .../xorg-driver/xf86-input-synaptics_1.8.1.bb      |  4 --
 4 files changed, 104 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg/libopkg-opkg_remove.c-avoid-remove-pkg-repeatly-with.patch
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-synaptics/always_include_xorg_server.h.patch

-- 
1.9.3


