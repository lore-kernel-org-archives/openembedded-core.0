Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D75E105F79E
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 11:54:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14047.1773402856257606452
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 04:54:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y7DHL/1B;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48535a0ef86so17421005e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 04:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773402854; x=1774007654; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y5MUXUjWMYMye+h1pOzGJEJB/g+1ha+o4pJiCtPU0xM=;
        b=Y7DHL/1BsMciJ+rwsB3GNhPc8oBx2R7PG7QEaDqKkoGYoXlw0+LXoucSbidmld+yJc
         loVHL0Vj1RGqkJuBEmgYS+d/QrLEB8cDfySoBcNDgBgJBtzNkf1ZhF8S4Yxor9FDO2uT
         3Z+Lhzbf9uZRg6JKCDJTuwiQpNqniDvQy+77/favDnmUdZDvV3XCvfJdFACLxxstmAth
         buHGNO5HyQJY2YnDFCyvb2ZB6UaiolYFYp1pRSM55aJaus30CK7OaIwwi3P5pmdg3yJJ
         CypdXbUCtpxOKBVpLfEOIRYRUA56nnj2DEhHVvPe5TYL5RPxNGchpAjSrt84ZmPowSSQ
         g7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773402854; x=1774007654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5MUXUjWMYMye+h1pOzGJEJB/g+1ha+o4pJiCtPU0xM=;
        b=T2reB3ovCKFtfoQEFlHzKpjEmcG7nbpTZAH/kERFEGASIAYx9YdCcl/6Uwog2dhfEB
         Pr0YwoG1/WuJ+POOYxzjdhhs3WyAU1cG0rl1lVXy2c38pr0uspVr+ogomEun7WmuCBGf
         2MuBHiaj4exjDqkRodThUSEziciprWSQpTr27zeACBtHaacdYXy6xtXlMd0V7SdxONak
         fd0mOtUpFs2a23ufJ3Q9bs3Y0WNhv2XnCjBadL2HfhKURb18w1wEwY+fKKUO41eeWTHa
         qvFdpt+aiowdpcCSwHEDhh80zNpQqWsvEEWzpKczzJSJ9X1QEMP6hJq/Y8rU07510hyi
         NR/Q==
X-Gm-Message-State: AOJu0YwlLOTwYaywU8eMHBDPMhmKvGUVqQksPqxinm71+ymVT0I9dZ1N
	PzWQOzB0P68sntuN7ZQMBbUqPHvrpXSrIm2TB/6Ygi9Qljt2M3fOoaXl1dVOXA==
X-Gm-Gg: ATEYQzyn4nlbum4JUFZdGvDXFqGJUcXGyP5iDnbZfVDPnyFceez4H3sA1fTs3VToAf7
	ofwtSatdsVUhZKusEFvvlKOVYkux0war77tY5DBd+jchHXAJO81/NMBQHvPfXMBfEzYQRS0oglD
	vUWO4gwkmm11MuibzaQcJ3p/OkWpYt6SGxBwiXdC+2eoL27x71Y63PqUs4MqlJf8AA6yDiP7723
	eHs6Mnb7jcASUgyyQfZdpydeCF3TmtYvb9QFy2BeOwQRpsRZuJweNkPfkwsX5fkZtXb6xnFKxjG
	X4AGVL67MsQu/2npdRszFf5H6d0MPUaFBsUlEDH2He5b1V6j/7XIWxMTrPEU8Umu23irGpeSLZ1
	RxHX6DDPdnN8BNI95sJg653UlBxok68aO0LzEWmAZ38Ap9AvgbOzt9+1wEJJ+ppF05nocMFz2mu
	4Sw5E3XuDI+OEmr0rNxHsuWb0hqabdt/FD
X-Received: by 2002:a05:600c:1e28:b0:485:3e19:9e01 with SMTP id 5b1f17b1804b1-4855670e7d2mr40863125e9.28.1773402854015;
        Fri, 13 Mar 2026 04:54:14 -0700 (PDT)
Received: from toster.lan ([185.228.162.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855778d268sm26037885e9.8.2026.03.13.04.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 04:54:13 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>,
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Subject: [OE-core][PATCH] pacth: add user and email when patchtool is git
Date: Fri, 13 Mar 2026 11:53:46 +0000
Message-ID: <20260313115345.4704-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 11:54:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233042

From: Jose Quaresma <jose.quaresma@oss.qualcomm.com>

When the PATCHTOOL=git, oe-core creates a git repo for the sources with:

 git init
 git add .
 git commit

The git commit fails blindly due to misconfigured user when git don't have
the email proper configured. Although the commit command does not fail
because it returns 0, it is not executed and the tree remains with all
files staged so the following git commands can fail and fails in some cases.

This problem has been particularly observed in some obscure and little-used
cases in openembedded-core like patching the linux-firmware which only works
using PATCHTOOL=git because it deals with binary files.

Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
---
 meta/lib/oe/patch.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index afc42df8a7..abc822f7fb 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -318,6 +318,8 @@ class GitApplyTree(PatchTree):
 
     def _initRepo(self):
         runcmd("git init".split(), self.dir)
+        runcmd(("git config user.email %s" % self.commitemail).split(), self.dir)
+        runcmd(("git config user.name %s" % self.commituser).split(), self.dir)
         runcmd("git add .".split(), self.dir)
         runcmd("git commit -a --allow-empty -m bitbake_patching_started".split(), self.dir)
 
-- 
2.53.0


