Return-Path: <akuster@mvista.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 228C270258
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 13:27:36 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id y10so2750759pdj.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 06:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=T/eldfuesQsJ3sUBeBA/rixXBMDLwizoWrPdjEgMOd4=;
	b=UVOzUAInVZHVjoGp3/ayBP+ioYWbJJBDzieNjFPaxWoR4S5eOeEV4rGo/CjDlGJAjM
	/7a57r31kQXSplMlIiEcchKBAdL7VNCpJJxG6ydDsfZ2w/dLhNEHIsbPfUiu0rFHrJnv
	1EQeneROXQ5YAcrdlKTCvbCoqCUFfAsS4AisU8onzBJrx9neJ+T2RrAUgAQ5gkAg4VO4
	dz9+OI/STCuj5pHAjX3+4d6S3XcMPPEXfFjwHM49oyJ55Mo9FHc0WOpygDZ1qg/ZGsAb
	MLaxrYIGncAPwnoecxQTn8ryazF9UKT95Q5f+4r5rQ3UW0Yp6sO5OtWjneiA9XpQEo/3
	jumA==
X-Gm-Message-State: ALoCoQlCaPHvtaSF1x8PiHWdMKZPEjyhaZeBuZC/bM+9/evHcqdBw7oP5t1/kqYhJ4iftEnc2nig
X-Received: by 10.68.201.226 with SMTP id kd2mr1503939pbc.157.1405430858210;
	Tue, 15 Jul 2014 06:27:38 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	fv2sm14012616pbd.11.2014.07.15.06.27.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Jul 2014 06:27:37 -0700 (PDT)
From: Armin Kuster <akuster@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 06:27:35 -0700
Message-Id: <1405430855-12398-1-git-send-email-akuster@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][PATCH] nettle: update to version 3.0
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
X-List-Received-Date: Tue, 15 Jul 2014 13:27:48 -0000

Update to latest version
Add GNUv3 license

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../nettle/{nettle_2.7.1.bb => nettle_3.0.bb}            | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)
 rename meta/recipes-support/nettle/{nettle_2.7.1.bb => nettle_3.0.bb} (59%)

diff --git a/meta/recipes-support/nettle/nettle_2.7.1.bb b/meta/recipes-support/nettle/nettle_3.0.bb
similarity index 59%
rename from meta/recipes-support/nettle/nettle_2.7.1.bb
rename to meta/recipes-support/nettle/nettle_3.0.bb
index 8aa5351..04789c9 100644
--- a/meta/recipes-support/nettle/nettle_2.7.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.0.bb
@@ -1,17 +1,19 @@
 SUMMARY = "A low level cryptographic library"
 HOMEPAGE = "http://www.lysator.liu.se/~nisse/nettle/"
 SECTION = "libs"
-LICENSE = "LGPLv2.1 & GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://serpent-decrypt.c;beginline=53;endline=67;md5=bcfd4745d53ca57f82907089898e390d \
-                    file://serpent-set-key.c;beginline=56;endline=70;md5=bcfd4745d53ca57f82907089898e390d"
+LICENSE = "LGPLv2.1 & GPLv2 & GPLv3"
+LIC_FILES_CHKSUM = "file://COPYINGv3;md5=11cc2d3ee574f9d6b7ee797bdce4d423\
+                    file://serpent-decrypt.c;beginline=53;endline=67;md5=a4ccbeb343203d3586661f45c1cab577 \
+                    file://serpent-set-key.c;beginline=56;endline=70;md5=150b0ea44cdfb712a83331bff566e9a8"
 
 DEPENDS += "gmp"
 
 SRC_URI = "http://www.lysator.liu.se/~nisse/archive/${BP}.tar.gz"
 
-SRC_URI[md5sum] = "003d5147911317931dd453520eb234a5"
-SRC_URI[sha256sum] = "bc71ebd43435537d767799e414fce88e521b7278d48c860651216e1fc6555b40"
+SRC_URI[md5sum] = "f64b1bf1e774b7ae6e507318e340250e"
+SRC_URI[sha256sum] = "9651c0bd2326eb737d0ed9eb403444712407c01a25b0fe813432ef31bebcd913"
+
+inherit autotools-brokensep
 
 EXTRA_OECONF = "--disable-openssl"
 
@@ -21,6 +23,4 @@ do_configure_prepend() {
        fi
 }
 
-inherit autotools
-
 BBCLASSEXTEND = "native"
-- 
1.9.1


