Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id A7AD46C5CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 15:41:52 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id j207so2279669wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 07:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lnDIC7hP9wLafa/K2UC+yjPowh+CUDvcWx5GwJ3fnuw=;
	b=Sv2ArgtqUhK/6nvu/TxPrEVzxAWMIvJzYTuR6kZ1wjRODRhSYW6ARQ7PuueMkcDsOX
	w5+S/SX1II5BRszd61SsP+hEcFDA639d64Jun8vACwEqw3LlPEZtYT9cq+1pwc3XXZCV
	g6LcS4tQw1DdTWINo2NG2WEaWB69kbLFCmhG6KIM3nQzI3U7LQtEZ9LQm26KVt3D0GXA
	ZGjsUyZmQTYMNmnCr5jeUhjc8BnL3qgKhwb0J3N2acYK21J553YDEknJffAMIR4Inj3h
	SN/v7iPBgDSenN/mXjke+wCE/fYs21hEEtkDULKYDzJTONoX4VDTybtcM5n59moilNE1
	kwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lnDIC7hP9wLafa/K2UC+yjPowh+CUDvcWx5GwJ3fnuw=;
	b=dNuah7/BpWooSGRlbAllFBnjfF54RpFP9MGBIaeUeiSs3VjCiLWEaOJW9KX9gKVGBY
	OlayJl1/L/VPq5WkBuZFi1iCy5PA9jVqemxb9F0iQ64R+o0L12EqTMR+skLPGJAxyTzi
	gRAp6jFVGbBhR0ZsW7rWQu112HSKdJkQsL2Svs5ZveNcg28qaPpzNawiFFOD0inIA+YO
	lbJV8hHz8mVCnRRQ0Vti5+JNU8jpszdQK263t1WYloX/6JjMdN/teFQ79XI3kCaZsive
	Z4I6Nz6x6LdGoue9qNzcy8LD7WO6sCdqO3yziURM0cqZUY81V9/BF9kiZN/7kkYv2FKJ
	uTyA==
X-Gm-Message-State: AA+aEWaBBdjdjn6G+C1DY8CzhcLsN/JuQvYDXR03C5CAsAXIMonG+QhM
	lkMXU000ktxP3CkDmo7xRAd1XWsD
X-Google-Smtp-Source: AFSGD/WKpG+xWaPZ1qq0zeZo6NfAaWJdhwb1Uup5ejwjFfUzmZexUoCE+9qQMBzYthz3o8OjFYqN+w==
X-Received: by 2002:a1c:6a08:: with SMTP id f8mr9760604wmc.4.1542901313125;
	Thu, 22 Nov 2018 07:41:53 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	e8-v6sm3302931wmf.22.2018.11.22.07.41.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Nov 2018 07:41:52 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Nov 2018 16:41:24 +0100
Message-Id: <20181122154136.121480-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181122154136.121480-1-alex.kanavin@gmail.com>
References: <20181122154136.121480-1-alex.kanavin@gmail.com>
Subject: [PATCH 04/16] dmidecode: update to 3.2
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
X-List-Received-Date: Thu, 22 Nov 2018 15:41:52 -0000

Also, replace a sed hack with a proper patch.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...mitting-changes-from-do_unpack_extra.patch | 24 +++++++++++++++++++
 .../{dmidecode_3.1.bb => dmidecode_3.2.bb}    | 13 ++++------
 2 files changed, 29 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-devtools/dmidecode/dmidecode/0001-Committing-changes-from-do_unpack_extra.patch
 rename meta/recipes-devtools/dmidecode/{dmidecode_3.1.bb => dmidecode_3.2.bb} (60%)

diff --git a/meta/recipes-devtools/dmidecode/dmidecode/0001-Committing-changes-from-do_unpack_extra.patch b/meta/recipes-devtools/dmidecode/dmidecode/0001-Committing-changes-from-do_unpack_extra.patch
new file mode 100644
index 00000000000..c9b19182ddf
--- /dev/null
+++ b/meta/recipes-devtools/dmidecode/dmidecode/0001-Committing-changes-from-do_unpack_extra.patch
@@ -0,0 +1,24 @@
+From 00a3ace35d66e7ae60046e254a4d00f0f9c1abe2 Mon Sep 17 00:00:00 2001
+From: OpenEmbedded <oe.patch@oe>
+Date: Thu, 22 Nov 2018 12:05:04 +0000
+Subject: [PATCH] Do not install to /usr/local
+
+Upstream-Status: Inappropriate
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 77c9310..fc378fd 100644
+--- a/Makefile
++++ b/Makefile
+@@ -30,7 +30,7 @@ CFLAGS += -O2
+ LDFLAGS =
+ 
+ DESTDIR =
+-prefix  = /usr/local
++prefix  = /usr
+ sbindir = $(prefix)/sbin
+ mandir  = $(prefix)/share/man
+ man8dir = $(mandir)/man8
diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.1.bb b/meta/recipes-devtools/dmidecode/dmidecode_3.2.bb
similarity index 60%
rename from meta/recipes-devtools/dmidecode/dmidecode_3.1.bb
rename to meta/recipes-devtools/dmidecode/dmidecode_3.2.bb
index b423fda6d24..63f4061cb7e 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.1.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.2.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "http://www.nongnu.org/dmidecode/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/dmidecode/${BP}.tar.xz"
+SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/dmidecode/${BP}.tar.xz \
+           file://0001-Committing-changes-from-do_unpack_extra.patch \
+           "
 
 COMPATIBLE_HOST = "(i.86|x86_64|aarch64|arm|powerpc|powerpc64).*-linux"
 
@@ -17,11 +19,6 @@ do_install() {
 	oe_runmake DESTDIR="${D}" install
 }
 
-do_unpack_extra() {
-	sed -i -e '/^prefix/s:/usr/local:${exec_prefix}:' ${S}/Makefile
-}
-addtask unpack_extra after do_unpack before do_patch
-
-SRC_URI[md5sum] = "679c2c015c515aa6ca5f229aee49c102"
-SRC_URI[sha256sum] = "d766ce9b25548c59b1e7e930505b4cad9a7bb0b904a1a391fbb604d529781ac0"
+SRC_URI[md5sum] = "9cc2e27e74ade740a25b1aaf0412461b"
+SRC_URI[sha256sum] = "077006fa2da0d06d6383728112f2edef9684e9c8da56752e97cd45a11f838edd"
 
-- 
2.17.1


