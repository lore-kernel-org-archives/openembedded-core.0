Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RVfx9-0001yW-Az
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 09:55:43 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAU8n2CM024789
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 00:49:02 -0800 (PST)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 30 Nov 2011 00:49:02 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2011 16:45:41 +0800
Message-ID: <67feaf8417bf8b28c7d898056b92c2625045acd6.1322642187.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1322642187.git.wenzong.fan@windriver.com>
References: <cover.1322642187.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v2 1/5] gnu-config: Extend to provide nativesdk recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Nov 2011 08:55:43 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

We need to provide autoconf-natviesdk in meta-toolchain, the
gnu-config-nativesdk is required by it.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../gnu-config/gnu-config_20111111.bb              |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb b/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb
index 27400c6..0c652c2 100644
--- a/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb
+++ b/meta/recipes-devtools/gnu-config/gnu-config_20111111.bb
@@ -8,7 +8,7 @@ DEPENDS_virtclass-native = "perl-native-runtime"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://downloads.yoctoproject.org/releases/gnu-config/gnu-config-yocto-${PV}.tgz \
 	   file://config-guess-uclibc.patch \
@@ -38,4 +38,4 @@ do_install () {
 PACKAGES = "${PN}"
 FILES_${PN} = "${bindir} ${datadir}/gnu-config"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.0.4



