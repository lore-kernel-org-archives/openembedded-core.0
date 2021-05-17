Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.19517.1621260878209344997
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 07:14:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=yfkiiYen;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.179, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f179.google.com with SMTP id t4so3209399plc.6
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 07:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=nThOSCN4ejdomCCAKpVKK+Ivxw/xOkDSeqO1owqL3W0=;
        b=yfkiiYenDBd4olZi5Vgy8q28PMFn0Nis0pZALhuGnG9rpNACIB63HEPuES1DcYtyQA
         NmDZY1TTophS5O6s3EyfiMPDQFcb1gPpaBkHKCIpV47QnjLaY5aqVC96M6HSp6JhQDe5
         4DkEO6kEQxMNq8l6cUlLD4MTeo5eQC1yTVQABBk7tUGwUJ9LF2qMofANprFM++2rQ+E1
         tlHSizT+WPUvThMsLRwI9bpxfgfvMjZfOOucxRUqtk3iBkFGoi3zBKpwPw+A3jRKmkBg
         GVYKDmEgLg6f+oWTlBXS1wKSWGBTZOCFL0+eOLBH3fNgVJ2lJOYkbehM6qXBT8rChhoR
         28tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nThOSCN4ejdomCCAKpVKK+Ivxw/xOkDSeqO1owqL3W0=;
        b=lizY8sahd3cEXzzef47k04em39jh5hc+ZjyhaSCpcLwRd8vDUp4VgKeALtUpkLI2WE
         x7Hpc/VkPNZrY+lygn7NHrA9H2SYQ4sPiRbxpIKtiT66ibq8K2hI0+yvGVm8Foygg4Zm
         px/H82CixesHqDkbd+KEPDtI8njsyW758398UkL7TpP96C5yLmDggInmuJFT5Lo5xw7L
         VD1DvEiD1S29Re0XSTWIWjK7cjsHh9Qr7EMkEQkIvJZ7tW/ju+rA50oveveOSsGcmYr7
         44XK+65o9/6hcQRtMcA5OWz1uVB6GNjVHiy4w9/DkYwXA9/BOBUmYxSpZVNMX7spKzSb
         C5og==
X-Gm-Message-State: AOAM530KtIBX4NA9Iq6cY1xiFIffSeEvI+Di85KNQEzT+mbGNzU8UJvj
	SUit+tcgn97gwa7/BUTLtHD07AfP99AyV083dtQ=
X-Google-Smtp-Source: ABdhPJykhHMel5bC4q3NRMxMkXRbBAv+KUhwbjVYHLqoCEeACp4or10O0aF5Xcc9UvR07oGExrS74Q==
X-Received: by 2002:a17:90b:4812:: with SMTP id kn18mr18614726pjb.188.1621260877299;
        Mon, 17 May 2021 07:14:37 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 66sm11292660pgj.9.2021.05.17.07.14.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:14:36 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/35] cpio: Exclude CVE-2010-4226 from cve-check
Date: Mon, 17 May 2021 04:13:23 -1000
Message-Id: <0f759992b7713e9664a4276a068a65f5e638fe33.1621260695.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1621260695.git.steve@sakoman.com>
References: <cover.1621260695.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Issue applies to use of cpio in SUSE/OBS, doesn't apply to us.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 915b38c54a7932744a9f56713d1c6bd00a789331)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/cpio/cpio_2.13.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-extended/cpio/cpio_2.13.bb
index 9e35a80f8b..6536257993 100644
--- a/meta/recipes-extended/cpio/cpio_2.13.bb
+++ b/meta/recipes-extended/cpio/cpio_2.13.bb
@@ -16,6 +16,9 @@ SRC_URI[sha256sum] = "e87470d9c984317f658567c03bfefb6b0c829ff17dbf6b0de48d71a4c8
 
 inherit autotools gettext texinfo
 
+# Issue applies to use of cpio in SUSE/OBS, doesn't apply to us
+CVE_CHECK_WHITELIST += "CVE-2010-4226"
+
 EXTRA_OECONF += "DEFAULT_RMT_DIR=${sbindir}"
 
 do_install () {
-- 
2.25.1

