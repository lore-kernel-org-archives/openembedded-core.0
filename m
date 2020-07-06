Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.61265.1594051897838626470
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=d5XYg4Jq;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d10so3481193pll.3
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=g1jcYBfhW7+yYbqp8ED1n1DGB2hxZPS1n1fqLZpGs6g=;
        b=d5XYg4JqWbW4XjoXXLMcGkI9sw27Unbu2IRKT+yc+/QtLWcLrveOilRIc0CIbzT9hT
         ITqpGEdqS/IeRWtkGjxfiuJYewRxTmC3GC2H/WGQhsgv5jidBfF/aprEkEjmciE/uVsg
         sTQkHrpV06p6dO8tRKGa4jq7MWxXvPqB4XehBBOBYSQ8FdyOlJ/guOsEnC0VvnkxrWG4
         B2ESbAb2Wr2/Mlw1oZJZH/UmfoP85PUl6YA1pZKeYXfuDbG1agUC7Xw8uWW+F1Sc0nwP
         yUk4LfiyO1BcyZBfUe0Ymca+j9XUHtEICU0BS3hQMMWpnL5ob1ZzmFG7oKvlK67p6t5z
         qc8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=g1jcYBfhW7+yYbqp8ED1n1DGB2hxZPS1n1fqLZpGs6g=;
        b=C4MfKpHRlZ6XdI30aZ6TIPZajvsL08dlqhOv6dvdXllFy3ATP8VMtOxV2Mo5JEK2AN
         1GftuPUwViwTD8NZkdL5SRORVAJbQrt++8hqymTPqs+pxak0jGkce3ThsaZBTI5eedNa
         ccntYSbwwrronI+rOvOr9UCUO7UjA+wIBRg2WORRYwFVkEN00CZT//ZEGn0o/cRnzQtU
         qP6po6RnpShls/r/Kq3LZUIEA4d5TUmusTPHVZG1oXrw0R4l9m9VZ7vXTWcHx2XvzFMs
         o3CkvwSwwKL0utVfDOOrXFBiOJ5Ne1Dd94CyC39faEVNq8JbllryVL6PtNJ6q+ZSPmUJ
         t4DQ==
X-Gm-Message-State: AOAM530Od4OftVMeLWOcY87IfT7BXXD+qIgz8mIom4gCF8RN+bLXyP1F
	GgYk3eTX8s7PSkVC7IVOZfS/Q/XlnTwNeQ==
X-Google-Smtp-Source: ABdhPJwqUgDQWIRZTz0NVS/IbrEi3cyfXnhsjVtj+ctJ5C4dn55c7SS7Ge/aRSF9M7I5ePA0l2ICgA==
X-Received: by 2002:a17:902:d916:: with SMTP id c22mr35493855plz.69.1594051896989;
        Mon, 06 Jul 2020 09:11:36 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i67sm18225811pfg.13.2020.07.06.09.11.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:11:36 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/25] python3-libarchive-c: add the missing rdepends
Date: Mon,  6 Jul 2020 06:10:15 -1000
Message-Id: <50e0ae71813b736c576acbdfe3ed007979ae3149.1594050175.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594050175.git.steve@sakoman.com>
References: <cover.1594050175.git.steve@sakoman.com>

From: Mingli Yu <mingli.yu@windriver.com>

Add the missing rdepends to fix below error:
 # python3
 [snip]
 >>> import libarchive
 [snip]
 ModuleNotFoundError: No module named 'ctypes'
 ModuleNotFoundError: No module named 'mmap'

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b3a2615878bc7515a7bdace525dc27be45f158e2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-libarchive-c_2.9.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb b/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb
index 4983ae527a..3a2d8733e9 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_2.9.bb
@@ -12,6 +12,10 @@ inherit pypi setuptools3
 SRC_URI[md5sum] = "083bd2cb0043c1e22a52cb9a05e31532"
 SRC_URI[sha256sum] = "9919344cec203f5db6596a29b5bc26b07ba9662925a05e24980b84709232ef60"
 
-RDEPENDS_${PN} += "libarchive"
+RDEPENDS_${PN} += "\
+  libarchive \
+  ${PYTHON_PN}-ctypes \
+  ${PYTHON_PN}-mmap \
+"
 
 BBCLASSEXTEND = "native"
-- 
2.17.1

