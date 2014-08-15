Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EF043601A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 01:37:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7F1b8pd014649
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 18:37:08 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 14 Aug 2014 18:37:07 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Aug 2014 20:42:47 -0500
Message-ID: <5303a1f15a0c44dcc34e7bdec060629518e6cd6e.1408066680.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1408066680.git.peter.seebach@windriver.com>
References: <cover.1408066680.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] qemumips.conf: Default to (and support) mips32r2
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
X-List-Received-Date: Fri, 15 Aug 2014 01:37:12 -0000
Content-Type: text/plain

The MIPS emulation for qemumips actually supports
mips32r2:
	isa                     : mips1 mips2 mips32r1 mips32r2

We should probably use that tuning file.

This implicitly changes the default value of DEFAULTTUNE to
mips32r2.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/conf/machine/qemumips.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/machine/qemumips.conf b/meta/conf/machine/qemumips.conf
index ce1c419..d9d2421 100644
--- a/meta/conf/machine/qemumips.conf
+++ b/meta/conf/machine/qemumips.conf
@@ -3,7 +3,7 @@
 #@DESCRIPTION: mti_malta32_be
 
 require conf/machine/include/qemu.inc
-require conf/machine/include/tune-mips32.inc
+require conf/machine/include/tune-mips32r2.inc
 
 KERNEL_IMAGETYPE = "vmlinux"
 KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
-- 
1.7.1


