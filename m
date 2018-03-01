Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7217F788B7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 23:03:01 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id n7so8263452wrn.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 15:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=VU2w5ohwzWyieGZDRWsZ7UTh5MaWy+WShg3CbjYEdTQ=;
	b=RBvFBHqxLrbQnPjPZfSTWMxBWpDiDKcgB2mr2tjmuVhU0sqU5xvRE6kzUGv+a0vQzZ
	oQ/jhyVthnnZZ+fjOcpb1nUkkrHuqncHn3UJzrX+M4KVwrw5pDWbQi/uc1Ww8TM8e72r
	dVTQqPnNNEwJeIKo5u8VX6mYlJs8p2k7fMiEKVMsQzlrT6MB/43dL8VBlz6rgVkXwwY8
	i1upk+ZdrMLrAlHdPgfUUQUPwKDgLEFMbOjDX6+VECeQfA6h6Jvko5KUJnWu8DIrho3r
	OvTPls7YssGx/IuCr89VyjbJ/nHtYyLCkrtoty5ewnZQyVgqW8PzSeTm57MZXkvmOk9e
	lyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=VU2w5ohwzWyieGZDRWsZ7UTh5MaWy+WShg3CbjYEdTQ=;
	b=tuQw5wTT1EukU7SQWpjPb3ATChlpoov9NAAkBnS7hT1QZacJPwtCbkO40BZeDoeXO0
	8N/raiqhaC34E+IaXyIWIfOWnWKz4xrPu4+nX/fEDmSCcywZBta6VYtMnhkMnghfmg5I
	ZrCtl/SPi357dG11xVnWS32QE9pBcTxISM9buMAxlCISzhu1UWTiEJ618DhED6xvTUZQ
	F7hHUMROHR2XCWkmlbuwbL36op/kb2RDbe+TV0xt7fDF/y2ieeS7byR0TdwsjlvXMlw4
	c5e9omxDQsWBqzTlZT2sHD3nz7sc4f5nQjFC/KUOzXPmFo+PW4AWJUjzO+xVUUumxkeo
	nmaA==
X-Gm-Message-State: APf1xPACQkdqkN2SM+AsfVENFTcf8cRVbIUQwm5pEjNr3fbJt517Q/Mr
	uwQF52JoQyhqbhqmVUmO7EztOcM0
X-Google-Smtp-Source: AG47ELuzJxmQtYwtLvcklyqq4Yf812TkYafOdtYlX/MEGnq3f7MJm+qhzPjW98eCNfdjZMhf/3PrRg==
X-Received: by 10.223.178.26 with SMTP id u26mr3364804wra.63.1519945382234;
	Thu, 01 Mar 2018 15:03:02 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	c78sm6624885wmd.45.2018.03.01.15.03.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 15:03:01 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 23:03:00 +0000
Message-Id: <20180301230300.26346-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] ttf-bitstream-vera: cleanup recipe
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
X-List-Received-Date: Thu, 01 Mar 2018 23:03:01 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../ttf-fonts/ttf-bitstream-vera_1.10.bb           | 34 +++++++++-------------
 1 file changed, 14 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
index b2e4cef39d9..70b32cf8f11 100644
--- a/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
+++ b/meta/recipes-graphics/ttf-fonts/ttf-bitstream-vera_1.10.bb
@@ -13,26 +13,20 @@ inherit fontcache
 
 FONT_PACKAGES = "${PN}"
 
-SRC_URI = "${GNOME_MIRROR}/ttf-bitstream-vera/1.10/ttf-bitstream-vera-${PV}.tar.bz2" 
-
-do_install () { 
-        install -d ${D}${prefix}/share/fonts/ttf/ 
-        for i in *.ttf; do 
-                install -m 644 $i ${D}${prefix}/share/fonts/ttf/${i} 
-        done 
-
-	# fontconfig ships this too.  not sure what to do about it.
-        #install -d ${D}${sysconfdir}/fonts 
-        #install -m 644 local.conf ${D}${sysconfdir}/fonts/local.conf 
-
+SRC_URI = "${GNOME_MIRROR}/ttf-bitstream-vera/1.10/ttf-bitstream-vera-${PV}.tar.bz2"
+SRC_URI[md5sum] = "bb22bd5b4675f5dbe17c6963d8c00ed6"
+SRC_URI[sha256sum] = "db5b27df7bbb318036ebdb75acd3e98f1bd6eb6608fb70a67d478cd243d178dc"
 
-        install -d ${D}${prefix}/share/doc/${BPN}/
-        for i in *.TXT; do 
-                install -m 644 $i ${D}${prefix}/share/doc/${BPN}/$i
-        done 
-} 
+do_install () {
+        install -d ${D}${datadir}/fonts/ttf
+        for i in *.ttf; do
+                install -m 644 $i ${D}${datadir}/fonts/ttf
+        done
 
-FILES_${PN} = "/etc ${datadir}/fonts"
+        install -d ${D}${docdir}/${BPN}
+        for i in *.TXT; do
+                install -m 644 $i ${D}${docdir}/${BPN}
+        done
+}
 
-SRC_URI[md5sum] = "bb22bd5b4675f5dbe17c6963d8c00ed6"
-SRC_URI[sha256sum] = "db5b27df7bbb318036ebdb75acd3e98f1bd6eb6608fb70a67d478cd243d178dc"
+FILES_${PN} = "${datadir}/fonts"
-- 
2.11.0


