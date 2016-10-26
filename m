Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3475871B7C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 08:37:44 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 26 Oct 2016 01:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,549,1473145200"; d="scan'208";a="1050341657"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 26 Oct 2016 01:37:45 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id F01B46A4082;
	Wed, 26 Oct 2016 01:37:10 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 11:37:25 +0300
Message-Id: <5d985719c3e8b33f6281c7965f7d4e8fbb7c9e1c.1477469885.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <b4be4ec82b3f01924e2fb87dc868f56284d0a8cf.1477469885.git.jussi.kukkonen@intel.com>
References: <b4be4ec82b3f01924e2fb87dc868f56284d0a8cf.1477469885.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1477469885.git.jussi.kukkonen@intel.com>
References: <cover.1477469885.git.jussi.kukkonen@intel.com>
Subject: [PATCHv2 02/16] libevdev: Upgrade 1.5.2 -> 1.5.4
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
X-List-Received-Date: Wed, 26 Oct 2016 08:37:45 -0000

Tiny bug fix releases.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../recipes-support/libevdev/{libevdev_1.5.2.bb => libevdev_1.5.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libevdev/{libevdev_1.5.2.bb => libevdev_1.5.4.bb} (74%)

diff --git a/meta/recipes-support/libevdev/libevdev_1.5.2.bb b/meta/recipes-support/libevdev/libevdev_1.5.4.bb
similarity index 74%
rename from meta/recipes-support/libevdev/libevdev_1.5.2.bb
rename to meta/recipes-support/libevdev/libevdev_1.5.4.bb
index c76e1d7..9cae859 100644
--- a/meta/recipes-support/libevdev/libevdev_1.5.2.bb
+++ b/meta/recipes-support/libevdev/libevdev_1.5.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb \
 
 SRC_URI = "http://www.freedesktop.org/software/libevdev/${BP}.tar.xz"
 
-SRC_URI[md5sum] = "96ad6edb5ce5c4428f1b183cc180ff8c"
-SRC_URI[sha256sum] = "5ee2163656a61f5703cb5c08a05c9471ffb7b640bfbe2c55194ea50d908f629b"
+SRC_URI[md5sum] = "8f22027bd7a7ba19e6f2695f78e672b6"
+SRC_URI[sha256sum] = "11fe76d62cc76fbc9dbf8e94696a80eee63780139161e5cf54c55ec21a8173a4"
 
 inherit autotools pkgconfig
-- 
2.1.4


