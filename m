Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AF8297D2CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 08:32:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3F8Wong001012
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 01:32:50 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Mon, 15 Apr 2019 01:32:49 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Apr 2019 16:32:47 +0800
Message-ID: <1555317167-20284-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [PATCH] libyaml: update SRC_URI[md5sum] and SRC_URI[sha256sum]
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
X-List-Received-Date: Mon, 15 Apr 2019 08:32:49 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/libyaml/libyaml_0.2.2.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libyaml/libyaml_0.2.2.bb b/meta/recipes-support/libyaml/libyaml_0.2.2.bb
index d2b39f3..fbd1992 100644
--- a/meta/recipes-support/libyaml/libyaml_0.2.2.bb
+++ b/meta/recipes-support/libyaml/libyaml_0.2.2.bb
@@ -8,8 +8,10 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a76b4c69bfcf82313bbdc0393b04438a"
 
 SRC_URI = "http://pyyaml.org/download/libyaml/yaml-${PV}.tar.gz"
-SRC_URI[md5sum] = "2ad4119a57f94739cc39a1b482c81264"
-SRC_URI[sha256sum] = "46bca77dc8be954686cff21888d6ce10ca4016b360ae1f56962e6882a17aa1fe"
+SRC_URI[md5sum] = "54bf11ccb8bc488b5b3bec931f5b70dc"
+SRC_URI[sha256sum] = "4a9100ab61047fd9bd395bcef3ce5403365cafd55c1e0d0299cde14958e47be9"
+
+S = "${WORKDIR}/yaml-${PV}"
 
 inherit autotools
 
-- 
2.7.4


