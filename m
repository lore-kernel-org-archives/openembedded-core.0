Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15268.1795517770774021141
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 02:56:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kbWSREbK;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2979; q=dns/txt;
  s=iport01; t=1795517771; x=1796727371;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=M1AAegc75nLTeMGz4Q4HcDr/ypdjQV91SDdnt6tIFRk=;
  b=kbWSREbK1BG5Xu048spbyBPGdvb8gVNoFba/3exzet0xXZTxiZ2t9yKw
   lEtTjlWDfyQSaqLanqL33fgXx5KIsl8BpXIkjnIMHT4zJ5/M+UE2c4wr9
   dKAwcUNC0qMpqgyDUbqY7BjAz8f/4T2zzmdJoGPGq8xc/Eqtrn9okR+9k
   hgSiInRojxCbth6BInoKzO+n9NuC7pTdSleLBhSe3SPi6srX1CGPqc9mE
   ZG7xp+IURTQonIyZ0qW8QF2lf4RlQuosXzMlaRLR+XHwVFsY+U2FlSclh
   rBAd6tiRRdhZVPA/S1r5dbxb9IRa8TNg2Q/ubg5XoqzPuPsDCf6tbLhIA
   g==;
X-CSE-ConnectionGUID: rC+DqFwGRKGZD4V8FCoCiQ==
X-CSE-MsgGUID: e448N7gjTs+a0d98rhGebg==
X-IPAS-Result: =?us-ascii?q?A0BIAgCCagVr/9RK/pBaglmCV3VhQkkDlCeCJJ4pgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAzIBGAE9HAMBAhcYKyMIGYMCAYJ0AgERuluCLIEBg?=
 =?us-ascii?q?ykBPwJDUNszAQsUAYE4hUKIJF0YAYR9JxsbgXKBFYNqgQWBXAIDgiUFC4VuB?=
 =?us-ascii?q?IIiehKBVB6MeQKBT4hJSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHG?=
 =?us-ascii?q?wYFgRyBHoESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBE?=
 =?us-ascii?q?xosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAh8QB?=
 =?us-ascii?q?hYhCxsYDUgRLDcVGQQ+bgeUFIMagQ4BK4IsHKM4giGhEQoog3mMJJU6GjOqc?=
 =?us-ascii?q?guYfY4KllGEaoFoPIFZcBWDIglKGQ+OOYNrhRPJSCM1CwMvAQEHAgcOAwuBa?=
 =?us-ascii?q?JF+AQE?=
IronPort-Data: A9a23:vxN24atGajqvy3VsRD9u+ddh9+fnVAJfMUV32f8akzHdYApBsoF/q
 tZmKTyOMvaONmShLdB1bYm+/UIA6p7Qy9QyTAU/pC0yFX5AgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656ykmiMlkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvZ80s11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw4M00LXhg6
 tMiCx8/Qky918ydx5m6c7w57igjBJGD0II3s3x6iDWcBvE8TNWaGuPB5MRT23E7gcUm8fT2P
 pZFL2AyMFKfP1sVYw1/5JEWxI9EglH2aCVRslecv4I84nPYy0p6172F3N/9JITTFZ0MxBbwS
 mTu8jilUjdFO96j0nmMqn791vXPsi7xV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz5RvIzu/f5ByUQzFdCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:JASQlqoEW+LWQS+QgTaTjWoaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3A9toaLWpTjfZ5XsUJDoYiyC7mUdoOMVHE4mj/GWy?=
 =?us-ascii?q?XO0o1du27Yli7+Zoxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AGK0N+Q590lLJPFRpJCYuJ3Ilxoxlv/j+Lh8Ck6k?=
 =?us-ascii?q?d+MDcOX0gITeygT64F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="60180128"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 10:56:10 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id E37B1180001CA
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:56:09 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 29E3ECBF230; Tue, 24 Nov 2026 02:56:07 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail][PATCH 08/10] openssh: Fix CVE-2026-106583
Date: Tue, 24 Nov 2026 02:55:31 -0800
Message-Id: <20261124105533.348654-9-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124105533.348654-1-asparmar@cisco.com>
References: <20261124105533.348654-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251011
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1]. The two other commits linked by [2] only add and
adjust regression tests; they contain no functional security fix.

[1] https://github.com/openssh/openssh-portable/commit/0c4c9a7b320bd7ff61c4a2dc345cb2e27e9663b2
[2] https://ubuntu.com/security/CVE-2026-106583

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106583.patch     | 42 +++++++++++++++++++
 .../openssh/openssh_10.5p1.bb                 |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106583.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106583.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106583.patch
new file mode 100644
index 0000000000..90fcd1e07d
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106583.patch
@@ -0,0 +1,42 @@
+From 6a50f8a212670487306cdece3da6a79e4065b65c Mon Sep 17 00:00:00 2001
+From: "dtucker@openbsd.org" <dtucker@openbsd.org>
+Date: Mon, 5 Oct 2026 06:03:40 +0000
+Subject: [PATCH] upstream: Further restrict the characters allowed in a
+ command-line
+
+supplied user name, disallowing '$' and '\'. Reported by SecBuddyF KeenLab
+Tencent (CodeBuddy Security).
+
+OpenBSD-Commit-ID: 13671c178f492af63b5c1296f284818c7809ed9a
+
+CVE: CVE-2026-106583
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/0c4c9a7b320bd7ff61c4a2dc345cb2e27e9663b2]
+
+Backport Changes:
+- Omit the upstream OpenBSD revision-only hunks.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ readconf.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/readconf.c b/readconf.c
+index bc48b4f..e91bb67 100644
+--- a/readconf.c
++++ b/readconf.c
+@@ -3449,14 +3449,11 @@ ssh_valid_ruser(const char *s)
+ 	for (i = 0; s[i] != 0; i++) {
+ 		if (iscntrl((u_char)s[i]))
+ 			return 0;
+-		if (strchr("'`\";&<>|(){}", s[i]) != NULL)
++		if (strchr("'`\";&<>|(){}$\\", s[i]) != NULL)
+ 			return 0;
+ 		/* Disallow '-' after whitespace */
+ 		if (isspace((u_char)s[i]) && s[i + 1] == '-')
+ 			return 0;
+-		/* Disallow \ in last position */
+-		if (s[i] == '\\' && s[i + 1] == '\0')
+-			return 0;
+ 	}
+ 	return 1;
+ }
diff --git a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
index ab6b320c75..4db5a42957 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
@@ -32,6 +32,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-106587.patch \
            file://CVE-2026-106582.patch \
            file://CVE-2026-106585.patch \
+           file://CVE-2026-106583.patch \
            "
 SRC_URI[sha256sum] = "d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3bd6cbd19218db11"
 
-- 
2.35.6

