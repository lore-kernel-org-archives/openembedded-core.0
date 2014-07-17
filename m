Return-Path: <Ming.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4F10870602
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 07:58:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6H7wR4W004842
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 00:58:27 -0700 (PDT)
Received: from PEK-MLIU3-D1.corp.ad.wrs.com (128.224.163.186) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Thu, 17 Jul 2014 00:58:26 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jul 2014 15:58:18 +0800
Message-ID: <1405583899-13188-2-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
In-Reply-To: <1405583899-13188-1-git-send-email-ming.liu@windriver.com>
References: <1405583899-13188-1-git-send-email-ming.liu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] gmp: use PACKAGECONFIG to address readline dependency
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
X-List-Received-Date: Thu, 17 Jul 2014 07:58:28 -0000
Content-Type: text/plain

To avoid automatically detecting readline dependency, which will lead to
a implicit build result.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-support/gmp/gmp.inc      | 3 +++
 meta/recipes-support/gmp/gmp_4.2.1.bb | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-support/gmp/gmp.inc b/meta/recipes-support/gmp/gmp.inc
index d025e07..6aedc85 100644
--- a/meta/recipes-support/gmp/gmp.inc
+++ b/meta/recipes-support/gmp/gmp.inc
@@ -18,6 +18,9 @@ acpaths = ""
 
 BBCLASSEXTEND = "native nativesdk"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[readline] = "--with-readline=yes,--with-readline=no,readline"
+
 EXTRA_OECONF += " --enable-cxx=detect"
 
 PACKAGES =+ "libgmpxx"
diff --git a/meta/recipes-support/gmp/gmp_4.2.1.bb b/meta/recipes-support/gmp/gmp_4.2.1.bb
index 5c93925..69ad0ca 100644
--- a/meta/recipes-support/gmp/gmp_4.2.1.bb
+++ b/meta/recipes-support/gmp/gmp_4.2.1.bb
@@ -17,4 +17,7 @@ SRC_URI = "${GNU_MIRROR}/gmp/${BP}.tar.bz2 \
 SRC_URI[md5sum] = "091c56e0e1cca6b09b17b69d47ef18e3"
 SRC_URI[sha256sum] = "d07ffcb37eecec35c5ec72516d10b35fdf6e6fef1fcf1dcd37e30b8cbf8bf941"
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[readline] = "--with-readline=yes,--with-readline=no,readline"
+
 inherit autotools texinfo
-- 
1.8.4.1


