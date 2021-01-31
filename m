Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.17179.1612092344136671484
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 Jan 2021 03:25:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ExtYhhUG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f41.google.com with SMTP id dj23so15554418edb.13
        for <openembedded-core@lists.openembedded.org>; Sun, 31 Jan 2021 03:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VkSvFhtWuMhuPE2kpgF5o1wO3FFfBoZYYYUuRMT3ZU0=;
        b=ExtYhhUG+K0BPTosqKwuNzIyZIje5WS6+lDFkkc6GBFZdV8JXEbVmLFjNP8DSwNCLP
         w1+GssXEnwBIc+t0yqW35LgLg6QCc7LduUH/E4mykivBGCXBzpfDU1CruCi4cs9aOspf
         F7eBa46/uZHsS0EMibzzgb/nyOuIZ+OZ9FKcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VkSvFhtWuMhuPE2kpgF5o1wO3FFfBoZYYYUuRMT3ZU0=;
        b=XylvdLZYoxy4VDsfwIWEh9Sx/EWGqiXSs6jaiIRIPwLxBoxu8/H5yCZGmoeq1D2ytJ
         xWFaYRdPtDNBJS62bZw+alOASnMoHk6bj2DQY+9xusJ8FgBijns22p/tLL1zEGNV0D4g
         ZuVvLsJ7LauN2Wwl3pw4oHhu79Dz8JeoccZBcMDivOEkF7ygwP1hD9VfiUxuPwd/fIOk
         0kYD0UOccN2DuNVrI0LD3U7xdP5nDXOIQMbS71qp/7yEFDw5g27YKxVpUlIlQIoXa8i2
         9hci8fHXhpcI67cgQtNV8SsPXkau4IBI0cVAL4LzfvnHczaHRX0SL8OCvJNkxZ9RjQ2J
         r+VA==
X-Gm-Message-State: AOAM530hAyJJ2FgHS/PbzanNIWUFHewkqSf338e+ny2IjE+vDnO+o3zK
	GaMoKew6D33w7Z/LuTqbZ2rX2N/HsVEgAQ==
X-Google-Smtp-Source: ABdhPJwSAK3WyaaPB/ODVKeSf0+yZabkCBmXYkkCTb6ZjQQRtRP4HtwSKgtkCqIOzw0YKhbS3LhpfQ==
X-Received: by 2002:a50:ed97:: with SMTP id h23mr13547609edr.278.1612092342386;
        Sun, 31 Jan 2021 03:25:42 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:29f7:5a4e:c660:258e])
        by smtp.gmail.com with ESMTPSA id u21sm1554963ejj.120.2021.01.31.03.25.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 03:25:41 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3-setuptools: Add back accidentally dropped RDEPENDS
Date: Sun, 31 Jan 2021 11:25:41 +0000
Message-Id: <20210131112541.1441542-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was accidentally removed in a previous commit. Due to improvements
in the core, we can now just add it as a normal RDEPENDS along with the
others as the native case no longer causes issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python3-setuptools_51.0.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb b/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb
index db336bfa13b..dc09c13846d 100644
--- a/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_51.0.0.bb
@@ -28,6 +28,7 @@ RDEPENDS_${PN} = "\
   ${PYTHON_PN}-netserver \
   ${PYTHON_PN}-numbers \
   ${PYTHON_PN}-pickle \
+  ${PYTHON_PN}-pkg-resources \
   ${PYTHON_PN}-pkgutil \
   ${PYTHON_PN}-plistlib \
   ${PYTHON_PN}-shell \
-- 
2.27.0

