Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T4UjI-0006ip-Gx
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 12:33:36 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7NALSrx009420
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2012 03:21:28 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Thu, 23 Aug 2012 03:21:28 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Aug 2012 18:21:33 +0800
Message-ID: <55aeb8f8fd0cdce1c461c2c4f75026166e69e1dc.1345709138.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1345709138.git.kai.kang@windriver.com>
References: <cover.1345709138.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] ltp_20120104: add rdepends
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
X-List-Received-Date: Thu, 23 Aug 2012 10:33:36 -0000
Content-Type: text/plain

[Yocto #2973]

Add rdepends libaio to fix this defect.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-extended/ltp/ltp_20120104.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp_20120104.bb b/meta/recipes-extended/ltp/ltp_20120104.bb
index c82203a..f8119a7 100644
--- a/meta/recipes-extended/ltp/ltp_20120104.bb
+++ b/meta/recipes-extended/ltp/ltp_20120104.bb
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 		    file://utils/benchmark/kernbench-0.42/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 		"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2 \
            file://uclibc-getcontext.patch \
@@ -28,6 +28,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2 \
 SRC_URI[md5sum] = "ac183bbdac67139f049b3755fda37179"
 SRC_URI[sha256sum] = "11b149b821d709e3351ac66f028f1b0dd5337ee9073dc20019ccffdac42d5c2e"
 
+RDEPENDS_${PN} += "libaio"
+
 export prefix = "/opt/ltp"
 export exec_prefix = "/opt/ltp"
 
-- 
1.7.5.4



