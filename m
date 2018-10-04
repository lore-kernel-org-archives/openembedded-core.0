Return-Path: <angelo@sysam.it>
Received: from sysam.it (ec2-18-194-220-216.eu-central-1.compute.amazonaws.com
	[18.194.220.216])
	by mail.openembedded.org (Postfix) with ESMTP id 81301793ED
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 13:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by sysam.it (Postfix) with ESMTP id B8911205CC;
	Thu,  4 Oct 2018 13:30:00 +0000 (UTC)
Received: from sysam.it ([127.0.0.1])
	by localhost (sysam.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LTzEZYZpQmxX; Thu,  4 Oct 2018 13:29:59 +0000 (UTC)
Received: from localhost.localdomain
	(host70-5-dynamic.16-79-r.retail.telecomitalia.it [79.16.5.70])
	by sysam.it (Postfix) with ESMTPSA id A59A6205C3;
	Thu,  4 Oct 2018 13:29:59 +0000 (UTC)
From: Angelo Dureghello <angelo@sysam.it>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2018 15:29:52 +0200
Message-Id: <20181004132953.3568-4-angelo@sysam.it>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181004132953.3568-1-angelo@sysam.it>
References: <20181004132953.3568-1-angelo@sysam.it>
Cc: Angelo Dureghello <angelo@sysam.it>
Subject: [PATCH 3/4] conf/machine/include: add m68k architecture definitions
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
X-List-Received-Date: Thu, 04 Oct 2018 13:39:17 -0000

Signed-off-by: Angelo Dureghello <angelo@sysam.it>
---
 meta/conf/machine/include/m68k/README        | 9 +++++++++
 meta/conf/machine/include/m68k/arch-m68k.inc | 8 ++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta/conf/machine/include/m68k/README
 create mode 100644 meta/conf/machine/include/m68k/arch-m68k.inc

diff --git a/meta/conf/machine/include/m68k/README b/meta/conf/machine/include/m68k/README
new file mode 100644
index 0000000000..58722da6c4
--- /dev/null
+++ b/meta/conf/machine/include/m68k/README
@@ -0,0 +1,9 @@
+2018/10/03 - Angelo Dureghello <angelo@sysam.it>
+  - Initial revision
+
+There are actually no ABIs defined.
+
+The TUNE_ARCH is defined as "m68k".
+
+The TUNE_PKGARCH is defind as ${TUNE_PKGARCH_tune-${DEFAULTTUNE}}.
+
diff --git a/meta/conf/machine/include/m68k/arch-m68k.inc b/meta/conf/machine/include/m68k/arch-m68k.inc
new file mode 100644
index 0000000000..3ff8a3a5b5
--- /dev/null
+++ b/meta/conf/machine/include/m68k/arch-m68k.inc
@@ -0,0 +1,8 @@
+# m68k Architecture definitions
+
+DEFAULTTUNE ?= "m68k"
+
+# Architecture name
+TUNE_ARCH = "m68k"
+
+TUNE_PKGARCH = "${TUNE_PKGARCH_tune-${DEFAULTTUNE}}"
-- 
2.11.0


