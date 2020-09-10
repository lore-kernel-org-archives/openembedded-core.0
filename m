Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.20761.1599740687290619364
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:24:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ShfP6SuX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id a17so6480585wrn.6
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=c3vV4xrfvJ6AcM9bccaPMURh1f9hguq3/Jk+q3bSSKs=;
        b=ShfP6SuXRiBGYCjN21w7Dc3UROPTgoeQat06jTWXuN/m3nwWqjJn2BS9hfw1Q1Yth3
         d2bk4/y6J34GPneu2dPKOfg3EF7mDObrArblDJW9uKpKJrbWfge2F4zkWGp7kuoPNOUr
         rsl4UCSA+AH3WfQlig3XWxI+vYLuo1drTtarg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c3vV4xrfvJ6AcM9bccaPMURh1f9hguq3/Jk+q3bSSKs=;
        b=oAlsYbHrLONGrY3s+GCvLRMebZFJLRabA0+Nl+R8l9HOI5B+Zvn1C1xrX+YfnQWWka
         sV+NuCVC3edx8iIgGKZLqmwa6lmmd3mUrtGCXagIPyx2WSjULLLgOjgvu/9pCXySV2WD
         wi4DwTISYDrTPO6V4OW01j4kNV8e97G1XhDwktx+E/BSBXYGecswo2ziihUR1Gbc64yb
         H+RkzzddgvMNPObiDn23IIS6+mgMgApOj0WEGDdz09e1AIHjCZEDD9hwbnuq+0SYb2pc
         MEOCDYus8YyMLyYfOUL8ZtjyZtxnI0tuGhL89PBNtdTBjKaxc7lUABXQmGyS5WAX/FF1
         Cp9A==
X-Gm-Message-State: AOAM531/RVg/HUZUz5ce8V0YW4TJoNv0UOoQXvWXePlxSNAC9BEsQNlC
	P+DgRcwNh9T8IIz+l2gigsLrT4MGC1+NdA==
X-Google-Smtp-Source: ABdhPJxshIP6vlSu0POGeDIFy9q3BrarqaemMvDQ5ckE7P1OPrmllwQVv9tujtGBt0QWjFZwEIwXAw==
X-Received: by 2002:adf:f508:: with SMTP id q8mr8302802wro.233.1599740685516;
        Thu, 10 Sep 2020 05:24:45 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id j7sm8590498wrs.11.2020.09.10.05.24.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:24:45 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][thud 13/29] buildtools-extended-tarball: Add locale command
Date: Thu, 10 Sep 2020 13:24:17 +0100
Message-Id: <20200910122433.2040293-13-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
References: <20200910122433.2040293-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The eSDK installation code checks installed locales with the locale command which is
from glibc-utils. Add this so that we find the correct locales from the buildtools.

(From OE-Core rev: 7d35e4bc6ff94a2d03c48827d7d60a6855c9029d)

(From OE-Core rev: d99b6432decec0964ac0e08698abc782c9b114f5)

(From OE-Core rev: 3562a6848aa3e866ad8e2d3caed3211971817234)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index d756036373e..5a781730ed7 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -25,6 +25,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-libstdc++-dev \
     nativesdk-libtool \
     nativesdk-pkgconfig \
+    nativesdk-glibc-utils \
     "
 
 TOOLCHAIN_OUTPUTNAME = "${SDK_ARCH}-buildtools-extended-nativesdk-standalone-${DISTRO_VERSION}"
-- 
2.25.1

