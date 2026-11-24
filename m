Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15273.1795517772349077286
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 02:56:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=cLPn7r14;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3557; q=dns/txt;
  s=iport01; t=1795517772; x=1796727372;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=LCD2+CwxoZgVh2XwXj8MOxRWMK8EXDjZC9oSjOiCJ0A=;
  b=cLPn7r14D01V6Odkq/QENClu6sdnpkF9GEsfKnCcuhlBfasVdWlOnt1i
   XXHKrESUZOIim6vzlADO6bTih+nSBUtziM5diAQffm8Ubs2fuf6MAQ+rZ
   evp2vvFdqB83YtxqRytnoFFvMhvNk8fqsw6hQy/0W7HaIQwt+wqb5ZtL8
   1yBTLPuUUHjG25WQGel4V0uWnNCr5m4pzdAVsNzrZFWbqBUhMsAKUFL0G
   uErYPft3jKDK5hHkp3APfYWjyoNXxdpG/0n2olRauD1ifaaiqRSiE4dW0
   LrTd9kDmRyOtlAHcq/hIrm8nmiiNU3g7lNrkQJ2rGDR3NSSVt2FyvQfQ/
   A==;
X-CSE-ConnectionGUID: naVkTjYWSrOTxe4kFK0IOA==
X-CSE-MsgGUID: NOEUODn/TY6g+3P5f5a86w==
X-IPAS-Result: =?us-ascii?q?A0BLAgDCbAVr/9NK/pBaglmCV3VhQkkDhFSPU4IhA54pg?=
 =?us-ascii?q?X4PAQEBD0QNBAEBhD9GAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDZASAQIBAyMECwEYAT0cAwECAwImAgIrIwgZgwIBgnQCA?=
 =?us-ascii?q?RG6Wnp/M4EBgykBPwJDUNszAQsUAYEKLoVCgyABhQNdGAGEfScbG4FygRWDa?=
 =?us-ascii?q?oEFgVwCA4U5gmoEgiJ6EoFUHox5AoFPiElIgQIcA1ksAVUTDQoLBwWBaAM1E?=
 =?us-ascii?q?ioVbjIdgSM7Fy9YGwYFgRyBHoESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFU?=
 =?us-ascii?q?wklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+G?=
 =?us-ascii?q?wqBDCcfHhsOAh8QBhYhCxsYDUgRLDcVGQQ9AW4HlBSDGlk1ARMYgTR4kzWSQ?=
 =?us-ascii?q?KERCiiDeYwklToaM6pyC5h9jgqVN01NhGqBaDyBWXAVgyIJShkPjjmDa4UTy?=
 =?us-ascii?q?UgjNQsDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:vaWDrahVYpV9215dIdRTSUVJX161NBEKZh0ujC45NGQN5FlHY01je
 htvX2vXPqrcYjDycowlaI2w/UsD7JTVzodkT1A4r3pnFyNjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvjY8EkHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUe89h0PWN/y
 scCDwwdY0yAqcHu4ZWSH7wEasQLdKEHPasWt2slyXTSCuwrBMmbBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcWYz/7C7pm9AusrnDkazRCrVuPjaE2+GPUigd21dABNfKLIoTTGJkIwC50o
 Erg2EnEJT0cc+CulzXGqUrxiLLGzX3kDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXzBCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:EViAWq7c3tI7TDY0BQPXwOrXdLJyesId70hD6qkXc20zTiX4rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: 9a23:kbbt+m+2wWlWEuxu9vqVv0gdJMMZcEzi9233H1+1VWVHa+W0bnbFrQ==
X-Talos-MUID: 9a23:0E0erQUb334yE9Lq/BnLqQxFGMEv35XwBwNWqcgI5sDUazMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60015456"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 10:56:08 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id 61609180001D1
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:56:08 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 14551CBF222; Tue, 24 Nov 2026 02:56:07 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail][PATCH 03/10] openssh: Fix CVE-2026-106587
Date: Tue, 24 Nov 2026 02:55:26 -0800
Message-Id: <20261124105533.348654-4-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124105533.348654-1-asparmar@cisco.com>
References: <20261124105533.348654-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251017
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/openssh/openssh-portable/commit/526fd2771342f36142099bec82c49ce0457c5016
[2] https://ubuntu.com/security/CVE-2026-106587

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106587.patch     | 56 +++++++++++++++++++
 .../openssh/openssh_10.5p1.bb                 |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106587.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106587.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106587.patch
new file mode 100644
index 0000000000..db60004ea2
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106587.patch
@@ -0,0 +1,56 @@
+From 65a4ca5e5fe7b0980991829f09f06c3c66572289 Mon Sep 17 00:00:00 2001
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
+- Omit the servconf.c OpenBSD revision-only hunk.
+- Retain the existing post-authentication cleanup and undefine
+  CLEAR_ON_NONE after clearing the three pre-authentication options.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ servconf.c | 17 +++++++++++++++++
+ 1 file changed, 17 insertions(+)
+
+diff --git a/servconf.c b/servconf.c
+index ac0c31d..79afa7c 100644
+--- a/servconf.c
++++ b/servconf.c
+@@ -3949,6 +3949,23 @@ copy_set_server_options(ServerOptions *dst, ServerOptions *src, int preauth)
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
++#undef CLEAR_ON_NONE
++
+ 	/*
+ 	 * The only things that should be below this point are string options
+ 	 * which are only used after authentication.
diff --git a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
index 5b546e4b53..495c69c0ec 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
@@ -29,6 +29,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-106586_p1.patch \
            file://CVE-2026-106586_p2.patch \
            file://CVE-2026-106586_p3.patch \
+           file://CVE-2026-106587.patch \
            "
 SRC_URI[sha256sum] = "d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3bd6cbd19218db11"
 
-- 
2.35.6

