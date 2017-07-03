Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id BD3636093F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 10:59:21 +0000 (UTC)
Received: by mail-lf0-f46.google.com with SMTP id l13so100527328lfl.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jul 2017 03:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=UpVxlt8ZAiHzdvAKNftOSe+ej5+Hp9567uZDTS97ZDM=;
	b=koyJY+2uhJ9gXr1U4SkGhXUbLEX0Ra0VqqlVPEhGEPy08Le93AISh1CQ2Ncq8OUSRK
	y+1oXymZqxNcoQU/G8VOzk0TIrF9yrGUw+ka4tubtzV8HRjARMBof/ZCrMZamwvsxwxn
	vxQ+0ICf9go4p1Rdy/ouRv3rbdMjza8IDExpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UpVxlt8ZAiHzdvAKNftOSe+ej5+Hp9567uZDTS97ZDM=;
	b=qW0h9AXe8FaGB0YRwnklIk1w/eIcdtHrSxjRKVeHzDLIp7tJngoohr2J2dUZsJjvBd
	Pm1R4uLjO4HuqGrwBzc8Gs/XmSr2xjjbCUSB/HcWApsX8yahc1cUCZL4OhHrLlkYSpOk
	PY2JtlUFBdH2qv++oFKj71UuBbfypUwEjMFIADymoq6fnnjBwea7efTiuBLxS5j09rYf
	GEQ+/LoE4IFzqJWYNWMOyck3CQGJwucPpSnpP9TmjzrzZgSj/G2WDvlx8dR5ct2N2Uuj
	ROJ4INhxtSadZneDHXvNg5P2K8qLPATc5R2mCAQG0cactY7AFmiWh9MNJx6RR8Ebipl1
	yC+Q==
X-Gm-Message-State: AIVw1123aLEZLmyCTbWzxvjW+utKlw4vBbxLQSlHO3l0GHI0SUx/oKxC
	Tx6WPJrfbPcvKsrhtE1SDw==
X-Received: by 10.25.206.203 with SMTP id e194mr3300940lfg.43.1499079562309;
	Mon, 03 Jul 2017 03:59:22 -0700 (PDT)
Received: from localhost.localdomain (a91-156-68-101.elisa-laajakaista.fi.
	[91.156.68.101])
	by smtp.gmail.com with ESMTPSA id y4sm4157468lfc.8.2017.07.03.03.59.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 03 Jul 2017 03:59:20 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Jul 2017 13:59:18 +0300
Message-Id: <20170703105918.21597-1-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.13.0
Cc: naresh.kamboju@linaro.org
Subject: [PATCH v2] ltp: add acl, attr, curl and util-linux runtime dependencies
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
X-List-Received-Date: Mon, 03 Jul 2017 10:59:23 -0000

* Use a list and re-order alphabetically to make it easier to read and
  update.
* Add missing runtime dependencies:
  - acl (getfacl/setfacl commands are required)
  - attr (getfattr/setfattr commands are required)
  - curl (curl command is required)
  - util-linux (ipcs command is required)

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
Changes in v2:
 * add missing backslash

 meta/recipes-extended/ltp/ltp_20170516.bb | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/ltp/ltp_20170516.bb b/meta/recipes-extended/ltp/ltp_20170516.bb
index f537d60c15..564fdcf8c2 100644
--- a/meta/recipes-extended/ltp/ltp_20170516.bb
+++ b/meta/recipes-extended/ltp/ltp_20170516.bb
@@ -95,7 +95,27 @@ do_install(){
     cp -r testcases/open_posix_testsuite ${D}/opt/ltp/testcases
 }
 
-RDEPENDS_${PN} = "perl e2fsprogs-mke2fs python-core libaio bash gawk expect ldd unzip gzip cpio cronie logrotate which at"
+RDEPENDS_${PN} = "\
+    acl \
+    at \
+    attr \
+    bash \
+    cpio \
+    cronie \
+    curl \
+    e2fsprogs-mke2fs \
+    expect \
+    gawk \
+    gzip \
+    ldd \
+    libaio \
+    logrotate \
+    perl \
+    python-core \
+    unzip \
+    util-linux \
+    which \
+"
 
 FILES_${PN}-staticdev += "/opt/ltp/lib/libmem.a /opt/ltp/testcases/data/nm01/lib.a"
 
@@ -106,4 +126,3 @@ INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 # However, test_arch_stripped is already stripped, so...
 INSANE_SKIP_${PN} += "already-stripped"
-
-- 
2.13.0


