Return-Path: <tom.zanussi@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 565786B194
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Dec 2013 17:31:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 30 Dec 2013 09:31:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,574,1384329600"; d="scan'208";a="431789144"
Received: from unknown (HELO localhost) ([10.255.12.41])
	by orsmga001.jf.intel.com with ESMTP; 30 Dec 2013 09:31:23 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Dec 2013 11:31:21 -0600
Message-Id: <cover.1388424165.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/1][dora] - Fix for Bug 5403
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
X-List-Received-Date: Mon, 30 Dec 2013 17:31:39 -0000

This fixes a problem seen when accessing function params in systemtap
on certain platforms, due to flaky debuginfo.

Tested on the following machines with various systemtap scripts:

qemuppc
qemuarm
qemux86
qemux86-64
crownbay
nuc

The following changes since commit 3cf2d232529c4fd6b58f87ddbf3df9d805e4180f:

  libsoup-2.4: add intltool-native to DEPENDS (2013-12-20 09:29:05 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/systemtap-bug-5403-dora
  http://git.yoctoproject.org/cgit.cgi//log/?h=tzanussi/systemtap-bug-5403-dora

Tom Zanussi (1):
  systemtap: Add --enable-prologues to configuration

 meta/recipes-kernel/systemtap/systemtap_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.3.1


