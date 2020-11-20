Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web10.625.1605893276383962032
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:27:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=falG1Car;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id v12so8477830pfm.13
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 09:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dnkMuYBCGeAIJNklaplMvQqJKpCascOO7nnVPG26KoQ=;
        b=falG1Caryx5nSGg/BAAh/Hdup4i2FWy9WDQ+Wb31P+O5eZjVHKt3G3B93BCAzBe0ts
         cFUYX+oC2fjNRyIYxwHAUeTEmXz+dFf+DqKfoXBvgYocpIyZr3e0EejqaZUE9OTP1loi
         y4GEfGxkaKdyFHNJ29FZ3KPyU7apLDmJDX1V+VKsCPIEr+3qUWWfHz8L2QqD1Z5qxQ1b
         CRVfV3cbomyF9iah0PR01R/zQemJ4QRms+hlB2D630fCjRYd/VshY5r+rZVpXeDv7erm
         4rEfLjWXub6vTarZoyDp6s01U5Znf4RFqj/BDGA9K/kNxhkGAn1ufcEifTFQyN8f5yVC
         uS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dnkMuYBCGeAIJNklaplMvQqJKpCascOO7nnVPG26KoQ=;
        b=c1Ii+mJ1T20sXbJi5NY0Gx6toDCwV1KZbBnOAv9/DMDCZWMqUmuR7eztwqLz/8SDq/
         YY0Iw8zNhAqqKA28xhf3yOB9Lw1+GMpgV3kqhZ1GW+tqRygYBv8SSHcPtxxYcRTl3qNf
         MBhJHJWxaY2zJO4F400+50QRFGm93HL3PKbo8RL7NDLtLrdtPg9Tu39UunODqwQG29pg
         PkR/RyCKf56vfV2E2q8QKLkZN9Bvs/CFLqDqi7tHwD8VNY81Lioya/Pbmoou2f05kLCp
         QCtTerMDJqDWzA6CbZE5aF2+KqOTw8cF4cClpiQjj0fguOFBsc/Xmg9Bk/VLPtlTio8P
         /adA==
X-Gm-Message-State: AOAM533WSnME5zMAhsvIe0qOWF37aPejnQmFiy8RoBlXkx8WvUCz3S9y
	6Vl+qqwNL71+6/bUPioRUmC+MMhyuCidLw==
X-Google-Smtp-Source: ABdhPJwUVAUCnXKTduob5yyYLqGCQRWshUbkwdP3foNGT6ZMzHvzBbepyOMGCJcuKSw5JrUGgowZEw==
X-Received: by 2002:a65:6857:: with SMTP id q23mr14636728pgt.77.1605893275484;
        Fri, 20 Nov 2020 09:27:55 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id a23sm4398696pfl.29.2020.11.20.09.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 09:27:55 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 7/7] maintainers: Add myself for new pytest related recipes
Date: Fri, 20 Nov 2020 09:27:42 -0800
Message-Id: <20201120172742.1594854-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120172742.1594854-1-raj.khem@gmail.com>
References: <20201120172742.1594854-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 5349aa3971..def8098b06 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -591,6 +591,7 @@ RECIPE_MAINTAINER_pn-python3-pycryptodomex = "Joshua Watt <JPEWhacker@gmail.com>
 RECIPE_MAINTAINER_pn-python3-extras = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-git = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-gitdb = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-hypothesis = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-iniparse = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-jinja2 = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-python3-libarchive-c = "Joshua Watt <JPEWhacker@gmail.com>"
@@ -606,11 +607,13 @@ RECIPE_MAINTAINER_pn-python3-pyelftools = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-pygments = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-pygobject = "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-pyparsing = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-pytest = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-scons = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-scons-native = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-python3-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-six = "Zang Ruochen <zangrc.fnst@cn.fujitsu.com>"
 RECIPE_MAINTAINER_pn-python3-smmap = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
+RECIPE_MAINTAINER_pn-python3-sortedcontainers = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-python3-subunit = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-testtools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-qemu = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-- 
2.29.2

