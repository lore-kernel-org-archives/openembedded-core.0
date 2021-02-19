Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web12.1398.1613766716190904283
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Feb 2021 12:31:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20150623.gappssmtp.com header.s=20150623 header.b=TuJNWwWF;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.208.193, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f193.google.com with SMTP id u4so27576700ljh.6
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Feb 2021 12:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w3uhqhqsLFFTgO6bv5pQaLlYeShxSVElM5h46jD2QGg=;
        b=TuJNWwWFGKerF+e+W4rtqV4AuQalt88C6vAoHPa4ZM97umlnFumj6njonWBYjdW5rD
         /D076YPgKesIZrzJaYwHeKQb5cds+2EpsZLI2L4F2pBsQHn2lA4WInT9QiF7P5Y/OdUC
         O+boD6T1cAI5iN82q0mky9eTGUhVB1e5Vp3/k96AYHEB2RWh7WnUxPEikulkgNnIz6I8
         OkUqf6JpeyG3Ed4EtyqWVxvdS02evSdfcIF8prfXNOOgnQhOFeTIoy3qphSJxavz7DQt
         w1QSsvTquSSmfT3XpxmEpHlej565fSMl82FqI8wJKGjulJYstM/vayA5+wzje1tiXGQM
         FUrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w3uhqhqsLFFTgO6bv5pQaLlYeShxSVElM5h46jD2QGg=;
        b=i59wM1J4Owfyuzbj3GJNdvFkQRTQSaWJgVAbAN8xnk/CvRcJhg9Ga3H46/YKWmyWd1
         w8q9XuoDA6RHQ409KH6c51l7D/WXi9GITKqE8uSr2A7t/vANerupfJSqIdP1UcOVCZ4+
         56S4GuFppxL65MW8zqtvTEM78B/x62CFWEs2G7uhZGzMWlmB4zIuDOUQrYCk1HxVPCAC
         eRJHMJmgyqsPrtTOyMi4AiF096smPn1JxfZiTJHaxIUafEdv5zGPFOpNWKMDzoV1StSi
         YzmubevzRBe/kfndsqjHynar2lownX9cgEhiPumnFuhnocBCUv2K28Sq44vsqxqACzD7
         pZmg==
X-Gm-Message-State: AOAM5324j/QGfwT7y04vNrX1fvzsfTmq3dPCkokKTYAqzfvWGnEHDqNv
	C5qqe2yYMhlYn3oLfdDexEVdIfeRKR+fVEFi
X-Google-Smtp-Source: ABdhPJxTD35c4cWJCWXgU57jbHWnSJl8wGJQR/e9Y4QUgx2imkc1iYT53JqoM9JZoGeKuSJwlHsRDg==
X-Received: by 2002:a2e:8e39:: with SMTP id r25mr1037903ljk.121.1613766713756;
        Fri, 19 Feb 2021 12:31:53 -0800 (PST)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c213-89-0-115.bredband.comhem.se. [213.89.0.115])
        by smtp.gmail.com with ESMTPSA id t14sm1078560ljc.70.2021.02.19.12.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Feb 2021 12:31:46 -0800 (PST)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] ell: update to 0.38
Date: Fri, 19 Feb 2021 21:31:39 +0100
Message-Id: <20210219203139.2128179-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changelog:
- Fix issue with DHCP v6 Rapid Commit option check.
- Fix issue with handling RFC8018/RFC1423 padding.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/recipes-core/ell/{ell_0.37.bb => ell_0.38.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.37.bb => ell_0.38.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.37.bb b/meta/recipes-core/ell/ell_0.38.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.37.bb
rename to meta/recipes-core/ell/ell_0.38.bb
index e442b02198..11a80e16ed 100644
--- a/meta/recipes-core/ell/ell_0.37.bb
+++ b/meta/recipes-core/ell/ell_0.38.bb
@@ -16,7 +16,7 @@ inherit autotools pkgconfig
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-pem.c-do-not-use-rawmemchr.patch \
            "
-SRC_URI[sha256sum] = "30027a2043bbe2faca7849946bb2ed7d5e48c1b9d2638bfa8f5fdef3093c4784"
+SRC_URI[sha256sum] = "c1b7ae5676eec310f08757b3d8652b8e818776be1897fb5deb59e55f02a012a7"
 
 do_configure_prepend () {
     mkdir -p ${S}/build-aux
-- 
2.25.1

