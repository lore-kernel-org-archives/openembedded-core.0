Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web09.1226.1604335811558691747
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:50:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=up1akC0I;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id ay21so1655543edb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 08:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QhCPMvKuvgpFw/r2yEeB/9QzYm/ARUhtlIX++Erjm2U=;
        b=up1akC0IrwissYS8Qqw9PbMShsbSqMBD6uZbDuCoPg5dtTINSxpBOvEoqzZJ4gRtYX
         cD1Refw9oTUPAk7U0l3xyjLzSDPc6PTDvQpYU8+mISwXsNgSTTZ4kFSntPd2nM35EIj0
         zz5sf0hCgJ8HGchtg6VtRRQLB7k4mw4VH7IFBglzHwERjt0MJZW/5mD8DkhWB2kW/Ieu
         87jA0multL5qYiiI6+NVn1E2QjpxORWloEVlm/q08O/+HicYLa0LLZ1Zibi+Eiudd8yf
         3HgrO13tqybNrGjvjeSuwwDbCoLVlLODq1FMDOqWSEWtcpg3DKvC6uxavkskqX/it8Oy
         i4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QhCPMvKuvgpFw/r2yEeB/9QzYm/ARUhtlIX++Erjm2U=;
        b=ECsGzVUwkvHa8XYiwGdkfEKz1h3y9BPENKLkA3V8RKoluDYMnoBOcjt+cKrLnlkn2H
         hx6/gzedAumin66/rN8uDRji0P/qB6unzv6PPPseBxDeJ3h6Zmb7PebAsCdnBTqtoUbK
         5aVKi7bJUoSxtjSiyKjwIWVa/B34nxjkUcGFKR+zg9wxNtwF3VtXRJGrvW26pOKyPyG5
         H8Bh3tjigXgz1RQ5A2EotMTiSiWQIOcojatCP12indOPd5X1sF0iKPDTlRa1RSdSWvgy
         qCvFQbUiyvchFt5fslqPFz8grbJ9HGxzjXjA7Fg4ZazoPORwLnciL9WKs7nOg8HbxZuG
         eJBA==
X-Gm-Message-State: AOAM531jlz56DPGYgnuQ/BSZNt2cdie+eB36AAYEeeo7JtvjieFReHtB
	nxpRZNiK/6wXdZyo7Gz8zmaEUfg6IEPV5A==
X-Google-Smtp-Source: ABdhPJzcRxzwOx3FZxKijI1hVC7mTrleTH5+AZ7N8fNGU+KDN9e8AAjbxKuG58fLbGYClJjMqiKHRQ==
X-Received: by 2002:a05:6402:16d5:: with SMTP id r21mr7692437edx.358.1604335809950;
        Mon, 02 Nov 2020 08:50:09 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id us11sm9864781ejb.91.2020.11.02.08.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 08:50:09 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 59/80] python3-setuptools: upgrade 49.6.0 -> 50.3.2
Date: Mon,  2 Nov 2020 17:48:46 +0100
Message-Id: <20201102164907.27572-59-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201102164907.27572-1-alex.kanavin@gmail.com>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-conditionally-do-not-fetch-code-by-easy_install.patch | 8 ++++----
 ...-setuptools_49.6.0.bb => python3-setuptools_50.3.2.bb} | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools_49.6.0.bb => python3-setuptools_50.3.2.bb} (95%)

diff --git a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
index ee0a9dbb13..99c50e94cb 100644
--- a/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
+++ b/meta/recipes-devtools/python/files/0001-conditionally-do-not-fetch-code-by-easy_install.patch
@@ -1,4 +1,4 @@
-From 6a5086619ee1c4bcebc7df622face11de6679255 Mon Sep 17 00:00:00 2001
+From d2633b49275b20e7acf724567fe0189aab25771e Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Tue, 17 Jul 2018 10:13:38 +0800
 Subject: [PATCH] conditionally do not fetch code by easy_install
@@ -15,11 +15,11 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 5 insertions(+)
 
 diff --git a/setuptools/command/easy_install.py b/setuptools/command/easy_install.py
-index bcbd4f5..6455afd 100644
+index 9ec83b7..7e97a07 100644
 --- a/setuptools/command/easy_install.py
 +++ b/setuptools/command/easy_install.py
-@@ -653,6 +653,11 @@ class easy_install(Command):
-             os.path.exists(tmpdir) and rmtree(rmtree_safe(tmpdir))
+@@ -636,6 +636,11 @@ class easy_install(Command):
+             os.path.exists(tmpdir) and rmtree(tmpdir)
  
      def easy_install(self, spec, deps=False):
 +        if os.environ.get('NO_FETCH_BUILD', None):
diff --git a/meta/recipes-devtools/python/python3-setuptools_49.6.0.bb b/meta/recipes-devtools/python/python3-setuptools_50.3.2.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-setuptools_49.6.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_50.3.2.bb
index 360128b116..4480d56775 100644
--- a/meta/recipes-devtools/python/python3-setuptools_49.6.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_50.3.2.bb
@@ -12,7 +12,7 @@ SRC_URI_append_class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "46bd862894ed22c2edff033c758c2dc026324788d758e96788e8f7c11f4e9707"
+SRC_URI[sha256sum] = "ed0519d27a243843b05d82a5e9d01b0b083d9934eaa3d02779a23da18077bd3c"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.29.0

