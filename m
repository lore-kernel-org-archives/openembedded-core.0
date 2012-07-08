Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SnuFs-0001HK-LM
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jul 2012 18:22:40 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so16966652pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2012 09:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=jotwJ+LPAL0wuPsuKaNk8+zYWlLyXIaBhFXT3GgeT2E=;
	b=mCfk3kEdhPOxm+kBpxqwSJcsEgubSnwxbwXXw8OXxQgquWgwO1K28CasuhxLA2CPhV
	kMqTEE3br6eB7GFHg+ASw6sTr7p3a4JwWfU+D7Avd2ERST+MZWO1TvB+uFrLZQkI/uFn
	/BNfOXqC3mSUZUvU6yvhxLsOr34NsPtO2fYOQ/J/z5+yF3gYhoXTS8z9X/rC+woup/RR
	iUlHp7YawrzhFAPyagJDJTW+YocPFdIQHGeQ4LRV7hxxzLpdYsO1cd1ErcYL6Ra+LREp
	N40sHGOF4WMe2K+6RkxxJZ077Zdl6+EBLBnOqCG5FXrk1EAq62jS1ZtfyMiMlWGHV0me
	H6gg==
Received: by 10.68.237.103 with SMTP id vb7mr52775040pbc.38.1341763892831;
	Sun, 08 Jul 2012 09:11:32 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qp9sm25927714pbc.9.2012.07.08.09.11.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 Jul 2012 09:11:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Jul 2012 09:10:36 -0700
Message-Id: <52141359d1bf54e963711ef5df6ab1825af264ab.1341763347.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
References: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
In-Reply-To: <cover.1341763345.git.raj.khem@gmail.com>
References: <cover.1341763345.git.raj.khem@gmail.com>
Subject: [PATCH 18/19] qemu: Explicitly add --disable-gl-accel when gl is not enabled
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
X-List-Received-Date: Sun, 08 Jul 2012 16:27:16 -0000

Default seems to be to enable GL accelaration so when
gl is not specified in PACKAGECONFIG then add the
--disable-gl-accel to really disable it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 707493e..e618c1d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -38,7 +38,7 @@ do_install () {
 }
 
 PACKAGECONFIG ??= "gl"
-PACKAGECONFIG[gl] = "--enable-gl-accel,,,"
+PACKAGECONFIG[gl] = "--enable-gl-accel,--disable-gl-accel,,"
 
 DEPENDS_virtclass-native = "zlib-native alsa-lib-native glib-2.0-native"
 DEPENDS_virtclass-nativesdk = "zlib-nativesdk libsdl-nativesdk glib-2.0-nativesdk \
-- 
1.7.9.5



