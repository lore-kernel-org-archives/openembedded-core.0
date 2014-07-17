Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D47B86ACEC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 07:58:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6H7wMgC024563
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 00:58:22 -0700 (PDT)
Received: from PEK-MLIU3-D1.corp.ad.wrs.com (128.224.163.186) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Thu, 17 Jul 2014 00:58:21 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jul 2014 15:58:17 +0800
Message-ID: <1405583899-13188-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
Subject: [PATCH 1/3] flac: explicitly disable checking for nasm
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
X-List-Received-Date: Thu, 17 Jul 2014 07:58:26 -0000
Content-Type: text/plain

Automatical checking for nasm program will lead flac to a implicit build
result depending on nasm is built before or after it.

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-multimedia/flac/flac_1.3.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/flac/flac_1.3.0.bb b/meta/recipes-multimedia/flac/flac_1.3.0.bb
index ab37cbe..fdf38e9 100644
--- a/meta/recipes-multimedia/flac/flac_1.3.0.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.0.bb
@@ -28,6 +28,7 @@ EXTRA_OECONF = "--disable-oggtest \
                 --with-ogg-includes=${STAGING_INCDIR} \
                 --disable-xmms-plugin \
                 --without-libiconv-prefix \
+                ac_cv_prog_NASM="" \
                 "
 
 EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "altivec", " --enable-altivec", " --disable-altivec", d)}"
-- 
1.8.4.1


