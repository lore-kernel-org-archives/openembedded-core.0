Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 846E4C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 13:07:15 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.66649.1638882434110946552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Hck5599x;
 spf=pass (domain: gmail.com, ip: 209.85.221.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id i5so29395871wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=66MI2a4Ng22U9CSDWI/jwu+W3+7mhSK3yjl6MLwtJhw=;
        b=Hck5599xu8op6nvHttr1CybqogL8xy5jXPlRqNf1ES2t2ny0xSg4VwWPpMZNYBSL9P
         j5fU91DD0ceIGSRKRm0utwUDsnuNcUbcBFXQ2ui9uyiOK7f3RLpfsEPJqTkD87TIEr93
         2YwYPLZhgd0KnbKQvoiGoIrWZIDeq0jHq2dauw4RqFwEHBG4HwLIW1wsWVpuvSsDOAes
         ZA5Bla2/WM8L3ZFGsGe+Y57ET/G895g53bJY5PUMhNpKtvqbOZyWHkTVZk4YJRz6kVBO
         CAqf21Y4xIP0h9KoZqlJW5BnNq1mZS3OwxrT2oOc7eOOTkQoW4ObZOaAySkyXmgfIQKf
         fCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=66MI2a4Ng22U9CSDWI/jwu+W3+7mhSK3yjl6MLwtJhw=;
        b=Rnc1HP5EWnG0cp4pO9Reyk1eqWZ2WHb43cRDmwECu5rMI98SUhubMZSerkce2ekpeX
         zIgD/su3h4Corh2njZCw/zRWiQs0meyqilWbjpV1iwTzUWMl7RxekueBL3gSDJtcwwIA
         yzbg3ZNXaUeHQPgMJIpIfDySoOiegO3VjV+Zz1guug/c1Hv4JINfyX83CI4kswNVY1Pj
         rhbqbKAqWrPd8+1fmbO8zHQ76kjjVVVF63iYACn8ttF8tAh3W2P+T+oMptifjYQKNXY/
         MSm/s9MGB9yGSM1HejpOzDpXnEdRdGh5q5t3G7hN3uFuLEgMVMaFPDE3FYa8n3MWBwMI
         sGnw==
X-Gm-Message-State: AOAM533prgD73H5UmwITUz+I3IyHI5Qjhj+k4o/nRgR65fGbOk7Ar8Av
	QvoyOuTyEGKTqE54clsUdO4MDkcLeaD3MA==
X-Google-Smtp-Source: 
 ABdhPJwbICdMokwRpZEO4jzALV9+Gk1HabMRdnIfDGtF0bwtNFaR56RBb+P3im1iSoOP6BlRq0H4OA==
X-Received: by 2002:a5d:6dab:: with SMTP id u11mr50567276wrs.46.1638882432417;
        Tue, 07 Dec 2021 05:07:12 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n4sm16592468wri.41.2021.12.07.05.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 05:07:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/16] python3-pycryptodome: update to 3.12.0
Date: Tue,  7 Dec 2021 14:06:53 +0100
Message-Id: <20211207130703.3196805-6-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211207130703.3196805-1-alex@linutronix.de>
References: <20211207130703.3196805-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 13:07:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159292

License-Update: dropped a patents clarification
Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/python/python-pycryptodome.inc         | 4 +++-
 meta/recipes-devtools/python/python3-pycryptodome_3.11.0.bb  | 5 -----
 meta/recipes-devtools/python/python3-pycryptodome_3.12.0.bb  | 5 +++++
 ...cryptodomex_3.11.0.bb => python3-pycryptodomex_3.12.0.bb} | 2 +-
 4 files changed, 9 insertions(+), 7 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.11.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.12.0.bb
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.11.0.bb => python3-pycryptodomex_3.12.0.bb} (69%)

diff --git a/meta/recipes-devtools/python/python-pycryptodome.inc b/meta/recipes-devtools/python/python-pycryptodome.inc
index 3f4c6e9fca..071af557ea 100644
--- a/meta/recipes-devtools/python/python-pycryptodome.inc
+++ b/meta/recipes-devtools/python/python-pycryptodome.inc
@@ -3,10 +3,12 @@ DESCRIPTION = "PyCryptodome is a self-contained Python package of low-level\
  cryptographic primitives."
 HOMEPAGE = "http://www.pycryptodome.org"
 LICENSE = "PD & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=accfa6aeaceb3ba96676edf18e78302c"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=29242a70410a4eeff488a28164e7ab93"
 
 inherit pypi
 
+PYPI_PACKAGE_EXT = "zip"
+
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-io \
     ${PYTHON_PN}-math \
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.11.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.11.0.bb
deleted file mode 100644
index b0e37178e0..0000000000
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.11.0.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-pycryptodome.inc
-inherit setuptools3
-
-SRC_URI[sha256sum] = "428096bbf7a77e207f418dfd4d7c284df8ade81d2dc80f010e92753a3e406ad0"
-
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.12.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.12.0.bb
new file mode 100644
index 0000000000..a732441a7a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.12.0.bb
@@ -0,0 +1,5 @@
+require python-pycryptodome.inc
+inherit setuptools3
+
+SRC_URI[sha256sum] = "12c7343aec5a3b3df5c47265281b12b611f26ec9367b6129199d67da54b768c1"
+
diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.11.0.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.12.0.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.11.0.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.12.0.bb
index f1132c21ac..5f88419ce4 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.11.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.12.0.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "0398366656bb55ebdb1d1d493a7175fc48ade449283086db254ac44c7d318d6d"
+SRC_URI[sha256sum] = "922e9dac0166e4617e5c7980d2cff6912a6eb5cb5c13e7ece222438650bd7f66"
 
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.20.1


