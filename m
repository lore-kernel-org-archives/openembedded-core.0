Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SUTBL-0007R4-7A
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 03:37:39 +0200
Received: by obhx4 with SMTP id x4so342561obh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 18:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=2/msy1gLuJM3+BKZyg3/vrY1vqIwRhXs7S3kRUOIkcM=;
	b=DbSYHkyCZOlBeT+77EQyZITX7rfgXSfUcguF0yVJJr96UhNpDv1IUd/3bLi5OSwFWa
	/OZNsjSN8Stoted3lEc5ChEEcG7eaEZnbNw5NSTylo28WhVrXSr3EuMQsyy4NxeCm369
	UlcRe50rwu4Bn2QSGCcAaO9xGQYzP9iUTO3kpxWz4vp9wncKFlMNHTBVYHMpL8XOhU4s
	06t2lNIEwO8DKskVgTlpqJnm/Zne1l0o2/m98ZHiNhOA7imyGQHzLMq2Fx2HxKAIcKW/
	FDanGPoVUwlV9LoX+9Vu7hkEkkSdToHY8BqeeDHeS+lVt3rNcwLFV1hZA/QMnez7gviX
	z8nA==
Received: by 10.60.19.196 with SMTP id h4mr957288oee.56.1337131658103;
	Tue, 15 May 2012 18:27:38 -0700 (PDT)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id g9sm766554oeh.10.2012.05.15.18.27.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 May 2012 18:27:37 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2012 20:28:00 -0500
Message-Id: <1337131680-9197-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] bitbake.conf: add EXTERNAL_TOOLCHAIN to BB_HASHBASE_WHITELIST
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
X-List-Received-Date: Wed, 16 May 2012 01:37:39 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index dc68690..c920a18 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -746,7 +746,7 @@ BB_CONSOLELOG ?= "${TMPDIR}/cooker.log.${DATETIME}"
 
 # Setup our default hash policy
 BB_SIGNATURE_HANDLER ?= "OEBasic"
-BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST PRSERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE"
+BB_HASHBASE_WHITELIST ?= "TMPDIR FILE PATH PWD BB_TASKHASH BBPATH DL_DIR SSTATE_DIR THISDIR FILESEXTRAPATHS FILE_DIRNAME HOME LOGNAME SHELL TERM USER FILESPATH STAGING_DIR_HOST STAGING_DIR_TARGET COREBASE PRSERV_HOST PRSERV_PORT PRSERV_DUMPDIR PRSERV_DUMPFILE PRSERV_LOCKDOWN PARALLEL_MAKE EXTERNAL_TOOLCHAIN"
 BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SESSION_MANAGER DBUS_SESSION_BUS_ADDRESS SSH_AGENT_PID XDG_SESSION_COOKIE SSH_AUTH_SOCK XAUTHORITY"
 
 MLPREFIX ??= ""
-- 
1.7.7



