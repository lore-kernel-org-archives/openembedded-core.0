Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 292416AD79
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 03:10:23 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id z10so342397pdj.31
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2013 20:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=KlpGfP8qOuJ0Lw4XapCAAJHa9hoTXJ1a51EVy3Lgap0=;
	b=LNhDVfEdyKdgSNDv02JFpcZLTuD7Cw//eN02HThFKFoeJwvlEhv/PEIIGt9XhKVCSH
	FlEycKQyke/uh27tYlQJScYkt5x6NLcWflUpk0XSr1OGLQ0nd5UcDwR5OzgldhyQUxCc
	HgqIPolDKbJgwgEYQjY6H8GCsLZK1eSCZ5qmxojyBAvHtxJR7WHcNirs8O7BO95zawBh
	MMT+nCMNXtqdb2fbB9iQoaj/l/lvMjhlsYte2h8fhG315AHVaLP+ZR4AOFSs0b52Mx+v
	dAIH6IZzxcNuCSlVZFfuRdMMrFRSeHjXMXlZQNxQJDbsulYI7nMdlUnLi8v+ETLHeVnp
	tK6w==
X-Received: by 10.68.247.226 with SMTP id yh2mr21239463pbc.164.1372043424304; 
	Sun, 23 Jun 2013 20:10:24 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id p2sm17422153pag.22.2013.06.23.20.10.23
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 23 Jun 2013 20:10:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jun 2013 20:10:05 -0700
Message-Id: <1372043405-22668-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] libbsd: Add recipes for libbsd - utility functions from BSD systems
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
X-List-Received-Date: Mon, 24 Jun 2013 03:10:23 -0000

When building BSD programs this library provides common
BSD functions that are missing on other OSes e.g. Linux

This library is elemental for porting large set of BSD applications
current consumer of this are in meta-networking/openbsd-netcat
but once we have it in OE-Core more recipes depending on it in different layers
can be added.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libbsd/libbsd_0.5.2.bb |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta/recipes-support/libbsd/libbsd_0.5.2.bb

diff --git a/meta/recipes-support/libbsd/libbsd_0.5.2.bb b/meta/recipes-support/libbsd/libbsd_0.5.2.bb
new file mode 100644
index 0000000..952f212
--- /dev/null
+++ b/meta/recipes-support/libbsd/libbsd_0.5.2.bb
@@ -0,0 +1,19 @@
+# Copyright (C) 2013 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "This library provides useful functions commonly found on BSD systems, \
+               and lacking on others like GNU systems, thus making it easier to port \
+               projects with strong BSD origins, without needing to embed the same \
+               code over and over again on each project."
+
+HOMEPAGE = "http://libbsd.freedesktop.org/wiki/"
+LICENSE = "BSD-4-Clause & MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=98a015f07e71239b058398054f506f07"
+SECTION = "libs"
+DEPENDS = ""
+
+SRC_URI = "http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "be8b2e0dc4614699834c49693574fd1a"
+SRC_URI[sha256sum] = "5340cf67555a8d92e7652d96540a47986a26eeafb9a0a3e22d3b3e5701ebe23f"
+
+inherit autotools pkgconfig
-- 
1.7.9.5


