Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755E8D5AE59
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 03:38:21 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.64442.1730950693418601830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 19:38:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AQLgqapr;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-71e5a62031aso369615b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 19:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730950693; x=1731555493; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t2wYOAaTW3XEL/aAWGm+9BZif0sztFfEAyk0VzWEZMw=;
        b=AQLgqaprD6R2RP459Kmwl+QHwSEmRsDquvfYDG3MGYhmuwlrUbjqyeBOHpZMkWVVnk
         UIArSczhFRY2CjkXJWItcLz9gOIlxlnVjbT+CbqXIymQQ0ud64lQMjwpwdYQJ6tIubiI
         eqG/HH4vQVJXpiXbt7KICwAAbzFbUzz3TjLBy5BOzMWxaGdmR1cv+zi0zHQQ+FG36LyF
         KQ6TICDS9gN9g92LkT4TANPgOd5cutjCm+KXx42uyn3B8t2xQcKNVmqIhAaHRBL4Jmu6
         1nxCU0FVe9McyexPsn5zwMRT1V41gUN7B3yFjgMP90dEMwBczd6CgyRXjlmH8tQzLxaP
         TkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730950693; x=1731555493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t2wYOAaTW3XEL/aAWGm+9BZif0sztFfEAyk0VzWEZMw=;
        b=mEGyY1uNsXdOmI1PJAwWtk1kAmfQUYfSLqHvAMPyZ95hE+3H/iPXGolNyWob6UdNFW
         garf7zDeFhzKOEX8SEi5Pv+QMlA3xsmVTGwd/FncfJMn1/BHdooHW00JdBaijaJ375lG
         t6DR9CPEl6UhqWEyu2T19Uefea4lsFCW2y4I+WhHzjSej2awUqNTVTLyJbEg6o7VQlj2
         aoHl1Ab0+V9KUBadZfRNABrOKGua5GJAmwOtaBIWOIXbD089fa78q9cq4qp5udi96/iy
         8vbC1KiCDszdvo/hW/wXHDpmaiFYNHICxlBldHxACjcP6R66c2w4GYqUxi81JieVplXr
         dk0A==
X-Gm-Message-State: AOJu0YwXW9qsJ055dXm7g3BB5/cBDBoyMA6e2/bJHfMqkV90PETWnykZ
	ahmbxxtyIr3aukSsdcwBecocLdrMS7gj2uCpzMOQQcNppCtdwHjMCZHr5qe2pcmHPk6YikZfAXn
	s
X-Google-Smtp-Source: AGHT+IFMqj5SnrLFUu78u3zCg5xzGq63hVFu/3/3gO2Cyc2/C7HWvW/jPxf3BFsq1ez6jVv2q7pdPA==
X-Received: by 2002:a05:6a20:3944:b0:1db:ebc5:2632 with SMTP id adf61e73a8af0-1dbebc5268amr14942205637.36.1730950692678;
        Wed, 06 Nov 2024 19:38:12 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078cd2bcsm366803b3a.84.2024.11.06.19.38.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 19:38:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/10] python3-lxml=v5.0.2
Date: Wed,  6 Nov 2024 19:37:47 -0800
Message-Id: <baa0ba7084533907c0735dcb58b4432e0b3072df.1730950520.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730950520.git.steve@sakoman.com>
References: <cover.1730950520.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 03:38:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206825

From: Martin Jansa <martin.jansa@gmail.com>

* minor upgrade to fix building with gcc-14 on host
* contains 31 commits:
  https://github.com/lxml/lxml/compare/lxml-5.0.0...lxml-5.0.2
  the important one for gcc-14 is:
  https://github.com/lxml/lxml/commit/663041a56a075a8fa1e6ca13ba4c6d1de7043ac2

* https://bugs.launchpad.net/lxml/+bug/2045435
* https://bugs.gentoo.org/917562

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/{python3-lxml_5.0.0.bb => python3-lxml_5.0.2.bb}    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-lxml_5.0.0.bb => python3-lxml_5.0.2.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-lxml_5.0.0.bb b/meta/recipes-devtools/python/python3-lxml_5.0.2.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-lxml_5.0.0.bb
rename to meta/recipes-devtools/python/python3-lxml_5.0.2.bb
index 66cb8b0938..c0b385c7ea 100644
--- a/meta/recipes-devtools/python/python3-lxml_5.0.0.bb
+++ b/meta/recipes-devtools/python/python3-lxml_5.0.2.bb
@@ -18,11 +18,10 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "2219cbf790e701acf9a21a31ead75f983e73daf0eceb9da6990212e4d20ebefe"
+SRC_URI[sha256sum] = "6399703c40ba53e2c3b72fdb56cb908d2b83c08082ecf17de839b27e68d1e598"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-PYPI_PACKAGE_EXT = "zip"
 
 # {standard input}: Assembler messages:
 # {standard input}:1488805: Error: branch out of range
-- 
2.34.1


