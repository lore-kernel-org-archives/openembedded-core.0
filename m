Return-Path: <tom.rini@gmail.com>
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
	[209.85.219.196])
	by mail.openembedded.org (Postfix) with ESMTP id F381A7E6CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 00:11:01 +0000 (UTC)
Received: by mail-yb1-f196.google.com with SMTP id x32so5752920ybh.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 17:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=dxMLJpknnExp+aRmo/CKcJbNnBJIM9zrHS72bbPsYuw=;
	b=e/mnzDQPAWPPLZOi8fFUmMw8t62nLEdZZYVRP3qBC/BpD4BNuNn53v2xvcOizQwARm
	3Jxpkdl6kF14oA4Xhje6sjVxA8YluQevhd/2IGY+dP0H54+tr3h/shbS4vdcbaJRJB0C
	Aihx7VL33RL3RGe1KPkzH28oKZGY+LlQ+R+HUW3opnZSk5FRdRHooMxNIdqSCKfGGYk+
	GA1SzEMpx6s36sXf4ecPFmrqaBcg3I7YumS79RB0AbSXy8njwG7g0MgXY1hpK3oJ76eP
	nmJNLp7sd+QQ3MFUiMDb/ekkXBRedQK7BspBR5eHT8b3UfQXynd2aclNKwoHldE4C5mZ
	mMhw==
X-Gm-Message-State: APjAAAXtOA2OFsu7j5bQ1BIsoS7AHsqG5eAPORurj+EolXVwzk6Clj0A
	IlpIIcGwSiT2a1ryJ8n0HRtZkEh8pQ==
X-Google-Smtp-Source: APXvYqy0rwCQgLvYvyMv5EgzZZb+56gUdsyi6B3vvhgRBkfPo3mMBTCIemrjYb8xRnkh9jqx5vupUQ==
X-Received: by 2002:a25:7781:: with SMTP id
	s123mr41390544ybc.376.1560298262474; 
	Tue, 11 Jun 2019 17:11:02 -0700 (PDT)
Received: from bill-the-cat.local
	(cpe-2606-A000-1401-82DE-1DD5-268A-2EEA-9945.dyn6.twc.com.
	[2606:a000:1401:82de:1dd5:268a:2eea:9945])
	by smtp.gmail.com with ESMTPSA id l6sm4368078ywi.86.2019.06.11.17.11.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Jun 2019 17:11:01 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2019 20:10:58 -0400
Message-Id: <1560298258-21454-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] vim: Update to 8.1.1518 to fix CVE-2019-12735
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
X-List-Received-Date: Wed, 12 Jun 2019 00:11:02 -0000

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 meta/recipes-support/vim/vim-tiny_8.1.1240.bb | 12 ------------
 meta/recipes-support/vim/vim-tiny_8.1.1518.bb | 12 ++++++++++++
 meta/recipes-support/vim/vim.inc              |  2 +-
 meta/recipes-support/vim/vim_8.1.1240.bb      | 10 ----------
 meta/recipes-support/vim/vim_8.1.1518.bb      | 10 ++++++++++
 5 files changed, 23 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-support/vim/vim-tiny_8.1.1240.bb
 create mode 100644 meta/recipes-support/vim/vim-tiny_8.1.1518.bb
 delete mode 100644 meta/recipes-support/vim/vim_8.1.1240.bb
 create mode 100644 meta/recipes-support/vim/vim_8.1.1518.bb

diff --git a/meta/recipes-support/vim/vim-tiny_8.1.1240.bb b/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
deleted file mode 100644
index e4c26d23f69d..000000000000
--- a/meta/recipes-support/vim/vim-tiny_8.1.1240.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require vim.inc
-
-SUMMARY += " (with tiny features)"
-
-PACKAGECONFIG += "tiny"
-
-do_install() {
-    install -D -m 0755 ${S}/src/vim ${D}/${bindir}/vim.tiny
-}
-
-ALTERNATIVE_PRIORITY = "90"
-ALTERNATIVE_TARGET = "${bindir}/vim.tiny"
diff --git a/meta/recipes-support/vim/vim-tiny_8.1.1518.bb b/meta/recipes-support/vim/vim-tiny_8.1.1518.bb
new file mode 100644
index 000000000000..e4c26d23f69d
--- /dev/null
+++ b/meta/recipes-support/vim/vim-tiny_8.1.1518.bb
@@ -0,0 +1,12 @@
+require vim.inc
+
+SUMMARY += " (with tiny features)"
+
+PACKAGECONFIG += "tiny"
+
+do_install() {
+    install -D -m 0755 ${S}/src/vim ${D}/${bindir}/vim.tiny
+}
+
+ALTERNATIVE_PRIORITY = "90"
+ALTERNATIVE_TARGET = "${bindir}/vim.tiny"
diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 5f9f3d79de96..0a31e68cb7cc 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -12,7 +12,7 @@ SRC_URI = "git://github.com/vim/vim.git \
            file://vim-add-knob-whether-elf.h-are-checked.patch \
            file://0001-src-Makefile-improve-reproducibility.patch \
 "
-SRCREV = "d96dbd6f95ea22f609042cc9c6272f14a21ff1a5"
+SRCREV = "202d982b36d87cf91d992bd7e30d3223bdc72cd9"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-support/vim/vim_8.1.1240.bb b/meta/recipes-support/vim/vim_8.1.1240.bb
deleted file mode 100644
index 60946a181f42..000000000000
--- a/meta/recipes-support/vim/vim_8.1.1240.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require vim.inc
-
-PROVIDES = "xxd"
-
-PACKAGECONFIG_class-native = ""
-BBCLASSEXTEND = "native"
-
-ALTERNATIVE_${PN}_append = " xxd"
-ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
-ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
diff --git a/meta/recipes-support/vim/vim_8.1.1518.bb b/meta/recipes-support/vim/vim_8.1.1518.bb
new file mode 100644
index 000000000000..60946a181f42
--- /dev/null
+++ b/meta/recipes-support/vim/vim_8.1.1518.bb
@@ -0,0 +1,10 @@
+require vim.inc
+
+PROVIDES = "xxd"
+
+PACKAGECONFIG_class-native = ""
+BBCLASSEXTEND = "native"
+
+ALTERNATIVE_${PN}_append = " xxd"
+ALTERNATIVE_TARGET[xxd] = "${bindir}/xxd"
+ALTERNATIVE_LINK_NAME[xxd] = "${bindir}/xxd"
-- 
2.7.4


