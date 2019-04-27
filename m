Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
	[209.85.128.53])
	by mail.openembedded.org (Postfix) with ESMTP id 542DC6B067
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2019 11:37:22 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id o25so7140554wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2019 04:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cFf+39h8d1Ikrjd1KaAVAh9nfu/yku2CHZCZ8BWao0k=;
	b=oO7cKr9qFzNDhynEPQUiP2i3L2vp1Q0PDH3hDRC5acDB1v1U1gTELJ2Q+JBpT9Y669
	cvu19WRhXnfLf+C923Xq/Ou3ci5m3kjsmWRdHGEo6ZlvRlIb4x7u7tgah2nQ2KFrBk1I
	FSyh/AMfjes7zaK/LvWvgVd2itAiMQKQ9lxCS11FQ2U+6vnWq+11Dt3QpcwVFhPvy4Ex
	p8Rwq98byvrA5gbTjX13QmEok9b3g0PW0nxkJmC+gZNs4GgzQUNoX/cyeNzpZ7N2bWfJ
	4c/UFeGUwiyHXX2Nx6qvAKTy9UO/d8XA8BOYs1DXhpPWzefTEA4kTd2hnL39IoFnflsu
	9hrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cFf+39h8d1Ikrjd1KaAVAh9nfu/yku2CHZCZ8BWao0k=;
	b=CBBLMOyP2lT86iUFr8ZakAqkPhBaHmp2fn3ta9WWzFdu579gP4xxjRuo4KYH4sleZD
	x5u5XtxtcMPVUrnw0a9LqmaP/IJoXE/fh2EniJ+kUnuRvZxOvZ90jUbCWwpwu2Qjvm2c
	TvQzrFY8VYrtsQz4/1PVr7OhlIqVt+51fjTAmQrboulc8+4j7zUTH1TFUs9yR3sF9nKr
	eZMRHuPVKy6Ggw97oE9qBis+XGJWiBisQ7jJ69CmaO7qi2j3fqPMxbIpJcQFz6ta+boy
	Irhtfnl+ShuuYLO7/5guFmOIWYqaHb2R50F1CjyDBsusWa9SPx/Gl6Q+JiBKvWRRqpAi
	hKYA==
X-Gm-Message-State: APjAAAWQDWQq391slZDgCUtxSIJhbXKYecQgF4k+kcOoYxfjz5MSu8FN
	4Ck6YP5zDlVfM4iOuNIAtFlY/xIYccw=
X-Google-Smtp-Source: APXvYqxHwxaxJL4kjL1nT97Zb8+gDE+oQHmTmtXsqvjdSvlZueG3sL7LGUZ3/4hoX6RcBMvAEtYA9g==
X-Received: by 2002:a1c:c012:: with SMTP id q18mr7565221wmf.140.1556365042622; 
	Sat, 27 Apr 2019 04:37:22 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0CEB601D22DC9172CC0D64.dip0.t-ipconnect.de.
	[2003:f0:7f0c:eb60:1d22:dc91:72cc:d64])
	by smtp.gmail.com with ESMTPSA id
	v12sm6050389wrw.23.2019.04.27.04.37.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 27 Apr 2019 04:37:21 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 27 Apr 2019 13:37:14 +0200
Message-Id: <20190427113714.30173-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] vte-native: reduce c++ requirements from c++17 -> c++11
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
X-List-Received-Date: Sat, 27 Apr 2019 11:37:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This should fix build on ancient hosts

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...uce-gcc-required-support-downto-c-11.patch | 34 ++++++++++++++
 ...001-Revert-parser-glue-Use-std-clamp.patch | 44 +++++++++++++++++++
 ...replace-std-clamp-by-std-min-std-max.patch | 33 ++++++++++++++
 meta/recipes-support/vte/vte_0.56.1.bb        |  7 +++
 4 files changed, 118 insertions(+)
 create mode 100644 meta/recipes-support/vte/vte/0001-Reduce-gcc-required-support-downto-c-11.patch
 create mode 100644 meta/recipes-support/vte/vte/0001-Revert-parser-glue-Use-std-clamp.patch
 create mode 100644 meta/recipes-support/vte/vte/0001-vte.cc-replace-std-clamp-by-std-min-std-max.patch

diff --git a/meta/recipes-support/vte/vte/0001-Reduce-gcc-required-support-downto-c-11.patch b/meta/recipes-support/vte/vte/0001-Reduce-gcc-required-support-downto-c-11.patch
new file mode 100644
index 0000000000..9c839d6d26
--- /dev/null
+++ b/meta/recipes-support/vte/vte/0001-Reduce-gcc-required-support-downto-c-11.patch
@@ -0,0 +1,34 @@
+From 6d33f959f442f1338846f6f80e826f1345951b57 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Sat, 27 Apr 2019 12:52:03 +0200
+Subject: [PATCH] Reduce gcc required support downto c++11
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
++AX_CXX_COMPILE_STDCXX([11])
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
index 3585e9ce57..bc49809521 100644
--- a/meta/recipes-support/vte/vte_0.56.1.bb
+++ b/meta/recipes-support/vte/vte_0.56.1.bb
@@ -19,6 +19,13 @@ SRC_URI += "file://0001-Don-t-enable-stack-protection-by-default.patch \
            file://0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch \
            file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch \
            "
+
+SRC_URI_append_class-native = " \
+    file://0001-Reduce-gcc-required-support-downto-c-11.patch \
+    file://0001-Revert-parser-glue-Use-std-clamp.patch \
+    file://0001-vte.cc-replace-std-clamp-by-std-min-std-max.patch \
+"
+
 SRC_URI[archive.md5sum] = "a8984cd5a101dbff0b0c875d1de3f692"
 SRC_URI[archive.sha256sum] = "02fa8ecc02a9332e47f486795494527b5687b3bd448e73e6b67285f2f326dc7c"
 
-- 
2.20.1


