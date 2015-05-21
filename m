Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F35A673BE8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 19:09:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4LJ91MK010771
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 May 2015 12:09:02 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 21 May 2015 12:09:01 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 21 May 2015 15:08:55 -0400
Message-ID: <ad444598daaea7f6760adb9a6ad0a1a42dcc31e3.1432235097.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1432235097.git.bruce.ashfield@windriver.com>
References: <cover.1432235097.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/7] linux-yocto/3.19: Braswell DRM fixes
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
X-List-Received-Date: Thu, 21 May 2015 19:09:02 -0000
Content-Type: text/plain

Updating the 3.19 kernel SRCREVs to integrate the following Braswell
changes:

  374b5d0e09ea drm/i915: Only wait for required lanes in vlv_wait_port_ready()
  fca99e8ee111 Revert "drm/i915: Hack to tie both common lanes together on chv"
  00682f31b612 drm/i915: Work around DISPLAY_PHY_CONTROL register corruption on CHV
  654b1a4497c5 drm/i915: Implement chv display PHY lane stagger setup

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb |  2 +-
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
index d8f8d498ad27..e55a75a74e4e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.19.5"
 KMETA = "meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0befa35f40997c90936047e57fbbdd7edbf7e525"
+SRCREV_machine ?= "374b5d0e09ea016975f3d5ab5544968f31054f52"
 SRCREV_meta ?= "7215fe431391a322c7e39f410e7b8f2a2b507892"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
index b6ec61a43b98..72fe25ac867f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
@@ -11,14 +11,14 @@ KBRANCH_qemux86  ?= "standard/common-pc"
 KBRANCH_qemux86-64 ?= "standard/common-pc-64/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "123f12cf162082802442d70701d83749376c45df"
-SRCREV_machine_qemuarm64 ?= "0befa35f40997c90936047e57fbbdd7edbf7e525"
-SRCREV_machine_qemumips ?= "c6bc6e6a10b188f96b9761411421be78ee67aa75"
-SRCREV_machine_qemuppc ?= "b79584c854f875890d708d7fb3cda85430a9d3ec"
-SRCREV_machine_qemux86 ?= "0befa35f40997c90936047e57fbbdd7edbf7e525"
-SRCREV_machine_qemux86-64 ?= "0befa35f40997c90936047e57fbbdd7edbf7e525"
-SRCREV_machine_qemumips64 ?= "b25c62fa52d51dac118b0eed20b8d5971434fa80"
-SRCREV_machine ?= "0befa35f40997c90936047e57fbbdd7edbf7e525"
+SRCREV_machine_qemuarm ?= "00d625a9e909ff5cbf138cb20dc54e10f30638b3"
+SRCREV_machine_qemuarm64 ?= "374b5d0e09ea016975f3d5ab5544968f31054f52"
+SRCREV_machine_qemumips ?= "76bf3763b224e6d15c060206015f787e8968a4d7"
+SRCREV_machine_qemuppc ?= "6188d8bb5f774f0f760225f34371e94fcf8615d4"
+SRCREV_machine_qemux86 ?= "374b5d0e09ea016975f3d5ab5544968f31054f52"
+SRCREV_machine_qemux86-64 ?= "374b5d0e09ea016975f3d5ab5544968f31054f52"
+SRCREV_machine_qemumips64 ?= "623f6699ea6c4148579c8ede54ccfe0f3784b531"
+SRCREV_machine ?= "374b5d0e09ea016975f3d5ab5544968f31054f52"
 SRCREV_meta ?= "7215fe431391a322c7e39f410e7b8f2a2b507892"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.19.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
-- 
2.1.0


