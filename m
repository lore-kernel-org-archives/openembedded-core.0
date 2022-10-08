Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D54D7C433FE
	for <webhook@archiver.kernel.org>; Sat,  8 Oct 2022 23:55:45 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web08.9230.1665273337125525887
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 16:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WqgSuK/M;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 78so7531722pgb.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Oct 2022 16:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90+XCVdW1ICaxmM+N87uGFABEl2JPetU4E70C/3QKs0=;
        b=WqgSuK/MYBVUKgFFVzRjlPhBi4fpDBc3QxGFPqqPQ8hbPa+mRRaMfFWLr+Wl9jIGdO
         dR893Nelaw3qmfEdhcYqPhRFUO3Zc8g90XNPT2twkBuDogCpG5b0CdVescg9VjPBx5GF
         Wt26Ic8IF+AAaZj0MDnF2U3V5KNZjHkOj5YoBKMl/sLGZZX86tNgoApre/ABRwtZ2Kjh
         r5IyWm+XwzwKYoGCX5Azfb8J5ZgEIQRuU1yfUdvx4ADogzxRyeTg/rQi5jwY+NF2SXwb
         KkdfPsTfgXNOI7TdfAMZpcl61jWmMexKYLGpa+PCvPnFN4l+/i9+tJZJ2dzRQ12D6z1b
         2zAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90+XCVdW1ICaxmM+N87uGFABEl2JPetU4E70C/3QKs0=;
        b=b9OOxGm2zYMvweyn0oTsVtfo11ONfzkfkTizI37qk500pJvWRhkJoBJ+FQzjh5IZa0
         LvhOac6ZBykef5h1u13ZOBzq1U6kgGrBeFmQR5obnAp5S6Uazrp2rQePUyRHAHPd0/Bo
         8AABpHyV6eyeLkEtGkckKuMYST9BVBTGoU/Gf3Zg8sG1+IxfcR6X/KWnWI6Uu30N5Jrd
         E5rVr45IK07+b/yHpJMoj3iLlt9egp6g8Vqp4E5EKi35LskYqqh23lF23DOZgK22E0Qd
         Tn6Dn1f1yV65sNz2b/BZJw8zQuR+Z0psUecOuhUK7eqBZ+E48qAz1AvED2f4S4wbOxnG
         Yb1Q==
X-Gm-Message-State: ACrzQf178zGFmxEyAxaPqGVPWDik/JZYGr0NncfP+z06ZHt1R7vGcbuC
	5FsFRS95dAmcVLrI6UbfWDFjy6TGxKk=
X-Google-Smtp-Source: 
 AMsMyM5T/RsDWViGKh7NvVRx7pdosvKhGyM6VY7vSNW+mMu3CZirPub+XULYixLJdSNbCXjX7GWHIg==
X-Received: by 2002:a63:5b05:0:b0:460:a6a:ec38 with SMTP id
 p5-20020a635b05000000b004600a6aec38mr4776158pgb.485.1665273336156;
        Sat, 08 Oct 2022 16:55:36 -0700 (PDT)
Received: from chiron.hsd1.or.comcast.net
 ([2601:1c0:ca00:cea0:170:23ea:e88e:bfb7])
        by smtp.gmail.com with ESMTPSA id
 k11-20020a170902ce0b00b0017f57787a4asm3814710plg.229.2022.10.08.16.55.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Oct 2022 16:55:35 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/10] python3-poetry-core: upgrade 1.0.8 -> 1.3.2
Date: Sat,  8 Oct 2022 16:54:54 -0700
Message-Id: 
 <98afeda3a93136bac5b097021f1a043939bbab17.1665270768.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1665270768.git.tim.orling@konsulko.com>
References: <cover.1665270768.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Oct 2022 23:55:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171548

For changes, see:
https://github.com/python-poetry/poetry-core/blob/main/CHANGELOG.md#132---2022-10-07

* Update license checksums to reflect current path and vendored
  components.
* Licenses remain Apache-2.0 & BSD-2-Clause & MIT

License-Update: Vendored licenses changed path; current components

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-poetry-core_1.0.8.bb       | 44 ------------------
 .../python/python3-poetry-core_1.3.2.bb       | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 44 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-poetry-core_1.0.8.bb
 create mode 100644 meta/recipes-devtools/python/python3-poetry-core_1.3.2.bb

diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.0.8.bb b/meta/recipes-devtools/python/python3-poetry-core_1.0.8.bb
deleted file mode 100644
index f3e9b055218..00000000000
--- a/meta/recipes-devtools/python/python3-poetry-core_1.0.8.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-SUMMARY = "Poetry PEP 517 Build Backend"
-DESCRIPTION = "Poetry PEP 517 Build Backend"
-HOMEPAGE = "https://github.com/python-poetry/poetry-core"
-BUGTRACKER = "https://github.com/python-poetry/poetry-core"
-CHANGELOG = "https://github.com/python-poetry/poetry-core/blob/master/CHANGELOG.md"
-
-LICENSE = "Apache-2.0 & BSD-2-Clause & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=104d5c3c653aeededf4076773aa4c236 \
-                    file://poetry/core/_vendor/attrs.LICENSE;md5=75bb9823a2778b5a2bd9b793fac93ea2 \
-                    file://poetry/core/_vendor/jsonschema/COPYING;md5=6554d3a51d7cb0b611891317f3c69057 \
-                    file://poetry/core/_vendor/jsonschema/LICENSE;md5=2ecb81765361195731a6f72a89e449fd \
-                    file://poetry/core/_vendor/lark-parser.LICENSE;md5=b37b83a9cf129d92ee65aaa71c01ce72 \
-                    file://poetry/core/_vendor/packaging/LICENSE;md5=7a6e56c9d54ecd731ab31c52de7942f0 \
-                    file://poetry/core/_vendor/packaging/LICENSE.APACHE;md5=29256199be2a609aac596980ffc11996 \
-                    file://poetry/core/_vendor/packaging/LICENSE.BSD;md5=f405810d173a1618433827928768bcd2 \
-                    file://poetry/core/_vendor/pyparsing.LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a \
-                    file://poetry/core/_vendor/pyrsistent/LICENSE.mit;md5=1211a1ac6eac40020d0f99c39b4e4270 \
-                    file://poetry/core/_vendor/six.LICENSE;md5=6a574656da93d9ef05431b45907e35b6 \
-                    file://poetry/core/_vendor/tomlkit/LICENSE;md5=be329e5ef9c9fe86738c9afe6ef3c11c \
-                    "
-
-SRC_URI[sha256sum] = "951fc7c1f8d710a94cb49019ee3742125039fc659675912ea614ac2aa405b118"
-
-inherit python_poetry_core pypi
-
-RDEPENDS:${PN}:append:class-target = "\
-    python3-compression \
-    python3-core \
-    python3-crypt \
-    python3-io \
-    python3-json \
-    python3-logging \
-    python3-netclient \
-    python3-pathlib2 \
-    python3-pprint \
-    python3-shell \
-"
-
-RDEPENDS:${PN} += "\
-    python3-pip \
-    python3-six \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-poetry-core_1.3.2.bb b/meta/recipes-devtools/python/python3-poetry-core_1.3.2.bb
new file mode 100644
index 00000000000..1b6c76323b0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-poetry-core_1.3.2.bb
@@ -0,0 +1,45 @@
+SUMMARY = "Poetry PEP 517 Build Backend"
+DESCRIPTION = "Poetry PEP 517 Build Backend"
+HOMEPAGE = "https://github.com/python-poetry/poetry-core"
+BUGTRACKER = "https://github.com/python-poetry/poetry-core"
+CHANGELOG = "https://github.com/python-poetry/poetry-core/blob/master/CHANGELOG.md"
+
+LICENSE = "Apache-2.0 & BSD-2-Clause & MIT"
+LIC_FILES_CHKSUM = "\
+    file://LICENSE;md5=78c39cfd009863ae44237a7ab1f9cedc \
+    file://src/poetry/core/_vendor/attr/_version_info.py;beginline=1;endline=1;md5=b2dccaa94b3629a08bfb4f983cad6f89 \
+    file://src/poetry/core/_vendor/attrs/LICENSE;md5=5e55731824cf9205cfabeab9a0600887 \
+    file://src/poetry/core/_vendor/jsonschema/COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
+    file://src/poetry/core/_vendor/lark/LICENSE;md5=b37b83a9cf129d92ee65aaa71c01ce72 \
+    file://src/poetry/core/_vendor/packaging/LICENSE;md5=faadaedca9251a90b205c9167578ce91 \
+    file://src/poetry/core/_vendor/packaging/LICENSE.APACHE;md5=2ee41112a44fe7014dce33e26468ba93 \
+    file://src/poetry/core/_vendor/packaging/LICENSE.BSD;md5=7bef9bf4a8e4263634d0597e7ba100b8 \
+    file://src/poetry/core/_vendor/pyparsing/LICENSE;md5=657a566233888513e1f07ba13e2f47f1 \
+    file://src/poetry/core/_vendor/pyrsistent/LICENSE.mit;md5=b695eb9c6e7a6fb1b1bc2d193c42776e \
+    file://src/poetry/core/_vendor/tomlkit/LICENSE;md5=31aac0dbc1babd278d5386dadb7f8e82 \
+    file://src/poetry/core/_vendor/typing_extensions.LICENSE;md5=64fc2b30b67d0a8423c250e0386ed72f \
+"
+
+SRC_URI[sha256sum] = "0ab006a40cb38d6a38b97264f6835da2f08a96912f2728ce668e9ac6a34f686f"
+
+inherit python_poetry_core pypi
+
+RDEPENDS:${PN}:append:class-target = "\
+    python3-compression \
+    python3-core \
+    python3-crypt \
+    python3-io \
+    python3-json \
+    python3-logging \
+    python3-netclient \
+    python3-pathlib2 \
+    python3-pprint \
+    python3-shell \
+"
+
+RDEPENDS:${PN} += "\
+    python3-pip \
+    python3-six \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


