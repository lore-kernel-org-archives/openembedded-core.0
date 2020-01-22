Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D37597FDE2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 05:46:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2020 21:46:46 -0800
X-IronPort-AV: E=Sophos;i="5.70,348,1574150400"; d="scan'208";a="220200336"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.17.19])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Jan 2020 21:46:44 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jan 2020 13:46:34 +0800
Message-Id: <20200122054636.10681-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200122054636.10681-1-anuj.mittal@intel.com>
References: <20200122054636.10681-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] libjpeg-turbo: upgrade 2.0.3 -> 2.0.4
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
X-List-Received-Date: Wed, 22 Jan 2020 05:46:45 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../jpeg/{libjpeg-turbo_2.0.3.bb => libjpeg-turbo_2.0.4.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_2.0.3.bb => libjpeg-turbo_2.0.4.bb} (95%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.3.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
similarity index 95%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.3.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
index 32d3bd93b1..1f49fd3d3b 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.3.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
@@ -14,8 +14,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
            "
 
-SRC_URI[md5sum] = "bd07fddf26f9def7bab02739eb655116"
-SRC_URI[sha256sum] = "4246de500544d4ee408ee57048aa4aadc6f165fc17f141da87669f20ed3241b7"
+SRC_URI[md5sum] = "d01d9e0c28c27bc0de9f4e2e8ff49855"
+SRC_URI[sha256sum] = "33dd8547efd5543639e890efbf2ef52d5a21df81faf41bb940657af916a23406"
 UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/libjpeg-turbo/files/"
 UPSTREAM_CHECK_REGEX = "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
 
-- 
2.21.1


