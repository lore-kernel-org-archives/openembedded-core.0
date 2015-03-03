Return-Path: <net147@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 29C776017E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 13:32:09 +0000 (UTC)
Received: by pdbnh10 with SMTP id nh10so22626904pdb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 05:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Mwlri8LAllaQfEYh8U8+z9kycjA9PTQOwObn3YdujBo=;
	b=kqJt79JsXoFDjDpCUdZxhQEpOUR0IQrgqltWNW2OO5nY9UjgUXKu2rlh5VnyXFkfL7
	Ofqsfo17+MjnsbFepLFXHE23oVfsUVpmYSUjUmFPgVZaJycdzvsrOCPds3hYUgPu41qj
	8/x1LOnZddXHb2eOouhwaLTYy+og3VAKXRnxfn1PkfBr+xuAVYmzU6KfWqdWULKEw4hr
	JVlDw87T0gNnbSbL7iKnNoq2gk9HJ+Tva/t0gxyHePKAIjrChoZ3JO+689JxgN9PJxxs
	jG3zL0/4VxNUREeRbEz9ypjX5C4KkxzFQzcxv8nrfSYbK7kcmwHcbVLFfQfa99Ghfxcb
	oWvA==
X-Received: by 10.68.253.233 with SMTP id ad9mr56119473pbd.167.1425389530859; 
	Tue, 03 Mar 2015 05:32:10 -0800 (PST)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id cy6sm1103292pdb.15.2015.03.03.05.32.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Mar 2015 05:32:09 -0800 (PST)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Mar 2015 00:31:31 +1100
Message-Id: <1425389491-31479-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.3.1
Subject: [PATCH] kernel-devsrc: avoid splitting debug info
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
X-List-Received-Date: Tue, 03 Mar 2015 13:32:13 -0000

This fixes "QA Issue: non debug package contains .debug directory"
for some kernels.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index e36de1b..c3cad05 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -72,3 +72,4 @@ do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
 PACKAGES = "kernel-devsrc"
 FILES_${PN} = "${KERNEL_SRC_PATH}"
 RDEPENDS_${PN} = "bc"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
2.3.1


