Return-Path: <net147@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 914E7706D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 01:55:04 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id hz1so9915053pad.39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 18:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vgy5TtC7WGle3Rr2gsHZVYrQr8SMDTq/2d0Ap9f3sPw=;
	b=lrjItG+O8QONRfpl+fXQ67IwZs03cW7tK4mL5lL9Hdo83hW924LLaOHBHfcBdVXMDB
	pk4M9PzZ4Rw+IYMa+7/QZY5jA2zRNVf6K//dBO4Dg8r0OxDXXvPHHKyR/Yw2YwUdRreF
	15/IY+DKWtyWLFJCCw0UklbMWT7wD4y8BuhUBFwvu5H9brozbkCAqS7aUlj4xBywInc1
	Na9qA2PwJZcf9oFe06L+UVkXTm7vN68IVo5WfaiOYbuTSSNvs0eTXLPcLELvYBcXSxmB
	ex0/kE0cpkYwoE2Mj5IkpAqeHqGIMiPKuemAzFYigB2VSqXkq9HZ2P2s9vTaXmMnAoHr
	pe9g==
X-Received: by 10.68.182.98 with SMTP id ed2mr13806480pbc.95.1411610105816;
	Wed, 24 Sep 2014 18:55:05 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id g2sm48621pdk.46.2014.09.24.18.55.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Sep 2014 18:55:05 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Sep 2014 12:06:58 +1000
Message-Id: <1411610818-12412-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] qt-mobility: fix source URL
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
X-List-Received-Date: Thu, 25 Sep 2014 01:55:06 -0000

The source is no longer available from the original URL.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
index d46acb9..ae1769d 100644
--- a/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
+++ b/meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=fbc093901857fcd118f065f900982c24 \
 		    file://LGPL_EXCEPTION.txt;md5=411080a56ff917a5a1aa08c98acae354"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-mobility-${PV}:"
-SRC_URI = "http://get.qt.nokia.com/qt/add-ons/qt-mobility-opensource-src-${PV}.tar.gz \
+SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/qt-mobility/qt-mobility-opensource-src-${PV}.tar.gz/ea5db5a8d3dd4709c2926dceda646bd8/qt-mobility-opensource-src-${PV}.tar.gz \
            file://qt-mobility-configure.patch \
            file://0001-gstvideoconnector-fixed-buffers-allocation.patch \
            file://0002-Remove-unnecessary-rpaths-from-qml_device-example.patch \
-- 
2.1.0


