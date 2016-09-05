Return-Path: <joshuagloe@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 53D2A771FF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 13:59:28 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id ez1so9435190pab.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 06:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=1gAHou+CqzRERLrapHRaYVLkqrs/x+JwxBcClEZOKNs=;
	b=AqxmQ2OAOXIZwA+gKUmfsPRyJLp34sTNtxRbip3FbtlV+GMe0hJMPHpcVDCDbah1se
	cqUPUgYhUmwEhPJ3dwTofDrotbcmbDFIIWyfQS0+nqbB66dkW9+YCCLqe/Eq/Mt4OjPW
	QKHkM2wTfBc7qLSL699AXbjtnnr9SuqiRD0yMzmK10QQARzlOrmHLhRMSBHXWLuYobBF
	mBZPWmIILN4aIv/p00EM8JBERRaVreuTV42FrWVMF3aUv1k8svXzAkMJfAAWOpUj6c89
	EfSoVF92wc2gEZ+qWJgK+s7guILKXkAukyLO9Vd1waqIV+ynwcEjzKNgbNvb3F+N5orH
	3fuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=1gAHou+CqzRERLrapHRaYVLkqrs/x+JwxBcClEZOKNs=;
	b=SOUuG6J51EZTgSqUryqAElVd7x34NKt5oRMGoQgSCZULQE+NHYEhF0dXk9WTSP3aEC
	1l2+kTjUTC6LzkG/fuWYyhPpmj1ywI5WO+E3A+mqVr/Jijqr2DZ1d0kbHE3mEWOwBUEd
	96O2lnSdEDlY1RjO6rPSZWiD+iw1y6wTQ/gGCWeZpgoQZ9xdrn3ahzpIW0XnyoYs2mES
	2dKtmhklwx+yxc5kZlKzbzhTIwtQXr5ftMLsk/6BknGF9V04Mv5zBO3rT9V+Y5CVik4B
	MfljcKe2zSX3J+emRylJ1C1zsjvsGs2w8Kb5ccqFAM9hy+pAwz+0eUwg/KjERiJYZZ7v
	/TFQ==
X-Gm-Message-State: AE9vXwO0GBR0RVetFuSUlsYvTDqeai/Llf/gLAZumwrAKLpP5yoXmP1o5ZvzEYPTlzkyTQ==
X-Received: by 10.66.126.131 with SMTP id my3mr56343277pab.115.1473083969511; 
	Mon, 05 Sep 2016 06:59:29 -0700 (PDT)
Received: from jlock-mobl1.ger.corp.intel.com ([192.55.54.42])
	by smtp.gmail.com with ESMTPSA id
	u1sm33982460pfu.12.2016.09.05.06.59.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 06:59:28 -0700 (PDT)
From: Joshua Lock <joshuagloe@gmail.com>
X-Google-Original-From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Sep 2016 14:59:09 +0100
Message-Id: <67d679f87654ffdc19bc46e851d6f9bbddc07ea5.1473083836.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1473083836.git.joshua.g.lock@intel.com>
References: <cover.1473083836.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1473083836.git.joshua.g.lock@intel.com>
References: <cover.1473083836.git.joshua.g.lock@intel.com>
Subject: [PATCH 1/4] runqemu: fix typos
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
X-List-Received-Date: Mon, 05 Sep 2016 13:59:29 -0000

Remove a stray whitespace when accessing a member variable and fix a
spelling mistake in an Exception message.

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 scripts/runqemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index a94cc65..72c6352 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -160,7 +160,7 @@ class BaseConfig(object):
         self.custombiosdir = ''
         self.lock = ''
         self.lock_descriptor = ''
-        self. bitbake_e = ''
+        self.bitbake_e = ''
         self.fstypes = ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btrfs', 'cpio.gz', 'cpio', 'ramfs')
         self.vmtypes = ('hddimg', 'hdddirect', 'wic', 'vmdk', 'qcow2', 'vdi', 'iso')
 
@@ -289,7 +289,7 @@ class BaseConfig(object):
             self.set_machine_deploy_dir(arg, deploy_dir_image)
         else:
             logger.error("%s not a directory valid DEPLOY_DIR_IMAGE" % deploy_dir_image)
-            raise Exception("Falied to set MACHINE to %s. Unknown arg: %s" % (arg, arg))
+            raise Exception("Failed to set MACHINE to %s. Unknown arg: %s" % (arg, arg))
 
     def check_args(self):
         unknown_arg = ""
-- 
2.7.4


