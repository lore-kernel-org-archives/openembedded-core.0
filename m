Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1REMZD-0001M0-PL
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 16:47:27 +0200
Received: by ywf7 with SMTP id 7so1220889ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 07:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=hCcOk9fSx46g8jdX1ZDf4NMacEdxb1lHuE/JX6n8idk=;
	b=WizHR+XbvLVFC/yG6xh2P/wvlWOxRGQTVruqgmuTdZHGS8Dm+t1vlJ0fI8I823RXkC
	A0At4zqhhHwNSBFCX2S0BveF6JD6FgwZ3PjahUAonu7a98NqvLicW8Fu1CExgs7XapMX
	/a8PcibiNoQKKk4Z0EAWOLAjsryG330mGDBHQ=
Received: by 10.150.206.6 with SMTP id d6mr4844456ybg.60.1318516902335;
	Thu, 13 Oct 2011 07:41:42 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id v20sm122509anv.17.2011.10.13.07.41.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 07:41:41 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 14:41:18 +0000
Message-Id: <e6b0646a52c93799636078b8b9cb9b53c85272e5.1318516840.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1318516840.git.otavio@ossystems.com.br>
References: <cover.1318516840.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1318516840.git.otavio@ossystems.com.br>
References: <cover.1318516840.git.otavio@ossystems.com.br>
Subject: [PATCH 3/4] qt4: use 4.7.4 as default preference
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
X-List-Received-Date: Thu, 13 Oct 2011 14:47:27 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb        |    1 -
 meta/recipes-qt/qt4/qt4-native_4.7.4.bb          |    1 -
 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb |    2 --
 meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb        |    2 --
 4 files changed, 0 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
index 34061cb..e34ec8d 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.7.4.bb
@@ -9,4 +9,3 @@ QT_CONFIG_FLAGS += " \
  -exceptions \
 "
 
-DEFAULT_PREFERENCE = "-1"
diff --git a/meta/recipes-qt/qt4/qt4-native_4.7.4.bb b/meta/recipes-qt/qt4/qt4-native_4.7.4.bb
index 7196c73..3be4d73 100644
--- a/meta/recipes-qt/qt4/qt4-native_4.7.4.bb
+++ b/meta/recipes-qt/qt4/qt4-native_4.7.4.bb
@@ -15,4 +15,3 @@ TOBUILD := "src/tools/bootstrap ${TOBUILD}"
 SRC_URI[md5sum] = "9831cf1dfa8d0689a06c2c54c5c65aaf"
 SRC_URI[sha256sum] = "97195ebce8a46f9929fb971d9ae58326d011c4d54425389e6e936514f540221e"
 
-DEFAULT_PREFERENCE = "-1"
diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb
index 77e1f36..4c90d57 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.7.4.bb
@@ -7,5 +7,3 @@ SRC_URI += "file://blacklist-diginotar-certs.diff \
 
 SRC_URI[md5sum] = "9831cf1dfa8d0689a06c2c54c5c65aaf"
 SRC_URI[sha256sum] = "97195ebce8a46f9929fb971d9ae58326d011c4d54425389e6e936514f540221e"
-
-DEFAULT_PREFERENCE = "-1"
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
index 0290313..8c48936 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.7.4.bb
@@ -9,5 +9,3 @@ QT_CONFIG_FLAGS += " \
  -no-embedded \
  -xrandr \
  -x11"
-
-DEFAULT_PREFERENCE = "-1"
-- 
1.7.2.5



