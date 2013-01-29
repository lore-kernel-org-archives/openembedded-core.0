Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1U05T1-00079s-DA
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 08:18:57 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0T73AWi019032
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 23:03:10 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.143) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 28 Jan 2013 23:03:10 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Jan 2013 15:03:07 +0800
Message-ID: <e7320f336518626c6ad38c9c9d25c13c248cc562.1359440261.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359440261.git.rongqing.li@windriver.com>
References: <cover.1359440261.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] xinetd: enable tcp-wrappers support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 07:19:02 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
index 3bde512..87ea2b1 100644
--- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
+++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
@@ -7,7 +7,7 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8ad8615198542444f84d28a6cf226dd8"
 
 DEPENDS = ""
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.xinetd.org/xinetd-${PV}.tar.gz \
       file://xinetd.init \
@@ -28,6 +28,9 @@ INITSCRIPT_PARAMS = "defaults"
 
 EXTRA_OECONF="--disable-nls"
 
+PACKAGECONFIG ??= "tcp-wrappers"
+PACKAGECONFIG[tcp-wrappers] = "--with-libwrap,,tcp-wrappers"
+
 do_configure() {
 	# Looks like configure.in is broken, so we are skipping
 	# rebuilding configure and are just using the shipped one
-- 
1.7.10.4



