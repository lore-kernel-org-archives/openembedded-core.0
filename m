Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web08.16125.1605653673816067776
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 14:54:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eJRxWeO1;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id j19so10215257pgg.5
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 14:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1c909Pz8J3NKd+H82C27mQJFSyiCj/LEVJVRj79zpH4=;
        b=eJRxWeO1v+zARkcN8XAXx6MZrzykM/rSk73RtE8Pnopeq2QRXSTLLQlcSvJnRnf3H7
         RI6olEd2YrXN9XXg8TjaaJe4AVkHE6l7G4c9ZBOaFTo9lfXpp+DjSG3h9FQ/1LCSWT9b
         bjq0JNb5aKlVR0gtT+FyIP0lsjT1MgW58tf9fNIu74TCgI1aSKHf4pSkwz75yCcoUev4
         t8UOfNw+u8nzbVz38gPpQyZKPoCZiURnrA17Ul58U6L86cWzr17Dym3+l/NYaSC4vFpq
         k6i66Ge1iqKR/f7Q7IVaP3ytfwAQPMoZ1Dw2kqrZGGWNC+IsMu80kcm7u8lo4bu75IDl
         hFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1c909Pz8J3NKd+H82C27mQJFSyiCj/LEVJVRj79zpH4=;
        b=fko5QBy2QMprRkjcockGOqwJED/2Jnz8HQAGqAM4aJgmg/nIvvlcSHVVPjsPGj/Y+t
         aXhQOS1m6VpfZlHttODwHsklbM5al/wHT2xpJtDjXnC4/UPQv1Cn3nLXX/Mp7Av5xqGx
         u+Vk9MOzAvoxiF1c6taw2OyOjgJ8x1uqKLkjUyMvYSAESCPqyj4rd2dIDiYMVCtYKo/X
         GGlH44/5Bsukl2yiB7LdX1n7Y+VgPp5r7uerDw1gaT3XR1+hnYIi4Rsw/5rvexEc98K5
         d7ahGqso/6IDCegHRP208/Z2NJSRJlupoYxp4OdLBUdIIrHWS/bmXh8kJmU/W2yXPmy9
         /IuA==
X-Gm-Message-State: AOAM533PBozY10QfawkaRKqcujW4HPWc+83aPETj/MuSbLvwQB/zdtsm
	aR7b27gmbOIAHNrzGNIYXkzIECBoLoeHPg==
X-Google-Smtp-Source: ABdhPJwszE0z8uuj8inau+KQH4iGFA2IrnznrM1R0PLzFKJFuTkrYQJDhEUYiJ3leDxiKSm079zpIg==
X-Received: by 2002:a62:7bcc:0:b029:18b:5859:d5e1 with SMTP id w195-20020a627bcc0000b029018b5859d5e1mr1733399pfc.40.1605653673160;
        Tue, 17 Nov 2020 14:54:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4611])
        by smtp.gmail.com with ESMTPSA id w127sm22349579pfc.172.2020.11.17.14.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 14:54:32 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 3/4] python3-sortedcontainers: Add recipe
Date: Tue, 17 Nov 2020 14:54:27 -0800
Message-Id: <20201117225428.877691-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201117225428.877691-1-raj.khem@gmail.com>
References: <20201117225428.877691-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Used in some python package testing infrastructures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-sortedcontainers_2.3.0.bb             | 9 +++++++++
 1 file changed, 9 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb

diff --git a/meta/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb b/meta/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
new file mode 100644
index 0000000000..6060c03723
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-sortedcontainers_2.3.0.bb
@@ -0,0 +1,9 @@
+SUMMARY = "Sorted Containers is an Apache2 licensed sorted collections library, written in pure-Python, and fast as C-extensions."
+HOMEPAGE = "http://www.grantjenks.com/docs/sortedcontainers/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7c7c6a1a12ec816da16c1839137d53ae"
+
+inherit pypi setuptools3
+SRC_URI[sha256sum] = "59cc937650cf60d677c16775597c89a960658a09cf7c1a668f86e1e4464b10a1"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.29.2

