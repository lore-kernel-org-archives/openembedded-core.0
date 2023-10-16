Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2D6C46CA1
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 14:44:10 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.127607.1697467446332706506
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 07:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=CPPJX4+Y;
 spf=pass (domain: mvista.com, ip: 209.85.216.54, mailfrom: sdoshi@mvista.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-27d2b814912so2264198a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 07:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1697467445; x=1698072245; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLORWbtSv8maTRcB1Sw4WAzodUMTXqP/3r2znmDX5ns=;
        b=CPPJX4+YjRjKTyCT+jC6TGQLyM2wMB/OSchkgrKJDn3sCviJhXCaJQiNtdT1L1rHZk
         gNbyMaeE5g7pxOgMXn67lX1dC5oQkj8HVzgwKtzaDjTNrX6DWlQa8KbGXUsBtuysuVXa
         klzeqnenunD1Ny6/PdzgP9IMKjuRABvlT4/2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697467445; x=1698072245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLORWbtSv8maTRcB1Sw4WAzodUMTXqP/3r2znmDX5ns=;
        b=xLSj7ZvM8DffIcrbtwf61kjgaEliJqXG4OXdR903/PgcTFMJ3H15NudvcHUZhIOV7Q
         JNW0paeVArQakfWngipQqGDt1zOE2ucBZJFrZUGPMQ1IMTx7sbZ+RUmPS0AAqEMqT9rC
         DL60ZLrLZR3FDGp77w8DfJzuc62/I0WkDRaG+NOtgA++JIbOX/2yT/zbCAkHlE3MMIzx
         5wyGuMZDeUMQnBP3qlIDhhNKf2/+nNoJ84zC1vCnmRBusEqZahJWRTCozS247F1ttdin
         sJgZ2h+kHwdql8SL+kH92XAniVK7Ymqnotbw5nmOEOnl07NNxeF7EsbQc+kSVsGJaBsy
         JCmA==
X-Gm-Message-State: AOJu0YyATilvDZy/sgE4jHs1AoZbSLZ05xbeHGSnG6VK6yB/3G3TKeYb
	fZdNCAWUoCqUPqZol1wyY1Xtv4VF9AVgV7mdFEY=
X-Google-Smtp-Source: AGHT+IEfkH5DrMBifCsy+KZ2/EU3FGMhVp6sNml+qbhoCRo222qKTi1IynhJHh5SIxXXTYfehBMHBA==
X-Received: by 2002:a17:90b:4fc2:b0:27d:3c30:64bc with SMTP id qa2-20020a17090b4fc200b0027d3c3064bcmr6499985pjb.34.1697467445310;
        Mon, 16 Oct 2023 07:44:05 -0700 (PDT)
Received: from localhost.localdomain ([157.32.79.139])
        by smtp.gmail.com with ESMTPSA id az7-20020a17090b028700b0027360359b70sm4735948pjb.48.2023.10.16.07.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 07:44:04 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][dunfell][PATCH 2/2] libxpm: upgrade to 3.5.17
Date: Mon, 16 Oct 2023 20:13:50 +0530
Message-Id: <20231016144350.312086-2-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231016144350.312086-1-sdoshi@mvista.com>
References: <20231016144350.312086-1-sdoshi@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 14:44:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189296

From: Siddharth Doshi <sdoshi@mvista.com>

- This upgrade includes multiple security fixes.
CVE-2022-4883
CVE-2022-44617
CVE-2022-46285
CVE-2022-44617
CVE-2023-43788
CVE-2023-43789

- Removed CVE-2022-46285 as it is already fixed by this upgrade.

- License-update: additional copyright holders
f0857c0 man pages: Correct Copyright/License notices
Due to this commit LIC_FILES_CHKSUM is changed

- Disable reading compressed files as that requires compress/uncompress executables.
Following the approach in oe-core/master:
7de4084634 libxpm: upgrade 3.5.14 -> 3.5.15

- Add XORG_EXT to specify tar.xz as upstream has switched from bz2 to xz compression.

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../xorg-lib/libxpm/CVE-2022-46285.patch      | 40 -------------------
 .../{libxpm_3.5.13.bb => libxpm_3.5.17.bb}    |  9 ++---
 2 files changed, 4 insertions(+), 45 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxpm/CVE-2022-46285.patch
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.13.bb => libxpm_3.5.17.bb} (68%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm/CVE-2022-46285.patch b/meta/recipes-graphics/xorg-lib/libxpm/CVE-2022-46285.patch
deleted file mode 100644
index e8b654dfb2..0000000000
--- a/meta/recipes-graphics/xorg-lib/libxpm/CVE-2022-46285.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-CVE: CVE-2022-46285
-Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libxpm/-/commit/a3a7c6dcc3b629d7650148 ]
-Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
-
-From a3a7c6dcc3b629d765014816c566c63165c63ca8 Mon Sep 17 00:00:00 2001
-From: Alan Coopersmith <alan.coopersmith@oracle.com>
-Date: Sat, 17 Dec 2022 12:23:45 -0800
-Subject: [PATCH] Fix CVE-2022-46285: Infinite loop on unclosed comments
-
-When reading XPM images from a file with libXpm 3.5.14 or older, if a
-comment in the file is not closed (i.e. a C-style comment starts with
-"/*" and is missing the closing "*/"), the ParseComment() function will
-loop forever calling getc() to try to read the rest of the comment,
-failing to notice that it has returned EOF, which may cause a denial of
-service to the calling program.
-
-Reported-by: Marco Ivaldi <raptor@0xdeadbeef.info>
-Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
----
- src/data.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/data.c b/src/data.c
-index 898889c..bfad4ff 100644
---- a/src/data.c
-+++ b/src/data.c
-@@ -174,6 +174,10 @@ ParseComment(xpmData *data)
- 		notend = 0;
- 		Ungetc(data, *s, file);
- 	    }
-+	    else if (c == EOF) {
-+		/* hit end of file before the end of the comment */
-+		return XpmFileInvalid;
-+	    }
- 	}
- 	return 0;
-     }
--- 
-GitLab
-
diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
similarity index 68%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
index 8937e61cb5..4694f911be 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.17.bb
@@ -11,19 +11,18 @@ an extension of the monochrome XBM bitmap specificied in the X \
 protocol."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=51f4270b012ecd4ab1a164f5f4ed6cf7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=903942ebc9d807dfb68540f40bae5aff"
 DEPENDS += "libxext libsm libxt gettext-native"
 PE = "1"
 
 XORG_PN = "libXpm"
+XORG_EXT = "tar.xz"
+EXTRA_OECONF += "--disable-open-zfile"
 
 PACKAGES =+ "sxpm cxpm"
 FILES_cxpm = "${bindir}/cxpm"
 FILES_sxpm = "${bindir}/sxpm"
 
-SRC_URI += " file://CVE-2022-46285.patch"
-
-SRC_URI[md5sum] = "6f0ecf8d103d528cfc803aa475137afa"
-SRC_URI[sha256sum] = "9cd1da57588b6cb71450eff2273ef6b657537a9ac4d02d0014228845b935ac25"
+SRC_URI[sha256sum] = "64b31f81019e7d388c822b0b28af8d51c4622b83f1f0cb6fa3fc95e271226e43"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


