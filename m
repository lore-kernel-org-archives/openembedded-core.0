Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51062C41513
	for <webhook@archiver.kernel.org>; Sat, 22 Jun 2024 11:58:17 +0000 (UTC)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
 by mx.groups.io with SMTP id smtpd.web10.95805.1719057492678919249
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Jun 2024 04:58:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=GUW5d1rF;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.179, mailfrom: steve@sakoman.com)
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3761c390286so10061395ab.1
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 04:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719057492; x=1719662292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p4AjnJhoMzTtgASdCpOdAhy343zjCCjJYBrkualSoeQ=;
        b=GUW5d1rFVr9ZnkdPBkQtgB42QtbeqSDbcbEwoOLlfo+QAt+Cd6QBOZHaLpweckqpMA
         n7Y96aoKr98eoKTl4PNcP6a6/or9vZtJ2ASnOeiHDy+348vZvjbTTsHY457h8zRAveG0
         ZJTpVL/9c/05rL5+3Ud9UPbxz0uUFRk7LbcCMjAPuHuSmqzwhEgsrJcrvhIu2iHwORBB
         Cfh1I+WdVo55avJIhDiKTTtfCT5wA3wwxZorIvwyXFGf23/Pzyzzr5Q8Ay9zLQyMUn2z
         t8OZbThaPvWdHclLX/GaFnB4lOU6eQsK1jHUdeleyV3V9n4IRYQvzkkj4seVsLURFuDO
         BfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719057492; x=1719662292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4AjnJhoMzTtgASdCpOdAhy343zjCCjJYBrkualSoeQ=;
        b=H1yJzyuunfjtZB2lTG2WKiKZELR6igq/CYp/LqNeIFQ1tFVWEzkwvfzt8D80ruRsvL
         PzENv2UFQL70/3YFwjJU+IkDUxhUQOJAfVLd7CvIe5A7yhuw9y8PKPX/K60pwkUWYUxn
         kdA33ORQrogDgwFbsUGjSHA4PDxMTUk685TmzLnLLGAvar8IdMHooEaB5s8AUIH2P612
         bbuB90Gmkbpxb/4dNUjSGfI9bd4x5XYOlI4I9krOvGanMPCUPzVOy8p2pPzHbYOhygHQ
         e/6fEwbB2rbIvYkSfKKe9yK8fo9erxmTxmkim24FNzUWz3LJLbXtHg0TTb7x9+i5AWAY
         7DEQ==
X-Gm-Message-State: AOJu0YwG/w8IrZP6v5WhZEo+wxM9YvK+5i03K7HHNMPl2GfCNpTkn+JN
	5ad9DEvk3IeSyy7vSIgeZMapAc6VNgonvbir9byJNOdU0twaL12gHSk9/6w73QQwSJIjwyHoU30
	n
X-Google-Smtp-Source: AGHT+IFJ/yBpAfuatPHPjFS0oJB1ZbbY8eKeG0Tgs7jnCVdGrIhIVcYAGWsaReIOli7CpFZC0QqxeA==
X-Received: by 2002:a92:c266:0:b0:375:e06f:4b79 with SMTP id e9e14a558f8ab-3761d727d3fmr109312275ab.31.1719057491688;
        Sat, 22 Jun 2024 04:58:11 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-716b364687bsm2101074a12.12.2024.06.22.04.58.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 04:58:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 9/9] man-pages: remove conflict pages
Date: Sat, 22 Jun 2024 04:57:36 -0700
Message-Id: <fbc8f5381e8e1da0d06f7f8e5b8c63a49b1858c2.1719057291.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719057291.git.steve@sakoman.com>
References: <cover.1719057291.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Jun 2024 11:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201047

From: Changqing Li <changqing.li@windriver.com>

Remove the pages which libxcrypt and shadow already have to avoid
following conflicts during install man-pages and libxcrypt/shadow at the
same time.

Error: Transaction test error:
  file /usr/share/man/man3/crypt.3 from install of
  libcrypt-doc-4.4.33-r0.x86_64 conflicts with file from package
  man-pages-6.04-r0.x86_64

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 605b4a91dc44d33bd4742841e71645275bc039e8)
Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/man-pages/man-pages_5.13.bb | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-extended/man-pages/man-pages_5.13.bb b/meta/recipes-extended/man-pages/man-pages_5.13.bb
index f8602c699e..9afa9274a8 100644
--- a/meta/recipes-extended/man-pages/man-pages_5.13.bb
+++ b/meta/recipes-extended/man-pages/man-pages_5.13.bb
@@ -21,17 +21,12 @@ do_compile[noexec] = "1"
 
 do_install() {
         oe_runmake install prefix=${prefix} DESTDIR=${D}
+        rm -rf ${D}${mandir}/man3/crypt.3
+        rm -rf ${D}${mandir}/man3/crypt_r.3
+        rm -rf ${D}${mandir}/man3/getspnam.3
+        rm -rf ${D}${mandir}/man5/passwd.5
 }
 
 # Only deliveres man-pages so FILES:${PN} gets everything
 FILES:${PN}-doc = ""
 FILES:${PN} = "${mandir}/*"
-
-inherit update-alternatives
-
-ALTERNATIVE_PRIORITY = "100"
-ALTERNATIVE:${PN} = "crypt.3 crypt_r.3 getspnam.3 passwd.5"
-ALTERNATIVE_LINK_NAME[crypt.3] = "${mandir}/man3/crypt.3"
-ALTERNATIVE_LINK_NAME[crypt_r.3] = "${mandir}/man3/crypt_r.3"
-ALTERNATIVE_LINK_NAME[getspnam.3] = "${mandir}/man3/getspnam.3"
-ALTERNATIVE_LINK_NAME[passwd.5] = "${mandir}/man5/passwd.5"
-- 
2.34.1


