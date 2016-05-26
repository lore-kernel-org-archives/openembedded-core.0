Return-Path: <Zhenbo.Gao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0826D6FF56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 06:40:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4Q6eGaE022462
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 23:40:16 -0700 (PDT)
Received: from pek-zgao-d1.corp.ad.wrs.com (128.224.162.191) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 25 May 2016 23:40:15 -0700
From: Zhenbo Gao <zhenbo.gao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 26 May 2016 14:40:09 +0800
Message-ID: <1464244809-22488-1-git-send-email-zhenbo.gao@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] packagegroup-self-hosted.bb: remove unsuitable network related dependence
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
X-List-Received-Date: Thu, 26 May 2016 06:40:17 -0000
Content-Type: text/plain

self-hosted should not include any network related dependence, the image that
pulls in this packagegroup should handle any networking requirements.

Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index aa88cf9..c43e7e8 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -28,9 +28,6 @@ RDEPENDS_packagegroup-self-hosted = "\
     "
 
 RDEPENDS_packagegroup-self-hosted-host-tools = "\
-    connman \
-    connman-plugin-ethernet \
-    dhcp-client \
     e2fsprogs \
     e2fsprogs-e2fsck \
     e2fsprogs-mke2fs \
-- 
1.9.1


