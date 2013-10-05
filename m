Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id CA7996CD43
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Oct 2013 12:23:06 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id m14so2270597eaj.20
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 Oct 2013 05:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=8xFr4Is4Cpzzxe+bnGGacNt0cuKKUzQM9i2tTa5MM1s=;
	b=0j6X5KjLj9OU4fztFpF8juisLVpZUr7KshSt9x9cen+YwE/TcNEqqSdnsIAY1KY3am
	7ovRJ3PsPHEa4LLBKBrxeKTHSagPDkrQcDKl0usXXuz+6Xj1hXMKA4LmPDI5ctuh/nQX
	l5JbKy34p9Gf3WNRkol88icZ/JWeFKalm40BWKcJXMll8Jdrbg78wZGk/ec8ylOcGz+r
	PFEnmGlPNXREfoh/oe0PsRIdLPk7/7StkQwqdfrmltT9nREOHsX0UuLcy3ATl8XSXRy8
	dlai+06Txc7PWwgMAekIW9hfOfZmwsxuvYmUZueTvxdT65ct3ydPjT35+NsMfZPcLlAZ
	LVuw==
X-Received: by 10.15.43.13 with SMTP id w13mr30183647eev.37.1380975787937;
	Sat, 05 Oct 2013 05:23:07 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	a43sm39205094eep.9.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 05 Oct 2013 05:23:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 Oct 2013 14:22:59 +0200
Message-Id: <cad7bd95c628ae8fa3d3990f6ee1f2fb21203809.1380975568.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1380975568.git.Martin.Jansa@gmail.com>
References: <cover.1380975568.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 02/14] libunique: Add PACKAGECONFIG for dbus
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
X-List-Received-Date: Sat, 05 Oct 2013 12:23:07 -0000

* dbus-glib was missing in DEPENDS in order to enable dbus backend
  but because dbus was in DEPENDS lets enable this PACKAGECONFIG by
  default

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-gnome/libunique/libunique_1.1.6.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/libunique/libunique_1.1.6.bb b/meta/recipes-gnome/libunique/libunique_1.1.6.bb
index adb9525..31af658 100644
--- a/meta/recipes-gnome/libunique/libunique_1.1.6.bb
+++ b/meta/recipes-gnome/libunique/libunique_1.1.6.bb
@@ -12,7 +12,10 @@ SRC_URI[sha256sum] = "e5c8041cef8e33c55732f06a292381cb345db946cf792a4ae18aa5c66c
 
 PR = "r7"
 
-DEPENDS = "glib-2.0 gtk+ dbus"
+DEPENDS = "glib-2.0 gtk+"
+
+PACKAGECONFIG ??= "dbus"
+PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus dbus-glib"
 
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
-- 
1.8.3.2


