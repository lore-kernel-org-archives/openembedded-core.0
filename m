Return-Path: <kirgene@gmail.com>
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id BCFE161222
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 16:28:26 +0000 (UTC)
Received: by mail-ee0-f46.google.com with SMTP id c13so3565777eek.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2013 09:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=SyaxMsqYfCBMKxT0/EYGfV/q7yrM4fsvAnd/nPmVPDE=;
	b=xBVJdWBrJxRAzuHzFFxO28GtxXd4SWIj7ws1cYlUFl1ubzzDZgFn0Gz6rbOvJi1T9j
	Ski5ckjuAL/8TYRp5DAlwEGOyf9vrotWge072Rpy9yU5ALFZefAlSCsTdD4Eg7R/IS+L
	iccVFKyGM4ppFTZhNbP7gkcjlN8LpwYLaaZwAwJhykRradWM/3EHDXnKOlhbDRBFxiKZ
	EJI6I/4Jc2qMTIR3VxGYLbKZfJ8EylcnD8v/EXBas7Yug2cP4VYA/usLDELOt/35QG+N
	MQULPtB7QQkZF6rQsj+QR4HCTZmvXCknM4SdARRFUahQE4+8EJbFO6ytKa1QRewaqCXk
	/XpQ==
X-Received: by 10.14.3.3 with SMTP id 3mr26257537eeg.57.1376324906630;
	Mon, 12 Aug 2013 09:28:26 -0700 (PDT)
Received: from ubuntu.datv.net ([213.174.0.226])
	by mx.google.com with ESMTPSA id t6sm58568306eel.12.2013.08.12.09.28.25
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 12 Aug 2013 09:28:25 -0700 (PDT)
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Aug 2013 19:28:06 +0300
Message-Id: <1376324886-17664-1-git-send-email-kirgene@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: [PATCH v1] connman: fix systemd support for connman-* packages.
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
X-List-Received-Date: Mon, 12 Aug 2013 16:28:27 -0000

This patch fixes systemd's postinst/postrm script generation.

Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
---
 meta/recipes-connectivity/connman/connman.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 6b5ea0b..c5014b7 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -56,6 +56,7 @@ PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
 
+SYSTEMD_PACKAGES = "${PN} ${PN}-vpn"
 SYSTEMD_SERVICE_${PN} = "connman.service"
 SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
 SYSTEMD_WIRED_SETUP = "ExecStartPre=-${libdir}/connman/wired-setup"
-- 
1.8.1.2


