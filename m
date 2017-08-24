Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 22593782AE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 01:19:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7O1JLdv026991
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Aug 2017 18:19:21 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 23 Aug 2017 18:19:20 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Aug 2017 09:18:38 +0800
Message-ID: <20170824011838.25348-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH v2] webkitgtk: disable gobject-introspection on armv7a
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
X-List-Received-Date: Thu, 24 Aug 2017 01:19:22 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Disable gobject-introspection on armv7a and armv7ve
to avoid do_compile failure:

| qemu: uncaught target signal 11 (Segmentation fault) - core dumped
| Segmentation fault

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.16.6.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
index df355d29ba..0f126cba81 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
@@ -112,3 +112,8 @@ ARM_INSTRUCTION_SET_armv6 = "arm"
 ARM_INSTRUCTION_SET_armv7a = "thumb"
 ARM_INSTRUCTION_SET_armv7r = "thumb"
 ARM_INSTRUCTION_SET_armv7ve = "thumb"
+
+# qemu: uncaught target signal 11 (Segmentation fault) - core dumped
+# Segmentation fault
+GI_DATA_ENABLED_armv7a = "False"
+GI_DATA_ENABLED_armv7ve = "False"
-- 
2.11.0


