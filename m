Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id BDCAE76B7C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 17:15:56 +0000 (UTC)
Received: by wicjd9 with SMTP id jd9so40534644wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Sep 2015 10:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=eQGi9jdSOVSxAF19uLI4VxbKaCAtEY/IO9j8BWGDxEQ=;
	b=zmbHm5bF0vOMK/e6qeVrDmaKJtS8KvRgSx+lQwpBYkiIdJQypIbumhlGi5I3ruUu87
	muyuChsnHhoAB+Vm85T/XvDMAksk6iKMk4qaVXlk+yiHZwICiOkCI8mUZPLyOgm0gFnF
	+zxNGZJCdpyxTFWfs7U5GEzOcd7OtbW8pDd/mufKZ0D0pIxgg5HRprqT5MiYM6JaoyWO
	qjfXV1fLcoYWX+jP3Lg6bsVUg3+vQdNph5Ns+qUXVpOOPWyRpsyk1EUiiPBRUdhCB/mN
	8TVoBqV+olz1qAbIitRvdQLwMAR7Mxttnv1BiPuJKL3mFmFJCcEpdsTDbA3TtxngsnnR
	5WxQ==
X-Received: by 10.194.84.211 with SMTP id b19mr37837827wjz.120.1441127755928; 
	Tue, 01 Sep 2015 10:15:55 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ny7sm3692083wic.11.2015.09.01.10.15.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Sep 2015 10:15:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Sep 2015 19:11:55 +0200
Message-Id: <1441127515-30496-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.5.0
Subject: [dizzy][PATCH] gnome: move introspection options to gnomebase
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
X-List-Received-Date: Tue, 01 Sep 2015 17:15:57 -0000

From: Ross Burton <ross.burton@intel.com>

The gnome class is really a convenience class to include other classes, so move
the introspection arguments into gnomebase.bbclass.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/gnome.bbclass     | 4 ----
 meta/classes/gnomebase.bbclass | 3 +++
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/classes/gnome.bbclass b/meta/classes/gnome.bbclass
index 0de22dd..c6202bb 100644
--- a/meta/classes/gnome.bbclass
+++ b/meta/classes/gnome.bbclass
@@ -1,5 +1 @@
 inherit gnomebase gtk-icon-cache gconf mime
-
-EXTRA_OECONF += "--disable-introspection"
-
-UNKNOWN_CONFIGURE_WHITELIST += "--disable-introspection"
diff --git a/meta/classes/gnomebase.bbclass b/meta/classes/gnomebase.bbclass
index 6ca13cb..fa8f88d 100644
--- a/meta/classes/gnomebase.bbclass
+++ b/meta/classes/gnomebase.bbclass
@@ -28,3 +28,6 @@ do_install_append() {
 	rm -f ${D}${datadir}/applications/*.cache
 }
 
+EXTRA_OECONF += "--disable-introspection"
+
+UNKNOWN_CONFIGURE_WHITELIST += "--disable-introspection"
-- 
2.5.0


