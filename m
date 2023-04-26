Return-Path: <deepadeepthi98@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5058CC7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 11:20:38 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.5285.1682508037345294519
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 04:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Q3R/vh2o;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: deepadeepthi98@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-63f273b219eso3393776b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 04:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682508036; x=1685100036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K1TyObcqBWJxRWu+aHZrJcM/TMoiHzHpxurfbPN63xY=;
        b=Q3R/vh2otFEq6/SiG6Nk8/OvhIfuP+y0luJQjyjIC40HWkNWH57bc+GMYqck4Oc1p3
         IRjbTpdVYr6v+B/gZtZvxkVlenCPGmHukZxOdELzgRxVLRMIu8AX16MpgDodkFOT55IP
         1STWFJaztwVlDVphhS8jfAhzGj8OC8hI7QErFHmaq3ERrel+X+tyYVoTrxw1z4hnDpqN
         zwXRXSMbD7W72QmSDoybNgdB6yGCyThVFKgH41XHIxzLztgg4OknautTliTZP54NytGG
         AaQFskewkHeGlvUVKpi40VUe40g44PxoIfOcelJ0Z0h4KAQfla/hu5MGj27Px1O2F8kp
         k2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682508036; x=1685100036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K1TyObcqBWJxRWu+aHZrJcM/TMoiHzHpxurfbPN63xY=;
        b=c48bPJGBLpdu6h5299RgqK7psVsM2156v7EsnUtnBwzf12tEmkUIlXEMmoqHZWtCIp
         dSgLfV92NfsytLCNJ4hbKV40HreKwy1M5HTj+v+pShj8/SJ3Fh8yWQtR+mPsvA96CMVW
         OvMb6LJJJjPWFQxVDEMRsB/dEBopgMttzdKlkZyUzNpeQwn6lUInpM9uC4tAumoUZ7xL
         q5uDBrwKSoZnW6CXjDov1jLt7AYdXoj2ZWaj32iVfsu36/Fkgkzv8pWJ2QkkebY5sPfE
         /rKHsIBlcuU31VbGW4SCuXl70vo5AfXQ/Mk8z0X/OXL+bXoCoIB6ETOC1FNpta9zr1EL
         LIaw==
X-Gm-Message-State: AAQBX9fPGZsYVH8QUg9mDac9tCeVMwjMk/2bCSIZUVwHp+MGWBsMqCv6
	nVgSWTV5Z/czgN4/PAnWw247WIcl06hfWw==
X-Google-Smtp-Source: AKy350YAq4SFFgDkUZnDxoSXig073rHcIAS9yVzwXs731Xjd06wLdjZOfzrRMm+XcnMmNe5tdCbhcw==
X-Received: by 2002:a05:6a20:ab98:b0:f0:a0f4:7c5d with SMTP id da24-20020a056a20ab9800b000f0a0f47c5dmr21015098pzb.56.1682508036317;
        Wed, 26 Apr 2023 04:20:36 -0700 (PDT)
Received: from bft-PowerEdge-R620.. ([49.204.85.206])
        by smtp.gmail.com with ESMTPSA id q7-20020a63cc47000000b0051ba4d6fe4fsm9638422pgi.56.2023.04.26.04.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 04:20:35 -0700 (PDT)
From: Deepthi Hemraj <deepadeepthi98@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com,
	linux@blackfigtech.com
Subject: [mickledore][PATCH] glibc: stable 2.37 branch updates.
Date: Wed, 26 Apr 2023 16:49:15 +0530
Message-Id: <20230426111915.2740079-1-deepadeepthi98@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 11:20:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180430

Below commits on glibc-2.37 stable branch are updated.
1d63573f81 stdio-common: tests: don't double-define _FORTIFY_SOURCE
590d0e089b elf: Restore ldconfig libc6 implicit soname logic [BZ #30125]
790e504a17 stdlib: Undo post review change to 16adc58e73f3 [BZ #27749]

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 meta/conf/distro/include/security_flags.inc | 2 +-
 meta/recipes-core/glibc/glibc-version.inc   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 2972f05b4e..e950e06ca7 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -15,7 +15,7 @@ OPTLEVEL = "${@bb.utils.filter('SELECTED_OPTIMIZATION', '-O0 -O1 -O2 -O3 -Ofast
 lcl_maybe_fortify ?= "${@oe.utils.conditional('OPTLEVEL','-O0','','${OPTLEVEL} -D_FORTIFY_SOURCE=2',d)}"
 
 # Error on use of format strings that represent possible security problems
-SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security -Werror=format-security"
+SECURITY_STRINGFORMAT ?= "-Wformat -Wformat-security"
 
 # Inject pie flags into compiler flags if not configured with gcc itself
 # especially useful with external toolchains
diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 1b8665a9d8..4e0b82f1de 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= "release/2.37/master"
 PV = "2.37"
-SRCREV_glibc ?= "d8e1a7590d375159fb5aac07ad8111ab4699e994" 
+SRCREV_glibc ?= "1d63573f81945a489ea169636fa11850bc74716b"
 SRCREV_localedef ?= "794da69788cbf9bf57b59a852f9f11307663fa87"
 
 GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
-- 
2.34.1


