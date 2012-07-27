Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1SufsZ-0007hL-90
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 10:26:35 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6R8F2Zp028096
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 01:15:02 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.163) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 27 Jul 2012 01:15:01 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 16:15:01 +0800
Message-ID: <1343376901-8839-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 1/1] socat 1.7.2: add readline dependency
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
X-List-Received-Date: Fri, 27 Jul 2012 08:26:35 -0000
Content-Type: text/plain

From: Roy.Li <rongqing.li@windriver.com>

[YOCTO #2844]

socat has dependency on readline

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-connectivity/socat/socat_1.7.2.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.2.0.bb b/meta/recipes-connectivity/socat/socat_1.7.2.0.bb
index 1273dcf..33004e3 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.2.0.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.2.0.bb
@@ -4,11 +4,11 @@ HOMEPAGE = "http://www.dest-unreach.org/socat/"
 
 SECTION = "console/network"
 
-DEPENDS = "openssl"
+DEPENDS = "openssl readline"
 
 LICENSE = "GPL-2.0+-with-OpenSSL-exception"
 
-PR = "r0"
+PR = "r1"
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2;name=src \
            file://compile.patch"
 
-- 
1.7.4.1



