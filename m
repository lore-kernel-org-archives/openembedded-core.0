Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.20679.1599740606970230560
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2020 05:23:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WhN50i/J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id b79so5582628wmb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2020 05:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zx3TdyDadOXNXNWXdgijBcXFhN8oggm0Z9m9I+KAAdc=;
        b=WhN50i/J6392Nu0OURkX/lB9upJURsn6VfIpQQZsXeNaP0B+d3vvdUTPgYSmNpYyT+
         OPRVQfEcIDwffBX7XcsxQBruIaROHT6nymQd8EyhW6PNAqsdkWT/KDdtGZiVYMyuZPNj
         DTVasYhoP8jpp2xp6iYmmgVpTAZeo6ZMoq9Os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zx3TdyDadOXNXNWXdgijBcXFhN8oggm0Z9m9I+KAAdc=;
        b=r8c24prbqU8+ZJbMdi5IVt4sf77lDv8vLfn6uzkEBL2EzB+K+KZi+RlQEQE2nlzltN
         1W1uOQEKLNVqfFs7TzcD4CeqzLx0Jm9ZQDg0H7ZNeZGG4SAaVCWn/HloCHmLjdU+zklq
         lk7PkaySy1LaQEbLoh+tfy3BNdjxwQM/HylYUj7lsMoaFPHPy8Kl4/7vlTNmo1jvmFX0
         rN06lPt2V6u7T5xyueJ4Q9Vc5tzT7jngphYieiyYwNllAsGqc1VA8Qu3vBOSGXVZ+zF0
         t5KmWniGQItl+XSRIf7S4T1dfWwP36m8X2dK9NOY0PokYPh2cGXvHOd6XEzyLYAf2nQY
         HKrg==
X-Gm-Message-State: AOAM532hJHe4kjp9I96IDGUsUt5dkM6lvEUbjSyY5AnftupOzpluzOyk
	jyqORr8rYBJ+U/YbF4lY+n/zqfR6xP4XRQ==
X-Google-Smtp-Source: ABdhPJxPIFD43tnYdiZe+dYg7Wocn7mv9UaiKwZRnKYXXzzu2SLx7JpWeg3rmlV3T6K9G0TLKTPJJg==
X-Received: by 2002:a1c:23c8:: with SMTP id j191mr7907146wmj.64.1599740605201;
        Thu, 10 Sep 2020 05:23:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (2.f.a.6.5.4.b.4.5.7.2.f.a.5.0.6.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:605a:f275:4b45:6af2])
        by smtp.gmail.com with ESMTPSA id v17sm8810794wrr.60.2020.09.10.05.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 05:23:24 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>
Subject: [PATCH][warrior 19/22] maintainers: Add entry for buildtools-extended-tarball
Date: Thu, 10 Sep 2020 13:23:03 +0100
Message-Id: <20200910122306.2040194-19-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
References: <20200910122306.2040194-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(From OE-Core rev: 4281342a04078990bb0a110760ff2dc053eccc93)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 61d4d3d5a9f27e0fbf1d7ed6db818a779643b8f3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/maintainers.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 660a52ad870..4cb8c5c55a9 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -81,6 +81,7 @@ RECIPE_MAINTAINER_pn-build-appliance-image = "Richard Purdie <richard.purdie@lin
 RECIPE_MAINTAINER_pn-build-compare = "Paul Eggleton <paul.eggleton@linux.intel.com>"
 RECIPE_MAINTAINER_pn-build-sysroots = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-builder = "Richard Purdie <richard.purdie@linuxfoundation.org>"
+RECIPE_MAINTAINER_pn-buildtools-extended-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-buildtools-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-busybox = "Andrej Valek <andrej.valek@siemens.com>"
 RECIPE_MAINTAINER_pn-busybox-inittab = "Denys Dmytriyenko <denys@ti.com>"
-- 
2.25.1

