Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.37396.1628865117003675420
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Aug 2021 07:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=oW5H+Htc;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id e19so12202857pla.10
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Aug 2021 07:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6+coqGAg57EQs1rLO7cdNsxz6S7X1nyPueKgcpXmNyw=;
        b=oW5H+HtcRKHeMZQSbnzpr1iJEdnNtKiMZyZW3x7NeOJfaWS1wC9QX676C+LKueGU42
         GnBT7K+RaglaKt5gMu2PxKcmFSaRRjjIXy71kixESPT6oJaOWp7mABs5ahvQC/e96RzT
         Lera5pP2LnZFT7UeQU490HS/Iu+/i6xNBlYuDqG84eyi0vd5S48Ms8Ffy3tfM03RyqRi
         MD0KDpygzfgjFDIG1dhlndw89Gv+YchTlkse+6BmHe0SjKeCDHrHBHO3bSGssdowCXn+
         9Sou8Qn5waCVWezIRddB8OqVODOibm/3LYmYln+EIBiTDJiit9RYx/gzUWUSRizl1M8V
         EM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6+coqGAg57EQs1rLO7cdNsxz6S7X1nyPueKgcpXmNyw=;
        b=WbKq5shXLHtULOiakyXNkhZxD3VtGkzMQYtsDi+0M5QVoFeo0VkJCNdH75NxSmlstk
         VxBDtsMg9FCXg3qeTRxXTdJXkaTCDQwAUvmLsgZhQQyFU+oZin1e4DTm1dKC5kyozKHV
         i/nb1qilyh13fVqFXgSID+6lsrUQT1wNND28MUsiWeA19A40jBoyoz9nyKhOxcgF0DIn
         6ID7sJWDLWzNm7is0NEoiXC7NXXYcNAzc+GjBBPOxDQ2tFKsfRwtyXn8FgX0pDnPESxh
         8Yff9cGpr+xduZV7XtjL3dh0on3KRolMsgb7f6fDH5UepE6OwU31odiBCLD1/WUpT0Wu
         iouQ==
X-Gm-Message-State: AOAM533qVAt/kMYFUKtN9nMd/1mUl6QSlzuwfDXnoyC4HFSn0FuoVQIc
	OpBf6+u1FtMt5YMEDfJ6O0JLbRCnNpJw0ogK
X-Google-Smtp-Source: ABdhPJzV6FJua855xoj3TunOwM+cfAKQSCgmDiW9a5LJL8jIHAjxvyhL7iWT3n52eF8+xZAa+4SXKw==
X-Received: by 2002:a17:90b:3e8a:: with SMTP id rj10mr2963199pjb.171.1628865116198;
        Fri, 13 Aug 2021 07:31:56 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id nl9sm2113182pjb.33.2021.08.13.07.31.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 07:31:55 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/17] image: Drop COMPRESS_CMD
Date: Fri, 13 Aug 2021 04:29:49 -1000
Message-Id: <3ebaa86707ea99e8272dafc442318e3a5f483018.1628863869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628863869.git.steve@sakoman.com>
References: <cover.1628863869.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This was replaced by CONVERSION_CMD a long time ago and is no longer referenced
in core. Remove the references to it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 576d52cdaca047d290c3b10b26aa2244da230dbb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/image.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 1900eff412..0e252e99ff 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -460,11 +460,10 @@ python () {
                     # Create input image first.
                     gen_conversion_cmds(type)
                     localdata.setVar('type', type)
-                    cmd = "\t" + (localdata.getVar("CONVERSION_CMD_" + ctype) or localdata.getVar("COMPRESS_CMD_" + ctype))
+                    cmd = "\t" + localdata.getVar("CONVERSION_CMD_" + ctype)
                     if cmd not in cmds:
                         cmds.append(cmd)
                     vardeps.add('CONVERSION_CMD_' + ctype)
-                    vardeps.add('COMPRESS_CMD_' + ctype)
                     subimage = type + "." + ctype
                     if subimage not in subimages:
                         subimages.append(subimage)
-- 
2.25.1

