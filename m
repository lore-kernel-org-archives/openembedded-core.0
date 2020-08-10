Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.37549.1597028418806841864
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 20:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=lk1f6AYQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id a79so4396337pfa.8
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 20:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=xBlXDYd887WZsimHbR5G5tqDz24avavnv9UJ8XGrhGI=;
        b=lk1f6AYQs14FeHREDB28PaqnFm5JsYUJueFhhWWFP9aYGfpI4ew1vLvkLFuRjsfDii
         aICDoXZkTV3V597JE5BHCvt6gk1fL7bdIIo1SDRpjFmpu9f24c4f+rrYXCvZJTe8nsGz
         ImVUPRgQ4U6cYw9umJTOeJu8BPpxf6HnP7Q2UjOta3VEbY5q6ApjXDmHhYCeefnemc43
         XIRwwjQWqebtEQSBAQqtYsXqge+yGX1lt42RUvF/NCR5XDO1FFVsni4gri8zYBARMIdW
         LU+yOhKMOldBnU+ubzwMqYKJPCrU9v/Nl3KodcxLTLo+QpszVrhBjpwiR7P3eUkoQCHf
         dm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=xBlXDYd887WZsimHbR5G5tqDz24avavnv9UJ8XGrhGI=;
        b=i613hHOfw9ylD/sdItSTsjQihb3rfa/WMZsH1yKIx/QlQp/Dme7aFdzpx4WGL8VYuH
         Eg5SDP4K8mkkAHR7G9M+qfG3oXvP/1To6b1zLRHrsa9gNGM6BsveZk6Avk0FDZ0wKTWF
         IR9TkBODDZUoi4rtr2ex+b9P6+ytf0semRUydHzToa4iV9vm/l/6JHBOcEtyKKMmAP/W
         ouczAeXgx58Ouz0ElaTjclh/gLdFX3xETwaujDSHsNIeyB127mEeNhjaHPaAnVfnYozo
         TgCHWz7iijmUrXcScG8Odr4F5gZy/mIDuFroymfDXl8c5yCKvo5gABLHXxGIjZt1NYR5
         yDFQ==
X-Gm-Message-State: AOAM533Ln/b4ftN0I5SyUxVCdeMgWR08Dv7y4AYKMSR7Eghd9g4wkFXf
	BL5lEtzLnO+aAv2nKdfAx9UG2tMhMmmHeA==
X-Google-Smtp-Source: ABdhPJxvA8/HVAwk6fJFHJgrIQjRx3316C92+esu4wfaVuS8HeHlv5VWg+ZiBsZ8m112cyOoQWuAJQ==
X-Received: by 2002:aa7:984e:: with SMTP id n14mr23513758pfq.272.1597028417927;
        Sun, 09 Aug 2020 20:00:17 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e23sm7187271pgb.79.2020.08.09.20.00.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 20:00:17 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/19] webkitgtk: fix CVE-2020-13753
Date: Sun,  9 Aug 2020 16:59:21 -1000
Message-Id: <c19c4ef4efeebe4df03c06a995a60d1a31c605d8.1597028036.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597028036.git.steve@sakoman.com>
References: <cover.1597028036.git.steve@sakoman.com>

From: Lee Chee Yang <chee.yang.lee@intel.com>

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webkit/webkitgtk/CVE-2020-13753.patch         | 15 +++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.28.2.bb      |  1 +
 2 files changed, 16 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2020-13753.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2020-13753.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2020-13753.patch
new file mode 100644
index 0000000000..d8504c2b36
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/CVE-2020-13753.patch
@@ -0,0 +1,15 @@
+Upstream-Status: Backport [https://trac.webkit.org/changeset/262368/webkit?format=diff&new=262368]
+CVE: CVE-2020-13753
+Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
+
+Index: a/Source/WebKit/UIProcess/Launcher/glib/BubblewrapLauncher.cpp
+===================================================================
+--- a/Source/WebKit/UIProcess/Launcher/glib/BubblewrapLauncher.cpp	(revision 262367)
++++ b/Source/WebKit/UIProcess/Launcher/glib/BubblewrapLauncher.cpp	(revision 262368)
+@@ -642,5 +642,5 @@
+         int r;
+         if (rule.arg)
+-            r = seccomp_rule_add(seccomp, SCMP_ACT_ERRNO(EPERM), scall, 1, rule.arg);
++            r = seccomp_rule_add(seccomp, SCMP_ACT_ERRNO(EPERM), scall, 1, *rule.arg);
+         else
+             r = seccomp_rule_add(seccomp, SCMP_ACT_ERRNO(EPERM), scall, 0);
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb
index 288c715cc3..9cfec83ec7 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://cross-compile.patch \
            file://0001-Fix-build-with-musl.patch \
            file://include_array.patch \
+           file://CVE-2020-13753.patch \
            "
 SRC_URI[md5sum] = "ec0ef870ca37e3a5ebbead2f268a28ec"
 SRC_URI[sha256sum] = "b9d23525cfd8d22c37b5d964a9fe9a8ce7583042a2f8d3922e71e6bbc68c30bd"
-- 
2.17.1

