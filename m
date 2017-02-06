Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2E6D660721
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2017 10:04:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Feb 2017 02:04:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,341,1477983600"; d="scan'208";a="1122646217"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 06 Feb 2017 02:04:53 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id CE0A16A4080;
	Mon,  6 Feb 2017 02:03:52 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Feb 2017 12:04:46 +0200
Message-Id: <94e9dfd56e30fcd7091633b63d9be5ac31ebe291.1486375248.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1486375248.git.jussi.kukkonen@intel.com>
References: <cover.1486375248.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/3] latencytop: Add missing 'inherit pkgconfig'
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
X-List-Received-Date: Mon, 06 Feb 2017 10:04:54 -0000

The Makefile uses pkg-config.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-kernel/latencytop/latencytop_0.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/latencytop/latencytop_0.5.bb b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
index f31f1bb..c38a038 100644
--- a/meta/recipes-kernel/latencytop/latencytop_0.5.bb
+++ b/meta/recipes-kernel/latencytop/latencytop_0.5.bb
@@ -4,6 +4,8 @@ HOMEPAGE = "http://www.latencytop.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://latencytop.c;endline=23;md5=ee9ea9b1415356e5734adad4a87dc7fa"
 
+inherit pkgconfig
+
 DEPENDS = "virtual/libintl ncurses glib-2.0"
 
 PR = "r3"
-- 
2.1.4


