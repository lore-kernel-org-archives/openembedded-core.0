Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 749CA778D8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 08:06:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6P86YFl011767
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 01:06:34 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 25 Jul 2017 01:06:33 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Jul 2017 16:06:12 +0800
Message-ID: <20170725080612.422-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] debianutils: set higher priority than busybox for run-parts
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
X-List-Received-Date: Tue, 25 Jul 2017 08:06:33 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

debianutils-run-parts should have higher priority than
busybox (which is 50), so set the priority to 60 for
debianutils-run-parts.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-support/debianutils/debianutils_4.8.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/debianutils/debianutils_4.8.1.bb b/meta/recipes-support/debianutils/debianutils_4.8.1.bb
index 54c345ea25..0529a50983 100644
--- a/meta/recipes-support/debianutils/debianutils_4.8.1.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.8.1.bb
@@ -38,6 +38,8 @@ RDEPENDS_${PN} += "${PN}-run-parts"
 
 ALTERNATIVE_PRIORITY="30"
 ALTERNATIVE_${PN} = "add-shell installkernel remove-shell savelog tempfile which"
+
+ALTERNATIVE_PRIORITY_${PN}-run-parts = "60"
 ALTERNATIVE_${PN}-run-parts = "run-parts"
 
 ALTERNATIVE_${PN}-doc = "which.1"
-- 
2.11.0


