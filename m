Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.7716.1614526646199866602
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 07:37:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LeYqlECp;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id p1so12847582edy.2
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 07:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tBrGPvk0DR7Ow96+DkLDorTmAfDgNsQ+iWl/u80tFfs=;
        b=LeYqlECp9Js0X1cHMYRY98EmyiBiXlNgCDZVlYsewCKxUb7ak4k4+Qh8DUJgSWLsuD
         WcwNxOubbrtXwTp/D/P5U8r4MIN2NDBR17ub+BMQ3ZhZrVpK5J37bRn9VLniATjYzlY9
         HA5tP92iOUSFNnUCLs9dWeDV1QMn9zeoaYeAKN8MTLM69fJkqVK/SNxel8bFYNsuXcXP
         LbHcOV2hH5vQkXXwsY22bm7YdZ4+8T836EXTUkKdinEu4JA0KFRcTIPTgyzcwtfpILh+
         1HW1KI9XuzwkfOJHAZ40yKzo1jT8q8CnR1UnPLcKqxflBY9+lXeQWFlSweRZmzWAvbbA
         J2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tBrGPvk0DR7Ow96+DkLDorTmAfDgNsQ+iWl/u80tFfs=;
        b=hRbSE3Ytf2Lug7SJqzfPrM3mA2SZpjq69JtcgwD2PmbtPwv+1WweIubA33rXqKY0pr
         1+uuPQMs3zkWulgTRkFoKxslQv3BAmbH4/gMDjIZn88imoR3KdeHAqSW2KW4FCAg3czb
         I1LdB0arOkC51DhwX+M81bs0Nxt6PtaXgQGNO83XCTX+CqoVyMtvKHrdDbENcGUljNiq
         NK3+sdyuLbrg+7Bw/pcgMYvMVlAEeua6fF4K3Ebb7xu/+DPXJ26H/wNRO3BEp0WULxTo
         Cvp5esiJACQkpAVoFiYCgv1VyLTJ0uWJ6JSKrtw1+C0O7dfOu79H8khwU+a3s4M7i/m3
         POSA==
X-Gm-Message-State: AOAM532vHUZXsfuwcAqQ/UN5mUnj+TaHyNyMURUVcGCZNmLrAuQGT6hC
	t81nJys3EOmSFTixoCCznUL/VRIUrXwlVg==
X-Google-Smtp-Source: ABdhPJwBrVjlC6WOULNwEjoGAeGAcNpN27CuTbn4mHAjjHvlSqs+82XAYvmMA1E0IMxS6KQ6tGpZ1A==
X-Received: by 2002:aa7:d8da:: with SMTP id k26mr12432886eds.364.1614526644804;
        Sun, 28 Feb 2021 07:37:24 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2450:1011:512:45a5:1b3d:84d2:e7fc])
        by smtp.gmail.com with ESMTPSA id b17sm10234780ejj.9.2021.02.28.07.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Feb 2021 07:37:24 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 19/24] libmd: add a recipe
Date: Sun, 28 Feb 2021 16:36:57 +0100
Message-Id: <20210228153702.498275-19-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210228153702.498275-1-alex.kanavin@gmail.com>
References: <20210228153702.498275-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is required by new versions of libbsd.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc  |  1 +
 meta/recipes-support/libmd/libmd_1.0.3.bb | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-support/libmd/libmd_1.0.3.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c9c9b8fc1e..9093f2d7fd 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -350,6 +350,7 @@ RECIPE_MAINTAINER_pn-libinput = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-libjitterentropy = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-libksba = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libmatchbox = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-libmd = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-libmnl = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libmpc = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-libmodule-build-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
diff --git a/meta/recipes-support/libmd/libmd_1.0.3.bb b/meta/recipes-support/libmd/libmd_1.0.3.bb
new file mode 100644
index 0000000000..2e6762e490
--- /dev/null
+++ b/meta/recipes-support/libmd/libmd_1.0.3.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Message Digest functions from BSD systems"
+DESCRIPTION = "This library provides message digest functions \
+found on BSD systems either on their libc (NetBSD, OpenBSD) or \
+libmd (FreeBSD, DragonflyBSD, macOS, Solaris) libraries and \
+lacking on others like GNU systems."
+HOMEPAGE = "https://www.hadrons.org/software/libmd/"
+
+LICENSE = "BSD-3-Clause & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0436d4fb62a71f661d6e8b7812f9e1df"
+
+SRC_URI = "https://archive.hadrons.org/software/libmd/libmd-${PV}.tar.xz"
+SRC_URI[sha256sum] = "5a02097f95cc250a3f1001865e4dbba5f1d15554120f95693c0541923c52af4a"
+
+inherit autotools
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.29.2

