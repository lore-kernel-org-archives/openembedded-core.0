Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id D8D207E4F6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 03:54:22 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id f25so6340967pgv.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2019 20:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=LiY7Wn23WcbVZyNL5lBlHNb8RM39w2Nty9JkjGVQTKk=;
	b=PXRunTKJffrA3Krd7Y+GB23bbLEvvqLFpOAuWDLkkfHKLN4uV3qL2hkSphBVNIhPNy
	ztfZXeFKkl7fzyrbD+qwNoKOUWrvUXRoVIn4nypEeYFwV1e2ozfORTu1gB7o8etiPZAZ
	JRHXag95nPe7lFFHgOaGTGheFwNPjtcTEfkMZjch7KBFDsSt30yhWVGsCxXHxv2m23YX
	thGSJdyLhR2cBMF7PiWEoDAwW++ZLZg983A1kwuXaY64LwfZHrcj2HE4kwATsgOdEjZZ
	T1iWlLI3HkgVHtf6kueGYZ3PCMyChWDJnaX4DiM/OlutGteJNLP1E7oXFOGWqLO+2lfC
	BqlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LiY7Wn23WcbVZyNL5lBlHNb8RM39w2Nty9JkjGVQTKk=;
	b=DvA8VYacmnty34/Xu8gY5EvNCVTVh/0TKxfGEHtg3A/al7b9g44BGlZGMDBAEDb+2w
	txYBYHjAFuKbqLMQtM3K0vjeqSh2nRpZhIhbDc1F2SEwO6BMiKuG4gsO8Eku/6ySsVoI
	3UtAyzYmeLD6anP7KPNepE/t9WJjd84QaaSWqt+0nNJ9Tcjl775JoZoguafKgV7v0DKK
	sthTyLIdLcQscRJ9nXDICcbG4PFZ0KD2x2OPMnFmpFZrYTjVzx73gk4grN1eos0Repbv
	PKCacGn+80ed+dORijaoV5vaTGzCiJt2oclHbnhL7dtQl3HR27aGGjYBVkG+sLDQIL13
	lT8A==
X-Gm-Message-State: APjAAAVBA0MsMDlY+QpqT4FN6OdvUVBmOJ3t/27yvZ1zcKEzKYrPoydZ
	FOwCwAtLvJ0y8OVyfSlOyJiEp5+3cLc=
X-Google-Smtp-Source: APXvYqzXn7DebsUUUa9jCB21LE8QUjra8hTA+Nzv6wfnNFk/EsSRuc3NL0+YF+tcoUzCz7TQ0xPvvQ==
X-Received: by 2002:a63:292:: with SMTP id 140mr29935399pgc.88.1561348463749; 
	Sun, 23 Jun 2019 20:54:23 -0700 (PDT)
Received: from localhost.localdomain ([2601:202:4180:c33:4917:1686:82c6:892f])
	by smtp.gmail.com with ESMTPSA id
	w132sm9837202pfd.78.2019.06.23.20.54.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 23 Jun 2019 20:54:23 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jun 2019 20:54:00 -0700
Message-Id: <3d62aaa8d06387053f98e4156dc8920e2e97feea.1561348290.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1561348290.git.akuster808@gmail.com>
References: <cover.1561348290.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [Warrior][ 01/19] util-linux: Stop udevd to run ptests
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
X-List-Received-Date: Mon, 24 Jun 2019 03:54:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mariano López <just.another.mariano@gmail.com>

The util-linux's ptest uses the SCSI_DEBUG kernel module to create
virtual SCSI disks. The automount feature of udevd will try to mount
these disks by default. Because udevd controls the mount of the disks,
the eject/mount tests will fail or be skipped. This change will stop
udevd before executing the util-linux's ptest and start the daemon
again after all the tests.

This is for eudevd only, systemd-udevd doesn't present this problem
because there are no automount rules.

[YOCTO #13301]

Signed-off-by: Mariano López <just.another.mariano@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-core/util-linux/util-linux.inc       |  4 ++++
 meta/recipes-core/util-linux/util-linux/run-ptest | 14 ++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 7b9b4d2..a61bc78 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -318,4 +318,8 @@ do_install_ptest() {
     sed -i -e \
          '/^TS_CMD_KILL/ s|kill|${PTEST_PATH}/bin/kill|g' \
          ${D}${PTEST_PATH}/tests/commands.sh
+
+
+    sed -i 's|@base_sbindir@|${base_sbindir}|g'       ${D}${PTEST_PATH}/run-ptest
+
 }
diff --git a/meta/recipes-core/util-linux/util-linux/run-ptest b/meta/recipes-core/util-linux/util-linux/run-ptest
index 0324832..e135ee5 100644
--- a/meta/recipes-core/util-linux/util-linux/run-ptest
+++ b/meta/recipes-core/util-linux/util-linux/run-ptest
@@ -1,5 +1,14 @@
 #!/bin/sh
 
+
+# When udevd (from eudev) is running most eject/mount tests will fail because
+# of automount. We need to stop udevd before executing util-linux's tests.
+# The systemd-udevd daemon doesn't change the outcome of util-linux's tests.
+UDEV_PID="`pidof "@base_sbindir@/udevd"`"
+if [ "x$UDEV_PID" != "x" ]; then
+    /etc/init.d/udev stop
+fi
+
 current_path=$(readlink -f $0)
 export bindir=$(dirname $current_path)
 export PATH=$bindir/bin:$PATH
@@ -27,3 +36,8 @@ do
    }' 
 done
 
+
+if [ "x$UDEV_PID" != "x" ]; then
+    /etc/init.d/udev start
+fi
+
-- 
2.7.4


