Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 45D497D8FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:19 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id k17so2867896wrx.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Qs5mnbLH/vs8oYB3zIGCWF4S9VWn8QfkdlsC6sSOEl4=;
	b=kuO9XO75FXDEWpfg2EPQpe8KKEe9MNtXvV429XBVT+Zj3/+Ws8bLQSvO1Fs9WWk8Yx
	KceXOPUUIcCWFUAejI8We7Z53NFZLk5S1P3OAZ6zEgXBQwHsSeuo76vr1D9BgjCIeGkm
	wPCASWTlf2JcMLC+1MTpO49m9cOSKy3eI/s5olG+rBv3W4GIsBP/Xa4ThEMl8bWOqcnx
	+AiRf/9CLcHpD1t9l+aPp9qBqyHOpji6HhSTweF3cm+G99BTNo+8TVlF0za3azO9fYqk
	a6ejwjy1lGZUdR1sNfwn41z1PA157vooiX8sZYIRwxd5TL5zQHBDvDpo0xgO1VvnuGAC
	fvIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Qs5mnbLH/vs8oYB3zIGCWF4S9VWn8QfkdlsC6sSOEl4=;
	b=b5fvnBgopmoZBYk9Z75Jq43fX+LAeb4eHqpmf+VZcN7dDnJSYae/E+CkaaOl05plMj
	FEOpgnFF4c9zyg1MknJ/osfsFnRtznNQkhW1cI5pZHg5R3f3azSkSGXbUfdIV1qb1IaR
	EgcMjZFqp4CzveEjpGx2yDhYiWBOAwcd1byG+sj22M2xaRUu620abM/DyqUfxNwgjZKu
	fzX9gRWYmrfLqK835mxbJwXWSza8XUvwFiSbWxp0LoGdwtKBfM0GdkAsb+u7sOpQjmI5
	i1XzotBNZYZLnB/NRccBKYbc8bC2gyUGw10UjDzCzUb1J3m5TEYm3S4csRv7dbHLF7RF
	c3og==
X-Gm-Message-State: APjAAAXfBFKV0WqT6Hn+UoJ8h/mRblJ4eaIGhHX1VAafpPijb5P1DCJE
	+nv+frIJFV2n0ogKGRbpSYkWQO0I8RQ=
X-Google-Smtp-Source: APXvYqwhN55PZwH+ALzH1Zj7B+a64B/tKF2DaRiON0A29ivlQGl+70fKtiofV1BryB7vKkU8S77yNQ==
X-Received: by 2002:a5d:6947:: with SMTP id r7mr7359508wrw.167.1554901939888; 
	Wed, 10 Apr 2019 06:12:19 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:32 +0530
Message-Id: <69ccfb9f978382f935c4d0609e09e00aab327188.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 13/33] resulttool: Enable report for single result file
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:19 -0000

From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>

Current validation check function inside resulttool disallow the
report for single result file although the underlying library
was able to handle both directory and file as source input to report.
Removed the validation check as it was no longer needed and to
enable report for single result file.

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/resulttool | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/scripts/resulttool b/scripts/resulttool
index 5a89e1c..18ac101 100755
--- a/scripts/resulttool
+++ b/scripts/resulttool
@@ -51,13 +51,6 @@ import resulttool.report
 import resulttool.manualexecution
 logger = scriptutils.logger_create('resulttool')
 
-def _validate_user_input_arguments(args):
-    if hasattr(args, "source_dir"):
-        if not os.path.isdir(args.source_dir):
-            logger.error('source_dir argument need to be a directory : %s' % args.source_dir)
-            return False
-    return True
-
 def main():
     parser = argparse_oe.ArgumentParser(description="OEQA test result manipulation tool.",
                                         epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
@@ -80,9 +73,6 @@ def main():
     elif args.quiet:
         logger.setLevel(logging.ERROR)
 
-    if not _validate_user_input_arguments(args):
-        return -1
-
     try:
         ret = args.func(args, logger)
     except argparse_oe.ArgumentUsageError as ae:
-- 
2.7.4


