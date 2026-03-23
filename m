Return-Path: <maxin.john@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83CEFC72C5
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 06:50:23 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11635.1774248612584531225
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Mar 2026 23:50:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Qii2wfw5;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: maxin.john@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a27b5ad832so3633066e87.2
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Mar 2026 23:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774248611; x=1774853411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TmFgra2shoiXQkGb9AO8NqpQrVyZ6swxf3hoocOeOOc=;
        b=Qii2wfw5Cv+2a7zvg97Fk/rVN0UNOszjTJDgb2xzVqObrJl0vNiAexpeaJe1RcahwA
         Hva/S5a3cUnPyKfbwdhM51bHf3kFRgShfHh2W+hbBoFpwXIpRavPnAOiph4nAVCVko/X
         k1Oc3Z5/+sLcm9myvBm2P4KM66d2bfIMqwhKrwd5AYmUMckzbu7tMXjtZxexb58KTXVl
         dqR0lqVVRmNlQ0Xezbu1XGGBvExHWtqdUf9xnMUlpEW9WZRW/uf5dO612UV1WSgbrafa
         qycOoqYl5tBdILXCIMC7LOGm8Do4H30mIx+PAslUba/fxH4ZHYJlJ51OhDr3zsZIyQvK
         cs4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774248611; x=1774853411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TmFgra2shoiXQkGb9AO8NqpQrVyZ6swxf3hoocOeOOc=;
        b=A+1G0WTOzSJfiMSkyzd6ebzUZqyruM2j5ttB3tUlIrFYeO6UL0xzHAihzJvMl9jPSH
         ZKOljpUgtF8+98fqoD4kDI45YtaXDR0ZUHlK5pUHpum7TErB43ELyda8ryd0ja4j8MyS
         xmmljdkbqknlinLbJwLEFPoLy6yhmSWWV6rcIsiTlng3oCPV6U1v8zWVF86MGj7UI22f
         POa5MHFVdP/WG3dbahNiasQrGZql23FqVDRnY1JrZ9uCaZSx9fUC7W8ocPRNJYuSCFkh
         cD9Z2gzkhJ33gCOzluRpuounJxecf7ln48rrBsOx17mhf4VhXpQLbjUrmhvM30bkfb9u
         98tw==
X-Gm-Message-State: AOJu0YwcFfPn/x+o4kXuhr6xIG5bB+fIOI/FFE/g4DKwxMeDJzQ34JSC
	BsUkV+uHsZ4w+miXF2YRMaJ5kSfkn+AQ8Zcmvr5VagziXluCGMkfs5GIegIzxQ==
X-Gm-Gg: ATEYQzyF80AbGneMcsZeM8UuV+p9r5j6/PaKSLhKKHjftfaTP1h6GXkuWrULN3D7P63
	XXc/1PrwN14bA/UoH4Iz32/gttJUWHIQ3N14iHw48nhy7zONWB1XVjJyi7uJuEjAHz5BJvL6jzr
	hcZjz/RPjQMKFCyJfGHc43iTY9gKROd7okFeh/3+Fqiv8cxXu3OaoE9eemdzrwe39B7ilbQO7fy
	KUBzNwWwr3f/K3G162KmvREnHIdsnm/LPJvKck2ootkxgHUxnCIZx2jGA4z9pHzX4RB79N5iLm+
	wQDSHkrT8FChRXGkOyIXXfpb0jRTibxH+Mia0i0uDalwN93dQ/gMxBMkwkDqUK7Te/jWUN0QL4m
	IQJlHwFHpPLV/X+SQPX9Eau2wJZGixMIwR94V9PP0sX+UsuDUYTi7wxb6X0egDQ9dRpMRmlk8ip
	rT9RNsS7BFuQoHVR+sM6D0zgzitqbVaEOAYNP6NQohdolbjTOqsqMDqvD1/S5WrM705to5fStW
X-Received: by 2002:a05:6512:1247:b0:5a2:787a:fa54 with SMTP id 2adb3069b0e04-5a285af8cb6mr3634536e87.18.1774248610280;
        Sun, 22 Mar 2026 23:50:10 -0700 (PDT)
Received: from Thor.lan (nb6bp2luucgh1ubvhqb-1.v6.elisa-laajakaista.fi. [2001:99a:a58:9b00:9119:221d:45f0:de83])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285207476sm2341777e87.47.2026.03.22.23.50.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 23:50:08 -0700 (PDT)
From: Maxin John <maxin.john@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] iw: drop redundant downstream patch
Date: Mon, 23 Mar 2026 08:50:06 +0200
Message-ID: <20260323065006.78972-1-maxin.john@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 06:50:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233703

A similar fix has already been applied upstream, making this patch
unnecessary.

Remove the downstream patch to avoid duplication and keep the tree
in sync with upstream.

Upstream commit:
https://kernel.googlesource.com/pub/scm/linux/kernel/git/jberg/iw/+/26e074a04287919a848da997ab71b982ec404ddf%5E%21/#F0

Signed-off-by: Maxin John <maxin.john@gmail.com>
---
 ...on-t-use-git-describe-for-versioning.patch | 41 -------------------
 meta/recipes-connectivity/iw/iw_6.17.bb       |  1 -
 2 files changed, 42 deletions(-)
 delete mode 100644 meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch

diff --git a/meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch b/meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
deleted file mode 100644
index 715b88d46672..000000000000
--- a/meta/recipes-connectivity/iw/iw/0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Subject: [PATCH] iw: version.sh: don't use git describe for versioning
-
-It will detect top-level git repositories like the Angstrom setup-scripts and break.
-
-Upstream-Status: Pending
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
-diff -Naur iw-4.7-orig/version.sh iw-4.7/version.sh
---- iw-4.7-orig/version.sh	2016-05-31 12:52:46.000000000 +0300
-+++ iw-4.7/version.sh	2016-06-01 11:21:58.307409060 +0300
-@@ -15,27 +15,7 @@
- SRC_DIR=$(cd ${SRC_DIR}; pwd)
- cd "${SRC_DIR}"
- 
--v=""
--if [ -d .git ] && head=`git rev-parse --verify HEAD 2>/dev/null`; then
--    git update-index --refresh --unmerged > /dev/null
--    descr=$(git describe --match=v* 2>/dev/null)
--    if [ $? -eq 0 ]; then
--        # on git builds check that the version number above
--        # is correct...
--        if [ "${descr%%-*}" = "v$VERSION" ]; then
--            v="${descr#v}"
--            if git diff-index --name-only HEAD | read dummy ; then
--                v="$v"-dirty
--            fi
--        fi
--    fi
--fi
--
--# set to the default version when failed to get the version
--# information with git
--if [ -z "${v}" ]; then
--    v="$VERSION"
--fi
-+v="$VERSION"
- 
- echo '#include "iw.h"' > "$OUT"
- echo "const char iw_version[] = \"$v\";" >> "$OUT"
diff --git a/meta/recipes-connectivity/iw/iw_6.17.bb b/meta/recipes-connectivity/iw/iw_6.17.bb
index a9a4695d39d0..f3e80c3697e2 100644
--- a/meta/recipes-connectivity/iw/iw_6.17.bb
+++ b/meta/recipes-connectivity/iw/iw_6.17.bb
@@ -10,7 +10,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=878618a5c4af25e9b93ef0be1a93f774"
 DEPENDS = "libnl"
 
 SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
-           file://0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch \
            file://separate-objdir.patch \
 "
 
-- 
2.47.3


