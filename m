Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8917C36001
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:38:55 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.2865.1742323127683844285
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 11:38:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a294KAWk;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-301493f45aeso5462520a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742323127; x=1742927927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+2PtxRgE0TTRXgnqb83QPol09MKM/KsT/+eDq9QzMuk=;
        b=a294KAWkcLd/CBz6z3YthUry6EG4r0VEr+iIXCD1240VQavelkBHZsMr5eZewKbNvW
         mJBXbIEFY396zzVCY0esssMgO+Q39GWc5QHMAakCX3vXJQCscS0NUtGn2nCRMfXVmcNE
         WQORlhtwPn5aYN0jfZJjB3QRLvi7zUlEF8Ucn4cL3eNf4TU/V08qyGVT9zIj6LSmeW3G
         NARF72M81Tlpq2+lqpu5QYtDrTdDgxd+Dwawxdym5BJpPQWLm6tUWiT4Sz0AwRr1DBmK
         AzotMkSUQ7g08AlOAoAoFSek5qYD3+Pv2z6gt8JOsBdjEaLXJn7j7PE8B72kn24aXcaE
         WK1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742323127; x=1742927927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+2PtxRgE0TTRXgnqb83QPol09MKM/KsT/+eDq9QzMuk=;
        b=HhPXynfBOgJm3BLijEkx1ZvF5A0CVP/MDJg5+4tySdrgi+cCMGVGn50fDVU+I1GzRM
         dVXGb/WbJ0MAjXJe0AjXZmUA7TSS91tLEoErXr9TJzj3mki26ebBdPM3/17tUuqE5b7Z
         wTm3Eqk8L7VXmG5qiSxJwGiwEaRt0KHJzLj52FkZU7uky4oMlXxMzxAPvnmAcTl8v3+G
         UX+LDcp0mDg8vfkK5WfPVTWMEkAjsDVzswGbg8Y6MGDEBVSc0JeuZ9JeI98WoAZYYg52
         nDKqg8f+tYWLDxgfEU6jMDl0SSZ4GAN8TEkgYV3AEI2j2IgQZfFwuDZ1wmX9tIjc3vc6
         hnRA==
X-Gm-Message-State: AOJu0YzYCHPPCZYIcmEi6MEfkQg50hR+cIg09qS0wFyAjRwVfAYaJ8td
	IwRcFVwYNHfR9Bs4yhgUIHyptk/8MH5U+PXXQR4ZCzmdMz5KZBSlIEaPJr/7
X-Gm-Gg: ASbGncvX1OTQEvhQIFFIdnjvKaTE2I2pZ9JhS7iX9v2oo/1+/yNpgJ3gKE278NpaiC7
	QBz/0eEfaCQ6LAA9vbl6me/aLUo0yYjCu3YcT1Q8lN2gIW8ZVkXXzfKO3SgBfkI/gabyoiQnPrD
	+4IoELFJziatWcbRUjlHllqJPRIUL6CjSGAOiZ5yzcBvHsKA1KMI1Y5TvJbWjceFslvZJHvLSqn
	G+DbyQ8b8Cgm31kKEuweezBpnXJwQODARTPylndn/ntwpFok3tSriIHZGXY5qA6FW2vwgEgNzwe
	AjwrU3fro0EQPO1NtKjTzC8zRHoI4WdKkNmUYjEHjG1gK8A=
