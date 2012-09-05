Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T9C8n-0001oI-Pp
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 11:43:22 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q859UvUq029818
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 5 Sep 2012 02:30:57 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Wed, 5 Sep 2012 02:30:58 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Sep 2012 17:31:03 +0800
Message-ID: <148078af1ccf21d65276a1d6a9bb7bf8c31c2950.1346837304.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1346837304.git.kai.kang@windriver.com>
References: <cover.1346837304.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/3] ltp: update
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
X-List-Received-Date: Wed, 05 Sep 2012 09:43:22 -0000
Content-Type: text/plain

Update to latest version 20120903

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../ltp/{ltp_20120614.bb => ltp_20120903.bb}       |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/ltp/{ltp_20120614.bb => ltp_20120903.bb} (96%)

diff --git a/meta/recipes-extended/ltp/ltp_20120614.bb b/meta/recipes-extended/ltp/ltp_20120903.bb
similarity index 96%
rename from meta/recipes-extended/ltp/ltp_20120614.bb
rename to meta/recipes-extended/ltp/ltp_20120903.bb
index 14c0fef..85270ea 100644
--- a/meta/recipes-extended/ltp/ltp_20120614.bb
+++ b/meta/recipes-extended/ltp/ltp_20120903.bb
@@ -21,12 +21,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
 
 DEPENDS = "attr libaio"
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/ltp/ltp-full-${PV}.bz2"
 
-SRC_URI[md5sum] = "1078160b1f962a22f1598edad17293c5"
-SRC_URI[sha256sum] = "cbc00dd63226a4cde06fa506be4c71ddedcaf20dde474681db7ebeea1c1fb643"
+SRC_URI[md5sum] = "3c885047b137a6955e087ad20807a018"
+SRC_URI[sha256sum] = "41d2f4cd88619aa7b5cdad93cb7691b69166f7751bc9f2f72558937cbef581c2"
 
 export prefix = "/opt/ltp"
 export exec_prefix = "/opt/ltp"
-- 
1.7.5.4



