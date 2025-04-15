Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05AEC369AB
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 18:29:57 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.1605.1744741787658411207
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 11:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oo/2Fb7j;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: festevam@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7376dd56f60so4032902b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 11:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744741786; x=1745346586; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6fKKyyzrUDQkrjihTtFSmQsG/RHoWUK/FAtm5mF6DdM=;
        b=Oo/2Fb7j65N9dWBuVwiP8mc/Eja0qmj0zGm4lrOJExSTYdX1hKHIooqiZDuv7ZilHb
         g0x8dodLvzO4t7ql80lfLBlXlSOuajy1j988OLgymlI9PuokSZcIVufqMg0A75su1fVH
         qUHdp71aRBU5MBfRjZ3CW0LKA+8FMUhxgA5OR5ZnJ/c/cCTq6elKVRD09nzjsf7zkr1X
         rLLrRuAGD0uf2mUK5/hB+rsgxt/aDrJbIjPXFHyIpymVnw8x9QiH4Zfo/JboIMPyzIv9
         geQoK53cmFaL/hXJC8nKBzgSeeF5ce1FEyfe/i81lZetl/r9pTSpYwU5yhUw+iTqD/3T
         b9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744741786; x=1745346586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6fKKyyzrUDQkrjihTtFSmQsG/RHoWUK/FAtm5mF6DdM=;
        b=uHH95R8f01EnugJjVzVX70+3tkz0AG7PCAfUNmqgBQNIwglHylV8udfEGgoRsAVodB
         LxlyiE5QQ2V3dyOD4OyAunc2VzzqE/mLwpCQS3wCRjQ6N3WjEM766VmS6FnApUMf9JWy
         CImqDHzu/Rrl7rqUWHrtRfg2RNMjKDEk20+wNeZRw4KhY27IA54emhtITFsvw0/KW+0k
         docaZui00Rrr4cJFHp81LHk0iGjPU/hEY6i4zvnCXDer+zNUXMaJb4jECPlWC5b6zL/V
         G69FQtazCxc3CKB2zEkxnOujILUpaVcpEmMZd0050RVbKKXOkhBqgtVJG+FSQz0bfdqM
         dwXQ==
X-Gm-Message-State: AOJu0YzY9DF45ybpIh5NR1OGCMLGy+w8apc28lb0KVCudBU3pmCaZxtl
	6vadjnExVjsb/zokeAFb/qV7gKQr5aa00/zi4WI6qD64Ih6RI66tNQpI7w==
X-Gm-Gg: ASbGnct4M37Sm0CxicWbjzUcQdOC8omNoeVNpWsWmi5ffWNg1l+8ufyQ0vn35CIQQwc
	q4wyPYlaS80lz/YRzvIzSV/byDHQKbLXS9f0Sl5jA2bW3pck6YHEFng3NCNRaWhgC2bBgOJ1Z3Y
	ga3hlcAfZCtvCxZf4AVboYMPHl6OKxRWlc+oOTHzCczeKGiyiSb8OeFdGi7nAHbh6Zq21KT/GGM
	BO+fSDbgT/zDcvucZuF5mqcLvo+aLrdJkj/AJN7bDFzej9fSFRBUTbHZD+kWlKU/KGT9Wd7rF4K
	puUe6Jkl+mSwHCbxUcQba45iL5xYsbI1ldm2dNlHZ/WDu1Z6GqJNva0=
X-Google-Smtp-Source: AGHT+IEpux5kTtnuAsacfrOMsSyn73aVPKXy5ic1z0QFQ2aHpcIT7JR9uF40CZyudlZqYfJ3dtJDGA==
X-Received: by 2002:a05:6a00:b44:b0:739:4723:c4d7 with SMTP id d2e1a72fcca58-73c1fb5b584mr691426b3a.22.1744741786492;
        Tue, 15 Apr 2025 11:29:46 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:bf07:f4ce:a52a:db16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230e31dsm9091761b3a.141.2025.04.15.11.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 11:29:45 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: marcel@ziswiler.com,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v3] bmaptool: upgrade 3.8.0 -> 3.9.0
Date: Tue, 15 Apr 2025 15:29:39 -0300
Message-Id: <20250415182939.926382-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 18:29:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214961

From: Fabio Estevam <festevam@denx.de>

Update to the 3.9.0 version.

This version has switched to use hatch as the build backend, so adjust it
accordingly.

The INSANE_SKIP can now be safely removed as explained by
commit 824009560776 ("bmaptool: temporarily silence the pep517-backend warning").

python3-six is no longer a runtime dependency since bmaptool
commit a67976e80daf ("Remove six from production code"), so remove its
RDEPENDS entry.

Signed-off-by: Fabio Estevam <festevam@denx.de>
Reviewed-by: Marcel Ziswiler <marcel@ziswiler.com>
---
Changes since v2:
- Fixed typos in commit log. (Marcel)
Changes since v1:
- Remove python3-six from RDEPENDS.

 meta/recipes-support/bmaptool/bmaptool_git.bb | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-support/bmaptool/bmaptool_git.bb b/meta/recipes-support/bmaptool/bmaptool_git.bb
index c38f05e1a1..155dd0ac80 100644
--- a/meta/recipes-support/bmaptool/bmaptool_git.bb
+++ b/meta/recipes-support/bmaptool/bmaptool_git.bb
@@ -10,23 +10,20 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/yoctoproject/${BPN};branch=main;protocol=https"
-SRCREV = "2ff5750b8a3e0b36a9993c20e2ea10a07bc62085"
+SRCREV = "618a7316102f6f81faa60537503012a419eafa06"
 S = "${WORKDIR}/git"
-BASEVER = "3.8.0"
+BASEVER = "3.9.0"
 PV = "${BASEVER}+git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 # Need df from coreutils
-RDEPENDS:${PN} = "python3-core python3-compression python3-misc python3-mmap python3-setuptools python3-fcntl python3-six coreutils"
+RDEPENDS:${PN} = "python3-core python3-compression python3-misc python3-mmap python3-setuptools python3-fcntl coreutils"
 
-inherit setuptools3
+inherit python_hatchling
 
 # For compatibility with layers before scarthgap
 RREPLACES:${PN} = "bmap-tools"
 RCONFLICTS:${PN} = "bmap-tools"
 
-# Poetry backend appears incomplete, upstream has moved to hatch
-INSANE_SKIP = "pep517-backend"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.40.1