X-Google-Smtp-Source: AGHT+IFInI56AR9gLAAuT8eWu593NsN/0b6JNIhRD3ajaJTB+qkylJ8OuVWNtll9gAMgXGgwqSRx6A==
X-Received: by 2002:a17:90b:4a07:b0:2f2:a664:df20 with SMTP id 98e67ed59e1d1-301b9ea5915mr422673a91.7.1742323126849;
        Tue, 18 Mar 2025 11:38:46 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30153afee51sm8537489a91.28.2025.03.18.11.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 11:38:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [[PATCH v2 03/25] webkitgtk: Fix assertion options with clang
Date: Tue, 18 Mar 2025 11:38:18 -0700
Message-ID: <20250318183842.2256284-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318183842.2256284-1-raj.khem@gmail.com>
References: <20250318183842.2256284-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 18:38:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213229

libc++20 needs _LIBCPP_HARDENING_MODE while older libc++
needs _LIBCPP_ENABLE_ASSERTIONS

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...04-main-7ffc29624258-.-https-bugs.we.patch | 75 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.48.0.bb  |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch b/meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
new file mode 100644
index 00000000000..5cbb1035b21
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch
@@ -0,0 +1,75 @@
+From 83093455d02d73a327cea502d974aac82b59ad17 Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Tue, 18 Mar 2025 07:39:01 -0700
+Subject: [PATCH] Cherry-pick 292304@main (7ffc29624258).
+ https://bugs.webkit.org/show_bug.cgi?id=289953
+
+    [GTK][WPE] Use _LIBCPP_HARDENING_MODE with newer libc++ versions
+    https://bugs.webkit.org/show_bug.cgi?id=289953
+
+    Reviewed by Alicia Boya Garcia.
+
+    * Source/cmake/OptionsCommon.cmake: Add a new check for the libc++
+      version, if it is 19 or newer, use the new _LIBCPP_HARDENING_MODE
+      macro, otherwise for older versions keep _LIBCPP_ENABLE_ASSERTIONS.
+
+    Canonical link: https://commits.webkit.org/292304@main
+
+Upstream-Status: Backport [https://github.com/WebKit/WebKit/commit/2c105443d41e5ce3de3a4cac2ed8a07ebd134459]
+
+Canonical link: https://commits.webkit.org/290945.71@webkitglib/2.48
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Source/cmake/OptionsCommon.cmake | 24 +++++++++++++++++++-----
+ 1 file changed, 19 insertions(+), 5 deletions(-)
+
+diff --git a/Source/cmake/OptionsCommon.cmake b/Source/cmake/OptionsCommon.cmake
+index f6cf5ee..3178674 100644
+--- a/Source/cmake/OptionsCommon.cmake
++++ b/Source/cmake/OptionsCommon.cmake
+@@ -229,8 +229,22 @@ set(CXX_STDLIB_TEST_SOURCE "
+ ")
+ check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB_IS_LIBCPP)
+ if (CXX_STDLIB_IS_LIBCPP)
+-    set(CXX_STDLIB_VARIANT "LIBCPP")
+-    set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_ENABLE_ASSERTIONS)
++    set(CXX_STDLIB_TEST_SOURCE "
++        #include <utility>
++        #if _LIBCPP_VERSION >= 190000
++        int main() { }
++        #else
++        #error libc++ is older than 19.x
++        #endif
++    ")
++    check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB_IS_LIBCPP_19_OR_NEWER)
++    if (CXX_STDLIB_IS_LIBCPP_19_OR_NEWER)
++        set(CXX_STDLIB_VARIANT "LIBCPP 19+")
++        set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_HARDENING_MODE=_LIBCPP_HARDENING_MODE_EXTENSIVE)
++    else ()
++        set(CXX_STDLIB_VARIANT "LIBCPP <19")
++        set(CXX_STDLIB_ASSERTIONS_MACRO _LIBCPP_ENABLE_ASSERTIONS=1)
++    endif ()
+ else ()
+     set(CXX_STDLIB_TEST_SOURCE "
+     #include <utility>
+@@ -239,7 +253,7 @@ else ()
+     check_cxx_source_compiles("${CXX_STDLIB_TEST_SOURCE}" CXX_STDLIB_IS_GLIBCXX)
+     if (CXX_STDLIB_IS_GLIBCXX)
+         set(CXX_STDLIB_VARIANT "GLIBCXX")
+-        set(CXX_STDLIB_ASSERTIONS_MACRO _GLIBCXX_ASSERTIONS)
++        set(CXX_STDLIB_ASSERTIONS_MACRO _GLIBCXX_ASSERTIONS=1)
+     endif ()
+ endif ()
+ message(STATUS "C++ standard library in use: ${CXX_STDLIB_VARIANT}")
+@@ -255,8 +269,8 @@ option(USE_CXX_STDLIB_ASSERTIONS
+ 
+ if (USE_CXX_STDLIB_ASSERTIONS)
+     if (CXX_STDLIB_ASSERTIONS_MACRO)
+-        message(STATUS "  Assertions enabled, ${CXX_STDLIB_ASSERTIONS_MACRO}=1")
+-        add_compile_definitions("${CXX_STDLIB_ASSERTIONS_MACRO}=1")
++        message(STATUS "  Assertions enabled, ${CXX_STDLIB_ASSERTIONS_MACRO}")
++        add_compile_definitions("${CXX_STDLIB_ASSERTIONS_MACRO}")
+     else ()
+         message(STATUS "  Assertions disabled, CXX_STDLIB_ASSERTIONS_MACRO undefined")
+     endif ()
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
index afd5dcdd8d8..dfbf9590542 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://t6-not-declared.patch \
            file://sys_futex.patch \
            file://0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch \
+           file://0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch \
            "
 SRC_URI[sha256sum] = "94904a55cf12d44a4e36ceadafff02d46da73d76be9b4769f34cbfdf0eebf88e"
 

