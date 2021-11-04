Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9864DC433EF
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 19:48:44 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.2763.1636055313075890343
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:48:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CHuTyCAb;
 spf=pass (domain: gmail.com, ip: 209.85.219.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id v2so6014998qve.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EhE1YlWj9vdNK3h9SDxv9IoNUDPc1agwuLsbAU8jsPk=;
        b=CHuTyCAb3d2IhbM6+aHdTDIgLnaXffymAgOmWWD0ZQY5hBBfX/FHv4oB+9wPghvnsh
         CpLCJuJDjJZI3SbZw/7N00qrJePP76Bm4LNLv3UZnDvX8hSoCgh8lfFefkq62B4jmjFF
         v89qt/gaqvXF4bWg9gBv8YNuUuvf3nYu7DkfIexYcSEKb3PG84OV1GVZZ1rIc6sLy6wX
         XKhbutqhJeVQf3iozmV8yCrwX1/Qhe8MWwilApoI8dVXTkAdnEhSLsuEC1X4gHkxOMC0
         C/O6+3Y3Pp+PvhjGGeCJRaZKqfCX9dj3ocffdNUB42JPAhpgqNqwBWuV9fqmGqVYkNTD
         facA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EhE1YlWj9vdNK3h9SDxv9IoNUDPc1agwuLsbAU8jsPk=;
        b=5ZFjjJXoGjCNWSeUFS7I1r9LU5p0AMR9X9MMziEnYKxt9XZj7m6kaOMYRsmw5V/QsP
         o4oCHbdn5ffyK0nA7mjQNu3bOWXfnUahiz4rHq3rm/QqVVTsdTjmw7vyGxlGpXsburqq
         bR36Bl1kBliuD8aMMKnJhqgE/SOCgwnOAUZcServW/zMCDuSk/kql/4vkVSin6nwNid+
         Av7KmIv5iY7atWGOWm+kcJmWTtj1cI7SofrEqt4IeDf3tG5x31SBJJmBn+EvwQ8/CDc5
         kMUFtgBPMBI5GRw8Dv55G1tvb1TGdEC9Q9lI4u2H7afvcTKjoCMEpe86R68ThSWNf1WS
         Bkyw==
X-Gm-Message-State: AOAM5334uocwCKsB+nN3OpoCIyyETLSQCD38d6u+aB2imk7vjJX93Jzm
	JBI1RRwMteFgWdZpkwjmZhzNTqhCYg722Q==
X-Google-Smtp-Source: 
 ABdhPJxhRtUoyuS7wLAKVrZvZvWkNBlqEYXn4/9SDagyC1IubxwqQwKAauc3iXe/iCcteOkdNAdoRQ==
X-Received: by 2002:ad4:50c7:: with SMTP id e7mr34773257qvq.53.1636055312289;
        Thu, 04 Nov 2021 12:48:32 -0700 (PDT)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 br17sm4276771qkb.10.2021.11.04.12.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 12:48:31 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/6] linux-libc-headers: update to v5.15
Date: Thu,  4 Nov 2021 15:48:23 -0400
Message-Id: 
 <57d58cf2b9094e474cf01c17e475b0526ee969d8.1636054726.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1636054726.git.bruce.ashfield@gmail.com>
References: <cover.1636054726.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 19:48:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157865

From: Bruce Ashfield <bruce.ashfield@gmail.com>

No patches needed refreshing or removal, so we just update the
SRC_URI and pick up the latest uapi / kernel headers.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/distro/include/tcmode-default.inc                   | 2 +-
 ...{linux-libc-headers_5.14.bb => linux-libc-headers_5.15.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_5.14.bb => linux-libc-headers_5.15.bb} (81%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 58f49800c4..86a6b50433 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -21,7 +21,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
 BINUVERSION ?= "2.37%"
 GDBVERSION ?= "10.%"
 GLIBCVERSION ?= "2.34"
-LINUXLIBCVERSION ?= "5.14%"
+LINUXLIBCVERSION ?= "5.15%"
 QEMUVERSION ?= "6.1%"
 GOVERSION ?= "1.16%"
 # This can not use wildcards like 8.0.% since it is also used in mesa to denote
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb
similarity index 81%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb
index 282c04d79c..588cc3acd1 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.14.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.15.bb
@@ -14,7 +14,7 @@ SRC_URI:append = "\
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-SRC_URI[md5sum] = "a082ef5748b813abca0649dab8be5f52"
-SRC_URI[sha256sum] = "7e068b5e0d26a62b10e5320b25dce57588cbbc6f781c090442138c9c9c3271b2"
+SRC_URI[md5sum] = "071d49ff4e020d58c04f9f3f76d3b594"
+SRC_URI[sha256sum] = "57b2cf6991910e3b67a1b3490022e8a0674b6965c74c12da1e99d138d1991ee8"
 
 
-- 
2.19.1


