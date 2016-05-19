Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id E13EC601F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 10:43:27 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id r12so73994587wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 03:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=01WJt+naNImIQuO7k7IufXORO0DLwqAJADU3LsA1rbQ=;
	b=bR6RkY307wwjhQCwmusV2FQP0pH66KxD/9s0AB6xD37s6A5Q9hM6Ago9VQjprZuC1C
	RcbixwdGf564WeAp89a1TwXfaAjqgvlpme8bb1E1DbfEjteWmCq5+/Yt/zn7NeCPiSPB
	OZsoLglxRyEcGG7pcuhfU3P6iEVsl/7QNXeqVass9qaDi9HjIkBChP33sC8x+C4EjbEF
	wdWnamkVbjGrps0KEO/wFd1pBvDlZLop2QOxb5AtpTJ//nHdZZKuaMOfv91P/O9hr3/G
	OldZV4/3n/zH2DGCn6DWdBJ4U7+KFORGgn1w5SqwtE9pQrOC6KhTTZQVRnE0oclEPUsX
	1Vbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=01WJt+naNImIQuO7k7IufXORO0DLwqAJADU3LsA1rbQ=;
	b=cbdKmTpghqfmZ4LEDcYoINEGUkz2nkAtetsPp6WKmVLYbzMOljjdG5Xre84GeA/lN1
	w4jnGd5AT/6nIXhT+WXcA2X6Z3g0eOgvkh/ZUOPv8PVBw9GMqrfVBkoo5qnxfiFCibNf
	uSGdh+L8CFW7vz7z1EYssKfd9ylU8p6kyBxgee1n/0ntjAK19v0+VLhEyguKLfGZm8Av
	f5Imxx6ryND5B0l1RYOJ0jOlYijyl4i1D2qX00IYfO8g26haCVrn+f6/brXMX3Tvnb2U
	yItJUSKuRVblII2A0iyZ3zetp4PYJfkA3hvkh5mpQnfezO8UI7Jetvuv8H4B6Uo53CWm
	V84Q==
X-Gm-Message-State: AOPr4FXr3GSdSSel71XbEOcg/jjTrExrPKhXLYrxJVK6R2J79q147b2hvnBImBOxttrNP3dC
X-Received: by 10.28.93.6 with SMTP id r6mr13729936wmb.93.1463654607959;
	Thu, 19 May 2016 03:43:27 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	iv1sm13646234wjb.34.2016.05.19.03.43.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 May 2016 03:43:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2016 11:43:17 +0100
Message-Id: <1463654598-28971-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH 1/2] unzip: update SRC_URI
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
X-List-Received-Date: Thu, 19 May 2016 10:43:28 -0000

The infozip FTP server appears to have been taken down, so change the SRC_URI to
point at their SourceForge project.

[ YOCTO #9655 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/unzip/unzip_6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index 9efe756..2397606 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=94caec5a51ef55ef711ee4e8b1c69e29"
 PE = "1"
 PR = "r5"
 
-SRC_URI = "ftp://ftp.info-zip.org/pub/infozip/src/unzip60.tgz \
+SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/unzip60.tar.gz \
 	file://avoid-strip.patch \
 	file://define-ldflags.patch \
 	file://06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch \
-- 
2.8.0.rc3


