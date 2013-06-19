Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 97A8C601AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 06:37:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5J6bIvh025971
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 23:37:18 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 18 Jun 2013 23:37:17 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jun 2013 14:37:09 +0800
Message-ID: <92a2562fcefd5791424d47935898308b289eaf75.1371623706.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1371623706.git.rongqing.li@windriver.com>
References: <cover.1371623706.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] image-live.bbclass: enable read-only-rootfs IMAGE_FEATURE
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
X-List-Received-Date: Wed, 19 Jun 2013 06:37:16 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

enable read-only-rootfs to make /tmp be able to be written when using sysvinit

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 meta/classes/image-live.bbclass |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index bfb59f8..3f203d1 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -9,6 +9,8 @@ LABELS_append = " ${SYSLINUX_LABELS} "
 
 ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
 
+IMAGE_FEATURES_append = " read-only-rootfs"
+
 do_bootimg[depends] += "${INITRD_IMAGE}:do_rootfs"
 do_bootimg[depends] += "${PN}:do_rootfs"
 
-- 
1.7.10.4


