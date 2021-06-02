Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.13088.1622640443611010187
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 06:27:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KqWJil+8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id f17so1297208wmf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jun 2021 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xBx2hwanB8kpaVQgjfh1ms8CiMukoh7jF+2OtQmZHXE=;
        b=KqWJil+8yHIPMwQV8lRdrmx9Mi6HJCfbtvb6cMcqWSgaACzJkCqHBLt+qUoKYBd6QD
         r+Mbz39Tp4llCSBRe/rie/yMi7ZZwAgczH2WpYBVI9kumUfJHNdVJYuD4kTiFzLUyHXZ
         bRbYv22Py7uMR952Go4BhNMG6tQ6s06rbqOcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xBx2hwanB8kpaVQgjfh1ms8CiMukoh7jF+2OtQmZHXE=;
        b=cFal0DeT4ByryGo+zFC81ysMeK84aMfaRd2sw17SwLzDS/YGp6igVLDrMBBTE6w1ea
         MrqlSiS5ne6e2oZX39JrZz8MjB2dyqoO2neVZ4f+0muDW/QqnLRL5zn1wi2o4yfVCXFk
         9sXNrF2CtuGnKJn75cHlFVCCnWAqmTANkZmQptDTIluMkkEP0Ue1iQWjfGAo42+Ojnvh
         eNBa7VI2aR/Qb6k+d8pEtWePMZAlheHpGJg92okmsS7P64wvGnoUzx2kP/oKq6/4wiWx
         xvXagdox4TbllJYhfHxMrNWxuRwKRngk9B7kkE4y9rjkNJzobjvc0EGGQerqkk34hbk6
         rBsg==
X-Gm-Message-State: AOAM533uiJisgWQ7Nq3vqUTH4UdmdvjCAqttJXgDH7l6nsu8AGFY4Lna
	wFRh1he4bOvSbIYPanzOg6cNWjWY9hfj+g==
X-Google-Smtp-Source: ABdhPJygCo8/j9KP7MsVNsdL5BkpyHBwv0pAPqT4fvLmCXCJUoYBTHhLI0Kpwz6TXYLlkXb2L5+2vQ==
X-Received: by 2002:a7b:cb4a:: with SMTP id v10mr19753974wmj.158.1622640441899;
        Wed, 02 Jun 2021 06:27:21 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:743:408f:2993:133e])
        by smtp.gmail.com with ESMTPSA id i16sm2799498wmm.9.2021.06.02.06.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 06:27:21 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Nikolay Papenkov <n.papenkov@inango-systems.com>,
	Dmitry Kisil <d.kisil@inango-systems.com>
Subject: [hardknott] [PATCH 2/5] flex: correct license information
Date: Wed,  2 Jun 2021 14:27:17 +0100
Message-Id: <20210602132720.2921099-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210602132720.2921099-1-richard.purdie@linuxfoundation.org>
References: <20210602132720.2921099-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nikolay Papenkov <n.papenkov@inango-systems.com>

License-Update: Corrected license information

flex package is under two licenses:
- "BSD-3-Clause" is provided in top-level COPYING file; the license
  actually include third obligation (without the actual "3" numbering)
- "LGPL-2.0+" is explained by src/gettext.h

Signed-off-by: Dmitry Kisil <d.kisil@inango-systems.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/flex/flex_2.6.4.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/flex/flex_2.6.4.bb b/meta/recipes-devtools/flex/flex_2.6.4.bb
index 1d43d2228ac..54e7e01729d 100644
--- a/meta/recipes-devtools/flex/flex_2.6.4.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.4.bb
@@ -3,12 +3,14 @@ DESCRIPTION = "Flex is a fast lexical analyser generator.  Flex is a tool for ge
 lexical patterns in text."
 HOMEPAGE = "http://sourceforge.net/projects/flex/"
 SECTION = "devel"
-LICENSE = "BSD-2-Clause"
+LICENSE = "BSD-3-Clause & LGPL-2.0+"
+LICENSE_${PN}-libfl = "BSD-3-Clause"
 
 DEPENDS = "${@bb.utils.contains('PTEST_ENABLED', '1', 'bison-native flex-native', '', d)}"
 BBCLASSEXTEND = "native nativesdk"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e4742cf92e89040b39486a6219b68067 \
+                    file://src/gettext.h;beginline=1;endline=17;md5=9c05dda2f58d89b850c399cf22e1a00c"
 
 SRC_URI = "https://github.com/westes/flex/releases/download/v${PV}/flex-${PV}.tar.gz \
            file://run-ptest \
-- 
2.30.2

