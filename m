Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.20708.1599740595445624397
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:23:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MnIJsXvn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id k18so5579654wmj.5
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1fSs3ZXVqp1A+qmdwwUTnGGXQWv6yvdYQ6sWK6T9K4k=;
        b=MnIJsXvnk9n3j0RIg7TqSRIxqbgLf6vUUhrAJrObZNoZPS/PrXlrQBlFDDs/R+Xxtn
         yY74C8MbKP/IogeAcWJAL1Xw1eF6QcS9Ne+PMOaqehHpMcas1CzNIddh/pHfzmQ6NiLZ
         tN9WZId5wkwCjX+cVzdngojZMDZutyrZXDWx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1fSs3ZXVqp1A+qmdwwUTnGGXQWv6yvdYQ6sWK6T9K4k=;
        b=VJzz8anz3k+HbDbOT7pYtgWR8GL/eWhIhhRI0n+z524QTR2M9qqES6AI4UDXsO+WX5
         tsDcksFwViF5BqyF5e6RdsAZn6DvSaJ6nvKoMOy669V5e7v3tB0J8Dp0WQGIQwJ7T9+q
         YdxkGBaY5yu0hp+OS20H7CkDt1aCPfpi/WMo0k5jk60SnfBlrvyMdEgQwkUufKu4eFaT
         lRnGaHyZSJyeJEzotIMa1CzD/w/FdSi3AYd6L5uD43NBNV/9rPTnAYN3GEur0dgrzujz
         zxUlaTG2ZmWPwDZE3V39WcgoMLcclv3lHbvphrUlgr4qRPlN0BC6AmXZyiQMWb5UxkJT
         CtxA==
X-Gm-Message-State: AOAM533BNBQAASII5d7l5k/cDJBXm4Zw0AutuqgchXi5Totb6MILqG7Z
	Ms6CQdgE5IvK7EoK+Qt9GFzbu99enQjw2g==
X-Google-Smtp-Source: ABdhPJz+QPA0OfDWnwEY4WFnmyxVqS4uHGXeX/YkxZbPUpoeTzJNO6nEoQpasudD3Hf52xs4Q1iGtA==
X-Received: by 2002:a1c:6445:: with SMTP id y66mr8751201wmb.12.1599740593715;
        Thu, 10 Sep 2020 05:23:13 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id v17sm8810794wrr.60.2020.09.10.05.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:23:12 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [PATCH][warrior 08/22] buildtools-extended-tarball: Add libstc++.a
Date: Thu, 10 Sep 2020 13:22:52 +0100
Message-Id: <20200910122306.2040194-8-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
References: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

Builds like native-openjdk, really wants a to link
some tools against the static version. Since when
using the extended tarball, its the only place to
get it, add the library.

(From OE-Core rev: 59c4a3fdbbfd5a6aaba7e0a1675dcd5866a7f3a4)

(From OE-Core rev: 152709dec03bbac582ca63b65f2efb835e0b33fb)

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index 5a781730ed7..37f97056139 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -23,6 +23,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-libgcc \
     nativesdk-libstdc++ \
     nativesdk-libstdc++-dev \
+    nativesdk-libstdc++-staticdev \
     nativesdk-libtool \
     nativesdk-pkgconfig \
     nativesdk-glibc-utils \
-- 
2.25.1

