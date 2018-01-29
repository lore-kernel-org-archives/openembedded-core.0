Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 520357884B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 17:11:23 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id g21so8036044wrb.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 09:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0uUbKzEa5iDfr27lLrf5CdvomL+YKxdNQ8hx82aUjCo=;
	b=uozktDZX/sGCak9F/XWvJUH/vDjLMHXwOFfV2NdZM8v6Om8L0vNvaq0htWPXf/bTyc
	PsXiG6d41bSK7An+mpR2jXokE1MieBgGIKkycqAdpb6HBrMO3A02iyESkY0uFcKfkbtD
	j630XexolVjQvFVDzJ30dctZgOCBGAXxPss52WupkiuE8kgMi5LAVOqC53pUIJgT9J8u
	aQ286ZPvCIQh52LePKXt3+yZe6r46GHzrHJlYT+n9NzSr1fhUH1WUxJdMiz/p+vw2YBJ
	RDpn9OO8SiE6wfIeqpDVpCDGz2uF3kS93J3CqZ9zohLScK347/MS7erZEht6F+PKgIha
	CWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0uUbKzEa5iDfr27lLrf5CdvomL+YKxdNQ8hx82aUjCo=;
	b=cSGtIf1F9DBA0lu+XXNcXNByCSaJhE/ko0T/hM2n6XB5ixLP5YjJ2WjcBsjmdIrcg+
	ICD/7KVeqcvdKbDShDB1IsIt2fFWjLk+rQLhedfSZeZLQoG9xn9rANUE6zGxSHS5E02/
	mMgCtFABRtbespx2rw37h4SweIEaEB1NI2jAFnkLJeba7d+I2BtI/zBzQDt2OyOqf7Ha
	ypy857CtAsrdO7ug9Ytd2Iv5l9AO6dUnYGdOIjFJ2/Gf3KsO0kskqjcjdETebcEq0vLw
	tyJrDqSjvYNdoeDK27mf1hvOy/46R2rIJeCk+LqMjs7zZuP7mB8I22I3QxQD+DIE6Fy5
	rdCA==
X-Gm-Message-State: AKwxyteqRl7JgLRWxKSgoftXPW+mB59al90x4c9Q86zKYfBzVWtwC/Ea
	nTA41cRD4PIm8TbeYuzjaNZqkNWQ
X-Google-Smtp-Source: AH8x226JjS0NM0eOTDIwz4n3MWcrlD8XKOWGsbBTMPUPBrOevOIkP5rZ2CJ3XtgjU3KHIztJKgwp8g==
X-Received: by 10.223.185.124 with SMTP id b57mr19387172wrg.13.1517245883877; 
	Mon, 29 Jan 2018 09:11:23 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	e16sm11515244wre.5.2018.01.29.09.11.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jan 2018 09:11:23 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jan 2018 17:11:11 +0000
Message-Id: <20180129171111.14502-5-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180129171111.14502-1-ross.burton@intel.com>
References: <20180129171111.14502-1-ross.burton@intel.com>
Subject: [PATCH 5/5] ofono: use patch sent upstream instead of sed
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
X-List-Received-Date: Mon, 29 Jan 2018 17:11:23 -0000

Instead of using a sed to fix the hashbang in a test tool send a patch upstream
and use that.  This way we'll notice when the patch doesn't need to be applied
anymore.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/ofono/ofono.inc          |  3 ---
 .../ofono/ofono/use-python3.patch                  | 27 ++++++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.22.bb      |  1 +
 3 files changed, 28 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/use-python3.patch

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index 4443a95c2f7..0472414b199 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -26,9 +26,6 @@ SYSTEMD_SERVICE_${PN} = "ofono.service"
 do_install_append() {
   install -d ${D}${sysconfdir}/init.d/
   install -m 0755 ${WORKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
-
-  # Ofono still has one test tool that refers to Python 2 in the shebang
-  sed -i -e '1s,#!.*python.*,#!${bindir}/python3,' ${D}${libdir}/ofono/test/set-ddr
 }
 
 PACKAGES =+ "${PN}-tests"
diff --git a/meta/recipes-connectivity/ofono/ofono/use-python3.patch b/meta/recipes-connectivity/ofono/ofono/use-python3.patch
new file mode 100644
index 00000000000..7b84075257a
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/use-python3.patch
@@ -0,0 +1,27 @@
+set-ddr should use Python3 like all the other tests.
+
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 17b69cd1da4c5c5f732acb38ca1602446c567ee7 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Mon, 29 Jan 2018 11:31:25 +0000
+Subject: [PATCH] test/setddr: use Python 3
+
+All the other tests use Python 3, so this should to.
+---
+ test/set-ddr | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/set-ddr b/test/set-ddr
+index 5d061b95..33631f31 100755
+--- a/test/set-ddr
++++ b/test/set-ddr
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/python3
+ 
+ import sys
+ import dbus
+-- 
+2.11.0
diff --git a/meta/recipes-connectivity/ofono/ofono_1.22.bb b/meta/recipes-connectivity/ofono/ofono_1.22.bb
index fd7ee15af1d..e57eaa77eb9 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.22.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.22.bb
@@ -3,6 +3,7 @@ require ofono.inc
 SRC_URI  = "\
   ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
   file://ofono \
+  file://use-python3.patch \
 "
 SRC_URI[md5sum] = "2a683ab8e98448ad8bc5dc9868d2893e"
 SRC_URI[sha256sum] = "8e34a6696c300c9841b55e8dff640bd3096e49f5dbe55bbebaa69a71676f687e"
-- 
2.11.0


