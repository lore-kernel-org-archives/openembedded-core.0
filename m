Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.20763.1599740688754072454
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=StBxr/g5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id y15so5612395wmi.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4NZBv9g76N63nVbQ9u6Wl9vdTT2CwiYDFEc8zvAmrDM=;
        b=StBxr/g5KylYtrTkDyQpyyWFFuPcQyw5bT4WYQWpIxHUj/6Yvmd3WxSSiJyuRUyfqV
         E6KfoRDb7Bf+3EE5JApJm5cBMKu6f1FKFPP0TYhZcqxuwGqy+/sI/nk/f0U7rObOuWTm
         d8bD1gfhOQ2oxc9Qjxu+abZXHYFj7hjt+VpBQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4NZBv9g76N63nVbQ9u6Wl9vdTT2CwiYDFEc8zvAmrDM=;
        b=VxWuxVZlhqLGk3n6bD4PbdJba7ihf8GKtEgs/CH85IUNkZ1dxJT7f2Z0jFTGTzthZU
         zCRz1kVZzzVqDf/MeJjeNBEl8ifrKqIiDkoz8RPXzoqgFRhTS1dreKEGBdaiWAQLa6OZ
         ZDXgqxtx3hPGSvJo4h1d15D/ef+yUm57ePIwThvLMtcRUGz+p0KQ/tQTSnaU0hoPCxrz
         eMAmWj13E/gyiepkyh/DM3987wlX0XCXAdWdSj48D4BrbPaylFrq3gQDDxe56Cc4p/3o
         daxs/Zp772qIG9u1ffghQQwcQ67h8XIvZrR0L+APcZisHUbAFtHENT8fPTmP+zQy2eIl
         7M/g==
X-Gm-Message-State: AOAM530s2ypva1Qn1csfADvcRAwyEvecT1xGJ6Tctfr1KJXkEI4fzxq6
	boG8ApHEEkD+ydeY4btWsqD3oC08tBSuFA==
X-Google-Smtp-Source: ABdhPJzMDg80RyJ4jKWq84/R4vmcNHvVrVOYsZfxrL+/YqAcHe5SbJiAOpENPbuWYVfBH7OSwv/TJg==
X-Received: by 2002:a1c:a444:: with SMTP id n65mr8187050wme.122.1599740686894;
        Thu, 10 Sep 2020 05:24:46 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:45 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH][thud 14/29] nativesdk-buildtools-perl-dummy: add dependencies for autoconf and automake
Date: Thu, 10 Sep 2020 13:24:18 +0100
Message-Id: <20200910122433.2040293-14-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

* For buildtools-extended-tarball, where we are adding all of build-essentials
  to the nativesdk, we need additional perl modules for autoconf and automake.

(From OE-Core rev: f0f766160663407ea7683d31bbf5f011accc9ba2)

(From OE-Core rev: e7ade58a7da52ebb40120020dd86dd3ae9b2148e)

(From OE-Core rev: ed9d60fb5d471b4ec472088cc9307fd8575b187a)

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
index 6a8748acdfe..ee7d7cd6606 100644
--- a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
@@ -15,12 +15,15 @@ DUMMYPROVIDES = "\
     nativesdk-perl-module-file-find \
     nativesdk-perl-module-file-glob \
     nativesdk-perl-module-file-path \
+    nativesdk-perl-module-file-spec \
     nativesdk-perl-module-file-stat \
     nativesdk-perl-module-getopt-long \
     nativesdk-perl-module-io-file \
+    nativesdk-perl-module-overloading \
     nativesdk-perl-module-posix \
     nativesdk-perl-module-thread-queue \
     nativesdk-perl-module-threads \
+    nativesdk-perl-module-warnings \
     /usr/bin/perl \
     "
 
-- 
2.25.1

