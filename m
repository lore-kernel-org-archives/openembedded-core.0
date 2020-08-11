Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.3601.1597186682964862811
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2020 15:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dIaeU0e+;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id y6so234775plt.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2020 15:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0GheEV5DM58juqOXNE3gxSst7y/Rv5hfRIiH3/4IKNQ=;
        b=dIaeU0e+kc7MXYajVNAujkMCAi8L/mzRbFVCBZjFXtHnY7/uXZoXuA6NydVnI4QYeO
         OxikaXogISbITJ0GSb85cXAQeqEoN/rSxWsTerccDmhQ4kjcVOHF+MZxRS3aJKoBUn0G
         s2DM9G/Yby+mfVf9g0TR7spvLacEHy55q6chs9e47yZGZeezB7b3OKidVr0k++uVbwR6
         r378P33+LPz/Hnq05FBq9nQ12B8dOwUJtCRkE9RVMUlPzOQ1qYvAcFTwewvS0BH9PoVM
         Pl4FoMQ3buZ3f+TzK1rRE/0o7Ln1WFQOoMapT3ZZpQSnsbPvs3oKIQAsKnVBGQyLOUNo
         7t4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0GheEV5DM58juqOXNE3gxSst7y/Rv5hfRIiH3/4IKNQ=;
        b=BOTU+ouyAoFZwXMaEUWDFW9hA/NUXCpFjPoxdTiXFAet5j89hFo1tnpQoBTEfyzFCV
         0l8/xaztteAtk3ZNiGX8zFhjMV7NKXgInACZf5eQ8q17aIy95+m9tUus/H2Tw6vL7Opd
         CaIm4R9BLdQaW5Yl1kWB0PC8FSSsopqpwBxtbQHW7LCd406noBy5cWKd09NvB3ftnC/v
         DQlbmUtARzNghYaLnuOxcsFW3PTuHPd0j3kU/cJ5Qg4231N1+q4Fboldr5T44g2zOm1a
         nK7TuKErcrDvJDybESDXhqRTTejjGhXPFQtQOzck25m5uVsnxFV1qjaWyGZhzmDroP8U
         r4wg==
X-Gm-Message-State: AOAM5305I0oIjKlDSbC2CyUDuvRxxdDKRR4SXd/0fy8ONaj55WKUXC9G
	iQTciyMBhPvdlalJvM/ncHBSCf7FWqk=
X-Google-Smtp-Source: ABdhPJxgKNcyRx+0hY3PcaL1+uTmZQ8mdgP/pOsERnBJjayN7Ie1yoh72uIL5r74ADmkWJ/3ZfY2WA==
X-Received: by 2002:a17:90a:c003:: with SMTP id p3mr3297173pjt.120.1597186681844;
        Tue, 11 Aug 2020 15:58:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id g1sm127321pfr.97.2020.08.11.15.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 15:58:01 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] webkitgtk: Upgrade to 2.28.4
Date: Tue, 11 Aug 2020 15:57:59 -0700
Message-Id: <20200811225759.618503-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

backport a patch from master to fix clang11 build error

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...build-errors-due-to-WWc-11-narrowing.patch | 66 +++++++++++++++++++
 ...ebkitgtk_2.28.3.bb => webkitgtk_2.28.4.bb} |  3 +-
 2 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-clang-11-fix-build-errors-due-to-WWc-11-narrowing.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.28.3.bb => webkitgtk_2.28.4.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-clang-11-fix-build-errors-due-to-WWc-11-narrowing.patch b/meta/recipes-sato/webkit/webkitgtk/0001-clang-11-fix-build-errors-due-to-WWc-11-narrowing.patch
