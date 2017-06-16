Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 603A878423
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 03:02:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5G330OU026735
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 20:03:00 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 15 Jun 2017 20:02:59 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Jun 2017 20:02:59 -0700
Message-ID: <20170616030259.19456-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [meta-filesystems][PATCH] fuse: fix SRC_URI
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
X-List-Received-Date: Fri, 16 Jun 2017 03:03:00 -0000
Content-Type: text/plain

${P} -> ${BP}, otherwise it would fail when multilib.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
index e66f3cd..87292fe 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.7.bb
@@ -10,7 +10,7 @@ LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI = "https://github.com/libfuse/libfuse/releases/download/${P}/${P}.tar.gz \
+SRC_URI = "https://github.com/libfuse/libfuse/releases/download/${BP}/${BP}.tar.gz \
            file://gold-unversioned-symbol.patch \
            file://aarch64.patch \
            file://0001-fuse-fix-the-return-value-of-help-option.patch \
-- 
2.10.2


