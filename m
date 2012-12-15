Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TjpkB-0001ZW-Io
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 12:17:27 +0100
Received: by mail-bk0-f47.google.com with SMTP id j4so1978522bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Dec 2012 03:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=pctidfNEJ/vaQarz0/gMCTlz3kqlUh/3EqhINZzj40o=;
	b=0GpoGiqu0PKS1oCyI/tRBUZ7JdGkZp2VvhIkTXYUuBkzmnjDtt2arPP2fNY/RQyivJ
	rVkwa4yoWjn/EzfDqbTBfVCLAfYnRzciaFf81zbeyRpvnAFwG6+1k1cj+EGsT+ahYiBI
	zBckNdfHxQurZn3l8Y/S8lbS0bqpnS245I6XD2233oIPXEIb/ozcw15z/IYd7RxEYRx4
	NykA8+h7Cd0MK0U8RQegzQt6Z18dSLVx9h2qBgNT65f52srY5XDUXcNOB/XyVdwqDGRz
	KJ2NB91fa7kFFZcPg060oCqQwlct1iagn1Utzj5YwbQxwREo5dtia3qo0tEsCxA5HmLy
	xfAA==
Received: by 10.204.148.145 with SMTP id p17mr3833946bkv.136.1355569366068;
	Sat, 15 Dec 2012 03:02:46 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id m20sm6150048bkw.4.2012.12.15.03.02.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Dec 2012 03:02:45 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TjpVz-000193-Ft; Sat, 15 Dec 2012 13:02:43 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Dec 2012 13:02:42 +0200
Message-Id: <1355569362-4371-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] fontconfig: update to upstream version 2.10.2
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
X-List-Received-Date: Sat, 15 Dec 2012 11:17:29 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../{fontconfig-2.10.1 => fontconfig-2.10.2}/97_fontconfig         |    0
 .../{fontconfig-2.10.1 => fontconfig-2.10.2}/fix-pkgconfig.patch   |    0
 .../{fontconfig-native_2.10.1.bb => fontconfig-native_2.10.2.bb}   |    0
 .../fontconfig/{fontconfig_2.10.1.bb => fontconfig_2.10.2.bb}      |    4 ++--
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-graphics/fontconfig/{fontconfig-2.10.1 => fontconfig-2.10.2}/97_fontconfig (100%)
 rename meta/recipes-graphics/fontconfig/{fontconfig-2.10.1 => fontconfig-2.10.2}/fix-pkgconfig.patch (100%)
 rename meta/recipes-graphics/fontconfig/{fontconfig-native_2.10.1.bb => fontconfig-native_2.10.2.bb} (100%)
 rename meta/recipes-graphics/fontconfig/{fontconfig_2.10.1.bb => fontconfig_2.10.2.bb} (95%)

diff --git a/meta/recipes-graphics/fontconfig/fontconfig-2.10.1/97_fontconfig b/meta/recipes-graphics/fontconfig/fontconfig-2.10.2/97_fontconfig
similarity index 100%
rename from meta/recipes-graphics/fontconfig/fontconfig-2.10.1/97_fontconfig
rename to meta/recipes-graphics/fontconfig/fontconfig-2.10.2/97_fontconfig
diff --git a/meta/recipes-graphics/fontconfig/fontconfig-2.10.1/fix-pkgconfig.patch b/meta/recipes-graphics/fontconfig/fontconfig-2.10.2/fix-pkgconfig.patch
similarity index 100%
rename from meta/recipes-graphics/fontconfig/fontconfig-2.10.1/fix-pkgconfig.patch
rename to meta/recipes-graphics/fontconfig/fontconfig-2.10.2/fix-pkgconfig.patch
diff --git a/meta/recipes-graphics/fontconfig/fontconfig-native_2.10.1.bb b/meta/recipes-graphics/fontconfig/fontconfig-native_2.10.2.bb
similarity index 100%
rename from meta/recipes-graphics/fontconfig/fontconfig-native_2.10.1.bb
rename to meta/recipes-graphics/fontconfig/fontconfig-native_2.10.2.bb
diff --git a/meta/recipes-graphics/fontconfig/fontconfig_2.10.1.bb b/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb
similarity index 95%
rename from meta/recipes-graphics/fontconfig/fontconfig_2.10.1.bb
rename to meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb
index 268a3cb..ceb5119 100644
--- a/meta/recipes-graphics/fontconfig/fontconfig_2.10.1.bb
+++ b/meta/recipes-graphics/fontconfig/fontconfig_2.10.2.bb
@@ -26,8 +26,8 @@ SRC_URI = "http://fontconfig.org/release/fontconfig-${PV}.tar.gz \
            file://fix-pkgconfig.patch \
            file://97_fontconfig"
 
-SRC_URI[md5sum] = "c94e380eea42f2f23ca9537035ef1899"
-SRC_URI[sha256sum] = "c3912bf909c0057e50a67f58fc1b0ae644f1ebf532a0d97864588d9599280222"
+SRC_URI[md5sum] = "025e08b3d7fe45c433de5718e441ed15"
+SRC_URI[sha256sum] = "5c3bf994bb6d6303bbf1e641eaa4b431932138dc90de33642e5845e31e1fdfd6"
 
 PACKAGES =+ "fontconfig-utils-dbg fontconfig-utils "
 FILES_fontconfig-utils-dbg = "${bindir}/*.dbg"
-- 
1.7.10.4