new file mode 100644
index 0000000000..d8bb8efb88
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-clang-11-fix-build-errors-due-to-WWc-11-narrowing.patch
@@ -0,0 +1,66 @@
+From cb929f59b527fe890376e47613dfe1434a320bc0 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 11 Aug 2020 15:44:48 -0700
+Subject: [PATCH] [clang 11] fix build errors due to -WWc++11-narrowing
+
+https://bugs.webkit.org/show_bug.cgi?id=211193
+
+Reviewed by Adrian Perez de Castro.
+
+Fixes the following errors,
+
+Source/WebCore/html/MediaElementSession.cpp:1059:9: error: type 'WebCore::RenderMedia *' cannot be narrowed to 'bool' in initializer list [-Wc++11-narrowing]
+m_element.renderer(),
+^~~~~~~~~~~~~~~~~~~~
+
+Source/WebCore/style/StyleResolver.cpp:106:55: error: type 'const char [4]' cannot be narrowed to 'bool' in initializer list [-Wc++11-narrowing]
+m_mediaQueryEvaluator = MediaQueryEvaluator { "all" };
+                                              ^~~~~
+Source/WebCore/style/StyleResolver.cpp:106:55: note: insert an explicit cast to silence this issue
+m_mediaQueryEvaluator = MediaQueryEvaluator { "all" };
+                                              ^~~~~
+                                              static_cast<bool>( )
+
+* html/HTMLMediaElement.h:
+(WebCore::HTMLMediaElement::hasRenderer const):
+MediaElementSession was implicitly casting a pointer to a bool,
+which is not allowed with modern Clang checks. Add a helper method
+to encapsulate the now required static_cast<bool>.
+* html/MediaElementSession.cpp: Use the new helper method to see
+if the HTMLMediaElement has an associated renderer.
+(WebCore::MediaElementSession::updateMediaUsageIfChanged):
+* style/StyleResolver.cpp: This was calling MediaQueryEvaluator {
+"all" }; and seemingly expecting to cast a const char[] to a bool,
+or maybe String? It's confusing because of the MediaQueryEvaluator
+API. If it was implicitly converting to bool then that could be
+unintentional. Such casts are not allowed either now. The
+MediaQueryEvaluator's default constructor says it returns true for
+"all", which appears to be the original intent of this call, so I
+replaced it with that.
+(WebCore::Style::Resolver::Resolver):
+
+git-svn-id: http://svn.webkit.org/repository/webkit/trunk@260951 268f45cc-cd09-0410-ab3c-d52691b4dbfc
+
+Upstream-Status: Backport [https://github.com/WebKit/webkit/commit/c3cf651016e4cdcb4350598d4a586821071f91bf.patch]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/WebCore/style/StyleResolver.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/WebCore/style/StyleResolver.cpp b/Source/WebCore/style/StyleResolver.cpp
+index 8bf371a0..34580ddb 100644
+--- a/Source/WebCore/style/StyleResolver.cpp
++++ b/Source/WebCore/style/StyleResolver.cpp
+@@ -107,7 +107,7 @@ Resolver::Resolver(Document& document)
+     if (view)
+         m_mediaQueryEvaluator = MediaQueryEvaluator { view->mediaType() };
+     else
+-        m_mediaQueryEvaluator = MediaQueryEvaluator { "all" };
++        m_mediaQueryEvaluator = MediaQueryEvaluator { };
+ 
+     if (root) {
+         m_rootDefaultStyle = styleForElement(*root, m_document.renderStyle(), nullptr, RuleMatchingBehavior::MatchOnlyUserAgentRules).renderStyle;
+-- 
+2.28.0
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.28.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.28.4.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.28.3.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.28.4.bb
index 0158092265..8ebb3709a8 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.28.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.28.4.bb
@@ -19,8 +19,9 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://cross-compile.patch \
            file://0001-Fix-build-with-musl.patch \
            file://include_array.patch \
+           file://0001-clang-11-fix-build-errors-due-to-WWc-11-narrowing.patch \
            "
-SRC_URI[sha256sum] = "f0898ac072c220e13a4aee819408421a6cb56a6eb89170ceafe52468b0903522"
+SRC_URI[sha256sum] = "821952e8c9303ed752f1fb1d4283f612c25249d00d705d2b79c2db1bc49c9464"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.28.0

