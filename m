Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6C105702A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 12:36:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6FCa1D6000310
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Jul 2014 05:36:01 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 15 Jul 2014 05:36:01 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 20:35:45 +0800
Message-ID: <57a93de32f9cf7d406b8cbf06fa57df055e23c4e.1405427541.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1405427541.git.hongxu.jia@windriver.com>
References: <cover.1405427541.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/8] libxml2: enable catalog support
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
X-List-Received-Date: Tue, 15 Jul 2014 12:36:05 -0000
Content-Type: text/plain

It let the environment variable XML_CATALOG_FILES could work
which was required by xmlto.

[YOCTO #2416]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/libxml/libxml2.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index e0b50cf..9aa640b 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -38,10 +38,10 @@ do_configure_prepend_class-nativesdk () {
 	export PYTHON_SITE_PACKAGES="${PYTHON_SITEPACKAGES_DIR}"
 }
 
-EXTRA_OECONF = "--without-python --without-debug --without-legacy --without-catalog --without-docbook --with-c14n --without-lzma --with-fexceptions"
-EXTRA_OECONF_class-native = "--with-python=${STAGING_BINDIR}/python --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma"
-EXTRA_OECONF_class-nativesdk = "--with-python=${STAGING_BINDIR}/python --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma"
-EXTRA_OECONF_linuxstdbase = "--without-python --with-debug --with-legacy --with-catalog --with-docbook --with-c14n --without-lzma"
+EXTRA_OECONF = "--without-python --without-debug --without-legacy --with-catalog --without-docbook --with-c14n --without-lzma --with-fexceptions"
+EXTRA_OECONF_class-native = "--with-python=${STAGING_BINDIR}/python --without-legacy --without-docbook --with-c14n --without-lzma"
+EXTRA_OECONF_class-nativesdk = "--with-python=${STAGING_BINDIR}/python --without-legacy --without-docbook --with-c14n --without-lzma"
+EXTRA_OECONF_linuxstdbase = "--without-python --with-debug --with-legacy --with-docbook --with-c14n --without-lzma"
 
 # required for pythong binding
 export HOST_SYS
-- 
1.8.1.2


