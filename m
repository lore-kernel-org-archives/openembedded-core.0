Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.1616.1613210540846758417
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Feb 2021 02:02:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Vd5yKAyl;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id o24so2206348wmh.5
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Feb 2021 02:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p/Uxn6M0GBgEgGMtjxKfblqikboX8/8ZtD3A60nz0iY=;
        b=Vd5yKAyl55QBXJhgpINA4NZPR/xZ8xE7yiRsDVAjsGme3SYada8mJMrFgWYILqNnRX
         vb6DVlYmr/dFY/k0EYYOwmWfpTm0WotOswa7VAg1DKj5Q+GJs75ys4gRkU5Qf/jn44Ef
         7YnK3ElkltfjXvq3I+sOCJbqe4OYBMDUku23Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p/Uxn6M0GBgEgGMtjxKfblqikboX8/8ZtD3A60nz0iY=;
        b=OPy2R+fmWV9qKxIauQnvWNeCr3/VqV0SETX6ploYZD7knNk3KXY16a8xWN1lPukh/J
         OTxbKMYwI3hvEIH5EYhVC6vAYpu2roXyVGOQR7KDqzIjaGjR1AXedhtQqdwNJR3Xzp1w
         JIow5QIZ6na+c/X/sjZJ+BEU59kLkm2cmF0QLQAGrq1mSVOJGCDpyfuYo7fBKVW46S/e
         J0KFjdPa86anRUk/XgKZAF7OIsQBADllDvpB1sXOxSoIu20wtMQ08ZE+b0fBEgRIms1u
         wX0qy2Fe7aaYfv64QST82nLmelgSTqb4vfCoZrsRILhNrceGZeXD0J6Lw45ZvgB/8xwf
         omWg==
X-Gm-Message-State: AOAM530UFFqobDkgMlb6MamiqSDTdeFIdagO+rWgeikgZboFUuCdB1Nw
	JaSZu1vX2lVnYOMQp0NW1ZWtbcYMIplswQ==
X-Google-Smtp-Source: ABdhPJzFhLJjCvtMTpWiqaFSxyDoh/UqUvfoXcV2zLSDko0SjgmsTx5AE6EIMENHc8S1IUj4lgesrQ==
X-Received: by 2002:a05:600c:4a09:: with SMTP id c9mr6092212wmp.91.1613210539261;
        Sat, 13 Feb 2021 02:02:19 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:91a5:e7fd:31d5:331])
        by smtp.gmail.com with ESMTPSA id b2sm14632342wrv.73.2021.02.13.02.02.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Feb 2021 02:02:19 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] nativesdk-buildtools-perl-dummy: Add new autoconf dependencies
Date: Sat, 13 Feb 2021 10:02:18 +0000
Message-Id: <20210213100218.1928273-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When used in SDKs we need to provide the perl modules used by autoconf.
Add new ones needed by recent changes.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
index cce086caf2a..beca73104e0 100644
--- a/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-buildtools-perl-dummy.bb
@@ -17,10 +17,13 @@ DUMMYPROVIDES_PACKAGES = "\
     nativesdk-perl-module-file-path \
     nativesdk-perl-module-file-spec \
     nativesdk-perl-module-file-stat \
+    nativesdk-perl-module-file-temp \
     nativesdk-perl-module-getopt-long \
     nativesdk-perl-module-io-file \
+    nativesdk-perl-module-list-util \
     nativesdk-perl-module-overloading \
     nativesdk-perl-module-posix \
+    nativesdk-perl-module-scalar-util
     nativesdk-perl-module-strict \
     nativesdk-perl-module-text-parsewords \
     nativesdk-perl-module-thread-queue \
-- 
2.27.0

