Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1REHJi-0006y7-3T
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 11:11:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9D95LCk004391
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 02:05:21 -0700 (PDT)
Received: from localhost (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 13 Oct 2011 02:05:21 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Oct 2011 17:05:35 +0800
Message-ID: <2020cc16e581438254e80e4f6400e2b3c8b85c23.1318496401.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.1.300.gc565c
In-Reply-To: <cover.1318496401.git.kai.kang@windriver.com>
References: <cover.1318496401.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.225]
Subject: [PATCH 3/4] xinput: add xinput from oe
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
X-List-Received-Date: Thu, 13 Oct 2011 09:11:06 -0000
Content-Type: text/plain

xinput is requred by xinput-calibrator, so pull it from oe.
Reset PR and add LIC_FILES_CHKSUM.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb

diff --git a/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb b/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
new file mode 100644
index 0000000..5f0d351
--- /dev/null
+++ b/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
@@ -0,0 +1,10 @@
+require xorg-app-common.inc
+DESCRIPTION = "a utility to configure and test XInput devices"
+
+LIC_FILES_CHKSUM="file://COPYING;md5=22c34ea36136407a77702a8b784f9bd0"
+
+DEPENDS += " libxi"
+PR = "r0"
+
+SRC_URI[archive.md5sum] = "1e2f0ad4f3fa833b65c568907f171d28"
+SRC_URI[archive.sha256sum] = "6aade131cecddaeefc39ddce1dd5e8473f6039c2e4efbfd9fbb5ee2a75885c76"
-- 
1.7.5.1.300.gc565c



