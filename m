Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCDyq-0005yo-OW
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:13:05 +0200
Received: by eyx24 with SMTP id 24so2130342eyx.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8sCaZ/BkOxpNCehMKrNB52FXnFpeRBfzfmqqoN6J/gQ=;
	b=NvUa5l4K3s6Rajbh14PV9+LaZ8y0bfgHmvFe/FrITmykSbFdxvl9NgY23byynakFhd
	loLyQmZIElbKGX6RfV7SMWeTTez+Fexr5+BlUwqLsAYDMixg+2ITdd4xSmG2CBuwBzd/
	mD2pVoGAsByxscAcJzR+Q5Ecm5dVpLsYqm8JE=
Received: by 10.223.62.19 with SMTP id v19mr11852383fah.27.1318007244062;
	Fri, 07 Oct 2011 10:07:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m26sm13627481fac.6.2011.10.07.10.07.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:07:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:09 +0200
Message-Id: <67a254e6e3dbf112369bb29f752ac245ff1ef56b.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 14/31] xserver-xorg: add new version 1.11.1
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
X-List-Received-Date: Fri, 07 Oct 2011 17:13:05 -0000

* move shared definitions to .inc file

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xorg-1.11.1.inc           |    7 +++++++
 .../xorg-xserver/xserver-xorg-lite_1.11.1.bb       |    2 ++
 .../xorg-xserver/xserver-xorg_1.11.1.bb            |    4 ++++
 3 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.1.bb
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc
new file mode 100644
index 0000000..690de3f
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.1.inc
@@ -0,0 +1,7 @@
+SRC_URI += "file://crosscompile.patch"
+
+# Misc build failure for master HEAD
+SRC_URI += "file://fix_open_max_preprocessor_error.patch"
+
+SRC_URI[md5sum] = "4cdf54dc569b6a5548257c93a45dcd3d"
+SRC_URI[sha256sum] = "c069c177d9a80bca2ee1d49aa1af6d9f996c83e4ff12393cab2ca3f8817276f6"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.1.bb
new file mode 100644
index 0000000..799b11a
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite_1.11.1.bb
@@ -0,0 +1,2 @@
+require xserver-xorg-lite.inc
+require xserver-xorg-${PV}.inc
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
new file mode 100644
index 0000000..8e97888
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.1.bb
@@ -0,0 +1,4 @@
+require xserver-xorg.inc
+require xserver-xorg-${PV}.inc
+
+PE = "1"
-- 
1.7.7



