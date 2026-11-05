Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27793.1793856712315701654
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:31:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DmImlrI0;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3121; q=dns/txt;
  s=iport01; t=1793856712; x=1795066312;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=vunOuIviexyP6m+h8q+/IIf51VcK0sahIzDiRLoHKE8=;
  b=DmImlrI0afXBnrBLPH8zi+BGZxA8pFXwtMk2zSKC8bue416H8t6ZxJqN
   5E/tTaaJwvAdY5vNqebciRxnep9j/bNrnzABCy9MEVeqMDjqU2hFxQwL4
   SGvnlAimP7qzy+XGnRGsaAFLN/K9cE1BEm6fjkaAZ8hSknv9tcyET9DIR
   r0Tmwr5kaK1s3BVOiFsdE7/cXbOL8T4mPW/1soaqCGl6+k5HE1SVFh6NW
   w5ZYEMaK9EQap4dqay2wY4gPMCD2yJbcH+o7f/vJZZDVxIcucbXW8w0BT
   DUETRvLe8PUbLRgMl56nGetAwIhQ0GUxDfb+34qfY9fhILXpd96wz9hjE
   w==;
X-CSE-ConnectionGUID: IAyQ7QO7Q3eB2PDEaesYUw==
X-CSE-MsgGUID: iGCLlYF/QiGxkFaM4z3y5g==
X-IPAS-Result: =?us-ascii?q?A0BIAgASFOxq/43/Ja1aHgEBCxIMggULgld1YUJJlCqCI?=
 =?us-ascii?q?QOeIYF+DwEBAQ9EDQQBAYQ/RgKOHQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMyARgBPRwDAQIXGCsjCBmDAgGCdAIBE?=
 =?us-ascii?q?bw+giyBAYMpAT8CQ1DbMwELFAGBOIVAiCNdGAGEfScbG4FygRWDaYEFgVwBA?=
 =?us-ascii?q?QOCJRCFbgSCIoEMgVoejHoCgVKGcEiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBBxsGBYEdgR6BEoEHXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSR?=
 =?us-ascii?q?yQiCBIJARMaLAqBGjU8CSY/FQxkCxoFYQgCDQxyORAwHiQvBRwmQBsKGBgNS?=
 =?us-ascii?q?BEsNxUZBD5uB5IvgxABgQ4BKgGCLBwBoziCIaERCiiDeIwklToaM6pxC5h9j?=
 =?us-ascii?q?gqWUYRpgWg8gUcLB3AVgyIJShkPjjmDa4F/gxTJSCM1CzIBAQcCBw4DC4Fok?=
 =?us-ascii?q?AItgU8BAQ?=
IronPort-Data: A9a23:R2ks4KCKauXrqBVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApDtz1WZTz
 2oYWG2APfyDMWX1LtsgOd/n8k9XvpfRx9NgOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb9h2YuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE4tx/NR4PGtIhoetdW1li2
 PUVMwEwcUXW7w626OrTpuhEnM8vKozveYgYoHwllW2fBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY2BPjDS0Un1lM/CI4+leShnFH0ciZTrxSeoq9fD237kVcvium1aISEEjCMbcR6tWKcl
 0yBxmXWEhI0PfnD22GUr33504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWspBUQXZ9UVuY98gzIkvaS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:Cl8SMqir83Gns4xk40XaZ5Zkj3BQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:B+MD1G2GhAIuuf+vJxTpSbxfO+k0SyLk6yjpeEKSU15FZbSYUm6t5/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3ADHrqZA+5vs+hmJscH9wT4S6Qf8ZHyICqOW5KqJQ?=
 =?us-ascii?q?pq8qqPAksKWyM0TviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="536290069"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 05:31:49 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 5DD7E180005C7
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Nov 2026 05:31:49 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id 02076CC124E; Wed,  4 Nov 2026 21:31:49 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH  4/8] openssh: Fix CVE-2026-106583
Date: Wed,  4 Nov 2026 21:31:44 -0800
Message-Id: <20261105053148.2704106-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105053148.2704106-1-hthakar@cisco.com>
References: <20261105053148.2704106-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 05:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249440
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream OpenSSH 10.6p1 backport for
CVE-2026-106583. The fix is referenced in [1] and the advisory in [2].

[1] https://github.com/openssh/openssh-portable/commit/0c4c9a7b320bd7ff61c4a2dc345cb2e27e9663b2
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-106583

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106583.patch     | 46 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106583.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106583.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106583.patch
new file mode 100644
index 0000000000..c813754d27
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106583.patch
@@ -0,0 +1,46 @@
+From 0c4c9a7b320bd7ff61c4a2dc345cb2e27e9663b2 Mon Sep 17 00:00:00 2001
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
+- Applied the username validation change to ssh.c:valid_ruser(), where
+  the equivalent validator resides in OpenSSH 9.6p1. Upstream changes
+  readconf.c:ssh_valid_ruser().
+- Omitted the upstream readconf.c OpenBSD RCS revision-only hunk.
+
+(cherry picked from commit 0c4c9a7b320bd7ff61c4a2dc345cb2e27e9663b2)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ ssh.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/ssh.c b/ssh.c
+index 2d2837d..91f7109 100644
+--- a/ssh.c
++++ b/ssh.c
+@@ -631,14 +631,11 @@ valid_ruser(const char *s)
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
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 5fe975180e..ce60645b01 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -49,6 +49,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-106586_p3.patch \
            file://CVE-2026-106585.patch \
            file://CVE-2026-106584.patch \
+           file://CVE-2026-106583.patch \
            file://CVE-2026-73283.patch \
            file://CVE-2026-73282.patch \
            file://CVE-2026-73281.patch \
-- 
2.35.6

