Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RAQfg-0003Zz-Pj
	for openembedded-core@lists.openembedded.org;
	Sun, 02 Oct 2011 20:21:52 +0200
Received: by yxj17 with SMTP id 17so2819501yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Oct 2011 11:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=hSSF2QPvM+97Vwucn65Es37SOLBXdUAYsthqDV3CgsI=;
	b=gxoLK7wB6SxPUDVTbtyk1zG3ORezEUV37z3qVJIMlUHkitSYvyZYtdSyTW5guoxr6a
	rdXxC6T+3PjO7uZlLk7xOJgYBAxSohlvDO8xsuIFs5a4jiqEMavL8YwIeK8MV2Sr9iQP
	pf2bo2htIh/nMXoZTnL/g62aNiGkllqrz1o3E=
Received: by 10.236.175.98 with SMTP id y62mr46007779yhl.78.1317579378908;
	Sun, 02 Oct 2011 11:16:18 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id r30sm13093379yhj.20.2011.10.02.11.16.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 02 Oct 2011 11:16:18 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Sun,  2 Oct 2011 18:15:57 +0000
Message-Id: <a10dfaacc8a038120173b0d6d098a1424d1e7dc1.1317579313.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1317579313.git.otavio@ossystems.com.br>
References: <cover.1317579313.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1317579313.git.otavio@ossystems.com.br>
References: <cover.1317579313.git.otavio@ossystems.com.br>
Subject: [PATCH 3/3] bootimg.bbclass: fix comment typo
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Oct 2011 18:21:52 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/bootimg.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 49ee85e..a5ba3cf 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -7,7 +7,7 @@
 #
 # End result is two things:
 #
-# 1. A .hddimage file which is an msdos filesystem containing syslinux, a kernel, 
+# 1. A .hddimg file which is an msdos filesystem containing syslinux, a kernel,
 # an initrd and a rootfs image. These can be written to harddisks directly and 
 # also booted on USB flash disks (write them there with dd).
 #
-- 
1.7.2.5



