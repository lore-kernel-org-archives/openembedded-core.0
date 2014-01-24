Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id B8BD26E6FB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2014 01:26:26 +0000 (UTC)
Received: by mail-yk0-f170.google.com with SMTP id 9so4178064ykp.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 17:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=Q5hW9K3zQrz4WS3GH2QCoAfGe6MfcbvCkLorV8C27Cs=;
	b=xRKumqz9IRxSv6cYS0RVkOC+dGcwo35OYePFszLPhy9PwgHUsI7fdCuD+0o6xcwHp2
	JqL40j4jOjc+3gwKkZ8O+Ff3BAVBJXJJASt2qtvleuAX6WHQ5pW1KRG2stoUrTyDGNRL
	+tDU0U3Eu5f345wvijqv2QLKOhvXBfi3BeaSWsfvInHS65s+MxckKIyx1B5LvNK8qG1R
	gm4VH+tBsCnvcUCc8Kq2akHvP0IaKcsKZdrLD/6ePetZr96K9dtvIh/X8ksK+1LxpicU
	hOa95jDQ2tQor9IcYHCvVpHEd+noH9DSggOe7fgRiPPIXOKJCUg4KtHsri6tgKmd/tHa
	8SIg==
X-Received: by 10.236.194.40 with SMTP id l28mr401890yhn.63.1390526787761;
	Thu, 23 Jan 2014 17:26:27 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.194.208.225])
	by mx.google.com with ESMTPSA id h66sm42456725yhb.7.2014.01.23.17.26.25
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jan 2014 17:26:26 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id 14F4F17BF8CF7; Thu, 23 Jan 2014 23:26:19 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 23:26:10 -0200
Message-Id: <1390526775-26036-7-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
References: <1390526775-26036-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Subject: [meta-fsl-arm][PATCH v3 06/11] libfslvpuwrap: Upgrade to 1.0.45 version
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
X-List-Received-Date: Fri, 24 Jan 2014 01:26:27 -0000

From: Lauren Post <lauren.post@freescale.com>

Package is from 3.10.17-1.0.0_beta release

Change-Id: I9822ff9c09d0644459f8cfba8cd5459783b200aa
Signed-off-by: Lauren Post <lauren.post@freescale.com>
---
 .../{libfslvpuwrap_1.0.40.bb => libfslvpuwrap_1.0.45.bb}      | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)
 rename recipes-multimedia/libfslvpuwrap/{libfslvpuwrap_1.0.40.bb => libfslvpuwrap_1.0.45.bb} (57%)

diff --git a/recipes-multimedia/libfslvpuwrap/libfslvpuwrap_1.0.40.bb b/recipes-multimedia/libfslvpuwrap/libfslvpuwrap_1.0.45.bb
similarity index 57%
rename from recipes-multimedia/libfslvpuwrap/libfslvpuwrap_1.0.40.bb
rename to recipes-multimedia/libfslvpuwrap/libfslvpuwrap_1.0.45.bb
index 95322ea..41a0ee3 100644
--- a/recipes-multimedia/libfslvpuwrap/libfslvpuwrap_1.0.40.bb
+++ b/recipes-multimedia/libfslvpuwrap/libfslvpuwrap_1.0.45.bb
@@ -1,4 +1,4 @@
-# Copyright (C) 2013 Freescale Semiconductor
+# Copyright (C) 2013, 2014 Freescale Semiconductor
 # Released under the MIT license (see COPYING.MIT for the terms)
 DESCRIPTION = "Freescale Multimedia VPU wrapper"
 DEPENDS = "imx-vpu"
@@ -6,12 +6,9 @@ LICENSE = "Proprietary"
 SECTION = "multimedia"
 LIC_FILES_CHKSUM = "file://EULA.txt;md5=93b784b1c11b3fffb1638498a8dde3f6"
 
-# FIXME: Inspecting the source code the content is in fact 1.0.40
-SRC_URI = "${FSL_MIRROR}/${PN}-3.10.9-1.0.0.bin;fsl-eula=true"
-SRC_URI[md5sum] = "25891ef8d92e82d9b2e999a74a327971"
-SRC_URI[sha256sum] = "84d610c478963e7b6a9660a38547b5365ca910159972b3860d7356aee33b9b41"
-
-S = "${WORKDIR}/${PN}-3.10.9-1.0.0"
+SRC_URI = "${FSL_MIRROR}/${PN}-${PV}.bin;fsl-eula=true"
+SRC_URI[md5sum] = "99d866c979c8a798c843f32632293f14"
+SRC_URI[sha256sum] = "c6ca189216bc60c53d342bcd9d9e7899229b96b54ae48ebfcf5f573096c34dcd"
 
 inherit fsl-eula-unpack autotools pkgconfig
 
-- 
1.8.5.3


