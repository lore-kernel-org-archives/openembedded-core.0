Return-Path: <angelo@sysam.it>
Received: from sysam.it (ec2-18-194-220-216.eu-central-1.compute.amazonaws.com
	[18.194.220.216])
	by mail.openembedded.org (Postfix) with ESMTP id 7FE0279357
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 13:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by sysam.it (Postfix) with ESMTP id CF2A7205CE;
	Thu,  4 Oct 2018 13:30:01 +0000 (UTC)
Received: from sysam.it ([127.0.0.1])
	by localhost (sysam.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FOZlCainMUUf; Thu,  4 Oct 2018 13:30:01 +0000 (UTC)
Received: from localhost.localdomain
	(host70-5-dynamic.16-79-r.retail.telecomitalia.it [79.16.5.70])
	by sysam.it (Postfix) with ESMTPSA id 26E89205C3;
	Thu,  4 Oct 2018 13:30:01 +0000 (UTC)
From: Angelo Dureghello <angelo@sysam.it>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2018 15:29:53 +0200
Message-Id: <20181004132953.3568-5-angelo@sysam.it>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20181004132953.3568-1-angelo@sysam.it>
References: <20181004132953.3568-1-angelo@sysam.it>
Cc: Angelo Dureghello <angelo@sysam.it>
Subject: [PATCH 4/4] conf/machine/include: add mcf5441x cpu type tuning
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

This patch adds tuning for the mcf5441x ColdFire family.

Signed-off-by: Angelo Dureghello <angelo@sysam.it>
---
 meta/conf/machine/include/tune-mcf5441x.inc | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-mcf5441x.inc

diff --git a/meta/conf/machine/include/tune-mcf5441x.inc b/meta/conf/machine/include/tune-mcf5441x.inc
new file mode 100644
index 0000000000..11a41a7c5d
--- /dev/null
+++ b/meta/conf/machine/include/tune-mcf5441x.inc
@@ -0,0 +1,13 @@
+DEFAULTTUNE ?= "mcf5441x"
+
+require conf/machine/include/m68k/arch-m68k.inc
+
+TUNEVALID[mcf5441x] = "Enable coldfire specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'mcf5441x', ' -mcpu=54418', '', d)}"
+
+AVAILTUNES += "mcf5441x"
+TUNE_FEATURES_tune-mcf5441x = "mcf5441x"
+TUNE_ARCH_tune-mcf5441x = "mcf5441x"
+TUNE_PKGARCH_tune-mcf5441x = "mcf5441x"
+PACKAGE_EXTRA_ARCHS_tune-mcf5441x = "m68k mcf5441x"
+
-- 
2.11.0


