Return-Path: <luca@lucaceresoli.net>
X-Greylist: delayed 2309 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 24 Aug 2017 08:20:18 UTC
Received: from srv-hp10-72.netsons.net (srv-hp10-72.netsons.net [94.141.22.72])
	by mail.openembedded.org (Postfix) with ESMTP id C22486FFFE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 08:20:18 +0000 (UTC)
Received: from 45.11.168.109.cust.ip.kpnqwest.it ([109.168.11.45]:47848
	helo=pc-ceresoli.dev.aim)
	by srv-hp10.netsons.net with esmtpa (Exim 4.89)
	(envelope-from <luca@lucaceresoli.net>)
	id 1dkmlw-003jJ0-Uj; Thu, 24 Aug 2017 09:41:49 +0200
From: Luca Ceresoli <luca@lucaceresoli.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Aug 2017 09:40:54 +0200
Message-Id: <1503560454-6045-1-git-send-email-luca@lucaceresoli.net>
X-Mailer: git-send-email 2.7.4
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - srv-hp10.netsons.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: srv-hp10.netsons.net: authenticated_id:
	luca+lucaceresoli.net/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: srv-hp10.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Subject: [PATCH] kernel-yocto: fix typo in error message
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
X-List-Received-Date: Thu, 24 Aug 2017 08:20:19 -0000

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 3c6df92131bc..c8ed1e9108c7 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -113,7 +113,7 @@ do_kernel_metadata() {
 				sccs="${WORKDIR}/defconfig"
 			fi
 		else
-			bbfatal "A KBUILD_DECONFIG '${KBUILD_DEFCONFIG}' was specified, but not present in the source tree"
+			bbfatal "A KBUILD_DEFCONFIG '${KBUILD_DEFCONFIG}' was specified, but not present in the source tree"
 		fi
 	fi
 
-- 
2.7.4


