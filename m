Return-Path: <adrian.freihofer@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id 959887E4BE
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jun 2019 08:00:10 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x5880AGW025429
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 8 Jun 2019 10:00:10 +0200
Received: from dev.vm6.ccp.siemens.com ([139.22.37.201])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id x588088p015864;
	Sat, 8 Jun 2019 10:00:08 +0200
Received: from dev.localdomain (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id E412C2273140;
	Sat,  8 Jun 2019 10:00:07 +0200 (CEST)
From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Jun 2019 09:59:45 +0200
Message-Id: <20190608075948.30537-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190608075948.30537-1-adrian.freihofer@siemens.com>
References: <20190608075948.30537-1-adrian.freihofer@siemens.com>
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH v3 1/4] qemurunner: fix undefined variable
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
X-List-Received-Date: Sat, 08 Jun 2019 08:00:11 -0000

While hacking on this I got an Exception. It's better to define
variables also in python.

Signe:-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 6d2860c106..c16227fc38 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -60,6 +60,7 @@ class QemuRunner:
         self.runqemutime = 120
         self.qemu_pidfile = 'pidfile_'+str(os.getpid())
         self.host_dumper = HostDumper(dump_host_cmds, dump_dir)
+        self.monitorpipe = None
 
         self.logger = logger
 
-- 
2.11.0


