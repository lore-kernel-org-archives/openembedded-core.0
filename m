Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DCFE577D52
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 13:21:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6VDL5fr002531
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 06:21:05 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Mon, 31 Jul 2017 06:21:04 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 31 Jul 2017 21:11:33 +0800
Message-ID: <1501506693-13285-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] qemux86 qemux86-64: Enable pci
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
X-List-Received-Date: Mon, 31 Jul 2017 13:21:05 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

lspci and some other software require "pci" in MACHINE_FEATURES and PCI
is valid in the qemux86* context.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/conf/machine/qemux86-64.conf | 2 +-
 meta/conf/machine/qemux86.conf    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 4f30033..9f78191 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -28,7 +28,7 @@ XSERVER = "xserver-xorg \
            xserver-xorg-module-libint10 \
            "
 
-MACHINE_FEATURES += "x86"
+MACHINE_FEATURES += "x86 pci"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index e232947..d778fa7 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -27,7 +27,7 @@ XSERVER = "xserver-xorg \
            xserver-xorg-module-libint10 \
            "
 
-MACHINE_FEATURES += "x86"
+MACHINE_FEATURES += "x86 pci"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
-- 
2.8.1


