Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B51B172E48
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Feb 2015 16:31:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t16GV95W011219
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 6 Feb 2015 08:31:10 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 6 Feb 2015 08:31:09 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 6 Feb 2015 11:31:01 -0500
Message-ID: <b71f98e94401f9c1ea4e992370dce35f50684db5.1423237494.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1423237494.git.bruce.ashfield@windriver.com>
References: <cover.1423237494.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] kernel-dev: install all modules by default
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
X-List-Received-Date: Fri, 06 Feb 2015 16:31:12 -0000
Content-Type: text/plain

When doing kernel development testing, we want all the modules that were
built to be installed on the target.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-extended/images/core-image-kernel-dev.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/images/core-image-kernel-dev.bb b/meta/recipes-extended/images/core-image-kernel-dev.bb
index d14f658726ab..e1aa71a79fb9 100644
--- a/meta/recipes-extended/images/core-image-kernel-dev.bb
+++ b/meta/recipes-extended/images/core-image-kernel-dev.bb
@@ -6,7 +6,7 @@ require recipes-core/images/core-image-minimal.bb
 
 KERNEL_DEV_UTILS ?= "dropbear"
 KERNEL_DEV_TOOLS ?= "packagegroup-core-tools-profile packagegroup-core-buildessential kernel-devsrc"
-KERNEL_DEV_MODULE ?= ""
+KERNEL_DEV_MODULE ?= "kernel-modules"
 
 CORE_IMAGE_EXTRA_INSTALL += "${KERNEL_DEV_MODULE} \
                              ${KERNEL_DEV_UTILS} \
-- 
2.1.0


