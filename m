Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4504C46CD2
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 02:32:41 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.5555.1704249160474336444
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 18:32:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZwRqcqMI;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: festevam@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-58962bf3f89so1882264a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 18:32:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704249160; x=1704853960; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Etw7626+qkYiNQsqvRwEYPxLsMqVCkZAOa9QYsNR7kE=;
        b=ZwRqcqMIsbHNlXFGRSaumg50Ea77J86jBr2vFX3hbOawS/+wnyUTctO3ZdB9PC3ZvP
         R2ib3kN7qO8Yz1r9bIZB9eedXr8Sd05r+8gmRoCAEHsyF+90AaAqUZEaCueGb8pV3j1F
         IRYDhfYY6PnmJQUsxvtWut2zjx71BzdpCZrXmb+ZVmBl+9uEWDCkuuAocR3UXf4o1HBk
         o9E0KXceS2/pt1CJk7gPPe82Gk4NZQI78O7WguUydZa7Wd3NDfuPTGQTF5v5SJiQqji0
         WtE39H4layp9dKE+M9vB3VIMNjHcPUEnJOBXe8O/xW9JmqyXLbepGEPKOQuX+sZAAwol
         Zhiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704249160; x=1704853960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Etw7626+qkYiNQsqvRwEYPxLsMqVCkZAOa9QYsNR7kE=;
        b=nEDPY5uoxrxnPmTyV+/3pPad65S8TrGQ5Ahoe5Ac395S6g+HkZv1iuWCd2SJcLdI9o
         xGT5pa7hAVTmfiAVuqUeJdckoozeiaI2g0XQ5Iu+gzxWqSnrOaSqjgxPAZgOTpPlQQca
         KSo3cRxVFHvvKYGfA57vTdj00qnIrsNGE+n0LA8BvSrvNCEp0DgiB7tjTmCD6K2MXdBq
         3Xu8bUtHTr82mg8HsRi7VvsRS28DLzsa3AmohShfmExgcj9OUSKIEMdYnxV0nOY8srbe
         FagxqsmiSAFDV8gdaQpxHMIAsLlUxBB2eCLBX4OCCV3PMWtjPRQ/onq+FAUIAd2SmZHg
         F9IA==
X-Gm-Message-State: AOJu0YzvjOpG6fdVjFdtnd4p+jrMlu41Nv1p63mUkyNVuVAG2VSRAMpm
	5/9zVzxmZD/A1CsXZWx9CURoLzeJjSU=
X-Google-Smtp-Source: AGHT+IFNwqOeQnG6K4BWUz+lUCh/a8wGmnEZDwvrg9KULk1FTtDC0pHMG8JAP5JmUe5WLNhPsuWIQQ==
X-Received: by 2002:a05:6a00:1c8d:b0:6da:736d:67c8 with SMTP id y13-20020a056a001c8d00b006da736d67c8mr11368797pfw.3.1704249159588;
        Tue, 02 Jan 2024 18:32:39 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:5d09:e1d2:fd71:125f])
        by smtp.gmail.com with ESMTPSA id d6-20020a056a00198600b006d93afd243asm21635268pfl.72.2024.01.02.18.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 18:32:39 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Fabio Estevam <festevam@denx.de>
Subject: [PATCH] bmap-tools: Upgrade to 3.7
Date: Tue,  2 Jan 2024 23:32:32 -0300
Message-Id: <20240103023232.1728267-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 02:32:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193262

From: Fabio Estevam <festevam@denx.de>

Upgrade to version 3.7.

The COPYING file has been renamed as LICENSE, so adapt LIC_FILES_CHKSUM
accordingly.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 meta/recipes-support/bmap-tools/bmap-tools_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/bmap-tools/bmap-tools_git.bb b/meta/recipes-support/bmap-tools/bmap-tools_git.bb
index 1de95c8e5243..effba2ecad68 100644
--- a/meta/recipes-support/bmap-tools/bmap-tools_git.bb
+++ b/meta/recipes-support/bmap-tools/bmap-tools_git.bb
@@ -7,13 +7,13 @@ faster with bmaptool than with traditional tools like "dd" or "cp"."
 HOMEPAGE = "https://github.com/01org/bmap-tools"
 SECTION = "console/utils"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/intel/${BPN};branch=main;protocol=https"
 
-SRCREV = "c0673962a8ec1624b5189dc1d24f33fe4f06785a"
+SRCREV = "d84a6fd202fe246a0bc19ed2082e41bcdd75fb13"
 S = "${WORKDIR}/git"
-BASEVER = "3.6"
+BASEVER = "3.7"
 PV = "${BASEVER}+git"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


