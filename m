Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id E8D0C71A8E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 12:00:21 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id b52so1615551wrd.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 04:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+AlBToGPjQt9IHBrt/9GlD0EXcTuiIStMhWS76eErrc=;
	b=q+zOEIZTihyah/bFN8UsbE/CHlkwyuaBiB5jTCFFvwotIFsBCb1veLJzlRts2zhht9
	HMaIsSq0DT1jN1OxY9O7IgkMYYYn8QrKX7vPux0snO2m3IRyoM7EIhq2jBnAaSp38HPx
	hW6dAOWiZuoZFhpEMA9FXG0dDfKDjk6bjofjXrZuZ9/tItJk4M4Fn99EvJ4UM8VfZbn6
	5GOTqPB00/GNhWQW9Qa7OyRETGoR/8c40RYZNk/ovCQH6kqrXKSxODZXytxTlOa0+2Kz
	BOpMZYm6A0fxOwcfbT5UtnygVBeWzLU/Bbl6bSsy+aESB8BVaRaNTvOB5bG75kQYDcUY
	GWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+AlBToGPjQt9IHBrt/9GlD0EXcTuiIStMhWS76eErrc=;
	b=r/iehICyNtov4LDxoG4yl4SVzlJ7HADTyB7fKh8Muzm/7SD6r6HRWUDAIs4FDhgcm+
	FCvvHAKlTL1vuWPPJDIDjj6ecZZGSVOKZ0P8SvpdzF5lxBZPo7ULHBLK+V9auUXC3dwQ
	eQC/I88f71hvax9yv6WxoBGgGUxc7C2el0dxxf749A8dtE3YHM8zBxCczO0/00ogrZy3
	f+SceKMhweCa37pJQbWzOPq1dSp1m60JbmH6Fj4DPWNFt4pGSIOmNXvjNeMrPy6Tx1Ib
	mvSompRS3vAhLCyxq8oLdnv3GIeiBAdYVNBFUFjvFDVhobs6NXxjkpO0voFBJx7RaXA+
	1+dg==
X-Gm-Message-State: APf1xPBTITSqa9K+3cWgpC9/Msrtde06tDHfQBPDDBGe+MucdKeBA2+k
	GrDSgJjlE9dZFt3ICsOAM4Bnwpg+
X-Google-Smtp-Source: AH8x2240+OgBRYAZuLEVwu2ShZJJn+cI0B2DIy/TgvtAP3KF5kGRmXx5sxuthENziSGJ1LrZeb4huQ==
X-Received: by 10.223.157.6 with SMTP id k6mr2064571wre.273.1517918422499;
	Tue, 06 Feb 2018 04:00:22 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 7sm8327657wmq.42.2018.02.06.04.00.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Feb 2018 04:00:21 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Feb 2018 11:59:54 +0000
Message-Id: <20180206115954.1780-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180206115954.1780-1-ross.burton@intel.com>
References: <20180206115954.1780-1-ross.burton@intel.com>
Subject: [PATCH 4/4] pigz: use maintainer-built tarballs
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
X-List-Received-Date: Tue, 06 Feb 2018 12:00:22 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/pigz/pigz_2.4.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/pigz/pigz_2.4.bb b/meta/recipes-extended/pigz/pigz_2.4.bb
index 20e4154434f..6e6da9c3c56 100644
--- a/meta/recipes-extended/pigz/pigz_2.4.bb
+++ b/meta/recipes-extended/pigz/pigz_2.4.bb
@@ -8,10 +8,10 @@ SECTION = "console/utils"
 LICENSE = "Zlib & Apache-2.0"
 LIC_FILES_CHKSUM = "file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline=7;endline=21"
 
-SRC_URI = "https://github.com/madler/pigz/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz"
-SRC_URI[md5sum] = "3c8a601db141d3013ef9fe5f2daaf73f"
-SRC_URI[sha256sum] = "e228e7d18b34c4ece8d596eb6eee97bde533c6beedbb728d07d3abe90b4b1b52"
-
+SRC_URI = "http://zlib.net/${BPN}/fossils/${BP}.tar.gz"
+SRC_URI[md5sum] = "def2f6e19d9d8231445adc1349d346df"
+SRC_URI[sha256sum] = "a4f816222a7b4269bd232680590b579ccc72591f1bb5adafcd7208ca77e14f73"
+# Point this at the homepage in case /fossils/ isn't updated
 UPSTREAM_CHECK_URI = "http://zlib.net/${BPN}/"
 UPSTREAM_CHECK_REGEX = "pigz-(?P<pver>.*)\.tar"
 
-- 
2.11.0


