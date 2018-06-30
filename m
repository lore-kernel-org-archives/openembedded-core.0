Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 98CAA601F1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2018 09:11:09 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id c8-v6so9971817qtp.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2018 02:11:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Hj3+miO9vXWYzm3jwKolRlJN2O0c9LiEAyJDbK0lIlQ=;
	b=sjgtGdn9z8GkAUvdTWYPqo6HcseG6tgFFwjEuN2rET23PjSZMfTNHHj4QnkKq+dqNF
	y4Gixn6hdM8+iIqqik2NzTPvIRfgr3SOkO4t6wUbAaB2C6cjH1h4I76SahvisMx1pdM8
	FO4mkXztc1FE8Y327EkX7NmaqYLjxkViE2tIS04gInUOzXRCz9KfcW4BiT/72fGcvE2Q
	+bWX/exOfc1oVPv+MnvogfEp8qZ13xlSsvcfJ+Er2SA00ZyZMoDIWiDDzrjLYCKdstvT
	GUEnMjn0Y8tJFu8We8vkwLbH7pXSwDLo3sxQPPFAK58ozSHh3qpGAMa1JjZOUiZSjH1i
	Wgkw==
X-Gm-Message-State: APt69E0HBD/ie/HJNYmMNKvz8tEoLuUJQaI1Erh0EKX1WoQqv/Mj3R6v
	lgiVROrAj2iEssFo9gAGXbXjWo9Q
X-Google-Smtp-Source: AAOMgpdrP0u5uc/W5LGS/+vtzt/77/S/YOvAeHpebZSeHxNA9Wh5WJ0EGV8BZsFoRkwNHiVtA03bvA==
X-Received: by 2002:a0c:d067:: with SMTP id
	d36-v6mr16016424qvh.216.1530349870027; 
	Sat, 30 Jun 2018 02:11:10 -0700 (PDT)
Received: from sparta.ny.asterius.io
	(pool-100-33-240-84.nycmny.fios.verizon.net. [100.33.240.84])
	by smtp.gmail.com with ESMTPSA id
	r13-v6sm8699917qti.70.2018.06.30.02.11.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Jun 2018 02:11:09 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sat, 30 Jun 2018 05:11:01 -0400
Message-Id: <1530349861-23603-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] python3-dbus: update to latest stable version of 1.2.8
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
X-List-Received-Date: Sat, 30 Jun 2018 09:11:09 -0000

Remove the PACKAGECONFIG for documentation as it now requires python3-sphinx which is not
provided in any existing recipe.

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/{python3-dbus_1.2.6.bb => python3-dbus_1.2.8.bb}   | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-dbus_1.2.6.bb => python3-dbus_1.2.8.bb} (62%)

diff --git a/meta/recipes-devtools/python/python3-dbus_1.2.6.bb b/meta/recipes-devtools/python/python3-dbus_1.2.8.bb
similarity index 62%
rename from meta/recipes-devtools/python/python3-dbus_1.2.6.bb
rename to meta/recipes-devtools/python/python3-dbus_1.2.8.bb
index 19cbae9..c9bf8df 100644
--- a/meta/recipes-devtools/python/python3-dbus_1.2.6.bb
+++ b/meta/recipes-devtools/python/python3-dbus_1.2.8.bb
@@ -8,15 +8,16 @@ DEPENDS = "expat dbus dbus-glib virtual/libintl"
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus-python/dbus-python-${PV}.tar.gz \
 "
 
-RSRC_URI[md5sum] = "1ce1ddf2582060f8f971652ea54cc17e"
-SRC_URI[sha256sum] = "32f29c17172cdb9cb61c68b1f1a71dfe7351506fc830869029c47449bd04faeb"
+SRC_URI[md5sum] = "7379db774c10904f27e7e2743d90fb43"
+SRC_URI[sha256sum] = "abf12bbb765e300bf8e2a1b2f32f85949eab06998dbda127952c31cb63957b6f"
 S = "${WORKDIR}/dbus-python-${PV}"
 
 inherit distutils3-base autotools pkgconfig
 
-PACKAGECONFIG ?= ""
-PACKAGECONFIG[docs] = "--enable-html-docs,--disable-html-docs,python3-docutils-native"
-PACKAGECONFIG[api-docs] = "--enable-api-docs,--disable-api-docs,python3-docutils-native python3-epydoc-native"
+# documentation needs python3-sphinx, which is not in oe-core or meta-python for now
+# change to use PACKAGECONFIG when python3-sphinx is added to oe-core
+EXTRA_OECONF += "--disable-documentation"
+
 
 RDEPENDS_${PN} = "python3-io python3-logging python3-stringold python3-threading python3-xml"
 
-- 
2.7.4


