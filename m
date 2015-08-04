Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 99B0A757A4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 06:40:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t746eBK1009687
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Aug 2015 23:40:12 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 3 Aug 2015 23:40:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Aug 2015 23:40:07 -0700
Message-ID: <ffe7176dbe7fdc3acd4da73571765303bbb4b10a.1438670283.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1438670283.git.liezhi.yang@windriver.com>
References: <cover.1438670283.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] libcheck: 0.9.14 -> 0.10.0
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
X-List-Received-Date: Tue, 04 Aug 2015 06:40:15 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../{libcheck_0.9.14.bb => libcheck_0.10.0.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libcheck/{libcheck_0.9.14.bb => libcheck_0.10.0.bb} (79%)

diff --git a/meta/recipes-support/libcheck/libcheck_0.9.14.bb b/meta/recipes-support/libcheck/libcheck_0.10.0.bb
similarity index 79%
rename from meta/recipes-support/libcheck/libcheck_0.9.14.bb
rename to meta/recipes-support/libcheck/libcheck_0.10.0.bb
index 2a69ff7..c0b459f 100644
--- a/meta/recipes-support/libcheck/libcheck_0.9.14.bb
+++ b/meta/recipes-support/libcheck/libcheck_0.10.0.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=2d5025d4aa3495befef8f17206a5b0a1"
 SRC_URI = "${SOURCEFORGE_MIRROR}/check/check-${PV}.tar.gz \
           "
 
-SRC_URI[md5sum] = "38263d115d784c17aa3b959ce94be8b8"
-SRC_URI[sha256sum] = "c272624645b1b738cf57fd5d81a3e4d9b722b99d6133ee3f3c4007d4d279840a"
+SRC_URI[md5sum] = "53c5e5c77d090e103a17f3ed7fd7d8b8"
+SRC_URI[sha256sum] = "f5f50766aa6f8fe5a2df752666ca01a950add45079aa06416b83765b1cf71052"
 
 S = "${WORKDIR}/check-${PV}"
 
-- 
1.7.9.5


