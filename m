Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6E2FA79D76
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Nov 2018 03:16:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA13FE69015139
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 20:15:57 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 31 Oct 2018 20:15:18 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Nov 2018 11:15:17 +0800
Message-ID: <1541042117-20190-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] apt: update SRC_URI
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
X-List-Received-Date: Thu, 01 Nov 2018 03:16:06 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

update SRC_URI since previous link is not valid now

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/apt/apt.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index f1cde30..50f22c8 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -2,7 +2,7 @@ SUMMARY = "Advanced front-end for dpkg"
 LICENSE = "GPLv2.0+"
 SECTION = "base"
 
-SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/a/${BPN}/${BPN}_${PV}.tar.xz \
+SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/apt/1.2.24/${BPN}_${PV}.tar.xz \
            file://use-host.patch \
            file://makerace.patch \
            file://no-nls-dpkg.patch \
-- 
2.7.4


