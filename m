Return-Path: <scerveau@connected-labs.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 93AC660556
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 13:05:06 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id k48so29075528wev.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Feb 2015 05:05:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=YQAukCP9+EtjbPfFAwdKE93dHz9k9GB6gqBSS1OPRTg=;
	b=SCAqqg0V2Pm5FsT06SxBl0f1ZvFXWi4eZTDs9oaOMASc7P+C3QEThEamsIFtl+LdFJ
	aAl6ab/eTawsi8Hme6A699023lAqxNyCWmFNgN4hFFjf3z7OqdqrH9fqE6lcVjC8d8P5
	lq7/D+RXSprV0JThYzynGUD+56bDQWMXUhMu2l1ZuQ/BHZe/N3Xuzz43AzEx5FNTIukw
	QRUFJFubl3CKiPo8RB3ciIVfvH2D7+ByNDqKaAb0u/bWg+OKV/sFc0oHo1r4to3F0EtB
	XJ7vNYNkDJ2mtmUfeZGNihRZWo1ZpWWkzS/xRUSFKYUp5CXiNL1IXLSEjXrDhXVKnfB9
	e0Uw==
X-Gm-Message-State: ALoCoQnKL+dpiMLdTSibctGeAxoM2f9ZGC/xvSg223IuobwRbUCBmwzK/HVzWYXVTSwIXApaGSyp
X-Received: by 10.180.91.43 with SMTP id cb11mr16241132wib.16.1424091907410;
	Mon, 16 Feb 2015 05:05:07 -0800 (PST)
Received: from sce-laptop-xps.mpl.mstarsemi.fr
	(connected-labs-gw1.ter2.neodc.mpl.cust.as8218.eu. [94.103.137.126])
	by mx.google.com with ESMTPSA id m9sm5896440wiz.24.2015.02.16.05.05.05
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 16 Feb 2015 05:05:06 -0800 (PST)
From: =?UTF-8?q?St=C3=A9phane=20Cerveau?= <scerveau@connected-labs.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Feb 2015 14:04:50 +0100
Message-Id: <1424091890-30393-1-git-send-email-scerveau@connected-labs.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-oe][PATCH] crda: update fetch url for both package and bin.
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
X-List-Received-Date: Mon, 16 Feb 2015 13:05:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The website http://wireless.kernel.org/download does not provide
crda and binary anymore.

Signed-off-by: Stéphane Cerveau <scerveau@connected-labs.com>
---
 .../recipes-connectivity/crda/crda_1.1.3.bb        |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb b/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
index 0bb8998..5b86058 100644
--- a/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
+++ b/meta-networking/recipes-connectivity/crda/crda_1.1.3.bb
@@ -7,13 +7,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=07c4f6dea3845b02a18dc00c8c87699c"
 
 DEPENDS = "python-m2crypto-native python-native libgcrypt libnl"
 
-SRC_URI = "http://wireless.kernel.org/download/crda/${BP}.tar.bz2;name=crda \
-           http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2013.01.11-regulatory.bin;name=bin \
+SRC_URI = "https://www.kernel.org/pub/software/network/${PN}/${BP}.tar.bz2;name=crda \
+           https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2013.01.11.tar.bz2;name=bin \
 "
 SRC_URI[crda.md5sum] = "29579185e06a75675507527243d28e5c"
 SRC_URI[crda.sha256sum] = "aa8a7fe92f0765986c421a5b6768a185375ac210393df0605ee132f6754825f0"
-SRC_URI[bin.md5sum] = "e0c8a5ca63fb8bf803213f9a0c90b50b"
-SRC_URI[bin.sha256sum] = "b1ee0b20c123c612dfdb6851ab42c01666f66fb583e0e590942f19bb54cf84be"
+SRC_URI[bin.md5sum] = "f137585abd5e07454932ea555b826149"
+SRC_URI[bin.sha256sum] = "6eb469555eb547b22738ce7bf59ebba42138560f128085a5e238eb6c8075792e"
 
 inherit python-dir pythonnative
 # Recursive make problem
@@ -28,7 +28,7 @@ do_install() {
 
     install -d ${D}${libdir}/crda/
 
-    install -m 0644 ${WORKDIR}/2013.01.11-regulatory.bin ${D}${libdir}/crda/regulatory.bin
+    install -m 0644 ${WORKDIR}/wireless-regdb-2013.01.11/regulatory.bin ${D}${libdir}/crda/regulatory.bin
 }
 
 
-- 
1.7.9.5


