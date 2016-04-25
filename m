Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A1B7F6FFD8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 13:51:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3PDpmc8017722
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 06:51:48 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Apr 2016 06:51:47 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Apr 2016 06:51:42 -0700
Message-ID: <2457a02f2b11bf8e7af37dd6ffe8ee4760fb03df.1461592183.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1461592183.git.liezhi.yang@windriver.com>
References: <cover.1461592183.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] meta-world-pkgdata: add LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 25 Apr 2016 13:51:47 -0000
Content-Type: text/plain

Fixed:
ERROR: meta-world-pkgdata-1.0-r0 do_populate_lic: QA Issue: meta-world-pkgdata: Recipe file does not have license file information (LIC_FILES_CHKSUM) [license-checksum]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/meta/meta-world-pkgdata.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/meta-world-pkgdata.bb b/meta/recipes-core/meta/meta-world-pkgdata.bb
index 3c5db50..b3989cd 100644
--- a/meta/recipes-core/meta/meta-world-pkgdata.bb
+++ b/meta/recipes-core/meta/meta-world-pkgdata.bb
@@ -1,5 +1,7 @@
 SUMMARY = "Pulls in pkgdata for world"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM ?= "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
 INHIBIT_DEFAULT_DEPS = "1"
 
 addtask do_allpackagedata before do_build
-- 
2.7.4


