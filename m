Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web08.4021.1619143683229530690
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 19:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WBRrvbDE;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id j14-20020a17090a694eb0290152d92c205dso412221pjm.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 19:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6HcxeEkkwXC2WaUKmctSBImFaURPzwhQ+BbBA3UwVs4=;
        b=WBRrvbDE6kMOW68WnarLUU5S7yQbAmt8sQ7VdXzmC6fG37OQYEOQX9cx6XgFbNHMq5
         RNWYeQcoEv6zZMCxUTSshI/GJzc6dEmfkPKTLyqC9tGeloJDoGXorVB3dGmahhMyYKtV
         9xycQXGSzWTj9jHBFAM8mUebF8iwFKgquq0XKACXVPXWjBDaJh6TPel0mTFi1a9SAfE7
         fUMySYjqK90JOq/jOw8ARuE4WqHjCPJ17zTYvRTDOYu+aBeE+XewJBer8WCQy4h2D6Xd
         uTGHZ6ZI38CE+mEg634gt+3zJDdDdo9DJZCjShKiu8hwF37Y6WNa8ebkdKdJKFUr/Jp3
         bMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6HcxeEkkwXC2WaUKmctSBImFaURPzwhQ+BbBA3UwVs4=;
        b=oM8YzTGMt9bo4u5O8tH3zkj/oowg5ilwRWBe4i0RChPiu9UCJ92PoNrBecjO+eSdl7
         VxFBI1/fy0gnBQKlAwHSAGzQX8NT9EEoxqqu3hPh+3PK1sVRW1isB6O/6O4BMXYsVF3u
         GY3PloD2OFKH4gXd7NyHCLJZ33lriKoiMSQwjUeHH3YvWgDV+Oqpzr4CwUZurqU39J29
         1/ZZUKK4huFiL+xwHV1QG2HEjvcmaxDdySwZtjL3k980NFlBHY0DduIwVacdg/4XFZak
         eqjIhp0o8f24dgjgAH83UpfXUK16JhMdkKtuseLCLePxGEutRSSfhL/iQDjEeXB74Yox
         j7DA==
X-Gm-Message-State: AOAM5325GWY0LA9FBChaUrCQe8mtH35oRUulJd69cTQoYGzRQaA9Gp1g
	bJAcGPRQ7gmzP5yPkEP5xNfLWwj+xSBkZg==
X-Google-Smtp-Source: ABdhPJwM0D0MQ4xZ7xZVctsJU/wfqwNi2XmNNl73s8o6MFG+z+Sg+h1REuWKuEAOlrfa20Xg5CWA/w==
X-Received: by 2002:a17:902:db0e:b029:eb:8b29:a809 with SMTP id m14-20020a170902db0eb02900eb8b29a809mr1751447plx.11.1619143682525;
        Thu, 22 Apr 2021 19:08:02 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id f2sm3187111pfe.177.2021.04.22.19.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 19:08:02 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python3-docutils: Upgrade to 0.17.1
Date: Thu, 22 Apr 2021 19:07:59 -0700
Message-Id: <20210423020759.3720767-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was in meta-python for a while so merge the changes here
and  upgrade, once applied, delete from meta-python

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-docutils_0.16.bb             | 17 -----------------
 .../python/python3-docutils_0.17.1.bb           | 11 +++++++++++
 2 files changed, 11 insertions(+), 17 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-docutils_0.16.bb
 create mode 100644 meta/recipes-devtools/python/python3-docutils_0.17.1.bb

diff --git a/meta/recipes-devtools/python/python3-docutils_0.16.bb b/meta/recipes-devtools/python/python3-docutils_0.16.bb
deleted file mode 100644
index 50547a1b0c..0000000000
--- a/meta/recipes-devtools/python/python3-docutils_0.16.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Text processing system for documentation"
-HOMEPAGE = "http://docutils.sourceforge.net"
-SECTION = "devel/python"
-LICENSE = "PSF & BSD-2-Clause & GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7a4646907ab9083c826280b19e103106"
-
-DEPENDS = "python3"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/docutils/docutils-${PV}.tar.gz"
-SRC_URI[md5sum] = "9ccb6f332e23360f964de72c8ea5f0ed"
-SRC_URI[sha256sum] = "7d4e999cca74a52611773a42912088078363a30912e8822f7a3d38043b767573"
-
-S = "${WORKDIR}/docutils-${PV}"
-
-inherit distutils3
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/python/python3-docutils_0.17.1.bb b/meta/recipes-devtools/python/python3-docutils_0.17.1.bb
new file mode 100644
index 0000000000..54a809847f
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-docutils_0.17.1.bb
@@ -0,0 +1,11 @@
+SUMMARY = "Docutils is a modular system for processing documentation into useful formats"
+HOMEPAGE = "http://docutils.sourceforge.net"
+SECTION = "devel/python"
+LICENSE = "PSF & BSD-2-Clause & GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=836a1950177996968a49ff477a4a61c4"
+
+SRC_URI[sha256sum] = "686577d2e4c32380bb50cbb22f575ed742d58168cee37e99117a854bcd88f125"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native"
-- 
2.31.1

