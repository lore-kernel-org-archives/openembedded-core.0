Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web12.6538.1599512009130442804
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 13:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dwnoWhR3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id y15so2598646wmi.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 13:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1ujL1HYRBThINjWhm1lVB4CqMOEpEKaKURN+pnue46Q=;
        b=dwnoWhR3j6uuEsMrlPagByZI6K2FlutU9DPd5fGi1HWcuNtZwoYVg3Ym7XuDCq8wAR
         sQDP99SmqzRHGL5zqTnRofjHZr20kncU48hxvBzug1OCmZq2P+RuF/zZ9tJmKdnzsVEc
         ThNQVQEZexTi+TLWT2w5GlcscITCkRJXDL3HI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1ujL1HYRBThINjWhm1lVB4CqMOEpEKaKURN+pnue46Q=;
        b=TbkgYr5uZji5dPVQ6Cfcq2oou36DR4hVysy4jM8SQnr7Fal1sWSdo1l3kaHoiCwe7s
         JZYzK7rTjtZ4CG9Q4pAmO31W6f3zE+fOpdv66JYaDGXx8/PPkLczedkMomY8XCZxpAJ3
         SWxBRnQwEnDgTT1U5Fa48U5B23RxQ9i/g2LAbUI4YDVal8PiMpZ3MIpQ6miBLTi8pJT4
         ptij9WuS49th/KUitWkInr4P5goELaZdz09GsOTM6PEObtnoOe8ZUIUE796y1BGmKtZI
         DwRnVWk0zT5sSgJJZPzJ7dPjMkNqY6K1PIBwoxg8c0PVosMnKjD7ZKB8qityn97e4Oc7
         WMFA==
X-Gm-Message-State: AOAM533PKwCFTvP7cCE/WtE1j4Xk8lnggdY7HFVluRJVUjDxfKTwyLje
	m92lz60LVqqRZ/uhHvJ+8ZQij+FE7QnBIA==
X-Google-Smtp-Source: ABdhPJwLgY75IP3RMD/zhMJkKa0IY75YcLq1ThrQOLH859/oHx5GUcJBo0FIBeOp8XIJAMoKzy4oUA==
X-Received: by 2002:a1c:59c2:: with SMTP id n185mr1019810wmb.43.1599512007363;
        Mon, 07 Sep 2020 13:53:27 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (e.4.4.b.0.8.f.4.f.c.f.0.9.0.5.8.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:8509:fcf:4f80:b44e])
        by smtp.gmail.com with ESMTPSA id 92sm32888299wra.19.2020.09.07.13.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 13:53:26 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@linux.intel.com>
Subject: [PATCH][zeus 07/19] nativesdk-buildtools-perl-dummy: add dependencies for autoconf and automake
Date: Mon,  7 Sep 2020 21:53:09 +0100
Message-Id: <20200907205321.1941682-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
References: <20200907205321.1941682-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tim Orling <timothy.t.orling@linux.intel.com>

* For buildtools-extended-tarball, where we are adding all of build-essentials
  to the nativesdk, we need additional perl modules for autoconf and automake.

(From OE-Core rev: f0f766160663407ea7683d31bbf5f011accc9ba2)

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
index 5bc11b9daf1..cfa41c4ae63 100644
--- a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
@@ -15,12 +15,15 @@ DUMMYPROVIDES_PACKAGES = "\
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
 "
 
 DUMMYPROVIDES = "\
-- 
2.25.1

