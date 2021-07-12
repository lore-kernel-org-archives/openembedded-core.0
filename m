Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.12892.1626103959662745005
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 08:32:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=JulqaTzz;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id m83so9063104pfd.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 08:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vfZ/jB1nTG2Tp8e8uDrnTPp6ovH6JAyfPynsaACvlBI=;
        b=JulqaTzzHcMzwh+XGUit/2waqYTTxpiLIi9tuY6Gns6ZD1waLg0lmQv/IKJsXTecSo
         Y/hn3cAPHGpRxzRcOdoKwGAh+O8nchiPMX3KM8uIE0XfCXUKHUWMEpt3xUTLt7dskq+M
         mSFdqWCkXoBFzZ6LVCcv056cT27QVT3uL5AgmE+6eZDs7MdQSl1FFSqm4LFNxjLyAMbO
         9ukDEAHvjr6Sfa6/OQc2QUo9pAeXAueGuFLLh/B+tcUUOoMbtvRlbPEPV5hgp22wXbzF
         3ee4JLH+S51BEtdm+kxRC/rOWxysFrVTlGU/IwBAgAZjRQL5hIUMh0BaNV/k/nBxwocu
         a6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vfZ/jB1nTG2Tp8e8uDrnTPp6ovH6JAyfPynsaACvlBI=;
        b=r41Pc2UCFrVp2NczyPN0A9OctdYM5UCO4y/l3JjHp3KIgVp0zXMA+kOqiwXCkP8cDk
         gNS302kiWnXFgNYimEQubl6adS5ysX/TiEOtjvYKdEqa3o3eUiPzhNpWDV7cnl+oCCi8
         lv4uxgEArZ3c+O5yprS8RvF5vSRtLl8U1Q/YGdWy/EOxJEIjF4iFoCSl7jOzEY+c15X3
         i9ZtkmEZ+UFhzWQ/DGGdbF4TmcBbzt35i8h8xLnfQJ7SX+pn+7TFmbkpHIcf8TSNId6z
         ZeB4i04u8L38BvF07l5fg18tRjqXU1L5e208i5KjXuZv1LXnQBwrJ3DQf8KM6ZRQRhF/
         Te3Q==
X-Gm-Message-State: AOAM533CXBgLozS7vrlz2XyEtmmXV3XzLnsz217AihouModyycMfIxZ2
	hzJy7lilAfgnfDhGlkk/oY80xnxo46YVTVdS
X-Google-Smtp-Source: ABdhPJyCdUFhOsdrhMRkDn1HeIQ1nOZDcAlk5QuCTl+ebrBODWT6P+mgASHlPDuvQfsQseIaxT+r5g==
X-Received: by 2002:a63:e211:: with SMTP id q17mr31934900pgh.363.1626103958844;
        Mon, 12 Jul 2021 08:32:38 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n3sm16765942pfn.216.2021.07.12.08.32.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 08:32:38 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/12] webkitgtk: Upgrade to 2.28.4
Date: Mon, 12 Jul 2021 05:31:56 -1000
Message-Id: <16f345895dfb82475ab4640e608d232c38b072f6.1626103708.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626103708.git.steve@sakoman.com>
References: <cover.1626103708.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

This is a bug fix release in the stable 2.28 series.

Fixes several crashes and rendering issues.

backport a patch from master to fix clang11 build error

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 6d38f23f5c34dfb2a2d28b834b0c35b1f7778f85)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index 44de685548..ceda2992d7 100644
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
2.25.1

