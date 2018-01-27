Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0266A78866
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 09:39:35 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id i186so5462167wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 01:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=vAy/RQc4hZK2X8PWQkB/2GJIYDS5KU/cg4wU9XdtfIk=;
	b=Zr9rAC+3FH+PQvRgU0qlFHRDT7z2YLutZJpErwjhY1GnZOk4jUpt0hwg9PDWANQ5Z8
	4dwf/GO0hFnTYuq9I/UiP1Wnmel8LAsQzHTM0IJ2YBxiqWnYXW1Q19L+cw0W7pXEsAJX
	Y/J3nbXi6QaVhm59NUAJrv6t9JBiVr7voE2hTp8SSEZOd5nb3qCnwQqnjL06+OJkfOHd
	o0ci4u972UR8moHpW5hMmu0mRxwB8E3BsND0uYQSR8I/5t+erZF5cr6NYeR4xM501FXt
	fZ8jt34u+msmPByw+SZdqDEK/W+O+zQ83VYMhKFNJiy+K7r6OXTL0cpgB27CFowQaD1I
	dvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vAy/RQc4hZK2X8PWQkB/2GJIYDS5KU/cg4wU9XdtfIk=;
	b=Gl8VEDGTRcvg/OC7hoA+mt/5M0gIsAMuw74GGPBPY57NoRfIeOVqQSUWwVBTE1JGSp
	7PUVyUsYZtDWrg7pt0Z+qf6hyeTZjsLPA1B1gFb5x+cF8QGeHKkWpzQPgl+aQIN0GUfH
	Psa0xM1tXVyzt4/XRPJLwaJb0RngC0WBcIb5cLHazn250IQZ3jyc5zeXYju8r2ty024U
	Pa2QLnsNsgkzVM4RM64+6SeskfOKpL1hHdRRFAmjHQWGnwkUY9Nant4yujrbwsx0/fpT
	ARMMSiU5X1DHi/pJ9cRz0zfvIs694So2XWNkXopxNwI9ZIUzfJdMh7pF19txR4xhXFoT
	KIHg==
X-Gm-Message-State: AKwxytek3lW5nsuYCpPlGvs3CR0pkogJ4nrpZuggVYaS5ev6h1xu6tg8
	8HqObINbcz3bU+FmsQjGSE1IlQ==
X-Google-Smtp-Source: AH8x224DHjX7Oy/lgr7UvF68aSIVsH6ZdJEQ8p+ckprdqo5Rff+8jfx/ZgLGzQTqUC2mAUTl4nnJWw==
X-Received: by 10.80.217.202 with SMTP id x10mr32281109edj.118.1517045976220; 
	Sat, 27 Jan 2018 01:39:36 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.200.12])
	by smtp.gmail.com with ESMTPSA id c5sm3819977ede.30.2018.01.27.01.39.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Jan 2018 01:39:35 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 27 Jan 2018 10:36:22 +0100
Message-Id: <1517045782-21446-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] bitbake.conf: add STAMPS_DIR to BB_HASHBASE_WHITELIST
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
X-List-Received-Date: Sat, 27 Jan 2018 09:39:36 -0000

From: Ming Liu <liu.ming50@gmail.com>

This allows scripts/bitbake-whatchanged to calculate the dependency
changes correctly since it needs to set different STAMPS_DIR during
the comparation.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 93afb13..01416ba 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -857,7 +857,7 @@ BB_SIGNATURE_HANDLER ?= "OEBasicHash"
 BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH BBSERVER DL_DIR \
     SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM \
     USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST \
-    PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
+    STAMPS_DIR PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE \
     CCACHE_DIR EXTERNAL_TOOLCHAIN CCACHE CCACHE_NOHASHDIR LICENSE_PATH SDKPKGSUFFIX \
     WARN_QA ERROR_QA WORKDIR STAMPCLEAN PKGDATA_DIR BUILD_ARCH SSTATE_PKGARCH \
     BB_WORKERCONTEXT BB_LIMITEDDEPS extend_recipe_sysroot DEPLOY_DIR"
-- 
2.7.4


