Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id E94E277E9D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 16:16:07 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id 108so9705712wra.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 09:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Va8UAATzhPargItCnirPbhQKrswYsAvknKudplNcPSM=;
	b=G3tD3jPJ0Y3CX6oy9OolaCCNForN1HA7Ulk5fUHMc4E99QQxmjaZM2owKF0iy1rXwh
	RKH0fProlHvRiSVRLf+LKNPyY5P6EZY/BGma3sF+xMdr2SQXIuRu91owKRE/izO0Mp3M
	KF6RY9m/Z3tgaLAqOkv2npxZxFNE4qOpKHXmmOHicPqKtzPrdMpzjbf9wK2UIGVooCt1
	XKwUzr2vzDtujwRE1Y4HBvNmoT0lUKnR0Da2Sc2IxfqbmEeRkDdemvT28db5ZcTBtHBS
	E0yxk+TPrS03tIUOa+HmV/vdL2G029W46qTLpRfTuXi1oBmEKV6jzlP8NLbWgmSE3KsS
	jYSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Va8UAATzhPargItCnirPbhQKrswYsAvknKudplNcPSM=;
	b=qsiP2t5n+Us1fjW7gX4liCzarcEvv77lviwijY6vf0nWAr2YszccX40wJTX/Du+MPc
	iJWx2tStR8S0OyglsLUd7L+EYzYZbCF87MLHpZPo9gHCcbji/V7IjgI4kgxYtQK09spx
	qVdx8YKq+J9skXQPQy9vF+dl7ILk4A/FF5EIXN1O1z1QpLjUjpjcsKcHpUsMAZCy01FU
	pG9tii7/9uWc7orT3HsGdODdc4TD8PqiVjffX6T5EUCJOjXY0ep0TIWzCEhSudn9w2is
	nn8p8eGdr+ku+md/kBuk4h7rrluJakpEkNJcTxTtKesRsLRlIyB9Ut5L+QbeN4ZnN+Im
	fr7g==
X-Gm-Message-State: AHPjjUjb0lzTr+WgWYezG+4wwL+DcK8f3dF81aAddirjYgYEwEXq4oNT
	ZVODL1SmKIFr+iBU3so=
X-Google-Smtp-Source: ADKCNb4Sn7pah/2Yic85l7oTAef5tmgKa7RvP3cYWciZt9VcYhKhjDJ755GMSRk9h77FcHFXv9L5WA==
X-Received: by 10.223.174.141 with SMTP id y13mr2728590wrc.209.1504628168200; 
	Tue, 05 Sep 2017 09:16:08 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 29sm1069967wrz.77.2017.09.05.09.16.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Sep 2017 09:16:07 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Sep 2017 17:16:04 +0100
Message-Id: <20170905161604.5001-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] shared-mime-info: enable nativesdk builds
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
X-List-Received-Date: Tue, 05 Sep 2017 16:16:08 -0000

Also remove the redundant DEPENDS_class-native, as the native class generates
this value automatically.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/shared-mime-info/shared-mime-info.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info.inc b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
index 6eedb6d3fdb..1f51225b0ee 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
@@ -6,7 +6,6 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libxml2 intltool-native glib-2.0 shared-mime-info-native"
-DEPENDS_class-native = "libxml2-native intltool-native glib-2.0-native"
 
 SRC_URI = "http://freedesktop.org/~hadess/shared-mime-info-${PV}.tar.xz"
 
@@ -33,4 +32,4 @@ do_install_class-native () {
 	autotools_do_install
 }
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


