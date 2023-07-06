Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56013EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 09:01:09 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.17505.1688634067304883311
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 02:01:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@snap.com header.s=google header.b=QRYQqTen;
 spf=pass (domain: snapchat.com, ip: 209.85.160.47, mailfrom: ecordonnier@snapchat.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1b06a46e1a9so480841fac.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 02:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1688634066; x=1691226066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sihnCgDjtHEW/tfwUX0MBsDjIDYMuFwJPSZt1rhLTH8=;
        b=QRYQqTenUgAQrZwPsHWkEHDWC/Ji1x4kTxWo22pLMEkVICZo53jLhsDHIwKh8e+CSP
         1HzgO0O1ORPAXPMSOyARhi1xCWo3ScGU7Idk5YiAwkgOTIvtDCa4QVbCA822DxAEVFWi
         r71fcR1unpDA51lPSXL5VdcHrXsad8sJtZlqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688634066; x=1691226066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sihnCgDjtHEW/tfwUX0MBsDjIDYMuFwJPSZt1rhLTH8=;
        b=NVXw1sKRy9jb/olOZwtbTd6lcJaVCSHjM2xB4V4lgjGH/JfqWroPM340yBpXpy1xlr
         741RSHT0JUjh1lTQ5lAdCONVle3u5B616MUqUN3ZOHzGHIs8MrQLZiJgCocSVk6b0YAA
         cdhpJz34p4+Vl0u2yKSqtXo9BegliOWEA8PsXU8F2BwDuIwvVhGQG4LEpmXZ34PJksLl
         IURe6+G8KzTL12zyiK+r1PcwFIZUqHnuBfqJxifrrYCxrDATizQpEYvTt1DN26qAb5yf
         V+ViObEUCZNd3gGtIPEBiRZGc5ZL/rC4LWfk5L6Xv3It/aCxfaMkrowx0uFdYOWJL1Kn
         aL+Q==
X-Gm-Message-State: ABy/qLZpiPwl6VTF72NEcoXxcNSViAeYQnrrigqZiKPWLvuj1xfvdWhT
	N+WT5MXpYnSDV7XMcO2Cl5z9TLSOrwugJ3Y56S2CQA==
X-Google-Smtp-Source: APBJJlGqFLL3wpCvzokFX4VuHOnaagSwnNI/uWIdAFY4ANJU6iMz6QXhWH/s3J+wLWgnZtwaGi49qg==
X-Received: by 2002:a05:6870:d0d3:b0:1b3:eec8:fa90 with SMTP id k19-20020a056870d0d300b001b3eec8fa90mr1543768oaa.6.1688634066140;
        Thu, 06 Jul 2023 02:01:06 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id cl12-20020a17090af68c00b00262e9fbd5fbsm2651630pjb.32.2023.07.06.02.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 02:01:05 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [PATCH] qemu: fix typo
Date: Thu,  6 Jul 2023 11:00:57 +0200
Message-Id: <20230706090057.388192-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.36.1.vfs.0.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 09:01:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183917

From: Etienne Cordonnier <ecordonnier@snap.com>

Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 6acda61425..5b0b95c289 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -215,7 +215,7 @@ PACKAGECONFIG[seccomp] = "--enable-seccomp,--disable-seccomp,libseccomp"
 # libnfs is currently provided by meta-kodi
 PACKAGECONFIG[libnfs] = "--enable-libnfs,--disable-libnfs,libnfs"
 PACKAGECONFIG[pmem] = "--enable-libpmem,--disable-libpmem,pmdk"
-PACKAGECONFIG[pulsedio] = "--enable-pa,--disable-pa,pulseaudio"
+PACKAGECONFIG[pulseaudio] = "--enable-pa,--disable-pa,pulseaudio"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
 PACKAGECONFIG[bpf] = "--enable-bpf,--disable-bpf,libbpf"
 PACKAGECONFIG[capstone] = "--enable-capstone,--disable-capstone"
-- 
2.36.1.vfs.0.0


