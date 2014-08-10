Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 27DFF70A0E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 09:38:22 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id b13so7251199wgh.34
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 02:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=VG3VbDhjdBgBvSfZ6qix2ytUM8sPMPPi5EtRY/9oqSo=;
	b=gi1Xidy6icflgb+5xmMmUKcx3Qa6DKD8E14xxVLKY+7ede0WKbdHs3HtCW19DBGgrX
	8HuYqRJ4j3i7edsV+a9mRkIsjEohEwvh9wfgp+XCRoHDqb7uw1Zr9EcGaVSfkVaz+qLU
	scLUQ7povmrzUH3cxv7Sqw4MPwwbnfG336//kTyC6dj4TQ/2v+ua2UGd8m8QE0Jl3KUF
	OC+zMkeTGk3y+B8bVAUXxYkDHtxxGJbrbgKHJAseb416VZMApfUt7mqH/vgGFv3OE6Om
	B32WCcwFXxO06uF4iDssCYQaUIHD0rd5fh6er/dqRnlRjy2go7oQ2tFqThHaYPmCDNZ0
	8xiQ==
X-Received: by 10.180.83.8 with SMTP id m8mr16214222wiy.8.1407663503744;
	Sun, 10 Aug 2014 02:38:23 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bx2sm30777621wjb.47.2014.08.10.02.38.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Aug 2014 02:38:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 10 Aug 2014 11:38:54 +0200
Message-Id: <1407663535-6484-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
Subject: [daisy][PATCH 1/2] perf: explicitly disable libunwind
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
X-List-Received-Date: Sun, 10 Aug 2014 09:38:26 -0000

* it's not included in DEPENDS and it's detected from sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 20968f9..9776943 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -76,7 +76,7 @@ EXTRA_OEMAKE = \
 		CC="${CC}" \
 		AR="${AR}" \
 		perfexecdir=${libexecdir} \
-		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
+		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 NO_LIBUNWIND=1 ${SCRIPTING_DEFINES} \
 		'
 
 EXTRA_OEMAKE += "\
-- 
2.0.4


