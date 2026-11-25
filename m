Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36466.1795585636913943100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:47:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YklHy1iS;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2837; q=dns/txt;
  s=iport01; t=1795585637; x=1796795237;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=laREhs1GEHTv6bhM9aIINBQP8zMvwjcB31MRsMQlH/0=;
  b=YklHy1iShYQU2/+Q8AbYCH5eWoKTjG9+bqPGG7P6Eas+ckm9A7vcJG6S
   V0aeLKZaLTQ4OA8IO4Rf8T1z36DzeFfZD8i/QqMXReD3TyYVLzF+vIARA
   UP4hro7XW9tI3lrxAYxgIm9/wM+qNofaZgRpLoGwTYehL+2VDKzaNQg0n
   RCl5zP1LyFZvuBdDXwG5XIqK8YhdYcxE7XtX30BvUJsqHbMSZHM/mbhjO
   mQZPCkMu22frR8X1VnxzlccV/fRGN2twSzOvGDW0TPG8pfXzqG6BS3gzc
   zofYJbjT8638rk91D8JYQdcHjiM4WrI0Truatm5dDdECaEOZBQqiueu54
   g==;
X-CSE-ConnectionGUID: z2FuRrsjS/KqfUK7WGBY/w==
X-CSE-MsgGUID: /s+YFyWQT0+MfIO7uQT+ag==
X-IPAS-Result: =?us-ascii?q?A0BIAgB8dQZr/9NK/pBaglmCV3VgQ0kDlCeCJJ4pgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAzIBGAE9HAMBAi8rIwgZgwIBgnQDEblvgiyBAYMpA?=
 =?us-ascii?q?T8CQ1DbMwELFAGBOIVCiCVdGAGEficbG4FyhH+BBYFcAgOCKoV5BIIiehKBV?=
 =?us-ascii?q?B6MdQKBSYhSSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBH?=
 =?us-ascii?q?oESgQNdgSsoXiGBCIF1AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaN?=
 =?us-ascii?q?TwJJj8VDGcLGgVhCAINDHQ5EDAcJC8FGSY8GwqBDCcdHhkOAikGFiELNBgNS?=
 =?us-ascii?q?BEsNxUZBD5uB5QTgxt7EwErgiyldaERCiiDeYwklToaM6pyC5h9jgqWUYRqg?=
 =?us-ascii?q?Wg8gVlwFYMiCUoZD445g2uFE8lIJjILAy8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:uyDZwanOYYL3FToJlfsMJ4Po5gzUJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZWW2FO62OYmqgKop1O9m+p01T6sLdztI2HFE5/y9gQ1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6x9yQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsf/b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FZ9C1PtNG3pMz
 rs7MT4wTU+8qMiHh63uH4GAhux7RCXqFIoSoDRkiDreF/tjGMiFSKTR7tge1zA17ixMNa+CO
 4xDNGYpM0iGOUQWUrsUIMpWcOOAhmX/ej5RsnqepLE85C7YywkZPL3FboKLIIfQHJ49ckCw4
 XmFzkroPSgmbJ+6xxuirW+VuqzGknauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZHvd/7ESGzbDZpl/BQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:Sf5MAaqjA+XNxjqolB2GALoaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: 9a23:GRkDNmA9gW+52cP6Ezs92lMuANsnSTr+1XntABCHJkxYD6LAHA==
X-Talos-MUID: 9a23:tFhkagkuwz+YLLDQssyWdnolL4RZzbWRMXxV0rAImu7bKBVMeD6S2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60623213"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:47:13 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id CC1131800031B
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:47:12 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 7EDD9CBF201; Tue, 24 Nov 2026 21:47:11 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 01/10] openssh: Fix CVE-2026-106584
Date: Tue, 24 Nov 2026 21:47:02 -0800
Message-Id: <20261125054711.2691239-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125054711.2691239-1-hthakar@cisco.com>
References: <20261125054711.2691239-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:47:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251144
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/openssh/openssh-portable/commit/aef20dfe30e68a469911a229b9117e7134766311
[2] https://ubuntu.com/security/CVE-2026-106584

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106584.patch     | 39 +++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106584.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106584.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106584.patch
new file mode 100644
index 0000000000..31b35aad9a
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106584.patch
@@ -0,0 +1,39 @@
+From aef20dfe30e68a469911a229b9117e7134766311 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Tue, 15 Sep 2026 08:31:46 +0000
+Subject: [PATCH] upstream: Correct handling of DST when converting dates
+
+Timestamps conversion was ignoring Daylight Savings Time (DST) causing
+date conversions to be +/-1 hour under some circumstances.
+
+bz4004; from Khush Patel, ok deraadt
+
+OpenBSD-Commit-ID: bd5eb2603c04d4b5072b0e593b137a98ef75b731
+
+CVE: CVE-2026-106584
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/aef20dfe30e68a469911a229b9117e7134766311]
+
+Backport Changes:
+- Omitted the upstream misc.c OpenBSD revision-only hunk. OpenSSH 10.3p1
+  also lacks earlier error-sentinel handling; that is not part of this
+  DST fix and is not imported here.
+
+(cherry picked from commit aef20dfe30e68a469911a229b9117e7134766311)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ misc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/misc.c b/misc.c
+--- a/misc.c
++++ b/misc.c
+@@ -2591,6 +2591,7 @@ parse_absolute_time(const char *s, uint64_t *tp)
+ 		if ((tt = timegm(&tm)) < 0)
+ 			return SSH_ERR_INVALID_FORMAT;
+ 	} else {
++		tm.tm_isdst = -1;	/* mktime decides DST */
+ 		if ((tt = mktime(&tm)) < 0)
+ 			return SSH_ERR_INVALID_FORMAT;
+ 	}
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index dfcb77f215..8bdbdcd6bd 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -35,6 +35,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-73282.patch \
            file://CVE-2026-73281.patch \
            file://CVE-2026-123158.patch \
+           file://CVE-2026-106584.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6

