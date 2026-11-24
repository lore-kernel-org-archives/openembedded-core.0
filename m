Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15272.1795517772250648076
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 02:56:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=E+iq0UDy;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2746; q=dns/txt;
  s=iport01; t=1795517772; x=1796727372;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=iH2ZUlQWDigPWk6+pG3bOQXgUXVU4EyXGJYG1RsZIYI=;
  b=E+iq0UDypyWtvbeXV866EMdeJVBd5Ekxk97yzSIFFiAdKFm6Eoymnsql
   CA5zWF5o4DWN+vtcTDI5EcFyb+304T8LcfF2l3tkWqsC8MH06l9oxTUTy
   5uCkovL61J/OCL0CvS228vhZB6ro/s7WjGXuNuI/i0e/mUmVQm5zDT69N
   JYovO2EAD/nXdZHQWQsHtFbFFyrRIay36GO2ZxUzEVFGrMBEJOR3a/4Rl
   Zfr9fhG5Gy+8nQcugGwCC6D/2Xrr9ujPCbMIXkk0cC9CuhoyplLEqO7ch
   fRgLLNuik/tcxy6Bv6boFLOauh1yg7aypxEwn3RQ9E4qtO69VVBrlMfrZ
   g==;
X-CSE-ConnectionGUID: bSj0HfAuQWGDh01hKHNEsA==
X-CSE-MsgGUID: MIp7TqUuR9WjfGnNR6YaSw==
X-IPAS-Result: =?us-ascii?q?A0BIAgDCbAVr/9RK/pBaglmCV3VhQkkDlCeCJJ4pgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAzIBGAE9HAMBAi8rIwgZgwIBgnQCARG6WoIsgQGDK?=
 =?us-ascii?q?QE/AkNQ2zMBCxQBgTiFQogkXRgBhH0nGxuBcoR/gQWBXAIDgiqFeQSCInoSg?=
 =?us-ascii?q?VQejHkCgU+ISUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBBxsGBYEcg?=
 =?us-ascii?q?R6BEoEDXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBG?=
 =?us-ascii?q?jU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bDgIfEAYWIQsbG?=
 =?us-ascii?q?A1IESw3FRkEPm4HlBSDGnsTASuCLKV1oREKKIN5jCSVOhozqnILmH2OCpZRh?=
 =?us-ascii?q?GqBaDyBWXAVgyIJShkPjjmDa4UTyUgjNQsDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:rSEC168E+jZW1kmwTgRTDrUD1H+TJUtcMsCJ2f8bNWPcYEJGY0x3m
 zNOWmrVb/feNGWgLtt2Pd+3/UlQ6MDVzNZkGQBr+C1EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazhIs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2k8Bo9A2uheHFhx2
 tAYcGkNTTClqvmflefTpulE3qzPLeHiMZlavjRryivUSK9/B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6ZOXWjOX9PYH46tO6znnDldjRCgFmUvqEwpWPUyWSd1ZCzaoWEJYHbHK25mG69h
 3qZw33EHytLC96R5jyjyCydj9TQyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRul/fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:nqFFNaOm2M8HlsBcTu2jsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: =?us-ascii?q?9a23=3AG6J1dmmrYA3T0T+QFO0K+XofPQPXOXfmzi/wLWa?=
 =?us-ascii?q?lMFlGZL3NEF+z2IVJiOM7zg=3D=3D?=
X-Talos-MUID: 9a23:OmPXSAg0qA2cnbis5Avzh8MpEeZwvJi3NV03wKoEteaCExYuCj6mk2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="62797591"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 10:56:08 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id 5A0B21800040B
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:56:08 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 0CDA4CC2EF1; Tue, 24 Nov 2026 02:56:07 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail][PATCH 01/10] openssh: Fix CVE-2026-106584
Date: Tue, 24 Nov 2026 02:55:24 -0800
Message-Id: <20261124105533.348654-2-asparmar@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251015
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/openssh/openssh-portable/commit/aef20dfe30e68a469911a229b9117e7134766311
[2] https://ubuntu.com/security/CVE-2026-106584

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106584.patch     | 35 +++++++++++++++++++
 .../openssh/openssh_10.5p1.bb                 |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106584.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106584.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106584.patch
new file mode 100644
index 0000000000..87489eb4fa
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106584.patch
@@ -0,0 +1,35 @@
+From 13ce54dc177d2ff471a07f0a1d197465617478da Mon Sep 17 00:00:00 2001
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
+- Omit the upstream OpenBSD revision-only hunks.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ misc.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/misc.c b/misc.c
+index 517fa7a..5f6be75 100644
+--- a/misc.c
++++ b/misc.c
+@@ -2593,6 +2593,7 @@ parse_absolute_time(const char *s, uint64_t *tp)
+ 			return SSH_ERR_INVALID_FORMAT;
+ 	} else {
+ 		tm.tm_wday = -1;	/* sentinel for error */
++		tm.tm_isdst = -1;	/* mktime decides DST */
+ 		if ((tt = mktime(&tm)) == -1 && tm.tm_wday == -1)
+ 			return SSH_ERR_INVALID_FORMAT;
+ 	}
diff --git a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
index 297caacc42..dc1dc8e3ef 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://sshd_check_keys \
            file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
            file://CVE-2026-123158.patch \
+           file://CVE-2026-106584.patch \
            "
 SRC_URI[sha256sum] = "d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3bd6cbd19218db11"
 
-- 
2.35.6

