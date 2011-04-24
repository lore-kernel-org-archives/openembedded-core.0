Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QE7n2-0000r4-Sw
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 00:28:29 +0200
Received: by bwz5 with SMTP id 5so1419946bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Apr 2011 15:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=F4X9oJinB8Q0n3Fp9JSIBlfS/ihEENqkOvHPGVcNqfc=;
	b=nzw3SbSrBfCVpXyo4DGIIR6rgqcP/0szVsIqhQDuK8tl2MQJIeyBf6YGkxs8u9K7NN
	dWaLmL2eKu+/GUU6HHzhXKggsVQI6Tz06+NbJIDXFcU//1PjZA8JRVbdDCC1zTy4xrFU
	jsXygK98QPlCn/6OP1/Q3g4AUmQMKd5ARypJE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=xP4uON/dlzD1JyXQgf1UqXrroo6dV1WDy7OnwCodJr0wLhA6FkiH38GIp0at0SWoDY
	5FV195DSovmDv9JXCEoEqIOK5yJXQni05YAiMT9j+CGv6MFY3Y8jsYgdlx6YWcSeLtva
	di2YV7KAGzzxYgU7HTthmpTDKYOXF5U76hmgc=
Received: by 10.204.81.213 with SMTP id y21mr2932779bkk.63.1303683960155;
	Sun, 24 Apr 2011 15:26:00 -0700 (PDT)
Received: from localhost ([94.230.152.115])
	by mx.google.com with ESMTPS id q25sm2143020bkk.10.2011.04.24.15.25.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 24 Apr 2011 15:25:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Apr 2011 00:25:51 +0200
Message-Id: <1303683951-31313-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <1303681612.5518.375.camel@rex>
References: <1303681612.5518.375.camel@rex>
Subject: [PATCH] task-base: allow distribution to define apm provider
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
X-List-Received-Date: Sun, 24 Apr 2011 22:28:29 -0000

* use VIRTUAL-RUNTIME_apm instead of apm directly

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-core/tasks/task-base.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/tasks/task-base.bb
index 599fa4b..a2a8925 100644
--- a/meta/recipes-core/tasks/task-base.bb
+++ b/meta/recipes-core/tasks/task-base.bb
@@ -179,8 +179,11 @@ RDEPENDS_task-base-acpi = "\
     acpid \
     libacpi "
 
+# Distro can override apm provider
+VIRTUAL-RUNTIME_apm ?= "apm"
+
 RDEPENDS_task-base-apm = "\
-    apm \
+    ${VIRTUAL-RUNTIME_apm} \
     apmd"
 
 RDEPENDS_task-base-ext2 = "\
-- 
1.7.5.rc1



