Return-Path: <pjtexier@koncepto.io>
Received: from koncepto.io (koncepto.io [195.154.119.111])
	by mail.openembedded.org (Postfix) with ESMTP id 5303561527
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 21:37:55 +0000 (UTC)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr
	[193.250.66.88]) by koncepto.io (Postfix) with ESMTPSA id E349E603F3;
	Wed, 19 Feb 2020 22:37:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1582148276;
	bh=5j9SkgvKhjgWmNVDZ8tyq2YO7NGpsw+oRfclsrLbVw0=;
	h=From:To:Cc:Subject:Date:From;
	b=qFugbVDoxaxI/GwwL7b2FRq+QIX9PL0BhWK46CrHlg3kCYiTZBKvRzJiO8UamZ3yC
	vc+hR+QmJC5p3Pu9VooItRwYdy1s6frI+Mk7wwKJK1spg6PXw5cbezB30lpY9Pi/qF
	QA9mkqYi5iQ5KjjAidf0ssYtwhLBCN/Ke9W3cocpAgudPjOTRIuTA4ccGCYTU2gzwo
	h1l/9H8g6+jWRf50TEIgsiqag9RU9uL/n9gcO5MqQsA3Fz6ci1TQbfakkNx4zxAkKO
	I89E1cUYMjeJIWmu+EXDieIXkuMHL2VXmq/iNPbf5fEzuUk51ued3VvdfLoXLuVj9V
	TAKtGp7DwGqcA==
From: Pierre-Jean Texier <pjtexier@koncepto.io>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2020 22:37:12 +0100
Message-Id: <1582148232-25284-1-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2] libubootenv: bump to revision ba952d0
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
X-List-Received-Date: Wed, 19 Feb 2020 21:37:55 -0000

This includes following changes:

ba952d0 BUG: variable lists not released in close()
690f868 Variables are not removed when loading from file
9e3586a Make sure there's no file descriptor leakage in case of error
03647c4 Check config file defines a non-zero Sector size
3b2d4f1 Check environment size from fw_env.config

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Acked-by: Stefano Babic <sbabic@denx.de>
---
changes v1 -> v2
	- introduce PV variable (suggested by Alexander Kanavin)

 meta/recipes-bsp/u-boot/libubootenv_0.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
index f5b6059..7a7ec4c 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.2.bb
@@ -11,8 +11,9 @@ LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://Licenses/lgpl-2.1.txt;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 
+PV = "0.2+git${SRCPV}"
 SRC_URI = "git://github.com/sbabic/libubootenv;protocol=https"
-SRCREV = "879c0731fa0725785b9fa4499bbf6aacd04ee4c2"
+SRCREV = "ba952d05ec9ab16029816a06d956bac7fb4e9832"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


