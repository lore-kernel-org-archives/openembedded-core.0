Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C38A560034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 18:57:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2OIvvu9027238
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Mar 2015 11:57:57 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 24 Mar 2015 11:57:56 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 24 Mar 2015 14:57:52 -0400
Message-ID: <2c03175314036b7360039fae572b9c9716d3f1c8.1427222980.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1427222980.git.bruce.ashfield@windriver.com>
References: <cover.1427222980.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/5] linux-yocto/3.19: fixes for Intel core warnings
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
X-List-Received-Date: Tue, 24 Mar 2015 18:57:56 -0000
Content-Type: text/plain

Updating the 3.19 meta branch to include the following configuration
change to deal with kernel configuration audit warnings:

  9e70b482d377 romley: remove common video and media config items
  8a4e096759ad intel-common: remove eg20t from common config
  c2f5ab15620c drm-cdvpvr: Add STAGING_MEDIA
  ac4693c1db39 media: Prefer modules(m) to yes(y) and update for 3.19 Kernel

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
index d5a07dd68918..0631c5e55156 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "31b35da6a5c8a2b162f6c33202e9b64dd13757d5"
-SRCREV_meta ?= "8fc194deced3f83e78b0671c6ff8b45bdb7f80e7"
+SRCREV_meta ?= "9e70b482d3773abf92c9c5850e134cbca1d5651f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
index ac1856abcecc..9b19eb299b16 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "31b35da6a5c8a2b162f6c33202e9b64dd13757d5"
 SRCREV_machine_qemux86-64 ?= "31b35da6a5c8a2b162f6c33202e9b64dd13757d5"
 SRCREV_machine_qemumips64 ?= "d35649ef8cbb0a0404be5c721377b138866181ad"
 SRCREV_machine ?= "31b35da6a5c8a2b162f6c33202e9b64dd13757d5"
-SRCREV_meta ?= "8fc194deced3f83e78b0671c6ff8b45bdb7f80e7"
+SRCREV_meta ?= "9e70b482d3773abf92c9c5850e134cbca1d5651f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.19.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
2.1.0


