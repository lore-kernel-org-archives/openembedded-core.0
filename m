Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7A74165C78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 12:36:35 +0000 (UTC)
Received: by wicmv11 with SMTP id mv11so13184728wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 05:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Fr1rXX+Z/1PWmubmtJj5JrwaC3xlREkIGFuWyOd4BGI=;
	b=Smxv1/p71VIkMKqnNFggeqDu30JSFPIOA/8bRBCxrHAupCTn+fWU78dVuHGyLpck2X
	IpgnWpBjvRXX0yXFvVhyuZ99eRF2H4HT/K2fEs8pHtOze85s7dZR2SX62rTq7GtI5ujm
	XbqKkFWilFjJuol7uRAnzSpyChvehJsEFll5xgbLiNHCTxnw6cCbiqS7y2qYSIG2OgBI
	U6SLWZj6j1s81WCour094LXXhOZ187+ypEhK8O69QtQQ7GfOqNw77MhQDBcHuZYe7pyh
	BclJjP/k04vVvZ4MDPY2zWct9aM/MLBgpNE816uBbbgfm9WGoJ7a8Q/XCWGVFZYu5dPq
	IFcQ==
X-Received: by 10.180.9.168 with SMTP id a8mr5137106wib.77.1436877396068;
	Tue, 14 Jul 2015 05:36:36 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	m10sm2993892wib.17.2015.07.14.05.36.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jul 2015 05:36:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 14:36:45 +0200
Message-Id: <1436877405-29049-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.4.4
Subject: [PATCH] connman-conf: fix SRC_URI_append
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
X-List-Received-Date: Tue, 14 Jul 2015 12:36:37 -0000

* add leading space so that it works even with some .bbappend adding
  additional files to SRC_URI without trailing space

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/connman/connman-conf.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman-conf.bb b/meta/recipes-connectivity/connman/connman-conf.bb
index 2358d9d..bd4c28d 100644
--- a/meta/recipes-connectivity/connman/connman-conf.bb
+++ b/meta/recipes-connectivity/connman/connman-conf.bb
@@ -4,9 +4,9 @@ network interface for a qemu machine."
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
 
-SRC_URI_append_qemuall = "file://wired.config \
-                          file://wired-setup \
-                         "
+SRC_URI_append_qemuall = " file://wired.config \
+                           file://wired-setup \
+"
 PR = "r2"
 
 S = "${WORKDIR}"
-- 
2.4.4


