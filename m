Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1D69660304
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 19:21:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5IJLOxN017388
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 12:21:25 -0700 (PDT)
Received: from fidler.corp.ad.wrs.com (128.224.146.250) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 18 Jun 2013 12:21:23 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Jun 2013 15:21:20 -0400
Message-ID: <1371583280-4333-1-git-send-email-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 1.8.2.1
MIME-Version: 1.0
Subject: [PATCH] nostromo: make SRC_URI work for multilib builds.
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
X-List-Received-Date: Tue, 18 Jun 2013 19:21:23 -0000
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
index e66676e..f729e6a 100644
--- a/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
+++ b/meta-webserver/recipes-httpd/nostromo/nostromo_1.9.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.nazgul.ch/dev_nostromo.html"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://src/nhttpd/main.c;beginline=2;endline=14;md5=e5ec3fa723b29b7d59d205afd8d36938"
 
-SRC_URI = "http://www.nazgul.ch/dev/${PN}-${PV}.tar.gz \
+SRC_URI = "http://www.nazgul.ch/dev/nostromo-${PV}.tar.gz \
            file://0001-GNUmakefile-add-possibility-to-override-variables.patch \
            file://nhttpd.conf \
            file://volatiles \
-- 
1.8.2.1


