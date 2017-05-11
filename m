Return-Path: <marek.belisko@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 97A9A72FB0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 17:43:01 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id d127so8574810wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 10:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=wHb9bn5K8a4Dd+PE6bcsCZXAg/CV7KX4QuxVBaQ83hA=;
	b=J36fiD3rhiHjv+0Mu5bmCgAup199MPNTkFiI7en9Pc32YUCqWX6okRwjc4xiOvpSHF
	MW6hqbZch6HXQBSn3pzUSDDWXDJQD7TnYEFRKwLuOhbu2rrjimYq/Dx4WrgF73LSre8n
	cOzpZiGyJlvfYSAcPo6l6Se71mesmY6H1bwzysuyQNmtK86IQA/9FN/GuG/0CKPs4kUU
	oXeluY2rcN4EiwR+viuTuDXFjz781bxtTcvsUDbWZIPAps4sFWPEs4uOSY6n2I/6hUhN
	D4svbkfvjMZS4F7Nmx2zVIWDj0YiyMn6VKUGPC+E5LzgGEvgo9aTIpB3nxkck/ZkqnYI
	dsxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=wHb9bn5K8a4Dd+PE6bcsCZXAg/CV7KX4QuxVBaQ83hA=;
	b=sr21deRb3pgVpNDudT38+DTcbFIih2UDlGg03bLsBUIAH06R3cuZxSHzKWC02LBkmn
	EgM04NZbtmGAKnd6giSami6EZM2r98KamjM7yRgP13fGzOVJW3ZqcuR40pHM//T19Ilj
	lnYlfnqqSWqAmDnENoDJQmp7tOI2P7AyxPK1RAvNLDtiWHD/ZLuCCiSAyCl0KBNu8XqJ
	s5AOtvIine7ICERVtWPLvQ7AZ3Rsbwt+Q4AyPXCHVwn7hDm3Cpk8IH71ltbvzbXlkA8A
	QKvxUYASvZq2sQm1l8xtbZmZAgRZz0zMy0bKMP3M/Jf1UU586veUbzkXxLfKjmIT6o9z
	BQTg==
X-Gm-Message-State: AODbwcD6JBJuWph9Zf3Tz+MTp8vDgzqGV/OCIWtBLz9siBLb+YTK2gJk
	TYED1UvlPNVWFtP5
X-Received: by 10.28.69.11 with SMTP id s11mr208280wma.85.1494524581914;
	Thu, 11 May 2017 10:43:01 -0700 (PDT)
Received: from localhost.localdomain (109-230-21-223.static.orange.sk.
	[109.230.21.223])
	by smtp.gmail.com with ESMTPSA id 92sm780966wra.0.2017.05.11.10.43.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 May 2017 10:43:01 -0700 (PDT)
Sender: Belisko Marek <marek.belisko@gmail.com>
From: Marek Belisko <marek.belisko@open-nandra.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 May 2017 19:43:00 +0200
Message-Id: <1494524580-21718-1-git-send-email-marek.belisko@open-nandra.com>
X-Mailer: git-send-email 2.7.4
Cc: Marek Belisko <marek.belisko@open-nandra.com>
Subject: [PATCH] recipes-support: Add recipe for libgpiod
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
X-List-Received-Date: Thu, 11 May 2017 17:43:02 -0000

libgpiod - C library and tools for interacting with the linux GPIO
character device

Since linux 4.8 the GPIO sysfs interface is deprecated.
User space should use the character device instead.
This library encapsulates the ioctl calls and data structures behind a
straightforward API.

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 meta/recipes-support/libgpiod/libgpiod_0.2.bb | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/recipes-support/libgpiod/libgpiod_0.2.bb

diff --git a/meta/recipes-support/libgpiod/libgpiod_0.2.bb b/meta/recipes-support/libgpiod/libgpiod_0.2.bb
new file mode 100644
index 0000000..fe2cd80
--- /dev/null
+++ b/meta/recipes-support/libgpiod/libgpiod_0.2.bb
@@ -0,0 +1,25 @@
+SUMMARY = "C library and tools for interacting with the linux GPIO character device"
+HOMEPAGE = "https://github.com/brgl/libgpiod"
+
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
+
+UPSTREAM_CHECK_URI = "https://github.com/brgl/libgpiod/releases"
+
+SRC_URI = "https://github.com/brgl/libgpiod/archive/v${PV}.tar.gz"
+
+SRC_URI[md5sum] = "e3430f35b6efa842693d659c0bfb7ad5"
+SRC_URI[sha256sum] = "de1947f3cb2cc4174364af430309fe6238976658575655bdbd76c60cffa7df92"
+
+inherit autotools pkgconfig
+
+# enable tools
+PACKAGECONFIG ?= "tools"
+
+PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
+PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,"
+
+PACKAGES += " ${PN}-tools"
+
+FILES_${PN} = "${libdir}/*"
+FILES_${PN}-tools = "${bindir}/*"
-- 
2.7.4


