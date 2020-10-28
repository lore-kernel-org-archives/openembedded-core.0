Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web09.11072.1603900080221818679
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 08:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WdjME0/H;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: yann.morin.1998@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id h22so39719wmb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 08:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=krqbFjOt5cUzazx9qFKAVjXhgle9NVXr+NcOWCjE074=;
        b=WdjME0/HO6K1V/DkSnljs1ByxzemExlbfDDaA8F3GQbzTc+9MeAwg/gnJeHoHMzedK
         nYH16VwnsJgrsyYk9AMaVb3dHziuYBiGAWUJ/RG+vdIUynz9FML6dNiSdSOvjRkTApxs
         kMTngPlg8+WUprCe7hVcdaKgXfMwBgv+worhZGhUbb9zrtVjSMl+PEFUwrHYxK1X/hq8
         gMjHzr+Egg/uQ6ihgidsJcwGLGXvuen50CmO15B/fbKwAx1AvtMFi679xQaHk428Um+W
         0U683CSd8/OwHUa2WivND9aj2kds0lTa34SEflUkzCtXwnyiVw1xes5IRm6vLXLw9njZ
         0JMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=krqbFjOt5cUzazx9qFKAVjXhgle9NVXr+NcOWCjE074=;
        b=oY4J18qsO/ZqNz+PdiZCSZUXUwJFdYHCBvr+j2jWIj09YJwlKQ31kQLSSOghZX/LNT
         W7ZACFfxjdSYi8i4zEGC+KFMVpddzNE/YntFE9v5JE8BObVv0L80eAAulTpN59Hz6HV9
         cKtxnM6H7iC/OqjYTP44F86PMHBTr5gTKWyOFfAfw4fpEY6EqYzaeSRdBV93ZxQ/DUkp
         DjUZzFj6c6PoQKpWEWhpNqmMkwisBQbjEnJK5xlqUDn5O6cb7lJzgREcOm7KVMQGJsYu
         bvUVZBeOb4PABhOpgmwIEuviKHtRdXfw/GSacHZViqdfylFOBM165a5RZehCoQkSRk3t
         LLdA==
X-Gm-Message-State: AOAM531Qrbf0hpTkGymLnxq/jc2M0nMArETgqD+OwgW28PMcZleTOLI6
	Wl8tsWKJZy4WEtVV+AqIDkoFcFjNlNM=
X-Google-Smtp-Source: ABdhPJx1FHcclk+Yvxxmayld3WcrOxTuIaA6Bkk2kn8waKFp9fGdY85jl59eoxxeL2yjwAUA9xtxTQ==
X-Received: by 2002:a1c:c30a:: with SMTP id t10mr3557882wmf.183.1603900078679;
        Wed, 28 Oct 2020 08:47:58 -0700 (PDT)
Return-Path: <yann.morin.1998@gmail.com>
Received: from localhost.localdomain ([2a01:cb19:8b51:cb00:d91a:f1f4:94c3:a2ef])
        by smtp.gmail.com with ESMTPSA id k18sm7270848wrx.96.2020.10.28.08.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 08:47:58 -0700 (PDT)
Sender: "Yann E. MORIN" <yann.morin.1998@gmail.com>
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: openembedded-core@lists.openembedded.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexandre BELLONI <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/2 v2] recipes-core/busybox: fixup licensing information
Date: Wed, 28 Oct 2020 16:47:56 +0100
Message-Id: <cf08c92cb2bdd9958c9caca644b59a88142b4d53.1603900066.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1603900066.git.yann.morin.1998@free.fr>
References: <cover.1603900066.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 7d32417b4d (busybox: Correct the name of the bzip2 license)
changes the licesne from 'bzip2' to 'bzip2-1.0.6' on the rationale
that the 'bzip2 license was renamed from "bzip2" to "bzip2-1.0.6"
[...] to match the official SPDX identifier.'

Though the above is true for the bzip2 and pbzip2 packages, the bzip2
code bundled in busybox is a copy from the bzip2 1.0.4 version, not the
1.0.6 version.

As such, using bzip2-1.0.6 is wrong.

Unfortunately, there is no official SPDX license identifier for this
bzip2 1.0.4 version, so we just mimick the existing ones (bzip2-1.0.5
and bzip2-1.0.6) by using bzip2-1.0.4.

Also, there is a license file attached to that, so we add it to the
list.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexandre BELLONI <alexandre.belloni@bootlin.com>

---
Changes v1 -> v2;
  - none, but the bzip2-1.0.4 license is now in common-licenses
---
 meta/recipes-core/busybox/busybox.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 45aaa2b41c..e0522be729 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -5,10 +5,11 @@ BUGTRACKER = "https://bugs.busybox.net/"
 
 DEPENDS += "kern-tools-native virtual/crypt"
 
-# bzip2 applet in busybox is based on lightly-modified bzip2 source
+# bzip2 applet in busybox is based on lightly-modified bzip2-1.0.4 source
 # the GPL is version 2 only
-LICENSE = "GPLv2 & bzip2-1.0.6"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb"
+LICENSE = "GPLv2 & bzip2-1.0.4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=de10de48642ab74318e893a61105afbb \
+                    file://archival/libarchive/bz/LICENSE;md5=28e3301eae987e8cfe19988e98383dae"
 
 SECTION = "base"
 
-- 
2.25.1

