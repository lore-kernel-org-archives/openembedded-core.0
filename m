Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.20758.1599740684652310975
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DaMtH5GK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id l9so5593651wme.3
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Hh/fss9NY+L079gQYhkgXeNx1aOkt83CJBiWz6tGuY=;
        b=DaMtH5GKOc/uqsOX39uEQXnsxMMm/wRTl6wdJDIy3lWPeBxelz7ds14E6xHcIWJ01n
         PAXVULpF2rulIESfroaKbFWt8JkVS4A1jDPVeBCLhuSMAIOWdXcCdoJi/TeOVAF02pu5
         yUakDwNwjvZ9rJp6/qj1sYv8xxbuSIPAHZvvQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Hh/fss9NY+L079gQYhkgXeNx1aOkt83CJBiWz6tGuY=;
        b=WCgdOrPcDmbykmgCUlMMaauJnZVP9/Z6LpLf/IeylU6RTtWt4rD9cw3/4stAk/f07R
         WZ5LJo/9tixH8+mgspLNO4EWqhYgDts539SNbTBa1l8CjWwKipHZaUP5487AVFoSOHa0
         6Qfu8KYZLsz+Xj0tdHawygtlA4Kz5E3vFsj3jvjv+4Y84gg5duMcLrBLrF9HMmWePQdy
         JOfOO/Dez7mM+G/LpD30tcd2Ahc2sMZvfvC1aToxLIKqFHN+r6Q+zGb0hwYbaY8G9//t
         Vf2UQxd3TEN4RHx8LQHBmuHn25dB90E42/gQiIjmcRoJTVVLJdu5e+eIri8WLn/QH0wZ
         LcbA==
X-Gm-Message-State: AOAM5326sxB7rlKycbvMzw0uNwaluZkzHOz1KxmnIP1nVUTL85Zz9ePU
	zwg761QZuLEbVSIENSLCxdQUG1ZFIW/kkg==
X-Google-Smtp-Source: ABdhPJwgGebRYD9WTqTelPEmLn4fqyON4fxiBQbc6wlOX77prF7eOOkXYlcg6FLKDSGUc8xYGhrNGQ==
X-Received: by 2002:a7b:c4d9:: with SMTP id g25mr8190142wmk.15.1599740682901;
        Thu, 10 Sep 2020 05:24:42 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:42 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH][thud 10/29] buildtools-extended-tarball: add recipe with build-essentials
Date: Thu, 10 Sep 2020 13:24:14 +0100
Message-Id: <20200910122433.2040293-10-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

* For some aging distros, such as CentOS 7, the native version
  of gcc is simply too ancient and is a constant source of
  headaches for moving forward.

* Add an extended version of buildtools-tarball which adds all
  of build-essential, so that the host is now modernized and
  capable of compiling the latest versions of components.

Fixes [YOCTO #13714]

(From OE-Core rev: f0377af2325613b63716b0bb4db1ab253d79f388)

(From OE-Core rev: bb4979f0e8367b475cc9a5274933a61bb0eb64b3)

(From OE-Core rev: f492e172e133a4b52dbe818d806cab783204e575)

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../meta/buildtools-extended-tarball.bb       | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta/recipes-core/meta/buildtools-extended-tarball.bb

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
new file mode 100644
index 00000000000..d756036373e
--- /dev/null
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -0,0 +1,32 @@
+require recipes-core/meta/buildtools-tarball.bb
+
+DESCRIPTION = "SDK type target for building a standalone tarball containing build-essentials, python3, chrpath, \
+               make, git and tar. The tarball can be used to run bitbake builds on systems which don't meet the \
+               usual version requirements and have ancient compilers."
+SUMMARY = "Standalone tarball for running builds on systems with inadequate software and ancient compilers"
+LICENSE = "MIT"
+
+# Add nativesdk equivalent of build-essentials
+TOOLCHAIN_HOST_TASK += "\
+    nativesdk-automake \
+    nativesdk-autoconf \
+    nativesdk-binutils \
+    nativesdk-binutils-symlinks \
+    nativesdk-cpp \
+    nativesdk-cpp-symlinks \
+    nativesdk-gcc \
+    nativesdk-gcc-symlinks \
+    nativesdk-g++ \
+    nativesdk-g++-symlinks \
+    nativesdk-gettext \
+    nativesdk-libatomic \
+    nativesdk-libgcc \
+    nativesdk-libstdc++ \
+    nativesdk-libstdc++-dev \
+    nativesdk-libtool \
+    nativesdk-pkgconfig \
+    "
+
+TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-extended-nativesdk-standalone-${DISTRO_VERSION}"
+
+SDK_TITLE = "Extended Build tools"
-- 
2.25.1

