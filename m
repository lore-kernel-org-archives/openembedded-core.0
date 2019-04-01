Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id AFB337D1A4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 21:48:49 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id v21so9773120edq.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 14:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=8V/Ygv85UYyLLU+zepU2/hIJOTOhLtpa4p24+4A8ra0=;
	b=Ms5CRN/xlHZNc0ixWuUG0INm0LkOCxx1J+nGPa1MRn147N/fB+YweeVnlmszboxqT8
	pRQpOea+OpFxiPfL94RYrkE73s7VdOk9zVa4Ogc6/KUrzHryhE70kpFozeMFN5lQ+DiN
	t3V/weVe2CW1fZWoQsRZ2vgAQLdcEaY6u+tiCRlxzRztcxhATkK1FpGmTHJC3ddZRrsU
	tlncbgl47rvtOjb4GNUw+znXDq3WpAyqAzapb2paH4sFtd2rWY00Jdm4IcTXBfns2bLQ
	MTrCmBGpHOk0q/NarmuId1+rEicDDDa4XiSfCgaTZF/0xNgz/EBm7MPd+diZoOWPO2D+
	rOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8V/Ygv85UYyLLU+zepU2/hIJOTOhLtpa4p24+4A8ra0=;
	b=aXK7rSZKcuSsM6S6JxuiP3MNLqfl2AczoZZVS8w0PlwBXaY71EVfbbzpcnaEYHu6Hx
	Mg4sGROCCbPKir61tNEn8adq/99yjR3oKiQb40CG5zZ4rDZmauFN1kPoqsBbGHtQgjCt
	ZaBVHaQAHGbF0erdfX1g+c+W5Lhb9t8qb5XflBGmn3UVvgkn93WD/tGXi9o+eaJXtAQC
	mToe5sI5M5MV7Xx6SYM91sQYCaoonIoV3x0CFe78WW6jDl1Lx6b3EEqs6aTxIUUUYwuw
	6vC7eBVCozRJ7uVO1WmD6dVc5ao4UwJl1HGXkatkdiDJrFL7kAJgruJD6ksDZlsKaKL4
	T0qw==
X-Gm-Message-State: APjAAAXAEDTFe5twXow0TYNepo56+T8ygFe3F+axYxEqUjj6U1L+oPBP
	ao7xRCiAtopAiXYykQDvBkh56kOS9LU=
X-Google-Smtp-Source: APXvYqyIIUtcDTHpiehn/LEj1kI6jbrcMOY+iwLQATlZGrlVRJCUx0oO88ZbyCQQRPdRh5uRvT/v+A==
X-Received: by 2002:a17:906:1ed7:: with SMTP id
	m23mr28356399ejj.198.1554155330028; 
	Mon, 01 Apr 2019 14:48:50 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	f25sm3463801eds.80.2019.04.01.14.48.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Apr 2019 14:48:49 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Apr 2019 23:48:46 +0200
Message-Id: <20190401214846.16380-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] libatomic-ops: update to 7.6.10
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
X-List-Received-Date: Mon, 01 Apr 2019 21:48:50 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{libatomic-ops_7.6.8.bb => libatomic-ops_7.6.10.bb}     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.6.8.bb => libatomic-ops_7.6.10.bb} (82%)

diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.8.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb
similarity index 82%
rename from meta/recipes-support/libatomic-ops/libatomic-ops_7.6.8.bb
rename to meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb
index 8292c3b312..a30f38eb73 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.8.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.6.10.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://doc/LICENSING.txt;md5=e00dd5c8ac03a14c5ae5225a4525fa2d \
                     "
 
-SRC_URI = "https://github.com/ivmai/libatomic_ops/releases/download/v${PV}/libatomic_ops-${PV}.tar.gz"
 UPSTREAM_CHECK_URI = "https://github.com/ivmai/libatomic_ops/releases"
 
-SRC_URI[md5sum] = "99128f05e3e3f4e0cd39aa23f23bbe0c"
-SRC_URI[sha256sum] = "1d6a279edf81767e74d2ad2c9fce09459bc65f12c6525a40b0cb3e53c089f665"
+SRC_URI = "https://github.com/ivmai/libatomic_ops/releases/download/v${PV}/libatomic_ops-${PV}.tar.gz"
+SRC_URI[md5sum] = "90a78a84d9c28ce11f331c25289bfbd0"
+SRC_URI[sha256sum] = "587edf60817f56daf1e1ab38a4b3c729b8e846ff67b4f62a6157183708f099af"
 
 S = "${WORKDIR}/libatomic_ops-${PV}"
 
-- 
2.17.1


