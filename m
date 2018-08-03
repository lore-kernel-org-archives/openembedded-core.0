Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 846F078E17
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 02:26:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w732PwN4013937
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 Aug 2018 19:25:59 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Thu, 2 Aug 2018 19:25:57 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 3 Aug 2018 09:49:47 +0800
Message-ID: <20180803014947.23598-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180803014947.23598-1-kai.kang@windriver.com>
References: <20180803014947.23598-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] layer.conf: update SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS
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
X-List-Received-Date: Fri, 03 Aug 2018 02:26:00 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

allarch has been removed from some packages which rdepends on
TUNE_PKGARCH packages, so remove related depenencies from
SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/conf/layer.conf | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 315fb936fa..49ce7a913a 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -53,10 +53,6 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   *->icecc-create-env-native \
   gcc-cross-${TARGET_ARCH}->virtual/${TARGET_PREFIX}libc-for-gcc \
   gcc-cross-${TARGET_ARCH}->linux-libc-headers \
-  ppp-dialin->ppp \
-  resolvconf->bash \
-  docbook-xsl-stylesheets->perl \
-  ca-certificates->openssl \
   initramfs-framework->${VIRTUAL-RUNTIME_base-utils} \
   initramfs-framework->eudev \
   initramfs-framework->systemd \
@@ -72,10 +68,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   liberation-fonts->fontconfig \
   cantarell-fonts->fontconfig \
   gnome-icon-theme->librsvg \
-  font-alias->font-util \
   systemd-boot->systemd-bootconf \
-  weston-init->weston \
-  weston-init->kbd \
 "
 
 # We need to keep bitbake tools in PATH
-- 
2.17.1


