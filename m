Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id D21AF60750
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 14:59:30 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id h1so4195368wre.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 06:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Xmvu3xz7nFKb/QzFq8JETEIcTBS2Qkl1KYF32mPUaCA=;
	b=cN4MtxMWMlfjI5tfJrhxLRfAIFyOZd1gmzrHNPDv1L+ddEwA5XDdEVpqb/z60E7Z45
	caUdvzQRq+zrWeMYM92Px8dEz5ZIOeP+MvVMIBoGixPVxmQdxlO+f0k7N1iMW4AepD95
	TkKN/TcxsE9jblj4+jjDJKgUeGV3d7MNNQWFbNaCXyaIYOl5gxWkV2iYqHpvXViLBbHT
	FgOBZYcRxDIoxyMZ2W3dszl3rzJ9h0rX1b56SEcvRxF57Unr7xgBojL7Sv/xAQ45vu1G
	ZroC/XRV71o2pBlVE0l6dImT5GvXBOEXwc2tsW5M6NuXfSRXYRdvpLK5mzYTELzpp5Xi
	cjzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Xmvu3xz7nFKb/QzFq8JETEIcTBS2Qkl1KYF32mPUaCA=;
	b=ZA4lf05s6/SWh+Qzlf9jZ8vHcFEiyWLK3RO1PIMc1dkbN7G9rS0E2SpX1rM9+36GoW
	SC1wF2zatYMg4cFjg0DYGpdiYbNSQO2E7KIX3yf+S/nDB2TW9winxC12myEqwNJMTy3A
	PcsabVrCSCNfpmhBHrVoYcxM4n9ydlbrF8TQADWbdnNAI67vnOvfWqABpuYVZnljD9Y0
	n/xzqfrovS/ZKUcIu9b5tSPHQeteBlYpBnIHYaIxrGHnlPNrgdEic6bmQOPd4u5eT/px
	737Rk6GXAwRq/j1opsNFCDK1A2nL8jhQm/dvxw7gCA5VG8qkQH8QEo6NJmS0J2ybRiHZ
	OGJQ==
X-Gm-Message-State: AJaThX4ze1Rl/7l1i+rpGmKemX3Mk5StvrrfkDfCFPU2fZFnZ2MlZuIG
	pIrbtEPNqTChYMBpkKgmuouUdADD
X-Google-Smtp-Source: AGs4zMZlIp5AHUjDSVVn3YQB53x7tGoICXz+nrg7Cym5RwX06LT5lgHwwTgC8YeAL1kwYaSQnGN6zA==
X-Received: by 10.223.134.1 with SMTP id 1mr19685435wrv.213.1512572371293;
	Wed, 06 Dec 2017 06:59:31 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 187sm551043wmu.19.2017.12.06.06.59.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Dec 2017 06:59:30 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Dec 2017 14:59:27 +0000
Message-Id: <20171206145928.5497-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] libxslt: use HTTP instead of FTP in SRC_URI
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
X-List-Received-Date: Wed, 06 Dec 2017 14:59:31 -0000

FTP isn't as reliable as HTTP.

[ YOCTO #12398 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libxslt/libxslt_1.1.32.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.32.bb b/meta/recipes-support/libxslt/libxslt_1.1.32.bb
index e8b1409d79b..b8951ab3a8b 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.32.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.32.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=0cd9a07afbeb24026c9b03aecfeba458"
 SECTION = "libs"
 DEPENDS = "libxml2"
 
-SRC_URI = "ftp://xmlsoft.org/libxslt/libxslt-${PV}.tar.gz \
+SRC_URI = "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz \
            file://pkgconfig_fix.patch \
            "
 
-- 
2.11.0


