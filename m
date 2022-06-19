Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8F8C433EF
	for <webhook@archiver.kernel.org>; Sun, 19 Jun 2022 19:31:47 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.21954.1655667067667873709
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=jRO7V/iF;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id g186so8467911pgc.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 12:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QAEPZrNh6XuSEg58/phjidd4T/suM2kZoERDLF6aXhE=;
        b=jRO7V/iFkrZMo4KsXyOqVtxKCEYKs2Hp0WJhqU7vYtdmQddOxZ9GSiKmFxIf7XkPhx
         jkCJ75D83USkt5aygrnvWOCygObuKUBLe5Wso2crEZg6qentqHGwBAzwS7l2R2qhPdwA
         MODgsBwP42n0kKMbXb731GcEFiQHUh6pV/vEK2gTKMyseWupCy8Nh5VFmwQgvPh4y+bQ
         Ad0xVU9v8khjtXrpvdvKU4JYZJGOw6OKTLlFGNuV8H/93L1JkKS/rGB1npv03HZK6ihh
         j/v3Zi2FFwGtGQVfRkhOGjvbHWjDFZDFd2VMrlHcOoodCnIePckAs5GpgwqUcCXZYSQ9
         wxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QAEPZrNh6XuSEg58/phjidd4T/suM2kZoERDLF6aXhE=;
        b=BrY2zyXDQ+awXJq6VJ3KtyWfzH5o3DvK2AI9mxNC/HHiTZfu9oW/1MXxtOuQobp27M
         b6eoohHl/J3yRD+0EftK5CoilA3l+8b2sLW2awsEUlb7T5yCWO6nYR+kck+A273Y5aQU
         juj6xzq/uBXqVjINo7DbUe6simHmALl8brB8RQkJPNH+g/7ZVZ+2vWu3kR9LVgwNtXA7
         9MtqL0k2DFsJdGORTqxtx99q5atc+kq24hvLPnEHnbJtlIvzoYwCwstT/aZISpOsaQSN
         TQ8Hqmmj+QW8xzOVXtLGKMZs4Q1QqZRaoMi52N60GjXFal1DqyYqUEo2EnaTTtOaNhWy
         I4eQ==
X-Gm-Message-State: AJIora/JrgabrFBLKG8GXXRnhBFJg8IhyYRisd26XcUPCL/hJUlFoXBL
	M+SHe+dG4ERKD63OZAoste8VRzb7hTN/Cph7
X-Google-Smtp-Source: 
 AGRyM1vJQf+h+XbXt8E62p9FJSNrLO0WRWy8fEWcc+vi3ZEwNkc6rNtkK6jBbDjaFPTPy5E1nZIyBA==
X-Received: by 2002:a63:9558:0:b0:40c:7eb9:c419 with SMTP id
 t24-20020a639558000000b0040c7eb9c419mr6978774pgn.6.1655667097389;
        Sun, 19 Jun 2022 12:31:37 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 o2-20020a637e42000000b003fe4836abdasm7432886pgn.1.2022.06.19.12.31.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:31:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/15] liberror-perl: Update sstate/equiv
 versions to clean cache
Date: Sun, 19 Jun 2022 09:30:50 -1000
Message-Id: 
 <b2d10487f80deb04a0893325a1ae79c8629a7655.1655666951.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655666951.git.steve@sakoman.com>
References: <cover.1655666951.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jun 2022 19:31:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167061

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There are cached reproducibility issues on the autobuilder due to the PRServ
sstate checksum issues, flush the bad data out the system by bumping the
versions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b12e6cfe3bb34e426c8bb74183d041948cb2ed89)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/perl/liberror-perl_0.17029.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/perl/liberror-perl_0.17029.bb b/meta/recipes-devtools/perl/liberror-perl_0.17029.bb
index 497f480347..67e5811f3c 100644
--- a/meta/recipes-devtools/perl/liberror-perl_0.17029.bb
+++ b/meta/recipes-devtools/perl/liberror-perl_0.17029.bb
@@ -9,6 +9,10 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8f3499d09ee74a050c0319391ff9d100"
 
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
+
 DEPENDS += "perl"
 
 RDEPENDS:${PN} += " \
-- 
2.25.1


