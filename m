Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A7A596FA80
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 07:51:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2Q7pRjn000567
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 00:51:27 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 26 Mar 2014 00:51:27 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 15:52:11 +0800
Message-ID: <1395820331-20426-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] setserial: package depends on groff-native to build
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
X-List-Received-Date: Wed, 26 Mar 2014 07:51:28 -0000
Content-Type: text/plain

From: Yue Tao <Yue.Tao@windriver.com>

Signed-off-by: Jonas Zetterberg <jonas.zetterberg@windriver.com>
Signed-off-by: Yue Tao <yue.tao@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-bsp/setserial/setserial_2.17.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/setserial/setserial_2.17.bb b/meta/recipes-bsp/setserial/setserial_2.17.bb
index 65d6068..f1e8cd3 100644
--- a/meta/recipes-bsp/setserial/setserial_2.17.bb
+++ b/meta/recipes-bsp/setserial/setserial_2.17.bb
@@ -8,6 +8,8 @@ LICENSE = "GPLv2.0"
 LIC_FILES_CHKSUM = "file://version.h;beginline=1;endline=6;md5=2e7c59cb9e57e356ae81f50f4e4dfd99"
 PR = "r3"
 
+DEPENDS += "groff-native"
+
 inherit autotools-brokensep
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/setserial/${BPN}-${PV}.tar.gz \
-- 
1.7.9.5


