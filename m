Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.918.1599081250381096605
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 14:14:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=l7bzD+JB;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id d26so753883ejr.1
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 14:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kl2fXwzR8wuK8GRtc0O4cHQJQgAbMIl23n95QeOgXG8=;
        b=l7bzD+JBHYOW4qk6zeYj/dOpcr9GAZpjS9J4XTM33Tx+8p+tbzn7+JwKgTaamwxSkc
         yqY2sJtqvPVMpgwF1t+Uy9hG0KRE28XXbJqjRyvgP2Lx1hg8P1gjJCdDnarvmh0qPlyo
         nBNG96XJS02UC0U1QcsphN4A8P5pjUjv57TkMI4qc4mhRa073V5WDB/v47D4XXoRkfaO
         f19PStRDox3qGlTGoh93sKBJoYG8bKdNlg14cGXYV1n4GpmlzGFYC1xQ+GfUYrsHaXi5
         EjQxVRt89jTbp7PPFnC6iDHuOiuC/r+Xi0XbKFO//YyC4ZWswv6hYyvns6T3PcB3VYA3
         3x8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kl2fXwzR8wuK8GRtc0O4cHQJQgAbMIl23n95QeOgXG8=;
        b=TTr6KuPLc6zG3DQB6UoYL12sYV1vm8igOzJ5XKqd5isQnCYah8fKnSXqv5D3wn1Wi4
         zH9Sa+kWIzekcocCnyJiLJau4oZT8BdfOCd3cTMw2lf6yCFbkJSbL1mjl3/KjRz84lY/
         j0It+AorwN4NcZQkFUIZ4OfUQK+NZ7yoDJmhOEDiu9SM+NtFLM7WCz+A2jQn9sDYqURU
         22ydDN31fw94YMb7WOp+xsqTz8ZYgHmG1RbNDE8OlTZk36vBGYMz+dnD/nOKQKPy7oSf
         uJ20dSigC5yLElRUbuWlFq9tZVVmGhY5MrC+4hQpzlOV8qk9US9iyWYi+18BF31W0v2T
         O9FA==
X-Gm-Message-State: AOAM530xphIbzOueHnRbCPPW5SCxi2aNxsvx0J90t7vOAiUZQOxt03nO
	yeVUK3zY1sqcTFRfWhcDQ6/MX/AuxQ4=
X-Google-Smtp-Source: ABdhPJzw417vRZmWaPEsRSycDQ3giAQi8VtBdbmGKxEDhKtca4McgbO0Qw9X4WMonsadnDug4q5EwA==
X-Received: by 2002:a17:906:b0c2:: with SMTP id bk2mr85864ejb.20.1599081248645;
        Wed, 02 Sep 2020 14:14:08 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id ch29sm631607edb.74.2020.09.02.14.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 14:14:08 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 14/23] re2c: upgrade 2.0.2 -> 2.0.3
Date: Wed,  2 Sep 2020 23:13:21 +0200
Message-Id: <20200902211330.4853-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902211330.4853-1-alex.kanavin@gmail.com>
References: <20200902211330.4853-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/re2c/{re2c_2.0.2.bb => re2c_2.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_2.0.2.bb => re2c_2.0.3.bb} (84%)

diff --git a/meta/recipes-support/re2c/re2c_2.0.2.bb b/meta/recipes-support/re2c/re2c_2.0.3.bb
similarity index 84%
rename from meta/recipes-support/re2c/re2c_2.0.2.bb
rename to meta/recipes-support/re2c/re2c_2.0.3.bb
index db26b02b84..a0b521ce56 100644
--- a/meta/recipes-support/re2c/re2c_2.0.2.bb
+++ b/meta/recipes-support/re2c/re2c_2.0.3.bb
@@ -6,7 +6,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "https://github.com/skvadrik/re2c/releases/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6cddbb558dbfd697a729cb4fd3f095524480283b89911ca5221835d8a67ae5e0"
+SRC_URI[sha256sum] = "b2bc1eb8aaaa21ff2fcd26507b7e6e72c5e3d887e58aa515c2155fb17d744278"
 UPSTREAM_CHECK_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.28.0

