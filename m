Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 453157DBBE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 14:07:43 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id s18so16340866wrp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 07:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=NMUbLuYT9CCucqlsfm38KbpLC8HeCHkCIVu3btL8sXo=;
	b=aw8bS4CBSz8hfuAzWqnYCZQPPja89wUv1L/9X9rXNzLlSSo6Vbhvm8inuOQT14nCaU
	4D/ae4E18B1+CUdM4yUjev8UngY8wm/nq2VkCZYMH72NpM7xx9Sf1bBhjkMM8vP2zOdA
	wD0VnGgpRZzKnrUisFXXqkFjPMPRkVGzGMF8iFMrRZQ6Yjr/p1HfMVXbkoB5LbbaDCjd
	Xxz4B1u/mQ9l1KSxEQAFV3Nz4YXzE/4fLhbD3jPzv4jdgzDXYKEGSAFVUdVpM2oj1pZr
	ms87g1i+n/01+u9R2vNhVxfU05CwsS1w1utMHHm64SOW3zb4bRhBjbpz2X4moBSB4FeS
	hhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NMUbLuYT9CCucqlsfm38KbpLC8HeCHkCIVu3btL8sXo=;
	b=PvPeXsR2wZ/urxAYG2ar9c2LxDTW7LbpeDWCFb/ENH58vP7Ic2/wHhOHvIyr+BDLmg
	v8IZ9j7nNXeNImv7z7yMEbIKKwERkCsMEu5e475ZZYNQngQtZzaiI1e9yqzq67scABDa
	yt0zdCD1Fkzt4GMHMYWwW1WSP9FK7InSYoy8CDET7Zkxb7j05Wo4lr7Tc4XsDjKsE64n
	zZZiJBFNBn0/rYre5VeXY6mQ1atw/gKAVZfTef/Mxe8HpgVcPHYYiAutZuDSJlh48YIn
	fS4vaNc3tn3es6aslz9e1J74SrQmnw9Kx8yFIlyFQ4olcOMIYFoFUEvrf1p406VRoRHx
	DvDA==
X-Gm-Message-State: APjAAAVYvfbPeHJqC5EAFZZ27XHsxK+rfApk6q7TIGBNXyB+MWJf+jGM
	aMTyccomVbuf/Y4N4Rjw572hLkBE
X-Google-Smtp-Source: APXvYqwhQ5BLMX0YlJbpgNT7BEwKpTI3MMWcn2U/k3jynRgICDuGX5PdP9HD4oIopQytOtBAILfgmA==
X-Received: by 2002:adf:c002:: with SMTP id z2mr42356079wre.177.1556546863825; 
	Mon, 29 Apr 2019 07:07:43 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id q7sm2627964wra.57.2019.04.29.07.07.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 29 Apr 2019 07:07:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Apr 2019 16:07:30 +0200
Message-Id: <20190429140730.2899-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190429140730.2899-1-schnitzeltony@gmail.com>
References: <20190429140730.2899-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] vte-native: reduce c++ requirements from c++17 -> c++14
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
X-List-Received-Date: Mon, 29 Apr 2019 14:07:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This should fix build on ancient hosts

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...uce-gcc-required-support-downto-c-14.patch | 34 ++++++++++++++
 ...001-Revert-parser-glue-Use-std-clamp.patch | 44 +++++++++++++++++++
 ...replace-std-clamp-by-std-min-std-max.patch | 33 ++++++++++++++
 meta/recipes-support/vte/vte_0.56.1.bb        |  7 +++
 4 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-support/vte/vte/0001-Reduce-gcc-required-support-downto-c-14.patch
 create mode 100644 meta/recipes-support/vte/vte/0001-Revert-parser-glue-Use-std-clamp.patch
 create mode 100644 meta/recipes-support/vte/vte/0001-vte.cc-replace-std-clamp-by-std-min-std-max.patch

