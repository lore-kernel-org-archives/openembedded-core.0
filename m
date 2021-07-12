Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.12761.1626103962637612911
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jul 2021 08:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=fWXLEoOY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d12so16759101pfj.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 08:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DOVS6K0jogfqj/xKNg96pOYeCzvcCPC8xyqKHP22jVo=;
        b=fWXLEoOYsd6l+7y1SRWSLscMbijnsKA3hEP+ltN3SSEMriu4ZSgsz9NULXWqUMT+HW
         m4Y6vm7/SIXW+NIVO1h9iIhfLcCS8KDvheJlz0DB+7iXuO1230vA2RJD13DN5eVwx7KK
         mwJA90v/MwUrsIJzqfxXx+NzW8uNt+IqGPCX/wyz9T2PL0pL4zJJ1xk7Qt+oxb/SGxAz
         NVihwzrZt2cIsyEWr3pAD3meL9rDz7L34zZi/rVT/RrBnMYFpikbtIApHSqc139C86P2
         FwyTYoPnnGtG6chOL6wgzW+UmmgJNlz7G3q+PLMNbsgR5dWzuP7pWCmsgcLJC2EPesQX
         Q4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DOVS6K0jogfqj/xKNg96pOYeCzvcCPC8xyqKHP22jVo=;
        b=UTzxP6x7JEiwUx8zU1piGL6YycCjxyc5Cb9wxbxBp3rerVqBuZ+PA0f7arzzbhoY6B
         3SqDaeXAhJKyr2XypSbm5fCezKewSWRxO9NLrmoIL4DUJp1+AnGJjelmvLJFspxlbRJv
         6S1HrIa1yb82e1RPQ7V2sUkf2gW/vVSnUZLRktvjhAnytq1foJSSaOEbBzM/8XbIK5Mw
         D4dgTscjtqdZMabUeXpp6XGcsekBszZ4zHmnulPy9dOQ3vDZaOg36v2tJ29fHmCRcLgH
         DSvq6kX7NjWj2+pDJoYnWIo9UDROfcacoDZSaWaQDhk5MXy56wLUExEdjm/0taoKCekk
         u3Cg==
X-Gm-Message-State: AOAM531Luqdlz9vjqtGPukmaAcYulK6M4EW07Ef7alWYV64Hww8JG4BW
	7arGmqlqlpu6VCjBd7khFUkVwb2/+zFFUDRE
X-Google-Smtp-Source: ABdhPJw244u/xvYNNB0nUVMDykC1x8OEoJuaprOq4g0recIcsgWp3GXRgnh/rjvThXcta5Go8xF52w==
X-Received: by 2002:a65:63c1:: with SMTP id n1mr54224649pgv.398.1626103956762;
        Mon, 12 Jul 2021 08:32:36 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n3sm16765942pfn.216.2021.07.12.08.32.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 08:32:36 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/12] webkitgtk: upgrade 2.28.2 -> 2.28.3
Date: Mon, 12 Jul 2021 05:31:55 -1000
Message-Id: <a452fbbdb9646cb2a2f37a680a269b41f4bf215b.1626103708.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626103708.git.steve@sakoman.com>
References: <cover.1626103708.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This is a bug fix release in the stable 2.28 series.

- Enable kinetic scrolling with async scrolling.
- Fix web process hangs on large GitHub pages.
- Bubblewrap sandbox should not attempt to bind empty paths.
- Fix threading issues in the media player.
- Fix several crashes and rendering issues.

Remove CVE-2020-13753.patch since fix is included in 2.28.3

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1e67e325ba620fe91ef11ab2a1029fbbc54b3c69)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../webkit/webkitgtk/CVE-2020-13753.patch         | 15 ---------------
 .../{webkitgtk_2.28.2.bb => webkitgtk_2.28.3.bb}  |  4 +---
 2 files changed, 1 insertion(+), 18 deletions(-)
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/CVE-2020-13753.patch
 rename meta/recipes-sato/webkit/{webkitgtk_2.28.2.bb => webkitgtk_2.28.3.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk/CVE-2020-13753.patch b/meta/recipes-sato/webkit/webkitgtk/CVE-2020-13753.patch
deleted file mode 100644
index d8504c2b36..0000000000
--- a/meta/recipes-sato/webkit/webkitgtk/CVE-2020-13753.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Backport [https://trac.webkit.org/changeset/262368/webkit?format=diff&new=262368]
-CVE: CVE-2020-13753
-Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
-
-Index: a/Source/WebKit/UIProcess/Launcher/glib/BubblewrapLauncher.cpp
-===================================================================
---- a/Source/WebKit/UIProcess/Launcher/glib/BubblewrapLauncher.cpp	(revision 262367)
-+++ b/Source/WebKit/UIProcess/Launcher/glib/BubblewrapLauncher.cpp	(revision 262368)
-@@ -642,5 +642,5 @@
-         int r;
-         if (rule.arg)
--            r = seccomp_rule_add(seccomp, SCMP_ACT_ERRNO(EPERM), scall, 1, rule.arg);
-+            r = seccomp_rule_add(seccomp, SCMP_ACT_ERRNO(EPERM), scall, 1, *rule.arg);
-         else
-             r = seccomp_rule_add(seccomp, SCMP_ACT_ERRNO(EPERM), scall, 0);
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.28.3.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.28.2.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.28.3.bb
index cf6b2ffae7..44de685548 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.28.2.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.28.3.bb
@@ -19,10 +19,8 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://cross-compile.patch \
            file://0001-Fix-build-with-musl.patch \
            file://include_array.patch \
-           file://CVE-2020-13753.patch \
            "
-SRC_URI[md5sum] = "ec0ef870ca37e3a5ebbead2f268a28ec"
-SRC_URI[sha256sum] = "b9d23525cfd8d22c37b5d964a9fe9a8ce7583042a2f8d3922e71e6bbc68c30bd"
+SRC_URI[sha256sum] = "f0898ac072c220e13a4aee819408421a6cb56a6eb89170ceafe52468b0903522"
 
 inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
 
-- 
2.25.1

