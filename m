Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A89478E0E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 01:29:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w731TQmb020599
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 2 Aug 2018 18:29:26 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Thu, 2 Aug 2018 18:29:25 -0700
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 3 Aug 2018 08:53:22 +0800
Message-ID: <20180803005322.18552-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180803005322.18552-1-kai.kang@windriver.com>
References: <20180803005322.18552-1-kai.kang@windriver.com>
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
X-List-Received-Date: Fri, 03 Aug 2018 01:29:26 -0000
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


