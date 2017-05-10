Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9E97371AD8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 09:35:30 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 May 2017 02:35:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,318,1491289200"; d="scan'208";a="85649703"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 10 May 2017 02:35:31 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 12:35:25 +0300
Message-Id: <20170510093529.6651-7-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170510093529.6651-1-alexander.kanavin@linux.intel.com>
References: <20170510093529.6651-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/11] ed: update to 1.14.2
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
X-List-Received-Date: Wed, 10 May 2017 09:35:31 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/ed/{ed_1.14.1.bb => ed_1.14.2.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/ed/{ed_1.14.1.bb => ed_1.14.2.bb} (79%)

diff --git a/meta/recipes-extended/ed/ed_1.14.1.bb b/meta/recipes-extended/ed/ed_1.14.2.bb
similarity index 79%
rename from meta/recipes-extended/ed/ed_1.14.1.bb
rename to meta/recipes-extended/ed/ed_1.14.2.bb
index 7e6bde450f1..87d03b10b1d 100644
--- a/meta/recipes-extended/ed/ed_1.14.1.bb
+++ b/meta/recipes-extended/ed/ed_1.14.2.bb
@@ -12,11 +12,11 @@ SECTION = "base"
 bindir = "${base_bindir}"
 
 # Upstream regularly removes previous releases from https://ftp.gnu.org/gnu/ed/
-SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/${BP}.tar.lz"
+SRC_URI = "${GNU_MIRROR}/ed/${BP}.tar.lz"
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/ed/"
 
-SRC_URI[md5sum] = "7f4a54fa7f366479f03654b8af645fd0"
-SRC_URI[sha256sum] = "ffb97eb8f2a2b5a71a9b97e3872adce953aa1b8958e04c5b7bf11d556f32552a"
+SRC_URI[md5sum] = "273d04778b2a51f7c3cbfcd2001876bf"
+SRC_URI[sha256sum] = "f57962ba930d70d02fc71d6be5c5f2346b16992a455ab9c43be7061dec9810db"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-- 
2.11.0


