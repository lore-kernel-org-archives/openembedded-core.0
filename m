Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36604.1795586571452469872
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 22:02:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QW5k7NIc;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4309; q=dns/txt;
  s=iport01; t=1795586571; x=1796796171;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7xBLiP1KjWva5v/qdPy7PG6wpIo1ZvVUODXmwHDTpfo=;
  b=QW5k7NIcrCM31mnui8pAGS98rRtOL+7Vi8duQuV2L3XN+iO58HmUaz9J
   HWEKaj01vY2fwvwrAajjHSosaYbQ5LHZKPb8zJ7I6MoDxGmhNaSSpYbPE
   smfEFcQsnAqCvwyHl2FPf5FUjyakeMFRj2bHSSxXxuaLe4/b3B1nv9ooH
   0jZjP1pWAr2SCgmhd8VQIJ/NadhN1TDbn4Y3yoIhsIb/in7Dcj2pXU40A
   TUtc88tDHXZuFye9Cd4U3nMi3wW7eMkthMzLNdkzPmtgoY6dE2AbhYmzp
   SFAW2gJOA37ls96HsrlsLGclJg/AmhyU9ofQMsoLSMZiyWYUWMSMo7fq0
   A==;
X-CSE-ConnectionGUID: Hc+B24lKRYifmWH9FSRZ0g==
X-CSE-MsgGUID: 4EAn/JTVQo2P3Bd9QojwCQ==
X-IPAS-Result: =?us-ascii?q?A0BHAgDoeAZr/9RK/pBaglmCV3VhQkmEV49TgiGeLIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/jmoCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkBIBKQQLARgBWQMBAgMCJgItIyGDAgGCdAIBEblmen8zgQGDK?=
 =?us-ascii?q?QE/AkNQ2zMBCxQBgQouhUKDIAGFBF0YAYR+JxsbgXKBFYNqgQWBXAEBA4U5g?=
 =?us-ascii?q?moEgiJ6EoFUHox1AoFJiFJIgQIcA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F?=
 =?us-ascii?q?y9YGwYFgRyBHoESgQNdgSsoXiGBCIF1AoJRggACAUlBDgdFUwklQxJHJCIIE?=
 =?us-ascii?q?gkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAcJC8FGSY8GwqBDCcdHhkOA?=
 =?us-ascii?q?ikGFiELNBgNSBEsNxUZBD0BbgeUE4MbWTUBExcBgTRPk16SQKERCiiDeYwkl?=
 =?us-ascii?q?ToaM6pyC5h9jgqVN4EahGqBaDyBRwsHcBWDIglKGQ+OOYNrgX+DFMlIIzULM?=
 =?us-ascii?q?gEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:R94l8aPCZIrliFrvrR3wlsFynXyQoLVcMsEvi/4bfWQNrUoj3jFRn
 GIYC22HOfaNNGKkc4wnaYi2pxwP6MTQyYdrGXM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmM/ErF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gWMsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69VlT2tsYYk7wNd2D2Rx1
 a02Ewo/Nh/W0opawJrjIgVtrs0uNozveYgYoHwllGifBvc9SpeFSKLPjTNa9G5s2oYUQKqYO
 JZfM2M1BPjDS0Un1lM/CI4+leShnFH0ciZTrxSeoq9fD237klYgjuSyboe9ltqiGeh8mAG6m
 lz/+D7BWTsWZeWYyyWuyyf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNswRZX59bFPc3rVjUjKHV+A2eQGMDS1atdeAbiSP/fhRyv
 nfhoj8jLWUHXGG9IZ5FyoqpkA==
IronPort-HdrOrdr: A9a23:z+4zA63xbuero74dbHazDAqjBIQkLtp133Aq2lEZdPUzSL38qy
 nOpoV46faaslgssR0b9OxoW5PwIk80i6QV3WB5B97LN2PbUQCTQ72Kg7GP/9SZIU3D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb26GGTCv5a585+rJjsaDJ1d0w==
X-Talos-CUID: =?us-ascii?q?9a23=3A8oHLymqMloXfB0iy7r3Tl07mUeAuMVeHkHPzGX6?=
 =?us-ascii?q?5B2NWaOy7cmWioKwxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3At3EBvwx39/N4tn/UJ3IZf3EVFKuaqPiDIUZKs6k?=
 =?us-ascii?q?4gs7eDXdaN2akizaoabZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="62964765"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 06:02:47 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id 1491418000424
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 06:02:47 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id B2A16CC124B; Tue, 24 Nov 2026 22:02:45 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] openssh: fix CVE-2026-106587
Date: Tue, 24 Nov 2026 22:02:45 -0800
Message-Id: <20261125060245.3720245-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: aer-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 06:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251161
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1]..

[1] https://github.com/openssh/openssh-portable/commit/526fd2771342f36142099bec82c49ce0457c5016
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-106587

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106587.patch     | 76 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106587.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106587.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106587.patch
new file mode 100644
index 0000000000..d63b111555
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106587.patch
@@ -0,0 +1,76 @@
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
+- Retained the OpenSSH 9.6p1 OpenBSD revision identifier in servconf.c.
+- Kept the 9.6p1 M_CP_STROPT calls for post-authentication options; the
+  upstream copy_server_option_string helper does not exist in this version.
+
+(cherry picked from commit 526fd2771342f36142099bec82c49ce0457c5016)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ servconf.c | 27 +++++++++++++++++++--------
+ 1 file changed, 19 insertions(+), 8 deletions(-)
+
+diff --git a/servconf.c b/servconf.c
+--- a/servconf.c
++++ b/servconf.c
+@@ -2791,6 +2791,22 @@ copy_set_server_options(ServerOptions *dst, ServerOptions *src, int preauth)
+ 	/* Arguments that accept '+...' need to be expanded */
+ 	assemble_algorithms(dst);
+ 
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
++
+ 	/*
+ 	 * The only things that should be below this point are string options
+ 	 * which are only used after authentication.
+@@ -2800,15 +2816,10 @@ copy_set_server_options(ServerOptions *dst, ServerOptions *src, int preauth)
+ 
+ 	/* These options may be "none" to clear a global setting */
+ 	M_CP_STROPT(adm_forced_command);
+-	if (option_clear_or_none(dst->adm_forced_command)) {
+-		free(dst->adm_forced_command);
+-		dst->adm_forced_command = NULL;
+-	}
+ 	M_CP_STROPT(chroot_directory);
+-	if (option_clear_or_none(dst->chroot_directory)) {
+-		free(dst->chroot_directory);
+-		dst->chroot_directory = NULL;
+-	}
++	CLEAR_ON_NONE(dst->chroot_directory);
++	CLEAR_ON_NONE(dst->adm_forced_command);
++#undef CLEAR_ON_NONE
+ 
+ 	/* Subsystems require merging. */
+ 	servconf_merge_subsystems(dst, src);
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 6c8138ddd8..04595e706f 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -47,6 +47,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-73283.patch \
            file://CVE-2026-73282.patch \
            file://CVE-2026-73281.patch \
+           file://CVE-2026-106587.patch \
            "
 SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
 
-- 
2.35.6

