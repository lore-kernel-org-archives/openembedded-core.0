Return-Path: <andreas.reichel@tngtech.com>
X-Greylist: delayed 358 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 21 Apr 2017 12:16:15 UTC
Received: from proxy.tng.vnc.biz (zimbra-vnc.tngtech.com [83.144.240.98])
	by mail.openembedded.org (Postfix) with ESMTP id 8394277AA9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 12:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by proxy.tng.vnc.biz (Postfix) with ESMTP id A55231E1A33;
	Fri, 21 Apr 2017 14:10:23 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -1.5
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 tagged_above=-10 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-0.5, LOCAL_FROM_TNG=-0.001,
	URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from proxy.tng.vnc.biz ([127.0.0.1])
	by localhost (proxy.tng.vnc.biz [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id OirojKxtFOiW; Fri, 21 Apr 2017 14:10:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by proxy.tng.vnc.biz (Postfix) with ESMTP id 85BE91E1A2D;
	Fri, 21 Apr 2017 14:10:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at 
Received: from proxy.tng.vnc.biz ([127.0.0.1])
	by localhost (proxy.tng.vnc.biz [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id X9oFtbhjf41n; Fri, 21 Apr 2017 14:10:21 +0200 (CEST)
Received: from localhost.localdomain (p578a821c.dip0.t-ipconnect.de
	[87.138.130.28])
	by proxy.tng.vnc.biz (Postfix) with ESMTPSA id 632131E1A4A;
	Fri, 21 Apr 2017 14:10:16 +0200 (CEST)
From: "Andreas J. Reichel" <andreas.reichel@tngtech.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Apr 2017 14:11:43 +0200
Message-Id: <20170421121145.9797-4-andreas.reichel@tngtech.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170421121145.9797-1-andreas.reichel@tngtech.com>
References: <20170421121145.9797-1-andreas.reichel@tngtech.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Daniel Wagner <daniel.wagner@siemens.com>,
	Andreas Reichel <andreas.reichel.ext@siemens.com>
Subject: [wic patch 3/5] wic: Add missing text to usage and help strings
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
X-List-Received-Date: Fri, 21 Apr 2017 12:16:16 -0000

Add missing parameters -c to and remove non-existent
parameter -i from usage string for 'wic create'.

Signed-off-by: Andreas Reichel <andreas.reichel.ext@siemens.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Signed-off-by: Daniel Wagner <daniel.wagner@siemens.com>

---
 scripts/lib/wic/help.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
index 2c2dbdc3b5..ba0c8e5eea 100644
--- a/scripts/lib/wic/help.py
+++ b/scripts/lib/wic/help.py
@@ -131,10 +131,10 @@ wic_create_usage = """
  Create a new OpenEmbedded image
 
  usage: wic create <wks file or image name> [-o <DIRNAME> | --outdir <DIRNAME>]
-            [-i <JSON PROPERTY FILE> | --infile <JSON PROPERTY_FILE>]
             [-e | --image-name] [-s, --skip-build-check] [-D, --debug]
             [-r, --rootfs-dir] [-b, --bootimg-dir]
             [-k, --kernel-dir] [-n, --native-sysroot] [-f, --build-rootfs]
+            [-c, --compress-with] [-m, --bmap]
 
  This command creates an OpenEmbedded image based on the 'OE kickstart
  commands' found in the <wks file>.
-- 
2.11.0


