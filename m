Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAigR-0005Ww-Id
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:35:51 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356887bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=McrjmkT2c1l7WyO8DHwa2ipTeBwa3Y+9kOT2OE/WoCg=;
	b=PDiLjIpBKI/sGYZtn3YkCl2CHYZPLG3D2R7MMizprybG9Sd/kaY2oNM57qRaK88Qjv
	eHzrRx8m8WnmPensRXdw5QJh1tRzHoxkCbBJxpLpcnggZRbJdiUNGg4meX4C9rl7mCH1
	kgxxnYdRrR5M50HJNn40H8nKVFXcvoIxNB/tI=
Received: by 10.204.137.212 with SMTP id x20mr5242050bkt.26.1317648621547;
	Mon, 03 Oct 2011 06:30:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e14sm13243219bka.0.2011.10.03.06.30.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:30:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:28:41 +0200
Message-Id: <cbdafd842a8a96761e3f87d9eefd2679bbf81d13.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 10/30] xserver-xf86: add new version 1.11.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Oct 2011 13:35:51 -0000

* move shared definitions to .inc file

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xf86-1.11.1.inc           |    7 +++++++
 .../xorg-xserver/xserver-xf86-dri-lite_1.11.1.bb   |    4 ++++
 .../xorg-xserver/xserver-xf86-lite_1.11.1.bb       |    2 ++
 3 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-1.11.1.inc
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.11.1.bb
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.11.1.bb

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-1.11.1.inc b/meta/recipes-graphics/xorg-xserver/xserver-xf86-1.11.1.inc
new file mode 100644
index 0000000..690de3f
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-1.11.1.inc
@@ -0,0 +1,7 @@
+SRC_URI += "file://crosscompile.patch"
+
+# Misc build failure for master HEAD
+SRC_URI += "file://fix_open_max_preprocessor_error.patch"
+
+SRC_URI[md5sum] = "4cdf54dc569b6a5548257c93a45dcd3d"
+SRC_URI[sha256sum] = "c069c177d9a80bca2ee1d49aa1af6d9f996c83e4ff12393cab2ca3f8817276f6"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.11.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.11.1.bb
new file mode 100644
index 0000000..54ff37a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.11.1.bb
@@ -0,0 +1,4 @@
+require xserver-xf86-dri-lite.inc
+require xserver-xf86-${PV}.inc
+
+PE = "1"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.11.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.11.1.bb
new file mode 100644
index 0000000..0c1b0fd
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.11.1.bb
@@ -0,0 +1,2 @@
+require xserver-xf86-lite.inc
+require xserver-xf86-${PV}.inc
-- 
1.7.7



