Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84B42CD98DA
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 17:31:49 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.134969.1781544700390698878
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 10:31:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hoqfiuOV;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3048; q=dns/txt;
  s=iport01; t=1781544700; x=1782754300;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7qJyLExMqnEmNI7tU5eiVnLtzEPdHCyff/BDw9Q431A=;
  b=hoqfiuOVVW4mMQ2eBO9X8mOnnVos2w3uYPPUTi+IFXN97T1hltODlDc8
   JGpbWzzNvYSnDJHgCH2Huj363FZu8d/vzBUDnISxhJppTQV7iHWacEu7W
   km3ntYM/TO325Aas5i73KRGPpEfVYESnopPYK+X++woIBW/WNZ8eodlnb
   B2Fu4417h+3U/LLeTqnuaV4JYBgcYVEmvElV7OLnh5W8mP2wBALOvQDAd
   0Z4V3Uj+4+hGW8lslYDz94RhkJ13LC/i4fZDha6LwvTKEeK+ybuEsjAid
   aeZOqqq8XrQ15j8i3KMmxRjOhRT/j1Al7hnH3SOMHnhRbIBaKYqTtjgHN
   w==;
X-CSE-ConnectionGUID: cG4FBWGYS9yCHuB0jTeotg==
X-CSE-MsgGUID: J9N80LTMT0u+9RqWQZ/H+g==
X-IPAS-Result: =?us-ascii?q?A0BDAgCFNTBq/47/Ja1aglmCV3RfQkkDlCeCIYEWnQiBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGSSgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAS0LAXIDAQJaIyGDAgGCcwIBEbVsGjeBeTOBAYNaAwIJAkNQ2?=
 =?us-ascii?q?ywBCxQBgTiFP4gfWxgBhHwnGxuBcoEVgnN2gQWBXAWIIgSCIoEMgVoeUoFRg?=
 =?us-ascii?q?gqKXEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYFKgg+BBYULI?=
 =?us-ascii?q?x8DOX+Bb4ElZ2YVMDWBAhEfChwDCxgNSBEsNxQbBD5uB4xRFw+BS3KBDhQYI?=
 =?us-ascii?q?oIKkxGSZaEPCiiDdYwhlToaM4VbpRGZCI4KlWhohGiBaDyBWXAVgyIJShkPj?=
 =?us-ascii?q?i0LC4NghRPCZCQ1CwMvAQEHAgcOAwuBaJF9AQE?=
IronPort-Data: A9a23:UEn5/qy4ab8ewoEB1lB6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkVWz
 WZOWD3TaK6IMDOgethzPd+z8kMEupLVyNIySAs5/1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4+aT/H3Ygf/hWYqaz9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEoZYaMyxclGOjBf3
 twFAmgPUh2Em+3jldpXSsE07igiBNPgMIVavjRryivUSK57B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cOXWjOX9PYH46tOuli2P2bz1fgFmUvqEwpWPUyWSd1ZCxYIKLIIHVHpw9ckCwh
 DPgrzzdPjQmbMHcmACczUuewc+MknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:kPY3HKi8QanSok7he85EcCTM3XBQXuoji2hC6mlwRA09TyX+rb
 HNoB1173HJYVoqNU3I+urwW5VoP0m8yXcd2+B4Vt2ftWLd11dAQrsP0WKb+V3dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrMdKB3tytHOuQ8YpE0dKT1XVw==
X-Talos-CUID: =?us-ascii?q?9a23=3AVxvlf2ubt02k3IzmOh0bEa3R6IsuXSHz5kj/EnT?=
 =?us-ascii?q?pGE1JVZfNS2Od/79rxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A29a08Q7gz+ksE4sJo8/eqiYAxoxKsoL+UGQxtKl?=
 =?us-ascii?q?eporVDzVPAgXarHe4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,206,1774310400"; 
   d="scan'208";a="480625731"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Jun 2026 17:31:39 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 4F5CF18000348
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 17:31:39 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id EF91FCC2EC3; Mon, 15 Jun 2026 10:31:38 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] qemu: Fix CVE-2024-6519
Date: Mon, 15 Jun 2026 10:31:23 -0700
Message-Id: <20260615173123.4157356-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3552.cisco.com [171.68.249.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 17:31:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238858

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream QEMU fix for CVE-2024-6519. The
upstream fix commit is referenced in [1], the Debian tracker fix
status is referenced in [2], and the public security advisory is
referenced in [3].

[1] https://gitlab.com/qemu-project/qemu/-/commit/4862d2c95104d9fd0430cc003c205094f8ada1f9
[2] https://security-tracker.debian.org/tracker/CVE-2024-6519
[3] https://www.zerodayinitiative.com/advisories/ZDI-24-1382/

Signed-off-by: Deepak Rathore <deeratho@cisco.com>

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5f30416a48..4b6c2252b7 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -36,6 +36,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-accel-tcg-Fix-iotlb_to_section-for-different-Address.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
+           file://CVE-2024-6519.patch \
            "
 # file index at download.qemu.org isn't reliable: https://gitlab.com/qemu-project/qemu-web/-/issues/9
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2024-6519.patch b/meta/recipes-devtools/qemu/qemu/CVE-2024-6519.patch
new file mode 100644
index 0000000000..9bd36bed2c
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2024-6519.patch
@@ -0,0 +1,53 @@
+From 56cd5218a61d7365e501b57d8d79330ffa696031 Mon Sep 17 00:00:00 2001
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
+index 9ea4aa0a853..2cc7e945e16 100644
+--- a/hw/scsi/lsi53c895a.c
++++ b/hw/scsi/lsi53c895a.c
+@@ -1163,6 +1163,7 @@ static void lsi_execute_script(LSIState *s)
+         s->waiting = LSI_NOWAIT;
+     }
+ 
++    object_ref(s);
+     reentrancy_level++;
+ 
+     s->istat1 |= LSI_ISTAT1_SRUN;
+@@ -1182,6 +1183,7 @@ again:
+         s->waiting = LSI_WAIT_SCRIPTS;
+         lsi_scripts_timer_start(s);
+         reentrancy_level--;
++        object_unref(s);
+         return;
+     }
+     insn = read_dword(s, s->dsp);
+@@ -1630,6 +1632,7 @@ again:
+     trace_lsi_execute_script_stop();
+ 
+     reentrancy_level--;
++    object_unref(s);
+ }
+ 
+ static uint8_t lsi_reg_readb(LSIState *s, int offset)
+-- 
+2.35.6
-- 
2.35.6


