Return-Path: <straka.derek@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 588E877BC3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Feb 2018 16:36:13 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id o7so1412407qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Feb 2018 08:36:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UDg9CLTHZuIPKf8KX0j/hbd7WobDLuwgzIlK8ccybwg=;
	b=XyyvgUsC/cd/giqhSmpVtsDevRIrmDayZZXHVRh/UaHOQw2NzrnItFzBh3PNBmEryD
	bo3ri7CQRjIP0pIGtcj6NNuFRXXx5AY3GUc+qU+AT/RpfX1cYMdGnhcOMDEJUB8/ycHj
	n4cuu/gzduWWRTKhDk2MDe7OcEeSgoA39VphhPgBtRJ03EGRz43pjicYMdhExxdIP9xM
	leJMaY+/JDLi8ncU0hKQd9k2i9dO9K13ZzmUo2lTj7jNRiCKwEst+ALLigTcpo0d8gLm
	MVTGFuXa8AmK5Z/vF6Vrm62fVTRYGXDHRVUPz2LT6WpjRofvRMFQ777cPwnKWQ2BxYWS
	ZITg==
X-Gm-Message-State: APf1xPCzODhQCHkwFQDstLMZVxy7GglFunyq4ca2kma+oEClxExb8mAC
	MF2npxNgrcjVh7CUWCnGlb2nyhG/
X-Google-Smtp-Source: AH8x224lk6FoAQ4k8rLj4PVISdQ352q7LNnzhyjQQyZ9w9MN1hVPLeua4keJkBYWlIq4DbH2E9e3sw==
X-Received: by 10.55.16.31 with SMTP id a31mr14036845qkh.298.1518366975046;
	Sun, 11 Feb 2018 08:36:15 -0800 (PST)
Received: from sparta.ny.asterius.io ([68.132.72.199])
	by smtp.gmail.com with ESMTPSA id w18sm14233qkw.35.2018.02.11.08.36.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 11 Feb 2018 08:36:14 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-core@lists.openembedded.org
Date: Sun, 11 Feb 2018 11:36:04 -0500
Message-Id: <1518366964-14607-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [PATCHv2] python3-dbus: update to version 1.2.6
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
X-List-Received-Date: Sun, 11 Feb 2018 16:36:14 -0000

License-Update: Checksum updated for added clarification to licenses
in other directories and verified the license terms remain the same

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


