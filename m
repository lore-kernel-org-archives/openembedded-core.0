Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id B3E897F35B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 11:19:22 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id j16so17038656wrr.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 04:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=74JsdhOlokErAPSalH8T+nIj0BBScNzln7v4urgM01c=;
	b=XtTMc4kDDz7deO9kZ1/h9i8TAKNWh3nMU0ilJoulqyNyv4BdRs2EPWQkea1zRMrjuf
	nqQ+M4uy+2Gfmfftct0tcfXBRnugs/0uB48fHizMTXxBHNrbb0v1YxHBVmJWFyblxjao
	S2z5J0Muy+AcvniY2Q4A1Jm1mEbgumeU82wUEHxh5vGtgiQi+Iuk+CqDT5/MinnCh2qT
	YbH20imSwdmTYF5puTGVKluDlxS6EIezcl4Sim672YvPaKGerwRKG2AL7laSs976WslA
	eFGbju8UgNymVeBH5GFEmFmiTJGrlm/tMxcOA2kyrbFJvIj03t0k3JaYEHEwPkXHToU5
	i33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=74JsdhOlokErAPSalH8T+nIj0BBScNzln7v4urgM01c=;
	b=ttnvYq983Bt8VJJ4zt6wClfTUuzCezqWAxBrrLhk8EXABiuilGhVoav1tqqklsxz8E
	dr36lTotHUZEv5y/2XzGr1Ym92XxGvuV/PWXqDRyhnDJTDs02eTB5bEY2lZPPMUB5v5s
	L+33tf4uf8SccoRG6alQPBZOcxRGJ4LzGhNmadR0PXogXYoo7Twsea5YHoDTqH4oR1tb
	YRwG5TXgBL73JNDUS/pMNidEOG0UVuSUXb3Bt3whA4LZmPPC/LRIGwDbIyUSnGt3SsCH
	L2xXpSDVGMXNXmDQC8xH6oT/U288WyRKFaVp4m0dCENIOBYpPcyEzHOAwB9JXdOJPftN
	nWEA==
X-Gm-Message-State: APjAAAWLGxp8ktYEnMPTn3dNPwO2VG5na8utAhpTaUnnvKflq7gku3uv
	N67CmU3Ysn9M3OTX3wbiQxHYS8QE/T8=
X-Google-Smtp-Source: APXvYqyM1gRHZI0tdyvxL6OL5tUKAalBQ+rGt9BB2Db2AuAXgYJQRiIA0HtZODAiZ720+OLCIuIICA==
X-Received: by 2002:a5d:5606:: with SMTP id l6mr15003148wrv.108.1567509563150; 
	Tue, 03 Sep 2019 04:19:23 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	r1sm19747161wro.13.2019.09.03.04.19.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Sep 2019 04:19:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Sep 2019 12:19:21 +0100
Message-Id: <20190903111921.15867-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] libnl: don't patch libnl-3.0.pc
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
X-List-Received-Date: Tue, 03 Sep 2019 11:19:22 -0000
Content-Transfer-Encoding: 8bit

This patch originally came from oe-classic in 2010 with the comment "fix pc file
so that it actually links to the support libraries".  If an application wants to
link to the support libraries then it should be using the relevant .pc files to
do so.

oe-core builds successfully with this patch removed and other distributions
don't carry it, so drop the patch.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../libnl/libnl/fix-pc-file.patch               | 17 -----------------
 meta/recipes-support/libnl/libnl_3.5.0.bb       |  9 +++------
 2 files changed, 3 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-support/libnl/libnl/fix-pc-file.patch

diff --git a/meta/recipes-support/libnl/libnl/fix-pc-file.patch b/meta/recipes-support/libnl/libnl/fix-pc-file.patch
deleted file mode 100644
index fe8b833a1ce..00000000000
--- a/meta/recipes-support/libnl/libnl/fix-pc-file.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-
-Some packages are asking only for libnl-2.0, but expects to get also
-libnl-genl, libnl-nf libnl-route, easiest way to fix them is here.
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Index: libnl-3.2.14/libnl-3.0.pc.in
-===================================================================
---- libnl-3.2.14.orig/libnl-3.0.pc.in
-+++ libnl-3.2.14/libnl-3.0.pc.in
-@@ -6,5 +6,5 @@ includedir=@includedir@
- Name: libnl
- Description: Convenience library for netlink sockets
- Version: @PACKAGE_VERSION@
--Libs: -L${libdir} -lnl-@MAJ_VERSION@
-+Libs: -L${libdir} -lnl-@MAJ_VERSION@ -lnl-genl-@MAJ_VERSION@ -lnl-nf-@MAJ_VERSION@ -lnl-route-@MAJ_VERSION@
- Cflags: -I${includedir}/libnl@MAJ_VERSION@
diff --git a/meta/recipes-support/libnl/libnl_3.5.0.bb b/meta/recipes-support/libnl/libnl_3.5.0.bb
index e6a225af525..c0609c4d900 100644
--- a/meta/recipes-support/libnl/libnl_3.5.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.5.0.bb
@@ -9,15 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "flex-native bison-native"
 
-SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV').replace('.','_')}/${BP}.tar.gz \
-           file://fix-pc-file.patch \
-"
-
-UPSTREAM_CHECK_URI = "https://github.com/thom311/${BPN}/releases"
-
+SRC_URI = "https://github.com/thom311/${BPN}/releases/download/${BPN}${@d.getVar('PV').replace('.','_')}/${BP}.tar.gz"
 SRC_URI[md5sum] = "74ba57b1b1d6f9f92268aa8141d8e8e4"
 SRC_URI[sha256sum] = "352133ec9545da76f77e70ccb48c9d7e5324d67f6474744647a7ed382b5e05fa"
 
+UPSTREAM_CHECK_URI = "https://github.com/thom311/${BPN}/releases"
+
 inherit autotools pkgconfig
 
 FILES_${PN} = "${libdir}/libnl-3.so.* \
-- 
2.20.1


