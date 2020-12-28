Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web09.2420.1609185895865210121
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 12:04:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RzHdrpgH;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id g24so10736181edw.9
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 12:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uuo5Z2PSyhUw2Q+QRYYE/gePFVor/xEgn9mLdDsJ/cA=;
        b=RzHdrpgHrHj4hPwFpwzqfAMr89W7Hwt0wCQdMvWR8mouw6NNJkKucqSNCrpFWfde5V
         n0/Lc/hgqBFRFB7Q0P4+yRZEzN3Pn4Gc26v+VrABv9z+TPahfafZwozDb/kdncpKJmPm
         GC1klJjHLTHlD24HebnhlGw9NleMeZKtL20uMU0Miu9ttSxbZdPbOIIKI11KBEQ29Ks6
         L3Bzj0MZ7zX+3Ja74GGo5WHNqHRwlwnHG4Yq7KsbHDlCZtKoB2wKq6fTISZrBWIMpuaJ
         vfanSjcfSTMs8Ms1cOC8eXk4X9Zm5T5HE0mYO3o8XUSzGuXKbn4HrAXqVbf6I5mxLVD8
         GGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uuo5Z2PSyhUw2Q+QRYYE/gePFVor/xEgn9mLdDsJ/cA=;
        b=NodcW3qveZZXhEYkmpKDY8M43W+q1ZXnRyBlP3GbzXT4c7nqIVXpEBoM2wXtGAqPIL
         yTrrANCfyP0UKy7sK69ugDrKEeQpKUTSOf7jI8alFRaQqvRQdSBrwRNVE085XL0jcirn
         nqmyjU4k1tEDGFjelKUU1pC6XgIBoieR+YbTllRq9++cp7l4Si/QMUxZTyk3ciVESQVG
         eT0ej6lZr11riBTOxT64DKhLVCIlUuNzc0hM679FOsAjyalPkjhkoW3itMjc5538YECw
         /JIbKYMuBy0zcPcFV+MjdIQnP6Sti1tjkZhK7JGP3ZPNv234PsQ3qwXl4y+N1BT96FgD
         Jglw==
X-Gm-Message-State: AOAM5337uM7mnXHapZVfsxVby/1M0kUHMOzvdoT05aP/c4Cw+hz4OWQl
	BJju8XrHWo5KnuteRi/A683TMdua7ek=
X-Google-Smtp-Source: ABdhPJyZ7W7pdJgCtkFB7atZ+1GLpKarHTPl1n7fWCZCcHNAw1OVhZ4fSkGxM79hrIuxOHjanQME/A==
X-Received: by 2002:a05:6402:1692:: with SMTP id a18mr42476293edv.321.1609185894516;
        Mon, 28 Dec 2020 12:04:54 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id a10sm17447476ejk.92.2020.12.28.12.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:04:54 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 15/22] python3-pytest: update 6.1.2 -> 6.2.1
Date: Mon, 28 Dec 2020 21:04:29 +0100
Message-Id: <20201228200436.78130-15-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228200436.78130-1-alex.kanavin@gmail.com>
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-the-setup_requires-for-setuptools-scm.patch | 17 +++++++----------
 ...-pytest_6.1.2.bb => python3-pytest_6.2.1.bb} |  2 +-
 2 files changed, 8 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/python/{python3-pytest_6.1.2.bb => python3-pytest_6.2.1.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch b/meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
index 8c5c17247e..1abd531c62 100644
--- a/meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
+++ b/meta/recipes-devtools/python/python3-pytest/0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
@@ -1,8 +1,7 @@
-From ff784f4803ab33f5e3389e40d038d52d1e211843 Mon Sep 17 00:00:00 2001
+From ead04f2da75efeca3369feff6161ea4a8baecbc9 Mon Sep 17 00:00:00 2001
 From: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
 Date: Wed, 28 Aug 2019 16:12:27 +0900
-Subject: [PATCH] [PATCH] setup.py: remove the setup_requires for
- setuptools-scm
+Subject: [PATCH] setup.py: remove the setup_requires for setuptools-scm
 
 The setup_requires argument forces the download of the egg file for setuptools-scm
 during the do_compile phase.  This download is incompatible with the typical fetch
@@ -18,22 +17,20 @@ Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
 Rebase for pytest 6.1.0.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
 ---
  setup.cfg | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/setup.cfg b/setup.cfg
-index 60f6564..c4d1471 100644
+index 6ed0792..0137090 100644
 --- a/setup.cfg
 +++ b/setup.cfg
-@@ -55,7 +55,6 @@ package_dir =
+@@ -53,7 +53,6 @@ package_dir =
  	=src
  setup_requires = 
- 	setuptools>=40.0
--	setuptools-scm
+ 	setuptools>=>=42.0
+-	setuptools-scm>=3.4
  zip_safe = no
  
  [options.entry_points]
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/python/python3-pytest_6.1.2.bb b/meta/recipes-devtools/python/python3-pytest_6.2.1.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-pytest_6.1.2.bb
rename to meta/recipes-devtools/python/python3-pytest_6.2.1.bb
index 6fc3b6f328..6843b4da25 100644
--- a/meta/recipes-devtools/python/python3-pytest_6.1.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest_6.2.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=81eb9f71d006c6b268cf4388e3c98f7b"
 
 SRC_URI_append = " file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch "
 
-SRC_URI[sha256sum] = "c0a7e94a8cdbc5422a51ccdad8e6f1024795939cc89159a0ae7f0b316ad3823e"
+SRC_URI[sha256sum] = "66e419b1899bc27346cb2c993e12c5e5e8daba9073c1fbce33b9807abc95c306"
 
 inherit update-alternatives pypi setuptools3
 
-- 
2.29.2

