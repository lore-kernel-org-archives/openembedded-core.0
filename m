Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.25842.1588523200246159515
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 09:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DFyK/4D1;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id l18so7252825wrn.6
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 09:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=psuG6cQRxDYFwdRU8kYSmRSST8TvLK8hg/cy4RlRmh8=;
        b=DFyK/4D1VOchkgrTtZDmpzH1JgMkLrWycSJl93ObUP7f/hT2j+QtRV7rD06CxLhmPF
         R2ZLOj/WZiWE+XlqOnzQRPErTE24SR68ZidxYIIgauyJkYjwVzq8Zg4Pkwa1zY61mYrD
         vumVXaiQIb+QvVBmN7TB7MyHuT0wPZgJRwOIMR+94MD+6bYCk4qx9eKyl6KfgbobMYdx
         97w2hHd4wmqBlzOGkieU0QkuNa9aprr/FnAvOIqoJiaf701aYrgMq4iE4nRV6Uw77uz8
         ITbJsZHZFQ2+vJXzSPSQZ4TqIGHXz8ultI3CbDu5aigPChhBcZYY5gupgmis/hgvV1Df
         e7DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=psuG6cQRxDYFwdRU8kYSmRSST8TvLK8hg/cy4RlRmh8=;
        b=DkmOGuD50CvDdRjOYNDMOH0NUGdOYspiGjRinh+pThrv4rRPbxg+8pGXyFKitM9Fav
         312QI29kecth+7znMK8mubBs5bMPn9gxyH2bhF1QLYDYPTjVx5ZSVLT+2mYlIEmXj4b7
         qerMuvjcMdp+ojoXojSdmaTN6CSAnQ3jsXIL2QneBYwoF4GDNYHn0x7dDhQTsSuG45bO
         KlETGqpWSYMRtCLq0WpouchKmCLQwAU+XqkGyKOibK4Scz+NXMd6/Rxc+U9N/MbxbQYc
         rvpM7V0asX2Ita/9xpHq4KGQVPTKqKHTJV6JEnEnjjWqqfdJ5AXs6oAI8ONlb8d9CLsZ
         sG/w==
X-Gm-Message-State: AGi0PuZJBkrgp2jINAQaGQZOP91EUg89GJuNaY8tZ0T0zF0Vcl67sOzJ
	MjDOpEB6VouokDoKwBqUIaD2HB9Q
X-Google-Smtp-Source: APiQypKkEe2+7qVHDo6tVWAwe7pR7jv6vYTf95A25V9y2/G2vzeqGRBKAgrLencoCJ2DDiKDAr0gAw==
X-Received: by 2002:adf:fd0a:: with SMTP id e10mr14428230wrr.160.1588523198632;
        Sun, 03 May 2020 09:26:38 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id q18sm9079532wmj.11.2020.05.03.09.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 09:26:37 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 10/17] git: update to 2.26.2
Date: Sun,  3 May 2020 18:25:52 +0200
Message-Id: <20200503162559.946-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200503162559.946-1-alex.kanavin@gmail.com>
References: <20200503162559.946-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disable iconv, as configure.ac attempts to run a
cross-compiled test program otherwise.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/git/git.inc       |  1 +
 meta/recipes-devtools/git/git_2.24.1.bb | 11 -----------
 meta/recipes-devtools/git/git_2.26.2.bb | 10 ++++++++++
 3 files changed, 11 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/git/git_2.24.1.bb
 create mode 100644 meta/recipes-devtools/git/git_2.26.2.bb

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 4131c98977..544e23c844 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -21,6 +21,7 @@ PACKAGECONFIG[svn] = ""
 
 EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl \
 		--without-tcltk \
+		--without-iconv \
 "
 EXTRA_OECONF_append_class-nativesdk = " --with-gitconfig=/etc/gitconfig "
 
diff --git a/meta/recipes-devtools/git/git_2.24.1.bb b/meta/recipes-devtools/git/git_2.24.1.bb
deleted file mode 100644
index daea31eab2..0000000000
--- a/meta/recipes-devtools/git/git_2.24.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require git.inc
-
-EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
-                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
-                 "
-EXTRA_OEMAKE += "NO_GETTEXT=1"
-
-SRC_URI[tarball.md5sum] = "166bde96adbbc11c8843d4f8f4f9811b"
-SRC_URI[tarball.sha256sum] = "ad5334956301c86841eb1e5b1bb20884a6bad89a10a6762c958220c7cf64da02"
-SRC_URI[manpages.md5sum] = "31c2272a8979022497ba3d4202df145d"
-SRC_URI[manpages.sha256sum] = "9a7ae3a093bea39770eb96ca3e5b40bff7af0b9f6123f089d7821d0e5b8e1230"
diff --git a/meta/recipes-devtools/git/git_2.26.2.bb b/meta/recipes-devtools/git/git_2.26.2.bb
new file mode 100644
index 0000000000..ae7aa267bf
--- /dev/null
+++ b/meta/recipes-devtools/git/git_2.26.2.bb
@@ -0,0 +1,10 @@
+require git.inc
+
+EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
+                 ac_cv_fread_reads_directories=${ac_cv_fread_reads_directories=yes} \
+                 "
+EXTRA_OEMAKE += "NO_GETTEXT=1"
+
+SRC_URI[tarball.sha256sum] = "e1c17777528f55696815ef33587b1d20f5eec246669f3b839d15dbfffad9c121"
+SRC_URI[manpages.sha256sum] = "b3c6cfc980f3c593d0cd0c63e0c97d6f1cafe7b72321fc3a94948758b9529c5b"
+
-- 
2.26.1

