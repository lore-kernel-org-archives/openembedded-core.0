Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7A48CD98DA
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 17:31:09 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.135237.1781544661710953262
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 10:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=FsZjMomm;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2958; q=dns/txt;
  s=iport01; t=1781544661; x=1782754261;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=a1rjXrEQKaH3qZ62ONKqeYCaqJrer3bWqrxnq42kHP8=;
  b=FsZjMomm1y4o7NnPhP5yd5HF9vIT7hil0Paod9gJ47APZiAuJfYJwLVO
   Ds4I4efuLZ2WR0ODg+pB1qro0bz7lpIiBCIEAQgjQkXjStc40HYG/gfxj
   0+pFOP4aHhWYIRIcmaelXEveYZGvKWlTvVR8v0TcunaXkzdrOp82sXDcp
   evB4tItiRM+bzGWJFOtlgPxtJPCbsBuzwIb/YJl5rotqFQHvsTxArlULu
   eDoyMgRt6ZBrmgSDev9Rl9BEL+0UfiLMuFp00ys98sAUUiz74VfV2Flhp
   8sqgW4fboURD4cgdEjWGh3X1Qca1Ugc+/YXORwUxn2JFSfOQvGfW8T56G
   g==;
X-CSE-ConnectionGUID: lalyEjgWTZ2R7OEmWkkxuQ==
X-CSE-MsgGUID: DFehz3EwTSS6hZcuw17N6Q==
X-IPAS-Result: =?us-ascii?q?A0BDAgAJNjBq/4z/Ja1aglmCGD90X0JJA5QngiGeHoF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAZJKAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NhloBLQsBcgMBAlojIYIqWAGCcwIBEbVuGjeBeTOBAYNaBQkCQ1DbL?=
 =?us-ascii?q?AEFBhQBgTiFP4gfWxgBhHwnGxuBcoQIdoEFgVwFgiqFeASCIoEMgVoeUoFRg?=
 =?us-ascii?q?gqKXEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYFKgg+BBYULI?=
 =?us-ascii?q?x8DOX+Bb4ElZ2YVMDWBAhEfChwDCxgNSBEsNxQbBD5uB4xRFw+BSnOBDhQYU?=
 =?us-ascii?q?IEtL5MRkmWhDwoog3WMIZU6GjOqbJkIjgqVaGiEaIFoPIFZcBWDIlMZD1aNV?=
 =?us-ascii?q?wsLg2CFE8JmJDULAy8BAQcCBw4DC4FokX0BAQ?=
IronPort-Data: A9a23:97OKAqAmFLeTJhVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDhw0TNSy
 2ZJUDiHPPyNNjTxKNFxOo2zoxkD6J/Un9diOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jX2thh
 fuo+5eBYAH8hmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEx/xqHWw0MrIkyLxNXkZj8
 MMbKyAQV0XW7w626OrTpuhEnM8vKozveYgYoHwllWqfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY3BPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FAgjOm2bIKEJ7RmQ+15sEuYt
 Dnr4FjCOU8aBteC1mPa1CyV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KPpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:CoRrOKGnO5PqsCjppLqE2MeALOsnbusQ8zAXPidKOH5om6Oj+f
 xG8M536faWskdzZJhfo7G90cC7KBu2n6KdirN/AV7NZmXbUROTTL1K3M/F3yDqHTH4+6p20K
 dtdLU7NfjLZGIK6PoTJGKDYrEdKB7tytHNudvj
X-Talos-CUID: 9a23:TKzH9W+DNIEwGbxoFIOVv0odHtEIcHLi8EWKGRCfJGNWS76FVGbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3ARimA7AyWRZqJC+cnr7J9v+rpV3maqIiABUAfyrg?=
 =?us-ascii?q?Zh/K/ayxCMCqC1WuRHLZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,206,1774310400"; 
   d="scan'208";a="494934095"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jun 2026 17:31:00 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id AB196180005A6
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 17:31:00 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 52AA3CC2EC3; Mon, 15 Jun 2026 10:31:00 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] qemu: Fix CVE-2024-6519
Date: Mon, 15 Jun 2026 10:30:49 -0700
Message-Id: <20260615173049.4156087-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 17:31:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238857

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream v11.0.0-rc2 backport for
CVE-2024-6519. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2]. The individual
backported commit link is recorded in the embedded patch header.

[1] https://gitlab.com/qemu-project/qemu/-/commit/4862d2c95104d9fd0430cc003c205094f8ada1f9
[2] https://security-tracker.debian.org/tracker/CVE-2024-6519

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 54644dd924..d232446e2e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -45,6 +45,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2025-12464.patch \
            file://0001-python-backport-Remove-deprecated-get_event_loop-cal.patch \
            file://0002-python-backport-avoid-creating-additional-event-loop.patch \
+           file://CVE-2024-6519.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-6519.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-6519.patch
new file mode 100644
index 0000000000..431afbbc60
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-6519.patch
@@ -0,0 +1,51 @@
+From 86bc714d9d02a23ea6be878febdc327bbfc9ff50 Mon Sep 17 00:00:00 2001
+From: Paolo Bonzini <pbonzini@redhat.com>
+Date: Fri, 27 Mar 2026 17:37:31 +0100
+Subject: [PATCH] lsi53c895a: keep a reference to the device while SCRIPTS
+ execute
+
+SCRIPTS execution can trigger PCI device unplug and consequently
+a use-after-free after the unplug returns.  Avoid this by keeping
+the device alive.
+
+Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/3090
+
+CVE: CVE-2024-6519
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/4862d2c95104d9fd0430cc003c205094f8ada1f9]
+
+Cc: qemu-stable@nongnu.org
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+(cherry picked from commit 4862d2c95104d9fd0430cc003c205094f8ada1f9)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ hw/scsi/lsi53c895a.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
+index 4d0c5fcd9b7..37dd38d7a87 100644
+--- a/hw/scsi/lsi53c895a.c
++++ b/hw/scsi/lsi53c895a.c
+@@ -1158,6 +1158,7 @@ static void lsi_execute_script(LSIState *s)
+         s->waiting = LSI_NOWAIT;
+     }
+ 
++    object_ref(s);
+     reentrancy_level++;
+ 
+     s->istat1 |= LSI_ISTAT1_SRUN;
+@@ -1177,6 +1178,7 @@ again:
+         s->waiting = LSI_WAIT_SCRIPTS;
+         lsi_scripts_timer_start(s);
+         reentrancy_level--;
++        object_unref(s);
+         return;
+     }
+     insn = read_dword(s, s->dsp);
+@@ -1625,6 +1627,7 @@ again:
+     trace_lsi_execute_script_stop();
+ 
+     reentrancy_level--;
++    object_unref(s);
+ }
+ 
+ static uint8_t lsi_reg_readb(LSIState *s, int offset)
-- 
2.35.6


