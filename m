Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.7079.1588683728280762158
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2020 06:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SYGV/0AY;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id g12so2229274wmh.3
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2020 06:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=psuG6cQRxDYFwdRU8kYSmRSST8TvLK8hg/cy4RlRmh8=;
        b=SYGV/0AYTs4Pcs/iT9YpP+/ddmT86oGnVM2Plo9ToRxSy/RE0gbqjMpHF+ABnJjqmz
         wG3gjNPq/P7dHg/oL8BQC4UO2krln8EjzIPanWA8vfx4UEtcR9PPy8uFB8BquLWrI/et
         qtKmvGaO6tvTDqbejoqKNeUnVY9cfWs6DVNY90XLaSv2NVMg0s/bp28SZb2etAqKCyWe
         5pcjxZj+0ZA8pKvfEOWAFj/pOlwFuDfMWrqXON2fjB/h5Qy8HTwI+ZkpP/qNbNl9FQxh
         G0Msd5puo1YfqLKvS3GvkpdRqeM/1SSg01U6jLzr8JrAxVvJKtQEVnLmUoCM9LGEFQ59
         YzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=psuG6cQRxDYFwdRU8kYSmRSST8TvLK8hg/cy4RlRmh8=;
        b=b633goGy6Mq/8j5AyelgsfkmCm3SeCQoEeaYOcdoqwKtwcqOS8ekFSVD0E9amUAUKA
         bFmHOkgyIo/qF0j4lasgD8kILw/Z980De1mgQCdB8khQXEg5irerO/93oPCF60e5Uio+
         XYFHlA81NyEjghVR2oZ3VGlT+5J7f1O4DtY/01CW7NFwWydlOIM8qu5qIRKSc2v3OOyu
         pNEsSyNNimVmPhko+oQVqZNwxOnT6tB15iwmtaYprfuGGPgQX9sefXHrBixV0SVj9XWt
         ABdsNT8mjYXNRER0BYxMLGZlnFIMQACDztc6K8Tq7ydKDIYjo8YMGVmYmNMYiiKvSVI3
         05tw==
X-Gm-Message-State: AGi0PuZa7BmaWbFK3TvBfTGdDmJ8OQRKWRw9zVjbywFG1TZ3DTEyVM07
	TeNrKp2C6Ncq9pfeT4VNP/HxX4iQ
X-Google-Smtp-Source: APiQypIPpTYCgBgsvLcW/SniWxnlIGfBYpduG6jMoL+T7/BiR71uPaZEixmulD61BP+5m6F8oqTvJA==
X-Received: by 2002:a05:600c:2945:: with SMTP id n5mr3385146wmd.148.1588683726640;
        Tue, 05 May 2020 06:02:06 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id h16sm3388113wrw.36.2020.05.05.06.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:02:06 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 06/24] git: update to 2.26.2
Date: Tue,  5 May 2020 15:01:15 +0200
Message-Id: <20200505130133.24930-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200505130133.24930-1-alex.kanavin@gmail.com>
References: <20200505130133.24930-1-alex.kanavin@gmail.com>
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

