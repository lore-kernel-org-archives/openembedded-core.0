Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web09.12871.1611672164404209300
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Jan 2021 06:42:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=A+pno/h+;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d13so4129726plg.0
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Jan 2021 06:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=p2Fr57bgryJtBAigQG5iZJiksbNM+MXvV7HJEM/fgEg=;
        b=A+pno/h+bjOSVOWYMtz/ZwRETo7UjHkEsCZEAljNha8j/bTGWBxz2g39OqXtbLYTS5
         3iix1MHvzwEW76fXcdbOD9RQf1ipQPKjgmVD4LVJffPB5nQJSrDhu5z79lJGDDpSP+/V
         2MV0Ue05KbcsPdtmxs6t0BEbHNgNJZrWWgWDG5B4LBhNRjr4wvCL0GgivTvTGPpBBQTv
         HdQF+840msQ/3KxS9ibWId1bp08mMh2DlK2KsTjhwrsPNhyrmR7CSUyeGPNePfNY9m6O
         y2ilvEwueyLajbvIQDHTrSvZmJudM4LD4AYmO+dpC3QkcJMIQEESkcQSOtEXTq08bJdQ
         LVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p2Fr57bgryJtBAigQG5iZJiksbNM+MXvV7HJEM/fgEg=;
        b=t6IV0sB9NAhRQXndzrLG69mEH4MHo0psQDyb/okvuc1CcsYR7WbWdcGLmglapsIfde
         awCes6IJTET37HUaZoWgtodzpPh9u05dcy3AMwYDIDu8KdtFG07s6G4jzc6GmhOaMMs1
         1MrgOS8yQV0Nl4fFNq4Fh66M6W+yFsy/kbONBRlFaixS+xK0UD/cv6VVSLeA0AyBG0Bv
         29Lz0QDOa6BksbStEqzyqJPazEAJQFuQDkeBW7T5A6h4B06r0cdijVl9PpPkA7y7T46W
         AD7BlfGG/6c45TDTRga3X+6upFC0zqNA1frI24ttOD4eJMNxY2qPzubqDh1TTP3SEXCH
         zTuA==
X-Gm-Message-State: AOAM531DzQnkly2KFN12a6NoE+lkBrwgmUsQQphu7/PN1VGy7C7rKFU+
	XisXGaY75CmobqF9xv1oBfPIhH8nK1jH30Hi0/8=
X-Google-Smtp-Source: ABdhPJxXXOfZ44lL0cJ0RD6qh6BtahZJyhCZf/iQWLhgjeWF/VE24/1xoFXFVhj1ftwm/zGd9Xn8Bw==
X-Received: by 2002:a17:902:b688:b029:dc:240a:2bd7 with SMTP id c8-20020a170902b688b02900dc240a2bd7mr6231667pls.50.1611672163496;
        Tue, 26 Jan 2021 06:42:43 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 11sm19303634pgz.22.2021.01.26.06.42.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 06:42:42 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell V3 11/46] pseudo: Add pathfix patch
Date: Tue, 26 Jan 2021 04:41:22 -1000
Message-Id: <b75a950dc9c21a9edbfe113ceff439e156476b5c.1611671734.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1611671734.git.steve@sakoman.com>
References: <cover.1611671734.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Add a path to fix up handling of dirfd being passed as a full file
and with path="".

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3006bbe7768e4efe33d3d2d3f5786a561ecbe96f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../pseudo/files/pathfix.patch                | 25 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/pathfix.patch

diff --git a/meta/recipes-devtools/pseudo/files/pathfix.patch b/meta/recipes-devtools/pseudo/files/pathfix.patch
new file mode 100644
index 0000000000..b3e63fa28f
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/pathfix.patch
@@ -0,0 +1,25 @@
+We're seeing systems in the wild (e.g. ubuntu 20.04) which call
+with a dirfd set to the full filename and path set to "". Since
+this seems to be expected to work, handle it accordingly.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+
+Index: git/pseudo_client.c
+===================================================================
+--- git.orig/pseudo_client.c
++++ git/pseudo_client.c
+@@ -1549,8 +1549,12 @@ base_path(int dirfd, const char *path, i
+ 
+ 	if (!path)
+ 		return NULL;
+-	if (!*path)
++
++	if (!*path) {
++		if (dirfd != -1 && dirfd != AT_FDCWD)
++			return fd_path(dirfd);
+ 		return "";
++	}
+ 
+ 	if (path[0] != '/') {
+ 		if (dirfd != -1 && dirfd != AT_FDCWD) {
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index c5040f5f7f..bc20a2f134 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -8,6 +8,7 @@ SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://track_link_fds.patch \
            file://xattr_fix.patch \
            file://mayunlink.patch \
+           file://pathfix.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
-- 
2.25.1

