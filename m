Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id BB2B465D00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 14:17:33 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l132so14054178wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 07:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Bge1V5XAJ06o8+MTskd3tW6oNMaRRdUpW7Oqopvb5Ck=;
	b=ZjDA1AdT481fq8MaFrDutfswYBkg5R6mY+4xrafBGK9PR8d3JRHmbfQeCYXl87n3s9
	SPuRTQX9t+9HeIBUVyFP1xkYqqYFaBWIZY0kWkthh9dh0f6DY+z0CrYHrU5k45b3cRKH
	pqNRql2mvLDVH0+OFPdWYHgQm5+wtfppW5rN1/G6Fv5kHeZc4QR3Vj9vnEcx6LHKNFqb
	70fXhfX2hxYiIkMhLTcFeH+48BIqlLzOfvYLhNlrp5cnc1ghJD9Ec7VCa85n1CyP5DaW
	k0E2cgHc30aQYebZDy06Syp2PfD7vjMZVmAUf94nDd+jNbBSn9+5WNBTJtlh7HKbjWGW
	2Epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Bge1V5XAJ06o8+MTskd3tW6oNMaRRdUpW7Oqopvb5Ck=;
	b=g630LsgsFyopKmsh8LoibxhhiJjQhQF4Bo4712oi6AqLFYMFHNgh1mtzICli17gBhw
	S/YROD9Tu6cMHXUVZd88G5N5X5Dvp5IiTKqrR4IGauTP/v/uU1FoJ/mMu3fXdRq7+kQs
	K8iIuWHLM+M6Z5ir0H0T6eHbYRdm+J2t1HqxkLVNYzaBwe4W6SGk76yOrKy5OI3atIm7
	9bfX5T58p7w4n73EWxfZOLhMQqZiLWVSlj0jfLnLrotqv1oq9kerL6O7buOsGCrzV4TZ
	vLMcjQXl1BC44JoJ2kwiXeb4TQpyxpvcv9ZmlrjsW+VyNGM7lDCHwCtjQdaKq6KgbjbG
	/RYg==
X-Gm-Message-State: AE9vXwM0Cy5527n7CFM/eXDd7dqPrKD1kk8v7PDDUNfxhK21yWnFlJKrQTQp3bSNtpCelA==
X-Received: by 10.28.166.149 with SMTP id p143mr9358674wme.21.1474294653509;
	Mon, 19 Sep 2016 07:17:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	h7sm10314259wmg.24.2016.09.19.07.17.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Sep 2016 07:17:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2016 16:17:31 +0200
Message-Id: <20160919141731.4151-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.10.0
Subject: [PATCH] enchant: add PACKAGECONFIG for *spell
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
X-List-Received-Date: Mon, 19 Sep 2016 14:17:35 -0000

* use PACKAGECONFIG for various *spell implementations

* keep aspell enabled by default

* prevent hunspell/myspell being autodetected as reported in "bitbake world status" e-mails:
  WARN: enchant: enchant rdepends on hunspell, but it isn't a build dependency?

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/enchant/enchant_1.6.0.bb | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-support/enchant/enchant_1.6.0.bb b/meta/recipes-support/enchant/enchant_1.6.0.bb
index 97a4761..44eb2e3 100644
--- a/meta/recipes-support/enchant/enchant_1.6.0.bb
+++ b/meta/recipes-support/enchant/enchant_1.6.0.bb
@@ -7,7 +7,7 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=dfcbabf9131dc9a95febef6753a2958b \
                     file://src/enchant.h;beginline=1;endline=29;md5=8d881caa1d37523567e1d8f726675a18"
 
-DEPENDS = "aspell glib-2.0"
+DEPENDS = "glib-2.0"
 
 inherit autotools pkgconfig
 
@@ -18,15 +18,17 @@ SRC_URI = "http://www.abisource.com/downloads/enchant/${PV}/enchant-${PV}.tar.gz
 SRC_URI[md5sum] = "de11011aff801dc61042828041fb59c7"
 SRC_URI[sha256sum] = "2fac9e7be7e9424b2c5570d8affe568db39f7572c10ed48d4e13cddf03f7097f"
 
-EXTRA_OECONF = "--with-aspell-prefix=${STAGING_DIR_HOST}${prefix} \
-		--enable-aspell br_cv_binreloc=no \
-		"
+PACKAGECONFIG ??= "aspell"
+PACKAGECONFIG[aspell]  = " --with-aspell-prefix=${STAGING_DIR_HOST}${prefix}  --enable-aspell,  --disable-aspell,  aspell,  aspell"
+PACKAGECONFIG[ispell]  = " --with-ispell-prefix=${STAGING_DIR_HOST}${prefix}  --enable-ispell,  --disable-ispell,  ispell,  ispell"
+PACKAGECONFIG[uspell]  = " --with-uspell-prefix=${STAGING_DIR_HOST}${prefix}  --enable-uspell,  --disable-uspell,  uspell,  uspell"
+PACKAGECONFIG[hspell]  = " --with-hspell-prefix=${STAGING_DIR_HOST}${prefix}  --enable-hspell,  --disable-hspell,  hspell,  hspell"
+PACKAGECONFIG[myspell] = "--with-myspell-prefix=${STAGING_DIR_HOST}${prefix} --enable-myspell, --disable-myspell, myspell, myspell"
+
+EXTRA_OECONF = "br_cv_binreloc=no"
 
 export CXXFLAGS += " -L${STAGING_LIBDIR} -lstdc++ "
 
 FILES_${PN} = "${bindir} ${libdir}/*${SOLIBS} ${datadir}/${BPN} ${libdir}/${BPN}/*.so"
 FILES_${PN}-dev += "${libdir}/${BPN}/*{SOLIBSDEV} ${libdir}/${BPN}/*.la"
 FILES_${PN}-staticdev += "${libdir}/${BPN}/*.a"
-
-RDEPENDS_${PN} += "aspell"
-
-- 
2.10.0


