Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id CB24871D60
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 15:15:14 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 28 Oct 2016 08:15:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,410,1473145200"; d="scan'208";a="24878774"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 28 Oct 2016 08:15:15 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2016 18:12:20 +0300
Message-Id: <07e04af79a45a49a8ce4cb1cde76b73d0200b204.1477667287.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
References: <cover.1477667287.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 17/26] btrfs-tools: enable optional building of manpages
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
X-List-Received-Date: Fri, 28 Oct 2016 15:15:15 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/btrfs-tools/btrfs-tools_4.7.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.7.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.7.1.bb
index becf093..36695c9 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.7.1.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_4.7.1.bb
@@ -18,9 +18,9 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
            file://fix-parallel.patch \
 "
 
-inherit autotools-brokensep pkgconfig
+inherit autotools-brokensep pkgconfig manpages
 
-EXTRA_OECONF += "--disable-documentation"
+PACKAGECONFIG[manpages] = "--enable-documentation, --disable-documentation, asciidoc-native xmlto-native"
 EXTRA_OECONF_append_libc-musl = " --disable-backtrace "
 
 
-- 
2.9.3


