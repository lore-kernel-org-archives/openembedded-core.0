Return-Path: <Yang.Shi@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id EBBDB61222
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2013 16:56:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7GGuS4V025725
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 16 Aug 2013 12:56:29 -0400 (EDT)
Received: from localhost.localdomain (147.11.152.86) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 16 Aug 2013 09:56:27 -0700
From: Yang Shi <yang.shi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Aug 2013 09:51:22 -0700
Message-ID: <1376671882-26213-2-git-send-email-yang.shi@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1376671882-26213-1-git-send-email-yang.shi@windriver.com>
References: <1376671882-26213-1-git-send-email-yang.shi@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH] hello-mod: Add comment for kernel module package naming
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
X-List-Received-Date: Fri, 16 Aug 2013 16:56:38 -0000
Content-Type: text/plain

modules bbclass renames kernel module packages with "kernel-module-" prefix
automatically.

Signed-off-by: Yang Shi <yang.shi@windriver.com>
---
 .../recipes-kernel/hello-mod/hello-mod_0.1.bb      |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
index 64a6dda..3136ae7 100644
--- a/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
+++ b/meta-skeleton/recipes-kernel/hello-mod/hello-mod_0.1.bb
@@ -13,3 +13,6 @@ SRC_URI = "file://Makefile \
           "
 
 S = "${WORKDIR}"
+
+# The inherit of module.bbclass will automatically name module packages with
+# "kernel-module-" prefix as required by the oe-core build environment.
-- 
1.7.5.4


