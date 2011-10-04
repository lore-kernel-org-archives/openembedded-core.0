Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RBApE-0003QQ-Hp
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 21:38:49 +0200
Received: by pzd13 with SMTP id 13so2333676pzd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Oct 2011 12:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=g6Ik8IH3uRkpXwwMqe11EO7Pn6UXOBtyfy730YA4WEc=;
	b=w5g0u7HQUj4fXTRXAiZGa7SRbkfcuWzyC+OkH/6GGRW3I2oaBMqkd1xqdoC7ft/xxi
	sO1Hd/QeOVO+vPq2vCLlQtsi8YHbtMNircCHkSXfBPUHHWoI//W/zILZZLZbVyD8ACvG
	I1YZbr6qH8mxOzNkJrv+DD886gQaSYDNrUvPk=
Received: by 10.68.54.65 with SMTP id h1mr12376437pbp.11.1317756787596;
	Tue, 04 Oct 2011 12:33:07 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id u1sm67841229pbr.9.2011.10.04.12.33.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Oct 2011 12:33:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Oct 2011 12:32:43 -0700
Message-Id: <1317756763-21114-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] runqemu-export-rootfs: Add HOW-TO for ubuntu 11.10 for rpcbind problem
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
X-List-Received-Date: Tue, 04 Oct 2011 19:38:49 -0000

The existing instruction to tackle
RPC: Authentication error; why = Client credential too weak
Are not applicable to ubuntu 11.10 especially

Therefore add the magic needed for ubuntu 11.10

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 scripts/runqemu-export-rootfs |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/scripts/runqemu-export-rootfs b/scripts/runqemu-export-rootfs
index 3ee3112..fec288a 100755
--- a/scripts/runqemu-export-rootfs
+++ b/scripts/runqemu-export-rootfs
@@ -118,6 +118,9 @@ case "$1" in
 		echo "    echo RPCBIND_OPTIONS=-i >> /etc/sysconfig/rpcbind"
 		echo "    /etc/init.d/rpcbind restart"
 		echo "==============================================="
+		echo "For Ubuntu 11.10 hosts"
+		echo "Add OPTIONS=\"-i -w\"  to /etc/default/rpcbind"
+		echo "sudo service portmap restart"
 	    fi
 	    exit 1
 	fi
-- 
1.7.5.4



