Received: from mail-da0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UW77v-0004Aw-7S
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Apr 2013 17:33:28 +0200
Received: by mail-da0-f43.google.com with SMTP id u36so2361008dak.16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2013 08:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=YE86N9S9sniyNn8v4p1+5SCCuf5TJzTTRyWCUcoKgWs=;
	b=WtbTaug5ZvvPK//6oAIHMhLRYa1mS4igBa2e6umdwyu5B6Zu3Wj/rxtL+LMIvRdiU5
	EJ2uGuKxMUkqi+Zf6D8DTtHNaqNLe3qsowmX0jxkn+5Yv/84rY/BIWvKbzTcuyk6ax+u
	MODeXUEoKQf1Cx+1tnjT5ysPpmryeINadhx777E0CmHU/o5hXotBxD1UlEWPd/kaJpk1
	1krrOFM1OXPGRu8jlVgh5C5ivPbgUxfY9v00lysUFnkN3KodtiQE/58Cp3uQxYXhNHM2
	MP0Ab848VTiMqLVKznWZT1kga6Fz99fWH+pswKqwm9UF8iJmQL5lOy6x7K5681va0uPP
	5Zew==
X-Received: by 10.67.8.98 with SMTP id dj2mr35923311pad.76.1367075740175;
	Sat, 27 Apr 2013 08:15:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	aa8sm17577419pad.14.2013.04.27.08.15.37 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 27 Apr 2013 08:15:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 27 Apr 2013 17:15:49 +0200
Message-Id: <1367075749-6702-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
Subject: [PATCH] buildhistory: change default BUILDHISTORY_DIR to TOPDIR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Apr 2013 15:33:40 -0000

* like PERSISTENT_DIR I find BUILDHISTORY_DIR more persistent
  then tmp-eglibc directory
* WARN: people with existing checkouts in TMPDIR/buildhistory
  need to move it to new location first (in order to save history)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/buildhistory.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 1ac1a8b..8efd41c 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -8,7 +8,7 @@
 #
 
 BUILDHISTORY_FEATURES ?= "image package sdk"
-BUILDHISTORY_DIR ?= "${TMPDIR}/buildhistory"
+BUILDHISTORY_DIR ?= "${TOPDIR}/buildhistory"
 BUILDHISTORY_DIR_IMAGE = "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"
 BUILDHISTORY_DIR_PACKAGE = "${BUILDHISTORY_DIR}/packages/${MULTIMACH_TARGET_SYS}/${PN}"
 BUILDHISTORY_DIR_SDK = "${BUILDHISTORY_DIR}/sdk/${SDK_NAME}"
-- 
1.8.2.1



