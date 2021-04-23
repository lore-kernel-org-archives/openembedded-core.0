Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web12.36.1619208243663435157
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 13:04:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iY51JH2V;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id gq23-20020a17090b1057b0290151869af68bso1761640pjb.4
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 13:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fQe58cP0kuUm+AOnGE9cXnMNh678JB1RvW9snPAp7QQ=;
        b=iY51JH2V2+/M81t07AFaRkWliEtJqOOtaAwcq44w3PcnemVUqw8SKsGkSwdwxMDyFL
         Y3Bh7IDPG0FK7dZJ+JjSOXRcpeLoXsYEIyEusCNA6JXa08ovBxT1uWny4neeV8Hg49g9
         6Id+iRWb6wDxm6iPiU9ZFyQ/m/8aJpi6HpRUqUGerInwC4qYuJFZHhP5Ti43TRRa+i3K
         fjg1ef8JS+gqDwNXqrOZVSQt8HJeuH4Bs7bXdXAlkHHIz/BNIZq85ENNOWpiPryrdUXw
         ccV9xMD9QD1wE2CsY/FqmsEChYY5Rj7q3gp6K5i+r2CHr7sg2VcXzClr7oFt0O9Om/rX
         h/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fQe58cP0kuUm+AOnGE9cXnMNh678JB1RvW9snPAp7QQ=;
        b=b36v6reS8JxcOicHbTU3xDoMHBvbEW2M0AZeR/Xeup6IXNeMWHezsrUVzsSal5tyeF
         NY2C7izdrsGHXocuZyu4IxyO3I+PhJuiW3h9jWw5nlJL/k9ZgbMBN3pdxZEXmFL40GGK
         dR//p7ajtLuOtZKXVrV7pCueQ9xUhdIbV8QzM6Y28HzwmLwuqh25mrqYMtaH7xiZFy/h
         ZHhbuKcJ4DQA4VJvnZ267fyfiU1Bswh/D/U98nzd9N/2B+mGkKrpikPOHoiUGjpDq5iB
         Vpbb24peJk6PnUqClkNEy5E7gtadBbIKPsBAFmOhPyv84xRks0+fEmcJmNVAES5HX5J0
         IzGw==
X-Gm-Message-State: AOAM533dbUSBFTBUYUSkTtTsTXE6zxdafyKKL91XQPX6P3dM7z5n0LWV
	YK60WksPfZsMuVDUgZ9NEfbHsTgSZl60Ww==
X-Google-Smtp-Source: ABdhPJy5KnlOTEznxm3NoLGxWSKUhJiarlAIeNbwamm7S+Spd3pHqOfxRUvVMavixyBU12Vr25ynBA==
X-Received: by 2002:a17:90a:e298:: with SMTP id d24mr7402384pjz.37.1619208242885;
        Fri, 23 Apr 2021 13:04:02 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id d132sm5201282pfd.136.2021.04.23.13.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 13:04:02 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/4] python3-docutils: Upgrade to 0.17.1
Date: Fri, 23 Apr 2021 13:03:56 -0700
Message-Id: <20210423200400.1108673-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This was in meta-python for a while so merge the changes here
and  upgrade, once applied, delete from meta-python

License-Change: Deleted legacy stylesheets from LICENSE [1]
                Updated URI for BSD-2 [2]

[1] https://sourceforge.net/p/docutils/code/8487/
[2] https://sourceforge.net/p/docutils/code/8554/

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

