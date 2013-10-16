Return-Path: <tom.zanussi@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 126B56C76F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 20:26:12 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Oct 2013 13:25:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,508,1378882800"; d="scan'208";a="308734177"
Received: from unknown (HELO localhost) ([10.255.15.157])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Oct 2013 13:25:39 -0700
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Oct 2013 15:25:38 -0500
Message-Id: <cover.1381954954.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.7.11.4
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 0/1] wic populate-ext fix
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
X-List-Received-Date: Wed, 16 Oct 2013 20:26:13 -0000

This is the pseudo version of the previously submitted fakeroot
fix to the wic populate-ext bug.

The following changes since commit 68a41d2afd3392c59f78398913aa3855225cc52d:

  glib-2.0: fix build on Aarch64 (2013-10-16 13:33:59 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/wic-fixes-1
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/wic-fixes-1

Tom Zanussi (1):
  wic: add pseudo to the populate-extfs step

 scripts/lib/mic/kickstart/custom_commands/partition.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
1.7.11.4


