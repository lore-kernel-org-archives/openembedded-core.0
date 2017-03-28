Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 659B177A4F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:58:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v2SCwDup022464
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 Mar 2017 05:58:13 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 28 Mar 2017 05:58:12 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 28 Mar 2017 08:58:06 -0400
Message-ID: <3270c4a26f064a91bb6bcba0d1a69f9564e2742d.1490705726.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1490705726.git.bruce.ashfield@windriver.com>
References: <cover.1490705726.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] linux-yocto/4.9: integrate 4.9-rt12
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
X-List-Received-Date: Tue, 28 Mar 2017 12:58:12 -0000
Content-Type: text/plain

Paul Gortmaker has made the 4.9-rt12 available to linux-yocto, so
we integrate it here and update the SRCREVs.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   | 4 ++--
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index e5f8e1d44ce2..63a8a3412d80 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,8 +11,8 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "66f4ce788d6bd16e858ec3d32b8b0f91619eb356"
-SRCREV_meta ?= "0e129b67b7c5999940f2137f8fdbced06d122475"
+SRCREV_machine ?= "95acaf7dbc800201295e6eb9f9a37ac24c53001b"
+SRCREV_meta ?= "8b97a445fab217b545fff10c27be8f60853f29de"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index fefe309b0f38..2dc233e57d11 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -10,7 +10,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "e675c4ecccb9dd9dd637f104e32b7808b4d56846"
-SRCREV_meta ?= "0e129b67b7c5999940f2137f8fdbced06d122475"
+SRCREV_meta ?= "8b97a445fab217b545fff10c27be8f60853f29de"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index 17bbdbabb2f2..54fafae66305 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "e675c4ecccb9dd9dd637f104e32b7808b4d56846"
 SRCREV_machine_qemux86-64 ?= "e675c4ecccb9dd9dd637f104e32b7808b4d56846"
 SRCREV_machine_qemumips64 ?= "c7eee598e73eb4b6eb1e9d203e6e84e63a4a278a"
 SRCREV_machine ?= "e675c4ecccb9dd9dd637f104e32b7808b4d56846"
-SRCREV_meta ?= "0e129b67b7c5999940f2137f8fdbced06d122475"
+SRCREV_meta ?= "8b97a445fab217b545fff10c27be8f60853f29de"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
-- 
2.5.0


