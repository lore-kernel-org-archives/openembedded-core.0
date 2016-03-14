Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A20ED73193
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 06:53:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2E6r2uY024172
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 23:53:02 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 13 Mar 2016 23:53:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 13 Mar 2016 23:52:55 -0700
Message-ID: <bd41832022777fa083e9357feae96e58fa4e813e.1457938286.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1457938286.git.liezhi.yang@windriver.com>
References: <cover.1457938286.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/7] runqemu: remove ISO and RAMFS from help text
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
X-List-Received-Date: Mon, 14 Mar 2016 06:53:02 -0000
Content-Type: text/plain

They don't work, and the script can check the type correctly.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu |    2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index ed32bc2..058ee29 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -26,8 +26,6 @@ of the following environment variables (in any order):
   KERNEL - the kernel image file to use
   ROOTFS - the rootfs image file or nfsroot directory to use
   MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)
-  RAMFS - boot a ramfs-based image
-  ISO - boot an ISO image
   Simplified QEMU command-line options can be passed with:
     nographic - disables video console
     serial - enables a serial console on /dev/ttyS0
-- 
1.7.9.5


