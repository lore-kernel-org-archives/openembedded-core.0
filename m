Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40AE46BBDC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 02:13:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2K2DmbR006362
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 19:13:48 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 19 Mar 2014 19:13:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Mar 2014 10:19:05 +0800
Message-ID: <4f77d9f716d47a21504369893086b24f6fb95bcb.1395281861.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1395281861.git.liezhi.yang@windriver.com>
References: <cover.1395281861.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] automake: upgrade from 1.14 to 1.14.1
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
X-List-Received-Date: Thu, 20 Mar 2014 02:13:47 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../automake/{automake_1.14.bb => automake_1.14.1.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/automake/{automake_1.14.bb => automake_1.14.1.bb} (89%)

diff --git a/meta/recipes-devtools/automake/automake_1.14.bb b/meta/recipes-devtools/automake/automake_1.14.1.bb
similarity index 89%
rename from meta/recipes-devtools/automake/automake_1.14.bb
rename to meta/recipes-devtools/automake/automake_1.14.1.bb
index de6fcfa..be73d19 100644
--- a/meta/recipes-devtools/automake/automake_1.14.bb
+++ b/meta/recipes-devtools/automake/automake_1.14.1.bb
@@ -22,8 +22,8 @@ SRC_URI += " file://python-libdir.patch \
             file://py-compile-compile-only-optimized-byte-code.patch \
             file://buildtest.patch"
 
-SRC_URI[md5sum] = "a3c0d9298c6112f5f2c26c639ccaaed7"
-SRC_URI[sha256sum] = "7847424d4204d1627c129e9c15b81e145836afa2a1bf9003ffe10aa26ea75755"
+SRC_URI[md5sum] = "d052a3e884631b9c7892f2efce542d75"
+SRC_URI[sha256sum] = "814c2333f350ce00034a1fe718e0e4239998ceea7b0aff67e9fd273ed6dfc23b"
 
 do_install_append () {
     install -d ${D}${datadir}
-- 
1.8.3.1


