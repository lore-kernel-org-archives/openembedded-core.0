Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2EB0E71AC3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Feb 2018 16:13:57 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id n188so15775909qkn.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Feb 2018 08:13:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Fmx28tq87e+mCukoJRDV/vmi8qhEeJwTZqncd7YJ+f0=;
	b=PHzD+vsu3oJYmHZ99xXa9B590GIlzh/nG4/ZQzJmrBICGnEO90iyXBP2mQoZttmPep
	0bJ4fPmhf+psLZh0+4h13dEEjs9aZm5GtoCHIm2qVsZhwctd3Is8ZRct4JzRZ2wEXOpr
	P2IC3dUjZaxY4VGzlvzIofHkqjKDsxz1TBfm7pJxJhzlYYm7U11ev4Us0y+V/2ha1PIE
	l7sKm2lzX6qRXm/sS8yj8je3lHYiGxKDozYMHdR1YeI+0blyqjuPBzQTeoGusse9uWlY
	L7ExP/YDQaivBS4Dia7XMUVywi5zz1+HhEoap9umv1UTIpp5pArrNCsBmyJ/lQG+dRM0
	/fWg==
X-Gm-Message-State: APf1xPCJpkyCK77/zX4JFDoyFE8XFOWFI6oFVkAhX2+NxtfxbkmQVStO
	aR9AcBW06rWlscq7chp/YAKIZGKc
X-Google-Smtp-Source: AH8x227hnd0cTx+5AprWHdipz4LOZX6BRZ1UrQQ28DJqZxnNQ7laC1KEW0q8Tsl5J5miVNnQJCT1zA==
X-Received: by 10.55.57.135 with SMTP id g129mr8555818qka.212.1518365638672;
	Sun, 11 Feb 2018 08:13:58 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id 33sm4797956qtf.52.2018.02.11.08.13.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Feb 2018 08:13:58 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Feb 2018 11:13:45 -0500
Message-Id: <1518365625-6559-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-dbus: update to version 1.2.6
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
X-List-Received-Date: Sun, 11 Feb 2018 16:13:58 -0000

Update the license file checksum for a added reference and
verify the license terms remain the same

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-dbus_1.2.4.bb => python3-dbus_1.2.6.bb}         | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/python/{python3-dbus_1.2.4.bb => python3-dbus_1.2.6.bb} (77%)

diff --git a/meta/recipes-devtools/python/python3-dbus_1.2.4.bb b/meta/recipes-devtools/python/python3-dbus_1.2.6.bb
similarity index 77%
rename from meta/recipes-devtools/python/python3-dbus_1.2.4.bb
rename to meta/recipes-devtools/python/python3-dbus_1.2.6.bb
index de5a01c..19cbae9 100644
--- a/meta/recipes-devtools/python/python3-dbus_1.2.4.bb
+++ b/meta/recipes-devtools/python/python3-dbus_1.2.6.bb
@@ -2,14 +2,14 @@ SUMMARY = "Python bindings for the DBus inter-process communication system"
 SECTION = "devel/python"
 HOMEPAGE = "http://www.freedesktop.org/Software/dbus"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0b83047ce9e948b67c0facc5f233476a"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b03240518994df6d8c974675675e5ca4"
 DEPENDS = "expat dbus dbus-glib virtual/libintl"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz \
 "
 
-SRC_URI[md5sum] = "7372a588c83a7232b4e08159bfd48fe5"
-SRC_URI[sha256sum] = "e2f1d6871f74fba23652e51d10873e54f71adab0525833c19bad9e99b1b2f9cc"
+RSRC_URI[md5sum] = "1ce1ddf2582060f8f971652ea54cc17e"
+SRC_URI[sha256sum] = "32f29c17172cdb9cb61c68b1f1a71dfe7351506fc830869029c47449bd04faeb"
 S = "${WORKDIR}/dbus-python-${PV}"
 
 inherit distutils3-base autotools pkgconfig
-- 
2.7.4


