Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36466.1795585636913943100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:47:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YSjK+Tj+;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2909; q=dns/txt;
  s=iport01; t=1795585638; x=1796795238;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ml/qax8I3trsDqWhsqfbfkoAOk61Qlgas6ZAlpHrGrQ=;
  b=YSjK+Tj+S6SG6P8H1AmAbPsGAkAFR2GKYEwJdMT9F0q/TAbomdhrkBY0
   lxDnFfUa1YjMonPSnox2hux+xm6iOwIbeLduaucYRKW6+uc5hWy8fPjrm
   KMQOxFKWu9c1uxmH6pxBrURIdXH36tHRhh/bOJsB2DC4MnCPT+6TjT+QO
   YSS/TfbZrd+2nIJVIFPVJ7rLZNYu0FKfjUxJyh1Sr6EucjFiX/Db/tlCQ
   fjhnQS4ZXVQcHa9zjoTggB4lW/PQfESTXssLuOfpJ+ytwyoFThfGzJNUT
   oG3D0UpD2ETgWxv7KFGv5+QntV7d9tK5MY3Z/bpRIplqn6Ndp+oIJeTC6
   w==;
X-CSE-ConnectionGUID: wnzqeMQhSyK2Z7XtkTegBg==
X-CSE-MsgGUID: 4hZD8HoORreXA1x5tatKpg==
X-IPAS-Result: =?us-ascii?q?A0BIAgB8dQZr/9RK/pBaglmCV3VgQ0kDlCeCJJ4pgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAzIBGAE9HAMBAhcYKyMIGYMCAYJ0AxG5b4IsgQGDK?=
 =?us-ascii?q?QE/AkNQ2zMBCxQBgTiFQoglXRgBhH4nGxuBcoEVg2qBBYFcAgOCJQULhW4Eg?=
 =?us-ascii?q?iJ6EoFUHox1AoFJiFJIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbB?=
 =?us-ascii?q?gWBHIEegRKBA12BKyheIYEIgXUCglGCAAIBSUEOB0VTCSVDEkckIggSCQETG?=
 =?us-ascii?q?iwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMBwkLwUZJjwbCoEMJx0eGQ4CKQYWI?=
 =?us-ascii?q?Qs0GA1IESw3FRkEPm4HlBODG4EOASuCLByjOIIhoREKKIN5jCSVOhozqnILm?=
 =?us-ascii?q?H2OCpZRhGqBaDyBWXAVgyIJShkPjjmDa4UTyUgmMgsDLwEBBwIHDgMLgWiRf?=
 =?us-ascii?q?gEB?=
IronPort-Data: A9a23:y46vDKySew8STm7Iptx6t+dixyrEfRIJ4+MujC+fZmUNrF6WrkUPy
 WcdDD2APPuJajGmeY12aoqzox8HvJPdy4cxTFBq/1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH9aOWJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaD9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJF4wL5QV3993OnBtr
 85HGCwOUh2Mre3jldpXSsE07igiBMDmJsYb/3pn1zycVK9gSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNk2aC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZjuCzaoGPI4ziqcN9wkaqi
 jLm+EPDGBwqHYWPlCaM7lG0ibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVVsAVF6gx7xuAj/ONpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:d9X+qaNtaoioPsBcTu2jsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:L9YuxmxlEy8H0kBT0Fw5BgULHNI8f1jkzEzBABWKVlZ1S4GYRnWfrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3ApvYVzQ6LRu/Ulbl5KLwyabQRxow045aCWGAKtq8?=
 =?us-ascii?q?ctvmtbDwtJz6Bryy4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60623218"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:47:14 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id 5FE92180001C9
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:47:14 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 9D25ECBEF98; Tue, 24 Nov 2026 21:47:11 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 08/10] openssh: Fix CVE-2026-106583
Date: Tue, 24 Nov 2026 21:47:09 -0800
Message-Id: <20261125054711.2691239-9-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125054711.2691239-1-hthakar@cisco.com>
References: <20261125054711.2691239-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251148
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1]. The two other commits linked by [2] only add and
adjust regression tests; they contain no functional security fix.

[1] https://github.com/openssh/openssh-portable/commit/0c4c9a7b320bd7ff61c4a2dc345cb2e27e9663b2
[2] https://ubuntu.com/security/CVE-2026-106583

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106583.patch     | 35 +++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106583.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106583.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106583.patch
new file mode 100644
index 0000000000..094f4bad63
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106583.patch
@@ -0,0 +1,35 @@
+From 0c4c9a7b320bd7ff61c4a2dc345cb2e27e9663b2 Mon Sep 17 00:00:00 2001
+From: "dtucker@openbsd.org" <dtucker@openbsd.org>
+Date: Mon, 5 Oct 2026 06:03:40 +0000
+Subject: [PATCH] upstream: Further restrict the characters allowed in a command-line
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
+- Omitted the upstream readconf.c OpenBSD revision-only hunk and retained
+  the Wrynose OpenSSH 10.3p1 revision.
+
+(cherry picked from commit 0c4c9a7b320bd7ff61c4a2dc345cb2e27e9663b2)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ readconf.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/readconf.c b/readconf.c
+--- a/readconf.c
++++ b/readconf.c
+@@ -3452 +3452 @@ ssh_valid_ruser(const char *s)
+-		if (strchr("'`\";&<>|(){}", s[i]) != NULL)
++		if (strchr("'`\";&<>|(){}$\\", s[i]) != NULL)
+@@ -3457,3 +3457,0 @@ ssh_valid_ruser(const char *s)
+-		/* Disallow \ in last position */
+-		if (s[i] == '\\' && s[i + 1] == '\0')
+-			return 0;
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 44d9881815..8545868d81 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -42,6 +42,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-106587.patch \
            file://CVE-2026-106582.patch \
            file://CVE-2026-106585.patch \
+           file://CVE-2026-106583.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6

