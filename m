Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.19581.1621260861288584686
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TE1o4rDb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id 69so3209994plc.5
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WSffufEjTYMEZOHAzwMdUWJ20IJFShpKx624yLUQU00=;
        b=TE1o4rDbsPL4XwJdUkMtXHy/JOqMDiJIU9wURAj0ITSBOLvbARdkLnM/jdfs22OOND
         xDPkiK+2Qdkj9SYXAPHhxLPHPwYhPGPMt29jZjAC2T+hSG7LDDaXa48TgImq5BhhKRAc
         M4J9Enp7UeGBpv63vbkGxIxQWcLnfH7RyXsHmjTmwulkqD5xH7GrFd7cu1xU/pKmjaZ+
         Tx5H9WdQS0YSknsq1Ok8MOEcBjx46eNrlZrb0hGgtBR4m9gePtHeB9OeJX4RUTBhU25C
         0eg/6dKUBF/hWUsmrgozy05awVWwOx0FY7hjOUFf52nFC+KknBJ98/AWTBPLsqH8LUCX
         018g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WSffufEjTYMEZOHAzwMdUWJ20IJFShpKx624yLUQU00=;
        b=mG0Q37sewmWCTiSrbcyn3SquuF8Jb43+6+6WSgWc5M8UgIGe5FMIKtDeZPb8sKQbpv
         buy5HEkTlKY1aKkZ7zgDycw4U6w+9H+5Oschd6/Z0OJANb4dllAW92Y4pJgGAI2cfFfE
         99XGtNU+wDEbH8FWEfEu3EIfk1PVIW/KYrRzOEbpJlaRMHe9+BExMiPpa2ngxiUZYCZ2
         ae+UStvP0FRP2tuCIc994AcTamAf6t4DjB7wx5stHRP49yxUM6fsFFy0o2JApLITk88c
         eZwZrJlcXjZ1dXHI4eKebE2tV1drRWVlH7m1BFzoH/Veonh2ByXfeSXLy46YhmWQvgfH
         kDPQ==
X-Gm-Message-State: AOAM532js5pbBCyDH7vNlI8bzgqkh49lMmAaE/D3Nd0vG9UE9JlU/N2v
	FPX05xQrTUoCGOnWdIJ5LP8TeQMNikhQmzhe7AI=
X-Google-Smtp-Source: ABdhPJw0YZfeEsElmSRwz+EWsMLaevLimXu/ULG4S0uVr5mLqzVXeBjNpIT1RrXMp5Jka49SxmqZww==
X-Received: by 2002:a17:90a:ab13:: with SMTP id m19mr171268pjq.124.1621260860394;
        Mon, 17 May 2021 07:14:20 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:20 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 09/35] qemu: Exclude CVE-2017-5957 from cve-check
Date: Mon, 17 May 2021 04:13:15 -1000
Message-Id: <559ed3e62e542b7a4456a9a4eef8742ce8521dfb.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The CVE applies to virglrender before 0.6.0 which we don't have.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9b5355375d028577de0b98e05992de6a088cb972)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 7647e44726..86abd5ea49 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -61,6 +61,9 @@ UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 SRC_URI[md5sum] = "278eeb294e4b497e79af7a57e660cb9a"
 SRC_URI[sha256sum] = "d3481d4108ce211a053ef15be69af1bdd9dde1510fda80d92be0f6c3e98768f0"
 
+# Applies against virglrender < 0.6.0 and not qemu itself
+CVE_CHECK_WHITELIST += "CVE-2017-5957"
+
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
 
-- 
2.25.1

