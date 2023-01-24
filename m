Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92396C25B4E
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 19:43:31 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.25903.1674589400543321827
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jan 2023 11:43:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=MEouD0DZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id h12so10964182wrv.10
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 11:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rkfDIiJ9LGzp/pz1wLu4gie4l+84el/wAWhzPW+PARA=;
        b=MEouD0DZrLGjsHf+eA9VfVp8cjq/TB3QV6HqBmHV9sq5m89ALnFv8551oy5klaWVqb
         Hlr5HLgcNjkmz1Eqj7YXbD6U+r6X5rZbxmJiX7sp03ur0lDVRYakdqPDPIzl6PpVxq06
         lGepcjNTPP1qKi6SKDaW+70FpZKVpOb3YpzyETRqI82U4RqDui2S8yYELHPO6Cb/ONr1
         lwI28dh/7TRhQR2TJc8RyPaxKzeooIEayjw0NUHK/yteABZUXYdBcpugOkwNw//6wWxo
         cws91s57PBpNvCcGEMnvBd1aeRDze0y4h5nO4+1GmeT9lUdcXuiavJwgEHlqzdoaDwkv
         yP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rkfDIiJ9LGzp/pz1wLu4gie4l+84el/wAWhzPW+PARA=;
        b=kiaa7YFmq357XAj9j/XEglRYbHDBgR1ctL2frP0GDvvp8Aifn1whC7Wf4iiXQk8UYs
         16V2/fZ5Bovpqik+NhPMdJ0+vPEueVl32Nom0XPvKpIXTnZP2dwbsgdg5Q5eg755qB0D
         G5CJwYEtx+0dU9RZ8e+WvhGfliYk5a3CfwA+gWSfvKXqwmpo1gYV8Qskfdr2Di8o7syW
         i+NRma8f7WxUd7UqcMkG7NegW9MxNuPH71LIXWSW+JH4fC+FtdMCd/ULtjRcYVcKcx/n
         qcqdtZx05Z0PNfbHwTtqEOjylmCS6LzhKNUXQCEE2HUW7cETuNcm6kZW0VS4ZZoP03PP
         SeBQ==
X-Gm-Message-State: AFqh2krnV5LYI4EaApGi8ZtrOeBbFecwievKwHdF5ylcLfgcORJyiyut
	BrtIz3brIRbPBrR21gMF3HRfMqgfw+V6CqWU
X-Google-Smtp-Source: AMrXdXtQO8rwxBRcVh12DmezI0Jt+bBMteF9gbJBCc3p95m8j/sulKbb/V9dT9JywelUI2qiJSpqDA==
X-Received: by 2002:a5d:424a:0:b0:2bb:9106:d10 with SMTP id s10-20020a5d424a000000b002bb91060d10mr25231919wrr.10.1674589398473;
        Tue, 24 Jan 2023 11:43:18 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.numericable.fr (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id p15-20020a5d4e0f000000b002bdc39849d1sm2575731wrt.44.2023.01.24.11.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 11:43:18 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] sanity: Fix small typos
Date: Tue, 24 Jan 2023 20:42:42 +0100
Message-Id: <20230124194242.1828056-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jan 2023 19:43:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176330

* reproducibile -> reproducible
* distrubution -> distribution
* Joined lines gone awry
* and and -> and

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-global/sanity.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 8dfd59f457..2d1ff7072c 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -494,7 +494,7 @@ def check_gcc_version(sanity_data):
 
 # Tar version 1.24 and onwards handle overwriting symlinks correctly
 # but earlier versions do not; this needs to work properly for sstate
-# Version 1.28 is needed so opkg-build works correctly when reproducibile builds are enabled
+# Version 1.28 is needed so opkg-build works correctly when reproducible builds are enabled
 def check_tar_version(sanity_data):
     import subprocess
     try:
@@ -622,10 +622,10 @@ def check_sanity_sstate_dir_change(sstate_dir, data):
 def check_sanity_version_change(status, d):
     # Sanity checks to be done when SANITY_VERSION or NATIVELSBSTRING changes
     # In other words, these tests run once in a given build directory and then 
-    # never again until the sanity version or host distrubution id/version changes.
+    # never again until the sanity version or host distribution id/version changes.
 
     # Check the python install is complete. Examples that are often removed in
-    # minimal installations: glib-2.0-natives requries # xml.parsers.expat
+    # minimal installations: glib-2.0-natives requires xml.parsers.expat
     try:
         import xml.parsers.expat
     except ImportError as e:
@@ -682,7 +682,7 @@ def check_sanity_version_change(status, d):
         if i and workdir.startswith(i):
             status.addresult("You are building in a path included in PSEUDO_IGNORE_PATHS " + str(i) + " please locate the build outside this path.\n")
 
-    # Check if PSEUDO_IGNORE_PATHS and and paths under pseudo control overlap
+    # Check if PSEUDO_IGNORE_PATHS and paths under pseudo control overlap
     pseudoignorepaths = d.getVar('PSEUDO_IGNORE_PATHS', expand=True).split(",")
     pseudo_control_dir = "${D},${PKGD},${PKGDEST},${IMAGEROOTFS},${SDK_OUTPUT}"
     pseudocontroldir = d.expand(pseudo_control_dir).split(",")
-- 
2.30.2