diff --git a/meta/recipes-support/vte/vte/0001-Reduce-gcc-required-support-downto-c-14.patch b/meta/recipes-support/vte/vte/0001-Reduce-gcc-required-support-downto-c-14.patch
new file mode 100644
index 0000000000..19379b4c9b
--- /dev/null
+++ b/meta/recipes-support/vte/vte/0001-Reduce-gcc-required-support-downto-c-14.patch
@@ -0,0 +1,34 @@
+From 6d33f959f442f1338846f6f80e826f1345951b57 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sat, 27 Apr 2019 12:52:03 +0200
+Subject: [PATCH] Reduce gcc required support downto c++14
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Native builds require host gcc and they might not support full c++17 but enough
+to build vte-native.
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 1c7a753b..698e795d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -97,7 +97,7 @@ AC_HEADER_STDC
+ AM_PROG_CC_C_O
+ AC_PROG_SED
+ 
+-AX_CXX_COMPILE_STDCXX([17])
++AX_CXX_COMPILE_STDCXX([14])
+ 
+ AC_SYS_LARGEFILE
+ 
+-- 
+2.20.1
+
diff --git a/meta/recipes-support/vte/vte/0001-Revert-parser-glue-Use-std-clamp.patch b/meta/recipes-support/vte/vte/0001-Revert-parser-glue-Use-std-clamp.patch
new file mode 100644
index 0000000000..581996d3c4
--- /dev/null
+++ b/meta/recipes-support/vte/vte/0001-Revert-parser-glue-Use-std-clamp.patch
@@ -0,0 +1,44 @@
+From 9e562ebaf4c01f864cd5791ad759465cb32a9dc5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sat, 27 Apr 2019 13:03:33 +0200
+Subject: [PATCH] Revert "parser: glue: Use std::clamp"
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+std::clamp requires c++17
+
+Upstream-Status: Inappropriate [configuration]
+
+This reverts commit 1a84c427cd2ea05939b86eb47c21a437d0ce6d79.
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ src/parser-glue.hh | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/parser-glue.hh b/src/parser-glue.hh
+index c12bb784..9c23a0a3 100644
+--- a/src/parser-glue.hh
++++ b/src/parser-glue.hh
+@@ -281,7 +281,7 @@ public:
+                                    int max_v) const noexcept
+         {
+                 auto v = param(idx, default_v);
+-                return std::clamp(v, min_v, max_v);
++                return std::min(std::max(v, min_v), max_v);
+         }
+ 
+         /* param_nonfinal:
+@@ -381,7 +381,7 @@ public:
+                                       int max_v) const noexcept
+         {
+                 int v = __builtin_expect(idx < size(), 1) ? vte_seq_arg_value_final(m_seq->args[idx], default_v) : default_v;
+-                return std::clamp(v, min_v, max_v);
++                return std::min(std::max(v, min_v), max_v);
+         }
+ 
+         /* collect_subparams:
+-- 
+2.20.1
+
diff --git a/meta/recipes-support/vte/vte/0001-vte.cc-replace-std-clamp-by-std-min-std-max.patch b/meta/recipes-support/vte/vte/0001-vte.cc-replace-std-clamp-by-std-min-std-max.patch
new file mode 100644
index 0000000000..ef53458858
--- /dev/null
+++ b/meta/recipes-support/vte/vte/0001-vte.cc-replace-std-clamp-by-std-min-std-max.patch
@@ -0,0 +1,33 @@
+From db3b9cceb55130b0a4b3414be804530c368ececc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sat, 27 Apr 2019 13:22:52 +0200
+Subject: [PATCH] vte.cc: replace std:clamp by std:min(std:max(..)..)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+std::clamp requires c++17
+
+Upstream-Status: Inappropriate [configuration]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ src/vte.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/vte.cc b/src/vte.cc
+index 0aa9a3fc..c9faab49 100644
+--- a/src/vte.cc
++++ b/src/vte.cc
+@@ -5125,7 +5125,7 @@ Terminal::resolve_selection_endpoint(vte::grid::halfcoords const& rowcolhalf, bo
+                 /* Just find the nearest cell boundary within the line, not caring about CJKs, unused
+                  * cells, or wrapping at EOL. The @after parameter is unused in this mode. */
+                 col += half;
+-                col = std::clamp (col, 0L, m_column_count);
++                col = std::min (std::max(col, 0L), m_column_count);
+         } else {
+                 switch (m_selection_type) {
+                 case selection_type_char:
+-- 
+2.20.1
+
diff --git a/meta/recipes-support/vte/vte_0.56.1.bb b/meta/recipes-support/vte/vte_0.56.1.bb
index 3585e9ce57..b261c03191 100644
--- a/meta/recipes-support/vte/vte_0.56.1.bb
+++ b/meta/recipes-support/vte/vte_0.56.1.bb
@@ -19,6 +19,13 @@ SRC_URI += "file://0001-Don-t-enable-stack-protection-by-default.patch \
            file://0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch \
            file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
            "
+
+SRC_URI_append_class-native = " \
+    file://0001-Reduce-gcc-required-support-downto-c-14.patch \
+    file://0001-Revert-parser-glue-Use-std-clamp.patch \
+    file://0001-vte.cc-replace-std-clamp-by-std-min-std-max.patch \
+"
+
 SRC_URI[archive.md5sum] = "a8984cd5a101dbff0b0c875d1de3f692"
 SRC_URI[archive.sha256sum] = "02fa8ecc02a9332e47f486795494527b5687b3bd448e73e6b67285f2f326dc7c"
 
-- 
2.20.1


