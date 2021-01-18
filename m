Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web08.3390.1611009482054988742
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jan 2021 14:38:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=KtDy+KMV;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id q4so9393398plr.7
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Jan 2021 14:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=12MN1y4r460o8HWbsqU/zYjCp9APjYatP0WuFpNURfo=;
        b=KtDy+KMVz73zodbl9EkQAXbtkDgq6N135jYSUGv/JJbfnYOpt56IgnzPRMaWkX6Rm1
         UtRvvmHHwS6qFeBu4p+yJlhaQNiTfrX6903BomYSe/Bbhx70sQs8XNfpod81olwY7tTV
         KeIIPz/lK5jnCt+VuG9b6bXkUy22M9wDD5JL+Bsd+1DDEIwKoN5rDgO29iz4b+cs6SpA
         84kpS3dN+cMe8uM7nH7nj/i+xpglD6wKk1TJPsl1aQwWsQmVkyqKAO33mCcTnZ7ayvaC
         4GecV4tFUilnCthceaeOVbTrtdNu1uBXNNiL8ss3kx3inh48E9IStdMZNaQYa0YEnUtU
         qlxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=12MN1y4r460o8HWbsqU/zYjCp9APjYatP0WuFpNURfo=;
        b=VDqhCXS+mxDFjWTmKlpnsrYWetPfhgC0EJpsBTEWb/NP7SFcXy2oUSr+/ayZwoaI3C
         LnvTUBNB/tlG1KglW9MNivbsAtmLeyVL6Kz0fwbR3x5De/zjKeZu5A8bX2m5NwUtGAuh
         VzzcR7iehVGLp/SIx5Z5qZi4ANrxFApq+Qxxl6PArrTmlllTHEqMRWGEEKwMrmGHOTrl
         NZWfU95R8R1kV++aj8krCcbEO9YTw9fCtQyfrd35AkZPyavVERi34xxrIlBXf4yJh7ME
         UgpKxwfx4W5Felxrji2itgbrculDkhvk8y74v5VTnNBEK3936Vzj/gs369qDi5LqRCrC
         Sinw==
X-Gm-Message-State: AOAM531oYzZM9I+dQLQTZXBHsQlkYw9N24TgiCmG+ualwSoaKTEF/8hB
	T1yGHTTjZo1b72BGw564h6dRlk7drgpoTuNfyy0=
X-Google-Smtp-Source: ABdhPJw9xlx9OcQL+V15me8VuaaydWKe9BY0Ei68KWRm+btVP9rE/UPmCtrGl39ixaIBbvWfwYMUYw==
X-Received: by 2002:a17:902:cec3:b029:de:901b:d0be with SMTP id d3-20020a170902cec3b02900de901bd0bemr1605474plg.26.1611009480744;
        Mon, 18 Jan 2021 14:38:00 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.150])
        by smtp.gmail.com with ESMTPSA id a12sm16835556pgq.5.2021.01.18.14.37.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 14:37:59 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/19] boost: drop arm-intrinsics.patch
Date: Mon, 18 Jan 2021 12:36:19 -1000
Message-Id: <9925bdcc1978ed3a03ce9d39b92976a57ea9cc88.1611009050.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1611009050.git.steve@sakoman.com>
References: <cover.1611009050.git.steve@sakoman.com>

From: Mans Rullgard <mans@mansr.com>

This patch makes gcc produce broken code.  It is unclear why it is there
in the first place.  Drop it.

Signed-off-by: Mans Rullgard <mans@mansr.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5f3cace37496fe1dc4fd045f688f7d441505c437)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../boost/boost/arm-intrinsics.patch          | 55 -------------------
 meta/recipes-support/boost/boost_1.72.0.bb    |  2 +-
 2 files changed, 1 insertion(+), 56 deletions(-)
 delete mode 100644 meta/recipes-support/boost/boost/arm-intrinsics.patch

diff --git a/meta/recipes-support/boost/boost/arm-intrinsics.patch b/meta/recipes-support/boost/boost/arm-intrinsics.patch
deleted file mode 100644
index fe85c69a82..0000000000
--- a/meta/recipes-support/boost/boost/arm-intrinsics.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Upstream-Status: Backport
-
-8/17/2010 - rebased to 1.44 by Qing He <qing.he@intel.com>
-
-diff --git a/boost/smart_ptr/detail/atomic_count_sync.hpp b/boost/smart_ptr/detail/atomic_count_sync.hpp
-index b6359b5..78b1cc2 100644
---- a/boost/smart_ptr/detail/atomic_count_sync.hpp
-+++ b/boost/smart_ptr/detail/atomic_count_sync.hpp
-@@ -33,17 +33,46 @@ public:
- 
-     long operator++()
-     {
-+#ifdef __ARM_ARCH_7A__
-+       int v1, tmp;
-+       asm volatile ("1:                 \n\t"
-+                     "ldrex   %0, %1     \n\t"
-+                     "add     %0 ,%0, #1 \n\t"
-+                     "strex   %2, %0, %1 \n\t"
-+                     "cmp     %2, #0     \n\t"
-+                     "bne     1b         \n\t"
-+                     : "=&r" (v1), "+Q"(value_), "=&r"(tmp)
-+                    );
-+#else
-         return __sync_add_and_fetch( &value_, 1 );
-+#endif
-     }
- 
-     long operator--()
-     {
-+#ifdef __ARM_ARCH_7A__
-+       int v1, tmp;
-+       asm volatile ("1:                 \n\t"
-+                     "ldrex   %0, %1     \n\t"
-+                     "sub     %0 ,%0, #1 \n\t"
-+                     "strex   %2, %0, %1 \n\t"
-+                     "cmp     %2, #0     \n\t"
-+                     "bne     1b         \n\t"
-+                     : "=&r" (v1), "+Q"(value_), "=&r"(tmp)
-+                    );
-+       return value_;
-+#else
-         return __sync_add_and_fetch( &value_, -1 );
-+#endif
-     }
- 
-     operator long() const
-     {
-+#if __ARM_ARCH_7A__
-+        return value_;
-+#else
-         return __sync_fetch_and_add( &value_, 0 );
-+#endif
-     }
- 
- private:
diff --git a/meta/recipes-support/boost/boost_1.72.0.bb b/meta/recipes-support/boost/boost_1.72.0.bb
index 51c84bc935..df1cc16937 100644
--- a/meta/recipes-support/boost/boost_1.72.0.bb
+++ b/meta/recipes-support/boost/boost_1.72.0.bb
@@ -1,7 +1,7 @@
 require boost-${PV}.inc
 require boost.inc
 
-SRC_URI += "file://arm-intrinsics.patch \
+SRC_URI += " \
            file://boost-CVE-2012-2677.patch \
            file://boost-math-disable-pch-for-gcc.patch \
            file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
-- 
2.17.1

