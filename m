Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9C6E573177
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 02:20:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u382KQMo019549
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Apr 2016 19:20:26 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 7 Apr 2016 19:20:26 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Apr 2016 19:20:25 -0700
Message-ID: <e0cfd75640f09df0315a008439599b7f29274e7a.1460080955.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1460080955.git.liezhi.yang@windriver.com>
References: <cover.1460080955.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] image-live.bbclass: fix iso + efi only
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
X-List-Received-Date: Fri, 08 Apr 2016 02:20:26 -0000
Content-Type: text/plain

When the user only builds iso + efi only, the syslinux-native which
provides isohybrid is required to build iso, so add syslinux-native to
DEPENDS.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image-live.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index c837fbf..c8a8610 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -32,6 +32,7 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
                         cdrtools-native:do_populate_sysroot \
                         virtual/kernel:do_deploy \
                         ${MLPREFIX}syslinux:do_populate_sysroot \
+                        syslinux-native:do_populate_sysroot \
                         ${@oe.utils.ifelse(d.getVar('COMPRESSISO', False),'zisofs-tools-native:do_populate_sysroot','')} \
                         ${PN}:do_image_ext4 \
                         "
-- 
2.8.0


