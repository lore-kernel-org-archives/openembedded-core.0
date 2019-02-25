Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id E62D17CB01
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 11:39:37 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id m1so7750707wml.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 03:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=dVG6AuCuqny6lJngnDdYGb1lqO3wf8yiKSTbLew7Sn4=;
	b=bdUg8/yeM6XwHoY9lV7qdkvWQvjfRbkawZGDU9yy4xxNpyGuLvNMi37vq2vqMDtCsc
	bZwrmKurh09unmuLGidcZaQsKRFlABsF3AGgYC4ckBiehmSD2BubgpZdmtprAGN+4AVE
	y6fphd/XB+zcyTP+tuOsIh3LO0pani163JfFE6hZBJT5RKUGFr8OaZIdXy8L6vTfe+k5
	Bg2MDornKKGfPG6PsOqoTssz1Qmuavzgt1HTzYOvfcb6AHGgSk29qOPCWtvHEWAcvlca
	DgH95Z0z+Bf9jATxK1UTKB7hp56VFBXUfxe8VEPAc00nvOZkXaseSkeThKcP6ExA+xgm
	rJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=dVG6AuCuqny6lJngnDdYGb1lqO3wf8yiKSTbLew7Sn4=;
	b=h6bg3+EEStxO58Q7mHVr2WxNjzwWk/nzNUeLFL7xVrlb+uMA07v4GYgELInFmHw8lv
	oqk0zK5cFCTBya9WmrM44lHQMMYcT4Xx4yGVCUTDEPTeGvJRGhQWriq2Bm2r8gJ6C3ia
	u6AXVzaE9RJ7nIZttAN9jJSj7j5VDoWVQECFJXZ1W07F4Y5S9YA9BYCtJOT/6HVjb+ZR
	K40m2X1/UVgDCbLdYApEShvY8xFVhEMAqFHcUdg+T/um5obN4gjBCx/+DQLtHLSLdRY9
	RNEp+0BoBeCtZ/43D2ul5MRn49jvKlCEGQQiFtPNpUYQ32LPK48ZHdzk+y447m0XxCUI
	JwqA==
X-Gm-Message-State: AHQUAuaTtUFjEYYrFmYXjhd8F/8GkjKthCdvZz16M4p352tdTxtQ6/tZ
	9TxsLoFtUIa4LYZK5GcCAaepmMphHGU=
X-Google-Smtp-Source: AHgI3IbE+WTfGHu7dPw+BP4XEVJ1HLCms51giBAaeWAl8OxAVtXqNjPa5XNd2TFzEqiCvwGWZrjj/Q==
X-Received: by 2002:a1c:6442:: with SMTP id y63mr11170639wmb.31.1551094778284; 
	Mon, 25 Feb 2019 03:39:38 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	u8sm11936231wrp.55.2019.02.25.03.39.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Feb 2019 03:39:37 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2019 11:39:30 +0000
Message-Id: <20190225113930.26417-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] libpcre: upgrade to 8.43
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
X-List-Received-Date: Mon, 25 Feb 2019 11:39:38 -0000

Licence checksum updated because the copyright dates were changed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/libpcre/{libpcre_8.42.bb => libpcre_8.43.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-support/libpcre/{libpcre_8.42.bb => libpcre_8.43.bb} (93%)

diff --git a/meta/recipes-support/libpcre/libpcre_8.42.bb b/meta/recipes-support/libpcre/libpcre_8.43.bb
similarity index 93%
rename from meta/recipes-support/libpcre/libpcre_8.42.bb
rename to meta/recipes-support/libpcre/libpcre_8.43.bb
index 3a488c00b71..d54b3941976 100644
--- a/meta/recipes-support/libpcre/libpcre_8.42.bb
+++ b/meta/recipes-support/libpcre/libpcre_8.43.bb
@@ -6,7 +6,7 @@ SUMMARY = "Perl Compatible Regular Expressions"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=fc5026403b44c868c25fc9546f7feb05"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=91bee59d1b327eb1599b4c673e2fb3d1"
 SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar.bz2 \
            file://pcre-cross.patch \
            file://fix-pcre-name-collision.patch \
@@ -14,8 +14,8 @@ SRC_URI = "https://ftp.pcre.org/pub/pcre/pcre-${PV}.tar.bz2 \
            file://Makefile \
 "
 
-SRC_URI[md5sum] = "085b6aa253e0f91cae70b3cdbe8c1ac2"
-SRC_URI[sha256sum] = "2cd04b7c887808be030254e8d77de11d3fe9d4505c39d4b15d2664ffe8bf9301"
+SRC_URI[md5sum] = "636222e79e392c3d95dcc545f24f98c4"
+SRC_URI[sha256sum] = "91e762520003013834ac1adb4a938d53b22a216341c061b0cf05603b290faf6b"
 
 CVE_PRODUCT = "pcre"
 
-- 
2.11.0


