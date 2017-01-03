Return-Path: <geoffrey.levillain@smile.fr>
X-Greylist: delayed 331 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 03 Jan 2017 11:18:05 UTC
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id B44DF6612D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2017 11:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 1B49B1EE1B55;
	Tue,  3 Jan 2017 12:12:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 9+ORbuvufOWX; Tue,  3 Jan 2017 12:12:34 +0100 (CET)
Received: from Mirage.daviel.idf.intranet (gre92-5-82-237-199-7.fbx.proxad.net
	[82.237.199.7])
	by idris.smile.fr (Postfix) with ESMTPA id BD0DE1EE1B28;
	Tue,  3 Jan 2017 12:12:33 +0100 (CET)
From: Geoffrey Levillain <geoffrey.levillain@smile.fr>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2017 12:12:03 +0100
Message-Id: <20170103111203.25132-1-geoffrey.levillain@smile.fr>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/1] image.bbclass: reactivate do_fetch, do_unpack and do_patch
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
X-List-Received-Date: Tue, 03 Jan 2017 11:18:07 -0000

Running fetch/unpack/patch can be used to get some image-specific
configurations files to apply with a function in the
ROOTFS_POSTPROCESS_COMMAND variable.

Hence delete the "noexec" line corresponding to these tasks so we can
run them when needed.

Signed-off-by: Geoffrey Levillain <geoffrey.levillain@smile.fr>
---
 meta/classes/image.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 04fd5f9961..8b8ea40964 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -615,9 +615,6 @@ MULTILIBRE_ALLOW_REP =. "${base_bindir}|${base_sbindir}|${bindir}|${sbindir}|${l
 MULTILIB_CHECK_FILE = "${WORKDIR}/multilib_check.py"
 MULTILIB_TEMP_ROOTFS = "${WORKDIR}/multilib"
 
-do_fetch[noexec] = "1"
-do_unpack[noexec] = "1"
-do_patch[noexec] = "1"
 do_configure[noexec] = "1"
 do_compile[noexec] = "1"
 do_install[noexec] = "1"
-- 
2.11.0


