Received: from mail-yh0-f45.google.com ([209.85.213.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UASAV-0002sZ-7n
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 22:34:36 +0100
Received: by mail-yh0-f45.google.com with SMTP id 24so780043yhr.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 13:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=WvmGBJUee8ImJZjzMb7CdOpdaoJYleNL2oYUmdr+KWM=;
	b=lBafhG45Kr+a2sC3wd3QNWjX+3j9NrjEcQHQhBpayH41ztcpY5r/5YVt1qUoegv/hw
	u6/9wUFeoAKo5k7H2HrzRYxIl0nP1tovtG2woJCoOaTLFZxU1lJPk8tmGfyIN8/qDuvu
	3UmtLjKHKxIjhDk6yRryZRZ2raMw6Y+RTz8Wr/ckFVkoCq1j6B7+Vl9f114y2aRuv8Nb
	jxfzFDddvWM4NzFplq7Mf1WpTHXjBbJ4owomkOUszVWM+FNZNLRPwdNwA1aurSm/uzMA
	MVCDkVTyQmSZpEYb9NPNkb2WfN2hhL5lCdV9KnReY8IgpW0EoZF8mSFuFM16qc4ghMKX
	fsgg==
X-Received: by 10.236.79.9 with SMTP id h9mr25311354yhe.83.1361913495172;
	Tue, 26 Feb 2013 13:18:15 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id x16sm3809059yhj.6.2013.02.26.13.18.12
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Feb 2013 13:18:14 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 18:23:25 -0300
Message-Id: <1361913805-23750-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] qt4-embedded: Enable Linux Input support
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
X-List-Received-Date: Tue, 26 Feb 2013 21:34:37 -0000

This allow use of Linux Input directly so being able to use 'evdev'
driver for keyboard use.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-qt/qt4/qt4-embedded.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index fbd8c28..f231e98 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -17,7 +17,7 @@ QT_EMBEDDED_FLAGS ?= " \
 QT_EMBEDDED_EXTRA_FLAGS ?= " \
     -plugin-gfx-transformed -plugin-gfx-qvfb -plugin-gfx-vnc -plugin-gfx-directfb \
     -plugin-mouse-tslib -qt-mouse-pc -qt-mouse-qvfb -qt-mouse-linuxinput \
-    -qt-kbd-tty \
+    -qt-kbd-tty -qt-kbd-linuxinput \
 "
 QT_EMBEDDED_KEYPAD_FLAGS ?= " \
     -DQT_KEYPAD_NAVIGATION \
-- 
1.8.1



