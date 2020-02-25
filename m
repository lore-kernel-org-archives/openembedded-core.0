Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
	[209.85.128.49])
	by mail.openembedded.org (Postfix) with ESMTP id 08E636089C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 18:54:05 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id a5so305594wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 10:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2NcmojncucyQyZp0eLqIu7Os1aADE7Ev4cnfhmteMS8=;
	b=llDyWjcX00aUFT7aYWG0QWhoSwl8Yma8Fc7uMVjqOZ6sT3fU2e2139ImDdYiIO7vEv
	bdFWT/j2x6lZelalGdIE7L8RNQ97ByD+v/Lv5Ntgva2Are70/1u2NiuFSAgHkti+e3ct
	6RRIUxcpYCc4a0BVBMT9jCRXgKSuhcxvDO3pjE4pQwYGHcCK/3NiVO9jrqt0XU/Jr7LQ
	qZ/67LmvCSRz16PBfXFPH0bSEMcy9oKaBCyc96Yc6EUx86lK4hybiRuA2WsV07Viw2+o
	woiiMus5yrIrSVpoG+608wr3nYM2qfWuxSmlyABN//ahkzTQQPAeRDMhMIu/7wxlP/Bg
	hBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2NcmojncucyQyZp0eLqIu7Os1aADE7Ev4cnfhmteMS8=;
	b=MGm1tE4+7EIAKNNsXD8X0/V7e3kg4f5/cP4TGfmSJXHVZ1aoRcMjfR0tNq4ExpuauE
	s9Gj7BGhLj6NOOFanJzInjwH9+wdl5Z4z7VbeqKf1oyI1g4eu0PvJk8vugppYK57fdIR
	irDWrLQNIuGT3dTzjmVGkZWJPZYTDn/KaOXV6pCAFLLTUi9gxt7UG92Bk2RkYcqUlbQB
	xjWXW4WozC4AVVjIV/VouQdOiEfgDi5kwG0xry0ZSqtKgjFqcV45Y4Yjp8vNb5bgFuyF
	fuLDCTuGkGiofigTfbftImrCwc8+II6L2vK57NfNYU54Vh+QDR5erp4p48Wy+21kRovc
	E+mg==
X-Gm-Message-State: APjAAAU+FxfXFSueYbCgpE/N0thHsPSRHTDTJi2XnWHZaK/+kIZmjRDz
	84Dym9ysl3qEjLKt55zEt4lZxMuI
X-Google-Smtp-Source: APXvYqz6kOZFQS2wu0BeqAds2/1lmY1UDNmmlMG7TFH1wTyQYa+OwoQ0Mco3JuzRZ+qV/UGVHtPMZA==
X-Received: by 2002:a1c:1d90:: with SMTP id d138mr540161wmd.163.1582656846320; 
	Tue, 25 Feb 2020 10:54:06 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	g7sm25730756wrq.21.2020.02.25.10.54.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 10:54:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 19:53:24 +0100
Message-Id: <20200225185335.19326-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH 01/12] libmodule-build-perl: upgrade 0.4229 -> 0.4231
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
X-List-Received-Date: Tue, 25 Feb 2020 18:54:06 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-build-perl_0.4229.bb => libmodule-build-perl_0.4231.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/perl/{libmodule-build-perl_0.4229.bb => libmodule-build-perl_0.4231.bb} (95%)

diff --git a/meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb b/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
similarity index 95%
rename from meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb
rename to meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
index e3ba40d96c..b3bc314ee7 100644
--- a/meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb
+++ b/meta/recipes-devtools/perl/libmodule-build-perl_0.4231.bb
@@ -15,9 +15,9 @@ LIC_FILES_CHKSUM = "file://README;beginline=949;endline=954;md5=624c06db56a2af4d
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/Module-Build-${PV}.tar.gz \
            file://run-ptest \
-          "
-SRC_URI[md5sum] = "1447d9e02e63f7a1643986789a8f1ba9"
-SRC_URI[sha256sum] = "1fe491a6cda914b01bc8e592faa2b5404e9f35915ca15322f8f2a8d8f9008c18"
+           "
+SRC_URI[md5sum] = "066b193e461d7dfe1eca17a139353001"
+SRC_URI[sha256sum] = "7e0f4c692c1740c1ac84ea14d7ea3d8bc798b2fb26c09877229e04f430b2b717"
 
 S = "${WORKDIR}/Module-Build-${PV}"
 
-- 
2.25.0


