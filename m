Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0731360116
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2016 18:22:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u65IMIBY031737
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jul 2016 11:22:18 -0700
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 5 Jul 2016 11:22:17 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<randy.macleod@windriver.com>
Date: Tue, 5 Jul 2016 11:22:17 -0700
Message-ID: <1467742937-17331-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] libidn: add license per package
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
X-List-Received-Date: Tue, 05 Jul 2016 18:22:22 -0000
Content-Type: text/plain

The idn package is GPLv3 and the rest is LGPLv2.1+ or LGPLv3.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-extended/libidn/libidn_1.32.bb |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/libidn/libidn_1.32.bb b/meta/recipes-extended/libidn/libidn_1.32.bb
index 565c75d..af828cb 100644
--- a/meta/recipes-extended/libidn/libidn_1.32.bb
+++ b/meta/recipes-extended/libidn/libidn_1.32.bb
@@ -28,6 +28,9 @@ SRC_URI[sha256sum] = "ba5d5afee2beff703a34ee094668da5c6ea5afa38784cebba8924105e1
 PACKAGES =+ "idn"
 FILES_idn = "${bindir}/*"
 
+LICENSE_${PN} = "LGPLv2.1+ | LGPLv3"
+LICENSE_idn = "GPLv3+"
+
 EXTRA_OECONF = "--disable-csharp"
 
 do_install_append() {
-- 
1.7.9.5


