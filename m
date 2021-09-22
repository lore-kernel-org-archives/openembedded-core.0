Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web09.230.1632333237503219497
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Sep 2021 10:53:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TTBCgKNo;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id c7so12803579qka.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Sep 2021 10:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Cdk/f7kl/ecN56ereFtQO7Tdf7TtOFxip2LS4kHzHqU=;
        b=TTBCgKNoP26b5MwNGzcMx2HIQr4ZjJqc326Y0O0GVZR6782I6v7M7/izy4b/ky/Ug2
         gDYEXgy4goIY4Jlfxf6nRXRbJdy/c2ou2l2pjBkENMwQ9kEOuZbIVaSMOP4Bads0ShbQ
         c10m6G/ZZ2Lbsbe93NFYZuiBTT6RM44V30bZA+ciVswwfmLoBpusqUQlmO9m+NEDtdvs
         gqY3JWtBGDZJ7BX9Ecj/aLsRZRytSRlfEc8G0gdu8gO02s+SxM4kZyg6bGUaLtPnvc7v
         PEv6UbNx5+K/WIT4kuWb/1kpPd/tI5iYkvrLojTJpgn5CliALE4pVaFlaV91KRykYGa0
         gvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Cdk/f7kl/ecN56ereFtQO7Tdf7TtOFxip2LS4kHzHqU=;
        b=lldBttltmehz+mCz5UhZ9YWlluYCHziscutrBpsx35gODFeLkW420jA1/tXKBuEIv8
         bK7Kiulr7lZVzJyQ6PumloT+fmEuum3RcU6/jJucCIqCgTEg/yR/i1JiQ35I8gCMt6Kk
         b491sCv1BBtaGc0kU2FBuMVt1+UwY/kLomS+G+718WLC1lEl83M+yw5VUDVl3vOh8PRS
         I9nA+oLbdZhgxE3Ysfi2B2iJt/29AJfOnF/wuRXe4gKZ7eq6xr/RLJh7R9ClaK6yVpwV
         HdBYudhAD/FrjD5BPC93jPLE/LxAgT4tJ9Qu1XqxRkuE3b4TVVVyrRfpaFaOiJ7Wlhhf
         6yoA==
X-Gm-Message-State: AOAM5313KhaTEcSC7/7/z85VrFPr3NDtAhXsWE3WNjhPp/XAJrqmFZtZ
	0XCY7tXQHIzgmfE6pgt4AvI=
X-Google-Smtp-Source: ABdhPJyZ7+NBhkETqX+WZuxByZw29Px7l5GY8qXIz1cMrYYAs2aeZn3BDpZ9pAoelV9jXc6hbQEtog==
X-Received: by 2002:a05:620a:5fc:: with SMTP id z28mr484896qkg.179.1632333236593;
        Wed, 22 Sep 2021 10:53:56 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id n16sm1809484qta.51.2021.09.22.10.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 10:53:56 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] libc-headers: bump to v5.14
Date: Wed, 22 Sep 2021 13:53:49 -0400
Message-Id: <f62be5f9522374f06bb09be188403bfcf4b0c75f.1632332981.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1632332981.git.bruce.ashfield@gmail.com>
References: <cover.1632332981.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The reference kernel is moving to 5.14, and 5.13 is EOL upstream, so
we update the libc-headers to match.

No patch issues were found for musl or glibc.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc                 | 2 +-
 ...inux-libc-headers_5.13.bb => linux-libc-headers_5.14.bb} | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.13.bb => linux-libc-headers_5.14.bb} (80%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 80b03305bb..27e60b60aa 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -21,7 +21,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.37%"
 GDBVERSION ?= "10.%"
 GLIBCVERSION ?= "2.34"
-LINUXLIBCVERSION ?= "5.13%"
+LINUXLIBCVERSION ?= "5.14%"
 QEMUVERSION ?= "6.0%"
 GOVERSION ?= "1.16%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb
similarity index 80%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb
index 556ca07f2c..282c04d79c 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.13.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb
@@ -14,5 +14,7 @@ SRC_URI:append = "\
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-SRC_URI[md5sum] = "76c60fb304510a7bbd9c838790bc5fe4"
-SRC_URI[sha256sum] = "3f6baa97f37518439f51df2e4f3d65a822ca5ff016aa8e60d2cc53b95a6c89d9"
+SRC_URI[md5sum] = "a082ef5748b813abca0649dab8be5f52"
+SRC_URI[sha256sum] = "7e068b5e0d26a62b10e5320b25dce57588cbbc6f781c090442138c9c9c3271b2"
+
+
-- 
2.19.1

