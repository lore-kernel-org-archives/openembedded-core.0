Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14019.1795509646512720330
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 00:40:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HsKixH9D;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3341; q=dns/txt;
  s=iport01; t=1795509646; x=1796719246;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=M99vVUnIrhX2q/kT3sy1MTes5MNdzDUnraOJRFnIxH8=;
  b=HsKixH9DTOF2jcsBlAbf+xmqmpEyVBHqJDfY4AzAEW2W3XU4zcjAA+Ik
   jjlx77We7BcDCnh9T+6mNZbKGMjNB1CPU67xcX1kjo9r6xtEIvZSfg3Np
   i+uTPDjgeEOz7HMDXcQvxcYJd7PSrv6Ttv+JZEgWLKhcJHOJLKu1pJXoQ
   5NLt4wNScFFWPLWoQzM+ZUqv7qugNmYy7/8ndaTMu3Mo+G6WpfAiVvJgO
   6Q7u5ngZKPT+kmp/hip5mZ+K0oYMLjERAueM2gPiyLJq0OJ5WuRhOTIqn
   pKmL55AbbvZyilpfx0xA9N1U764YO705u8nabwbIw/pkc7mkWP9lwVpqq
   g==;
X-CSE-ConnectionGUID: VbAFhob3SVSdAVEWpnhjEw==
X-CSE-MsgGUID: UEtgZL5DSx2bAxpFrHchnA==
X-IPAS-Result: =?us-ascii?q?A0BHAgCTSwVr/9RK/pBaglmCV3VhQkkDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYUFAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLAVYcAwECLysjCBmDAgGCdAIBEboZGzeBeTOBA?=
 =?us-ascii?q?YR+2zMBCxQBgTiFQogkXRgBhH0nGxuBcoEVg2qBBYFcAoE4hm4EgiKBDIFUG?=
 =?us-ascii?q?AaMeQKBT4hJSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFgRyBH?=
 =?us-ascii?q?oESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaN?=
 =?us-ascii?q?TwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOAh8QBhYhCxsYD?=
 =?us-ascii?q?UgRLDcVGQQ+bgeUFIMKEAEsThMBKgEgcVRHkwssAZI9gTWfXAoog3mMJJU6G?=
 =?us-ascii?q?jOFW6UXC5h9jgqVYwVphGqBaDyBWXAVgyIJShkPji4LC4NghAfKVCM1CwMvA?=
 =?us-ascii?q?QEHAgcOAwuBaIRhix8BJwSBUgEB?=
IronPort-Data: A9a23:QS5AXKlX/ooukv7yu1fTCAzo5gzVJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIYXziEa//fYGCjedB3PI+29hgP6p7Tz4BgTlZr/n02EFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6x9yQUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNsfnb8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FbMS08h3BmsVz
 sIjJBkzQy+bgeK07a3uH4GAhux7RCXqFIoSoDRkiDreF/tjGMmFSKTR7tge1zA17ixMNa+CO
 4xDNGYpM0iGOUQVUrsUIMpWcOOAj2LneiddoUi9rqss6G+Vxwt0uFToGISNI4HaHpQO9qqej
 l/r42vLJkw2D8zFwxOV6ly2puTPmwquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4GuAgrQXIwa3O7kPAXy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:pOVSbKCNE3b7qtblHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:lPZNXW4v3qwe6YlFxtssykQ9NMAieCbm8kzcCnGVNn5vSL+4VgrF
X-Talos-MUID: 9a23:JqQmyARN8o4P8bm0RXTRqS1tBuM1z5++UkokgY0ooemPNSpZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="60158393"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 08:40:44 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id 4671D180001FD
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:40:44 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 75CCBCBF224; Tue, 24 Nov 2026 00:40:41 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 5/8] cups: Fix CVE-2026-107888
Date: Tue, 24 Nov 2026 00:40:30 -0800
Message-Id: <20261124084033.72286-6-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124084033.72286-1-asparmar@cisco.com>
References: <20261124084033.72286-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:40:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250970
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream 2.4.x fix for CVE-2026-107888 to
CUPS 2.4.11. The fixing commit is referenced in [1], and the public
advisory is referenced in [2].

[1] https://github.com/OpenPrinting/cups/commit/c5fc041ca0a211f8e69854907be7b55f56955659
[2] https://github.com/OpenPrinting/cups/security/advisories/GHSA-qqm8-4q5h-jg55

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index abc6e98df9..a28080f053 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -36,6 +36,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-55467.patch \
            file://CVE-2026-55480.patch \
            file://CVE-2026-61702.patch \
+           file://CVE-2026-107888.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-107888.patch b/meta/recipes-extended/cups/cups/CVE-2026-107888.patch
new file mode 100644
index 0000000000..a96b109fcf
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-107888.patch
@@ -0,0 +1,61 @@
+From 35ad3366ac27f2908eaef366ba805ad48c510424 Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Thu, 1 Oct 2026 17:05:55 -0400
+Subject: [PATCH] Abort held jobs if the destination has gone away
+ (GHSA-qqm8-4q5h-jg55)
+
+CVE: CVE-2026-107888
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups/commit/c5fc041ca0a211f8e69854907be7b55f56955659]
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ CHANGES.md      |  2 ++
+ scheduler/job.c | 20 ++++++++++++++++----
+ 2 files changed, 18 insertions(+), 4 deletions(-)
+
+diff --git a/CHANGES.md b/CHANGES.md
+index 030b00d839..833021a203 100644
+--- a/CHANGES.md
++++ b/CHANGES.md
+@@ -9,6 +9,8 @@ Changes in CUPS v2.4.11 (2024-09-30)
+ - CVE-2026-NNNNN: The scheduler did not sanitizer fax numbers.
+ - CVE-2026-NNNNN: The scheduler did not open temporary PPD files in exclusive
+   mode.
++- SECURITY-4.1: Held jobs for temporary print queues could crash the scheduler
++  (GHSA-qqm8-4q5h-jg55)
+ - Updated the maximum file descriptor limit for `cupsd` to 64k-1 (Issue #989)
+ - Fixed `lpoptions -d` with a discovered but not added printer (Issue #833)
+ - Fixed incorrect error message for HTTP/IPP errors (Issue #893)
+diff --git a/scheduler/job.c b/scheduler/job.c
+index f746fb0e02..77e62a5af6 100644
+--- a/scheduler/job.c
++++ b/scheduler/job.c
+@@ -332,12 +332,24 @@ cupsdCheckJobs(void)
+       * Check whether the printer is still holding new jobs...
+       */
+ 
+-      printer = cupsdFindDest(job->dest);
++      if ((printer = cupsdFindDest(job->dest)) == NULL)
++      {
++       /*
++        * Whoa, the printer and/or class for this destination went away;
++	* cancel the job...
++	*/
+ 
+-      if (printer->holding_new_jobs)
++        cupsdSetJobState(job, IPP_JSTATE_ABORTED, CUPSD_JOB_PURGE, "Job aborted because the destination printer/class has gone away.");
+         continue;
+-
+-      ippSetString(job->attrs, &job->reasons, 0, "none");
++      }
++      else if (printer->holding_new_jobs)
++      {
++        continue;
++      }
++      else
++      {
++        ippSetString(job->attrs, &job->reasons, 0, "none");
++      }
+     }
+ 
+    /*
-- 
2.35.6

