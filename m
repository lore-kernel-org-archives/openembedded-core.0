Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5703AC6FA89
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 14:18:20 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web09.5355.1663078698434906878
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=0A83M3Cu;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id jm11so11937895plb.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Sep 2022 07:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=qJ3upSDBw+DjNQv5MvwKJgt54tVehWia6d6emsTpIY8=;
        b=0A83M3CuikbdPJdCTxyAu3ycPxlmoz8cDhhzz1ZnACpToibPqxsEdaUT+VzXQX01/B
         BTctazoAaSwmq/ci0xsPCTqLVOl9Y4WuXcih6RAmSU4hF85EoIo5UsDgG1LjT0a9BZHj
         X/4xElIn6Tz1glVQOk5cwWaMRxclWi7dpeemKpG+g9pgL2Ij9/IQBZoz6yt0zxzdC3gy
         hAkjMK3BzhrKGQrLEFP4SEDebzaDWcqyoKa93XeStmLTCbzkC/LZtlFzMgaktctlIREu
         LmA+OiZQxUSlS09VQDNH6q5JE9YC2/41dFMKJecMdzKsn8mt4S39MY1tXUV0Zp/ndAnB
         YXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qJ3upSDBw+DjNQv5MvwKJgt54tVehWia6d6emsTpIY8=;
        b=2TD0T3IXoBWnqwJjb/mDMwbp3b88GxWtg1UNff8CvAwxNqkzIGkjkuID/5iC6tTmm/
         QJoSh1SL3G2RCYWHpAft0bPRZC1CL2zKAOMxZ7oz5dwxf/66GXi9GZzQgYxiaFxWgRXN
         nwOB/6Vo3TTGA1hlH104+Bowsfu0nCg8kYlxSkzF2jL7rbL6MULRssd4umUlXSD+zVnB
         Vi7KJzQJ0EAoTCUAJ0uzyjQEOc4AoNGyVAgm2CJ/QSCl+GcNepUWDC0WQ2Luqy/ys1gd
         CzkNaVi+nul0S0erRH2QwErJoTGWNLnP+RywN+nGgAGBZmxoZgMKagOQ1yz2IP0Ady1j
         +hyA==
X-Gm-Message-State: ACgBeo1UcQs6b3BwbrOu7VhqCTjoelmv52MmJkLwpVImwnwxvbi2ZA/H
	XEQXDNCX9EUZSgEtwE4o6THaO9McO7mb3ydY
X-Google-Smtp-Source: 
 AA6agR6hWQ7CCDG22J3qpu7M/o8hdC+GFedJ6/vKK4WkL+cYgGLn/fdtf6g9m98wzapMTIuvpR9NVQ==
X-Received: by 2002:a17:90a:4805:b0:1f5:39ab:29a9 with SMTP id
 a5-20020a17090a480500b001f539ab29a9mr4217245pjh.202.1663078697438;
        Tue, 13 Sep 2022 07:18:17 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 g11-20020aa796ab000000b0053bf1f90188sm8086424pfk.176.2022.09.13.07.18.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 07:18:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/16] vala: upgrade 0.56.2 -> 0.56.3
Date: Tue, 13 Sep 2022 04:17:43 -1000
Message-Id: 
 <90b0762aff8b11e781f2d492fd7af7707bc623a1.1663078051.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663078051.git.steve@sakoman.com>
References: <cover.1663078051.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Sep 2022 14:18:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170581

From: wangmy <wangmy@fujitsu.com>

Changelog:
==========
 * Various improvements and bug fixes:
  - vala: Don't unconditionally expect ObjectType of Class [#1341]
  - vala: Make try-statement parsing more resilient [#1304]
  - vala: Avoid problems with '\' in #line directives on Windows [#1353]
  - gidlparser: Set source reference of parameters

 * Bindings:
  - atspi-2: Fix a few binding errors
  - glib-2.0: Use g_abort for GLib.Process.abort() beginning with 2.50 [#1350]
  - gtk+-3.0: Correctly unhide BindingSet.by_class to avoid Version attribute

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 29d2f8241312a7f0bda39805d41cd6789d369ce9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/vala/vala_0.56.2.bb | 3 ---
 meta/recipes-devtools/vala/vala_0.56.3.bb | 3 +++
 2 files changed, 3 insertions(+), 3 deletions(-)
 delete mode 100644 meta/recipes-devtools/vala/vala_0.56.2.bb
 create mode 100644 meta/recipes-devtools/vala/vala_0.56.3.bb

diff --git a/meta/recipes-devtools/vala/vala_0.56.2.bb b/meta/recipes-devtools/vala/vala_0.56.2.bb
deleted file mode 100644
index 08c8ccca1d..0000000000
--- a/meta/recipes-devtools/vala/vala_0.56.2.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-require ${BPN}.inc
-
-SRC_URI[sha256sum] = "66c9619bb17859fd1ac3aba0a57970613e38fd2a1ee30541174260c9fb90124c"
diff --git a/meta/recipes-devtools/vala/vala_0.56.3.bb b/meta/recipes-devtools/vala/vala_0.56.3.bb
new file mode 100644
index 0000000000..83f61e5b2f
--- /dev/null
+++ b/meta/recipes-devtools/vala/vala_0.56.3.bb
@@ -0,0 +1,3 @@
+require ${BPN}.inc
+
+SRC_URI[sha256sum] = "e1066221bf7b89cb1fa7327a3888645cb33b604de3bf45aa81132fd040b699bf"
-- 
2.25.1


