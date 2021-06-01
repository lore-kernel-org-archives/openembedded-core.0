Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web08.58653.1622557146325824378
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ZnRRnh1c;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id q16so6955659pls.6
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rzKhWURLbaBXwQxr7iXSajVVOMk1lWDrdj3BOhtiaoU=;
        b=ZnRRnh1cub+SCwQRLJ7mngmKzk5wg7cFreYDvZC5BVOy3mQLM9bIs67FxKp+L+TCL4
         t9LZg5qChgEicH0sobap5fn73gd8SiGxca/RrxlPz9lWl5R+Oxv1aBLu8m4E1oHW+Wa+
         voSdQCxfDF6M7cO+B8lqNMIO9meHkl++a3JJSv/dJ/qpfrLg6BYUuxrq0L1G0ZPpT76W
         mG5oBPufeTNGeAPy8QT4AYHeLW+9+yWJaF6hQRTrbwhE0YVOvcwBb8yxquiNLbLVulKF
         HvHPDpadewhQ01uzJrqMqSokPkWnIajQMPhnoDgA0LM1aV3MlE4g7zqC0Mc6HJW8tab6
         bafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rzKhWURLbaBXwQxr7iXSajVVOMk1lWDrdj3BOhtiaoU=;
        b=iGrTQd+A1Vbsj5OsxBJEnlS737gO+gEmwAfejh2Wu0qTXNWvX2CSujnmuJzyledVYU
         fvanv5RO+mER4qhs3c/R/uaROY4oUeCFgJycsc5qENv6K2nPd0b+sHa2kQ01unsNYC8i
         DsGqf9eKHmE0CS/EBhm98tzEQPQHk2eTnSZsqv8WBL5k/CVds21D2Skt7wRZJVvd9GB6
         oseotKWwXXfFg6i9lf8KA/C1W4r9yJIEde9iHJ9p2EKUTXY08G9YpX2XBgOg2kMN5L7M
         86OuZMOfO4jG8cPgoDiB4HoUVErH4XwqppjW6/zBYsQSo9nHhmfE9OiFtD2ymZ4F7km5
         VIYw==
X-Gm-Message-State: AOAM533uYnbCijd8pqopXHPUVSRVXmh3yODV4vUyqdlTBk9NXOpFDBAl
	Aof8XPMjlk5T50XKQ5FZr4ehtMHBR8Fl1pYQrVA=
X-Google-Smtp-Source: ABdhPJyyIpUByoRK7+y7nCX9gVVe2CIFopwR0P8u9LC5A6AZqJNOgkJ8Tu7VDy5dFVQpG7h1gttkmg==
X-Received: by 2002:a17:902:7fc1:b029:f9:2580:8183 with SMTP id t1-20020a1709027fc1b02900f925808183mr25960622plb.63.1622557145439;
        Tue, 01 Jun 2021 07:19:05 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.19.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:19:04 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 16/26] grub: Exclude CVE-2019-14865 from cve-check
Date: Tue,  1 Jun 2021 04:18:04 -1000
Message-Id: <a731386873f9c93c211be30ca8a8f42a9d8d6de3.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622556919.git.steve@sakoman.com>
References: <cover.1622556919.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The CVE only applies to RHEL.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8cfc3ebe50facb7e34e778f3e264b26cfae20a04)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/grub/grub2.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 2c55852ef0..180e3752f8 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -13,6 +13,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 CVE_PRODUCT = "grub2"
 
+# Applies only to RHEL
+CVE_CHECK_WHITELIST += "CVE-2019-14865"
+
 SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch \
            file://autogen.sh-exclude-pc.patch \
-- 
2.25.1

