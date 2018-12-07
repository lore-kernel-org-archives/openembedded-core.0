Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 801A86D7BA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Dec 2018 10:31:15 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g67so3971023wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Dec 2018 02:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=njq0ivn02apXvTYgZLmU/VDXyzpDB47iJJ+E32j4tbg=;
	b=KOof/fQ83ScOXeyw2jxMKBZMeL+TMNO/Oht+fvfBoyCOB1HWofJ9om2BtAfrfGtVXc
	gZUssQFqMbgDxPHpgzO5D/9YwQJuhf1E1OP1FDWA2D8u81WDZvUmOSoFx8Z3V1Qy+kUH
	1zDhhYrudQqddOjRNVnoHIn1YO206hQai8a6r1g4l5yjdpxt0UCnwrWztOyXVa3E4Xqd
	ax3YqkHOz7fdQkJrznke70zYrEobXwxmbSi9oHMOwvPo7Y5+TbOzKAIJazQeomAbx3/x
	HNa3n7NeBELTPr74Pk1Zrgs6aDG2rkhBGDIkTueV6axtqs9Crt3tFk5Kajlf9UzuRB2y
	xc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=njq0ivn02apXvTYgZLmU/VDXyzpDB47iJJ+E32j4tbg=;
	b=pw1ny0PzpdrymxlVHYhOMBoCaZMsEGWMOshuv7QQB77a1buL2+Fzc7QJOY70CSuHTk
	FaAe1YvKVNGQ5DndNeeBwBJNvcUdpPRSoYbQhj7lZpJm6LapCzbFQwc792pWUZ3X6trr
	p2KQqIwPU2iKRqobFFQgyXtynNBk+XY+INUkpUl3Naf1TValWvnv9oUOPvan82SLtxtV
	D7E2aEMmD2x6I3OuqLkHnwroh+vBHbXQJBxlL4+b5eNRz8yBfLF0T8rxT0jiTNtaNtXk
	Av5eUiCafwMHHh95+4NgxiSRHwkAXTV2CSautFLGy4B7kRdh/Vwmq9WCwyAS81gZZs+G
	SGOg==
X-Gm-Message-State: AA+aEWbgc7RqlU2uzm86UO1S6rGrIXoHqk0I3YVuPafXSRCwNusSL2Er
	ROOOQ5jTfr+1Ef43KOjwHWnufuYmtDM=
X-Google-Smtp-Source: AFSGD/XXPGtUhn0wbOAt1ayqHbbNiSLl8j+KNGaRClPVPcDbQmM84StWFd3uT2Nbds2xh6kX1ARepA==
X-Received: by 2002:a1c:2e0c:: with SMTP id u12mr1727872wmu.81.1544178675877; 
	Fri, 07 Dec 2018 02:31:15 -0800 (PST)
Received: from localhost.localdomain (193.164.125.18.ip.redstone-isp.net.
	[193.164.125.18])
	by smtp.gmail.com with ESMTPSA id h2sm1841271wrv.87.2018.12.07.02.31.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Dec 2018 02:31:15 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Dec 2018 10:31:07 +0000
Message-Id: <1544178667-9775-1-git-send-email-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] kernel-fitimage: Replace tabs with spaces in python
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Dec 2018 10:31:16 -0000

Fix:

  WARNING: python should use 4 spaces indentation, but found tabs in kernel-fitimage.bbclass, line 24

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/classes/kernel-fitimage.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 328bef4069b5..548699e9786e 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -19,9 +19,9 @@ python __anonymous () {
         else:
             replacementtype = "zImage"
 
-	# Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
-	# to kernel.bbclass . We have to override it, since we pack zImage
-	# (at least for now) into the fitImage .
+        # Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
+        # to kernel.bbclass . We have to override it, since we pack zImage
+        # (at least for now) into the fitImage .
         typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
         if 'fitImage' in typeformake.split():
             d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitImage', replacementtype))
-- 
2.7.4


