Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4896977D64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 14:28:24 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Apr 2017 07:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,384,1488873600"; d="scan'208";a="94884552"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2017 07:28:25 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Apr 2017 17:28:00 +0300
Message-Id: <6379254b335463f382767c3c1c7afa531c6712f1.1493302527.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1493302527.git.alexander.kanavin@linux.intel.com>
References: <cover.1493302527.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 01/13] asciidoc: drop distutils inherit, not actually required
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
X-List-Received-Date: Thu, 27 Apr 2017 14:28:24 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
index 1cd14542138..38164d55735 100644
--- a/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
+++ b/meta/recipes-extended/asciidoc/asciidoc_8.6.9.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "78db9d0567c8ab6570a6eff7ffdf84eadd91f2dfc0a92a2d0105d323ca
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/asciidoc/files/"
 
-inherit distutils autotools-brokensep
+inherit autotools-brokensep
 
 export DESTDIR = "${D}"
 DEPENDS_class-native = "docbook-xml-dtd4-native"
-- 
2.11.0


