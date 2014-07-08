Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6A6E2703E3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 09:48:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s689mBgr006191
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Jul 2014 02:48:12 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 8 Jul 2014 02:48:11 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Jul 2014 17:47:53 +0800
Message-ID: <7b884496fe887767c6be62b854b4b3dd9ac6aab8.1404812342.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1404812342.git.hongxu.jia@windriver.com>
References: <cover.1404812342.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 1/8] libxml2: enable Catalog support
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
X-List-Received-Date: Tue, 08 Jul 2014 09:48:14 -0000
Content-Type: text/plain

The environment variable XML_CATALOG_FILES could work
which was required by xmlto.

[YOCTO #2416]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/libxml/libxml2.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index e0b50cf..470ac3f 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -28,6 +28,8 @@ inherit autotools pkgconfig binconfig-disabled pythonnative ptest
 
 RDEPENDS_${PN}-ptest_append_libc-glibc += "eglibc-gconv-ebcdic-us eglibc-gconv-ibm1141"
 
+CFLAGS_append = " -DLIBXML_CATALOG_ENABLED"
+
 # We don't DEPEND on binutils for ansidecl.h so ensure we don't use the header
 do_configure_prepend () {
 	sed -i -e '/.*ansidecl.h.*/d' ${S}/configure.in
-- 
1.8.1.2


