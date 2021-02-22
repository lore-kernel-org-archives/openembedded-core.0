Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.34444.1613997401335839510
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 04:36:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y3mblfXE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id a207so14196609wmd.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 04:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=FhcrOCku0jL0gl6tCYVTmAdWEde3J+BPB4VJqBUMh8o=;
        b=Y3mblfXEC4BQtaBcYdYTkEsRw8G6Tign95ijnq/HmniqlqOKOho6kOcze0lH28MGJ8
         rXdjA9zV0heugni9V98Xpt2Eouphjl6NnXXzsdhDQnoILZ2QXrHOGrJUWF3ViHjZ9q0R
         zVYKky9IS5pPSfhZMiulVJBcy6G2afnn2yz4A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FhcrOCku0jL0gl6tCYVTmAdWEde3J+BPB4VJqBUMh8o=;
        b=ZrJgtLm2N7AxpGvQIxiybD0wic9LKXtft+QZF24rPtLfKSbkQqcgJnnKUeLJPxDSDU
         nZsKJY/+yRXmeDk1LIF2MkNYZbRFlsLxG5wmST8ynJBlZhZ2/4+kLAFsSWtc+mp/R1/M
         /JFCTNaSOeE/u2y0bqcC777Q5JSqxdcL9z7NYts0Bujs334tglk9JAfVEriG2oChh9VK
         svFF6InC0Bi8YE02GQC1RTB8muncFllzHkeHpyqUgji0VjMvJh2fTno4jM77z4m+e1Tq
         bPRmblEFnVM7PZht42qV4uyCzBrcnyFxPQiqLqu9P3WSwLhuLxYPspZ1wViSu4CwdmFa
         YNcg==
X-Gm-Message-State: AOAM533roJT70tPVjHTEcv9eQnNTCvUwH1XXPPgGmEMlkXS3x4Zqd5jJ
	czqv4cyokxZcy0at9GSy1ZGP8pTG7l8f5w==
X-Google-Smtp-Source: ABdhPJzOJxB212rbKR1G7cgtkY2dGs9OR+Z57gqiov/Z3pqp7K3MznLZOoxf6YzZbpHHBterQdcZuA==
X-Received: by 2002:a05:600c:3550:: with SMTP id i16mr18918211wmq.170.1613997399770;
        Mon, 22 Feb 2021 04:36:39 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:6747:849:8224:46bc])
        by smtp.gmail.com with ESMTPSA id c12sm17432526wru.71.2021.02.22.04.36.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 04:36:39 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] python3-pycryptodome/pycryptodomex: upgrade 3.9.9 -> 3.10.1
Date: Mon, 22 Feb 2021 12:36:35 +0000
Message-Id: <20210222123638.3754068-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210222123638.3754068-1-richard.purdie@linuxfoundation.org>
References: <20210222123638.3754068-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The license file dropped the APL-2 pieces but this wasn't in LICENSE
in the first place, no code seemed to refer to it so no change was
needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python-pycryptodome.inc         | 2 +-
 meta/recipes-devtools/python/python3-pycryptodome_3.10.1.bb  | 5 +++++
 meta/recipes-devtools/python/python3-pycryptodome_3.9.9.bb   | 5 -----
 ...ycryptodomex_3.9.9.bb => python3-pycryptodomex_3.10.1.bb} | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.10.1.bb
 delete mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.9.9.bb
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.9.9.bb => python3-pycryptodomex_3.10.1.bb} (69%)

diff --git a/meta/recipes-devtools/python/python-pycryptodome.inc b/meta/recipes-devtools/python/python-pycryptodome.inc
index 68b084eb04f..48481bcf9a9 100644
--- a/meta/recipes-devtools/python/python-pycryptodome.inc
+++ b/meta/recipes-devtools/python/python-pycryptodome.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "PyCryptodome is a self-contained Python package of low-level\
  cryptographic primitives."
 HOMEPAGE = "http://www.pycryptodome.org"
 LICENSE = "PD & BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=6dc0e2a13d2f25d6f123c434b761faba"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=accfa6aeaceb3ba96676edf18e78302c"
 
 inherit pypi
 
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.10.1.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.10.1.bb
new file mode 100644
index 00000000000..28448b84fe7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.10.1.bb
@@ -0,0 +1,5 @@
+require python-pycryptodome.inc
+inherit setuptools3
+
+SRC_URI[sha256sum] = "3e2e3a06580c5f190df843cdb90ea28d61099cf4924334d5297a995de68e4673"
+
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.9.9.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.9.9.bb
deleted file mode 100644
index 1e84ce4df74..00000000000
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.9.9.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-pycryptodome.inc
-inherit setuptools3
-
-SRC_URI[sha256sum] = "910e202a557e1131b1c1b3f17a63914d57aac55cf9fb9b51644962841c3995c4"
-
diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.9.9.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.10.1.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.9.9.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.10.1.bb
index abff71efdd2..a6b3b3e935d 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.9.9.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.10.1.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "7b5b7c5896f8172ea0beb283f7f9428e0ab88ec248ce0a5b8c98d73e26267d51"
+SRC_URI[sha256sum] = "541cd3e3e252fb19a7b48f420b798b53483302b7fe4d9954c947605d0a263d62"
 
 FILES_${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.27.0

