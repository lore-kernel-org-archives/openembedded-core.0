Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 284E6755F4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 04:34:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9S4YY1n028303
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 21:34:34 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 27 Oct 2015 21:34:34 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Oct 2015 12:34:55 +0800
Message-ID: <1446006895-19195-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] qemu: enable user mode for mips64 and mips64el
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
X-List-Received-Date: Wed, 28 Oct 2015 04:34:38 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

- remove mips64 and mips64el from softmmuonly list
  to enable user mode, they have been supported
  since 2012.
- keep the softmmuonly list and for loop although
  there is only one for now in case more supported
  arches added.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-devtools/qemu/qemu-targets.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu-targets.inc b/meta/recipes-devtools/qemu/qemu-targets.inc
index 5c35655..a3e46a8 100644
--- a/meta/recipes-devtools/qemu/qemu-targets.inc
+++ b/meta/recipes-devtools/qemu/qemu-targets.inc
@@ -7,7 +7,7 @@ def get_qemu_target_list(d):
     archs = d.getVar('QEMU_TARGETS', True).split()
     tos = d.getVar('HOST_OS', True)
     softmmuonly = ""
-    for arch in ['mips64', 'mips64el', 'ppcemb']:
+    for arch in ['ppcemb']:
         if arch in archs:
             softmmuonly += arch + "-softmmu,"
             archs.remove(arch)
-- 
1.9.1


