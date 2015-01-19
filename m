Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2E7A272C92
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 07:16:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0J7GhU2018155
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Jan 2015 23:16:43 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 18 Jan 2015 23:16:43 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 18 Jan 2015 23:16:37 -0800
Message-ID: <80ce23aad577bd716ac855cd421a0537ceed3383.1421651689.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421651689.git.liezhi.yang@windriver.com>
References: <cover.1421651689.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/9] automake: upgrade to 1.15
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
X-List-Received-Date: Mon, 19 Jan 2015 07:16:47 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{automake_1.14.1.bb => automake_1.15.bb}       |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/automake/{automake_1.14.1.bb => automake_1.15.bb} (89%)

diff --git a/meta/recipes-devtools/automake/automake_1.14.1.bb b/meta/recipes-devtools/automake/automake_1.15.bb
similarity index 89%
rename from meta/recipes-devtools/automake/automake_1.14.1.bb
rename to meta/recipes-devtools/automake/automake_1.15.bb
index be73d19..d5b6e9e 100644
--- a/meta/recipes-devtools/automake/automake_1.14.1.bb
+++ b/meta/recipes-devtools/automake/automake_1.15.bb
@@ -22,8 +22,8 @@ SRC_URI += " file://python-libdir.patch \
             file://py-compile-compile-only-optimized-byte-code.patch \
             file://buildtest.patch"
 
-SRC_URI[md5sum] = "d052a3e884631b9c7892f2efce542d75"
-SRC_URI[sha256sum] = "814c2333f350ce00034a1fe718e0e4239998ceea7b0aff67e9fd273ed6dfc23b"
+SRC_URI[md5sum] = "716946a105ca228ab545fc37a70df3a3"
+SRC_URI[sha256sum] = "7946e945a96e28152ba5a6beb0625ca715c6e32ac55f2e353ef54def0c8ed924"
 
 do_install_append () {
     install -d ${D}${datadir}
-- 
1.7.9.5


