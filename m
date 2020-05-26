Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web12.45275.1590469970908996808
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 May 2020 22:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KwLXFaTO;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: maxime.roussinbelanger@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id n141so6992641qke.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 May 2020 22:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PibQoLqt5alRDd2rG0L5HJeL3DmZmTW+ibIbxksiTIU=;
        b=KwLXFaTOsKTtgJN3VqWW3Y3pssL8fkHIipjiPesfWFIFZsBG597gQqYkDDoENJgFpi
         GbuTt9l/C0L8SIYFRINtJ3YJs/wgtW18sMBZOBPf5JL9XvMXyJVsH+yuhfOIyu+3zIie
         /WGb+1ZOlcKVNxc5CZDOvfMlYKPB0Wdvkzkteb4c5H4nMM4xdSdM74eOxKICwzE1yXAU
         Xiziz/j6VZV3adtIOSJ2iERxGyVG38tPzOygYJtKImocZ5n/RRbNiSPmx3tVc+Ugm202
         mZzgwNPkW7DNneOFRG0adXVWcOFMmnKMgJyyj8PMMfKBPCL34KNpMAawM5hd+pCPEHdL
         6f1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PibQoLqt5alRDd2rG0L5HJeL3DmZmTW+ibIbxksiTIU=;
        b=AmxOte1c9MGHIP+yiqWedQLqvF3brZLqe7auMcrtpOUl+wtPkI03jQpsgRnaGigwo0
         W5yQDtI3T6CYtOCg8I1UlV0YNE5LPwAqlZKubDnaU7XVQN8Xv6o1c7Z8AvSp/Tr6smA4
         Axs5fpN6ccHwORPYjkjoqer4mKrwTe0eFA2inqyfIk3pS4qx5z9s45HhH+k3D11FKocm
         MWgVE4BU0CC2Io38jW4km2M1T9pEZ367cuzoxIaBdptKCRNaD2b43M6zU3ZdHnURW7zn
         tN9+uw5dN+Knvn/zz5vE1RN0KJukR5prwwr3ymD+Dpdkgw+fR83Oyi4GPvAzX/3jNlLt
         Kr6w==
X-Gm-Message-State: AOAM533VSTkBJImIX8wCF/fma+IAgb5zqXXsIHqLQlj1Ji/NU3Oq2Jc8
	7T9UauMn8LxTGZ99Me+hw3DiybjW
X-Google-Smtp-Source: ABdhPJyHYhizvgOmFwj2FGjhVzNXmAZhiAnEtxn9Nrvk+Y3MKeuBpHgJ0FX7ERVrFyi7/d6o+yg2vw==
X-Received: by 2002:a37:4dcc:: with SMTP id a195mr2088605qkb.430.1590469969871;
        Mon, 25 May 2020 22:12:49 -0700 (PDT)
Return-Path: <maxime.roussinbelanger@gmail.com>
Received: from mbedesk.sonatest.net (ipagstaticip-d73c7528-4de5-0861-800b-03d8b15e3869.sdsl.bell.ca. [174.94.156.236])
        by smtp.gmail.com with ESMTPSA id c197sm16091869qkg.133.2020.05.25.22.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2020 22:12:49 -0700 (PDT)
From: =?UTF-8?B?TWF4aW1lIFJvdXNzaW4tQsOpbGFuZ2Vy?= <maxime.roussinbelanger@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Maxime=20Roussin-B=C3=A9langer?= <maxime.roussinbelanger@gmail.com>
Subject: [PATCH 1/2] python3-pathtools: add a recipe
Date: Tue, 26 May 2020 01:12:15 -0400
Message-Id: <20200526051216.14143-1-maxime.roussinbelanger@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Maxime Roussin-Bélanger <maxime.roussinbelanger@gmail.com>
---
 .../python/python3-pathtools_0.1.2.bb               | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pathtools_0.1.2.bb

diff --git a/meta/recipes-devtools/python/python3-pathtools_0.1.2.bb b/meta/recipes-devtools/python/python3-pathtools_0.1.2.bb
new file mode 100644
index 0000000000..2b36346ec7
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pathtools_0.1.2.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Path utilities for Python"
+SECTION = "devel/python"
+DESCRIPTION = "Pattern matching and various utilities for file systems paths."
+HOMEPAGE = "https://github.com/gorakhargosh/pathtools"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a870e4c037fc40b3973dd56a1526fc5b"
+
+SRC_URI[md5sum] = "9a1af5c605768ea5804b03b734ff0f82"
+SRC_URI[sha256sum] = "7c35c5421a39bb82e58018febd90e3b6e5db34c5443aaaf742b3f33d4655f1c0"
+
+inherit pypi setuptools3
+
+PYPI_PACKAGE = "pathtools"
-- 
2.20.1

