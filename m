Received: from mail-da0-f49.google.com ([209.85.210.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tzt3H-0007Vq-FP
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 19:03:31 +0100
Received: by mail-da0-f49.google.com with SMTP id v40so1351350dad.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 09:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=svkZ+brApOT+jLjEBmYY3/rlUm9wAD7i+l9htRjQV4U=;
	b=WJu1kZf+buROnfWxCFyZxZBsQdX6RAQfeEuLLl8jvK02t7QaM1xoNvbLnpctYaog5k
	dr38odFs3yNznIshKqfjmEd6xBrR3vGyiV3xb20VA66jYFE62oJMlcD/QnPiHAgWxLkW
	oB020z05kD3O7zKw9/vnLDEuy3+rW2BR+7zFfPHxYX8e2sf+xSOFZ9YuYNDCCGfT7SzW
	fToJBvdqUxtV8dIu1LD8QfJr1DWhbCDoGj/B+2yTVFIOsSrgJKQvO58LqgxR1BGQWodw
	SpcNHC6No7rJy7wM8K9hhf/lwUreSwXXVnWFybhNx/At8rcNpzuhaFhHlthmb3rMRhrI
	cDbQ==
X-Received: by 10.68.186.197 with SMTP id fm5mr13501410pbc.60.1359395268021;
	Mon, 28 Jan 2013 09:47:48 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id vx2sm6684430pbc.33.2013.01.28.09.47.45
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:47:46 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2013 18:47:41 +0100
Message-Id: <1359395261-7527-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.1
Subject: [PATCH] systemd: bump PE to provide upgrade path from meta-systemd recipe
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
X-List-Received-Date: Mon, 28 Jan 2013 18:03:39 -0000

* 197 sorts lower then v196.*, 22 ERRORs are shown when buildhistory is
  used:
ERROR: Package version for package udev-dbg went backwards which would break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package udev went backwards which would break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package udev-consolekit went backwards which would break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package udev-utils went backwards which would break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package udev-systemd went backwards which would break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package systemd-gui went backwards which would break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package systemd-vconsole-setup went backwards which would break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package systemd-initramfs went backwards which would break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package systemd-analyze went backwards which would break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package systemd-dbg went backwards which would break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package systemd-staticdev went backwards which would break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package systemd-dev went backwards which would break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package systemd-doc went backwards which would break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package systemd-locale went backwards which would break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package systemd went backwards which would break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package libgudev-1.0 went backwards which would break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package libsystemd-daemon went backwards which would break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package libsystemd-id128 went backwards which would break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package libsystemd-journal went backwards which would break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package libsystemd-login went backwards which would break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)
ERROR: Package version for package libudev went backwards which would break package feeds from (0:v196-105-gdecd634-r20.0 to 0:197-r1.0)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/systemd/systemd_197.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd_197.bb b/meta/recipes-core/systemd/systemd_197.bb
index 500c3ec..f43f0cc 100644
--- a/meta/recipes-core/systemd/systemd_197.bb
+++ b/meta/recipes-core/systemd/systemd_197.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
 
 PROVIDES = "udev"
 
+PE = "1"
 PR = "r1"
 
 DEPENDS = "xz kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup tcp-wrappers glib-2.0 libgcrypt"
-- 
1.8.1.1



