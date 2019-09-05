Return-Path: <anuj.mittal@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id DF5537EC9B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 07:51:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Sep 2019 00:51:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,469,1559545200"; d="scan'208";a="383769838"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.155.46])
	by fmsmga006.fm.intel.com with ESMTP; 05 Sep 2019 00:51:56 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2019 15:51:53 +0800
Message-Id: <20190905075153.13148-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] libjpeg-turbo: upgrade 2.0.2 -> 2.0.3
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
X-List-Received-Date: Thu, 05 Sep 2019 07:51:57 -0000
Content-Transfer-Encoding: 8bit

Bug fix release. Release notes:

https://github.com/libjpeg-turbo/libjpeg-turbo/releases

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../jpeg/{libjpeg-turbo_2.0.2.bb => libjpeg-turbo_2.0.3.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.0.2.bb => libjpeg-turbo_2.0.3.bb} (95%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.2.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.3.bb
similarity index 95%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.2.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.3.bb
index e1df754b76..1cf854de62 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.2.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.3.bb
@@ -14,8 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
            "
 
-SRC_URI[md5sum] = "79f76fbfb0c6109631332762d10e16d2"
-SRC_URI[sha256sum] = "acb8599fe5399af114287ee5907aea4456f8f2c1cc96d26c28aebfdf5ee82fed"
+SRC_URI[md5sum] = "bd07fddf26f9def7bab02739eb655116"
+SRC_URI[sha256sum] = "4246de500544d4ee408ee57048aa4aadc6f165fc17f141da87669f20ed3241b7"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.21.0


