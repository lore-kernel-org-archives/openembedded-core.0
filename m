Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36413.1795585636802208073
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:47:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=FdXyS7ew;
 spf=pass (domain: cisco.com, ip: 173.38.203.69, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3809; q=dns/txt;
  s=iport01; t=1795585637; x=1796795237;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=PDwjiLDnYSmsnDVaHbxcLc2+vNWk2TiLyC8tSbXxOeI=;
  b=FdXyS7ewM2W3xVmyzbvd73k46vti4tbBBb9macUEMt5+YzGNRL1zBJXH
   Kmhtm4s1RCBaUlkJdJiKvOYHojZ/eEpnTilGxYT3jw6D2e5BDRmof2VLh
   wTjmBS5M/+O4ybiOM1ygvZQtjQ5MjXaWeRL2mi9mcFMTbCEE94zbAHIwh
   WFGUd0pqtj1IkMt+K+nvzpk/i0qgEGdiWQxNB8XCBz4hH46BO994an0CB
   64jJvmYLjSd7RWV5TtYeMNf6ej71lvU11c74ISBx02jLmAjHz+PuEmE1a
   VcyehDeBCLjW2zdVGiWPklb6TWlsdIkjeuFSli88M7qMaHvbpRb3I4SbE
   A==;
X-CSE-ConnectionGUID: jCgEx2u4Spi/wG2kt6AWbQ==
X-CSE-MsgGUID: KTiq6TIeTXqIksC2L/Sh0g==
X-IPAS-Result: =?us-ascii?q?A0BMAgD8dAZr/8xK/pBaglmCGD91YENJA4RUj1OCIQOeK?=
 =?us-ascii?q?YF+DwEBAQ9EDQQBAYQ/RgKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2QEgECAQMjBAsBGAE9HAMBAgMCJgICKyMIGYMCAYJ0A?=
 =?us-ascii?q?xG5cHp/M4EBgykBPwJDUNszAQsUAYEKLoVCgyABhQRdGAGEficbG4FygRWDa?=
 =?us-ascii?q?oEFgVwCA4U5gmoEgiJ6EoFUHox1AoFJiFJIgQIcA1ksAVUTDQoLBwWBaAM1E?=
 =?us-ascii?q?ioVbjIdgSM7Fy9YGwYFgRyBHoESgQNdgSsoXiGBCIF1AoJRggACAUlBDgdFU?=
 =?us-ascii?q?wklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAcJC8FGSY8G?=
 =?us-ascii?q?wqBDCcdHhkOAikGFiELNBgNSBEsNxUZBD0BbgeUE4MbMSg1ARMYgTR4kzWSQ?=
 =?us-ascii?q?KERCiiDeYwklToaM6pyC5h9jgqVN4EahGqBaDyBWXAVgyIJShkPjjmBHwECg?=
 =?us-ascii?q?kmFE8lIJjILAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:FgAW/aBtMCPjLxVW/3ziw5YqxClBgxIJ4kV8jS/XYbTApGlw1zYEy
 zRNWT2HbP2NZjCkft8nOtm18h5UvpfVxoc2OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCC+G+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb/hmYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEwd5hIVFsINEj4ucwHk4U9
 uBGAQ8HV0XW7w626OrTpuhEj8k5ac2uN4QFtzQ4lnfSDO0tRtbIRKCiCd1whWtswJoTQbCBO
 4xDMWYHgBfoO3WjPn8XFJI3n+6yrnL+aDZf7lmSoMLb5kCNl1Irgee9arI5fPSpecRMwHq5q
 1725kX6GTpAEJukyWKKpyfEaujn2HmTtJgpPLqg+/hnhVeeymAeBFgdUkG2if24kVKlHdVHJ
 koZ/yAjoaQ/+AqsVNaVYvGjiHeJpFsYHtFXCeB/sFrLwavP6AHfDW8BJtJcVOEbWAYNbWRC/
 je0cxnBXFSDbJX9paqhy4qp
IronPort-HdrOrdr: A9a23:4HazNqrNv1KLNwlmMAjCnFYaV5oJeYIsimQD101hICG9Ffbo8P
 xG/c5rsSMc5wx+ZJhNo7290ey7MBDhHP1OkOws1MmZPTUO0VHAROoJ0WKh+UyDJ8SUzIFgPM
 lbH5SWcOeRMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ANV0mlhD0Jcjpy1SZNNXB7OaY=
X-Talos-CUID: 9a23:sAYhDGAyqX8q6xb6EytM+2MEQN15SWXci2j/eUykV09WQoTAHA==
X-Talos-MUID: 9a23:zVGWRws1QpdFQT54Zs2npw1jLZlUwqmSOFksko4t4e3DDiwoNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="63629782"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:47:13 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id E224218000206
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:47:12 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 8AD21CBF203; Tue, 24 Nov 2026 21:47:11 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 03/10] openssh: Fix CVE-2026-106587
Date: Tue, 24 Nov 2026 21:47:04 -0800
Message-Id: <20261125054711.2691239-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125054711.2691239-1-hthakar@cisco.com>
References: <20261125054711.2691239-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:47:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251141
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/openssh/openssh-portable/commit/526fd2771342f36142099bec82c49ce0457c5016
[2] https://ubuntu.com/security/CVE-2026-106587

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106587.patch     | 62 +++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106587.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106587.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106587.patch
new file mode 100644
index 0000000000..203dd8cc05
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106587.patch
@@ -0,0 +1,62 @@
+From 526fd2771342f36142099bec82c49ce0457c5016 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Wed, 16 Sep 2026 00:35:09 +0000
+Subject: [PATCH] upstream: Correctly handle some options that accept "none"
+
+Some options, including AuthorizedPrincipalsFile were documented as accepting
+"none" as a way to disable them, however when overriddes by a ssh_config(5)
+Match keyword, this argument was being interpreted as a literal file.
+
+With Chris Rohlf in collaboration with Claude and Anthropic Research
+
+ok markus, deraadt
+
+OpenBSD-Commit-ID: 802f3a7695eba20924c05e500b0ecd34ec877756
+
+CVE: CVE-2026-106587
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/526fd2771342f36142099bec82c49ce0457c5016]
+
+Backport Changes:
+- Omitted the upstream servconf.c OpenBSD revision-only hunk and retained
+  the Wrynose OpenSSH 10.3p1 revision.
+- Adapted the fix to OpenSSH 10.3p1's manual Match-option copy routine;
+  the upstream commit uses generated option-copy helpers. Left the
+  older version's existing post-authentication cleanup in place, so
+  the CLEAR_ON_NONE macro is undefined immediately after the three
+  pre-authentication options rather than reused below.
+
+(cherry picked from commit 526fd2771342f36142099bec82c49ce0457c5016)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ servconf.c | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/servconf.c b/servconf.c
+--- a/servconf.c
++++ b/servconf.c
+@@ -2884,6 +2884,23 @@ copy_set_server_options(ServerOptions *dst, ServerOptions *src, int preauth)
+ 
+ 	/* Arguments that accept '+...' need to be expanded */
+ 	assemble_algorithms(dst);
++
++	/*
++	 * These options may be "none" to clear a global setting.  They are
++	 * consulted before authentication, so they must be cleared here
++	 * rather than in the post-auth section below.
++	 */
++#define CLEAR_ON_NONE(v) \
++	do { \
++		if (option_clear_or_none(v)) { \
++			free(v); \
++			v = NULL; \
++		} \
++	} while(0)
++	CLEAR_ON_NONE(dst->authorized_principals_file);
++	CLEAR_ON_NONE(dst->trusted_user_ca_keys);
++	CLEAR_ON_NONE(dst->banner);
++#undef CLEAR_ON_NONE
+ 
+ 	/*
+ 	 * The only things that should be below this point are string options
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 9941487026..6037efb62c 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -39,6 +39,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-106586_p1.patch \
            file://CVE-2026-106586_p2.patch \
            file://CVE-2026-106586_p3.patch \
+           file://CVE-2026-106587.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6

