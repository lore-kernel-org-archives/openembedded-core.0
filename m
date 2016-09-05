Return-Path: <joshuagloe@gmail.com>
Received: from mail-pa0-f68.google.com (mail-pa0-f68.google.com
	[209.85.220.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2196C6FFCD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 20:33:12 +0000 (UTC)
Received: by mail-pa0-f68.google.com with SMTP id gi6so91208pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Sep 2016 13:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=1gAHou+CqzRERLrapHRaYVLkqrs/x+JwxBcClEZOKNs=;
	b=LDKQmltvf6LR6Cy7MJfpozpHwBz0rTotTVggHw851celJ0iIs/y5as9umCu1vTJNgc
	sMi1zkzlEoDNYw+4XxpCSNP3tAnmv/fvDLQPw1ezh9BzjCPP9EJzAcJJElO/rCKAJjO8
	35Nx8duqycJQKb2qUcu8WcYX9ZZXgZTKQpclkmTKavps8LYo5MFSw7GruFsQ1PSidZNr
	xQh6PVS0xO1amtjE6XRd9kr3jqwtFWTtV3elmKH9gB6GIOv09ZMokvXtjH6S83zJTde7
	FMeko0bfe93Jusyza4Z9qK4vS/3swv1X02T/gUXNYx9UgaQs4wuImU8D+QmpwVcMc5TW
	XL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=1gAHou+CqzRERLrapHRaYVLkqrs/x+JwxBcClEZOKNs=;
	b=D8F0pLNZjMdgHUyDP4GnpmsLM/kOOmeS7J4dNEmh24LzgCjtaB3c697qYA67diakBw
	5cA1xpzyaHRR1ZmtqPO5v3JRk2nLRMvQm/Y4FcrvZwWayDuJvsl55dt7dPLXDlYTpxxb
	bbegcED7Fj8GnBQuTS0rO3e4NTEPxyobCppBekdWXPUciXtfrWCHTDEIvWjuidYMVcoJ
	Lt1926iIS/H0zoMhhsD+yEZn5PRRWAf6GzEihgeTJPrq0QuuTSElDTKprzWfGE4p+rIY
	YrUmwRZWG6FFAqk2uWg7DHNsVsd82BgKa3zJU3zeBudx0/GaKXcMp3KYqVY2QpBX15EA
	ID+Q==
X-Gm-Message-State: AE9vXwPcpNwmeayPNfT4aq/KcItJ6xPT6v5DW8+2+UM8ok/isN6alwtfrvC1U1JzP9b6TA==
X-Received: by 10.66.233.38 with SMTP id tt6mr65622482pac.99.1473107593330;
	Mon, 05 Sep 2016 13:33:13 -0700 (PDT)
Received: from jlock-mobl1.ger.corp.intel.com ([192.55.54.43])
	by smtp.gmail.com with ESMTPSA id
	m24sm35402875pfi.34.2016.09.05.13.33.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Sep 2016 13:33:12 -0700 (PDT)
From: Joshua Lock <joshuagloe@gmail.com>
X-Google-Original-From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  5 Sep 2016 21:32:55 +0100
Message-Id: <6f2661bb69844991fd09e6858a0ca0cb546732b6.1473107499.git.joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1473107499.git.joshua.g.lock@intel.com>
References: <cover.1473107499.git.joshua.g.lock@intel.com>
In-Reply-To: <cover.1473107499.git.joshua.g.lock@intel.com>
References: <cover.1473107499.git.joshua.g.lock@intel.com>
Subject: [PATCH v2 1/3] runqemu: fix typos
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
X-List-Received-Date: Mon, 05 Sep 2016 20:33:15 -0000

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


