Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27795.1793856714274018828
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:31:54 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=dUMJUw5i;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3893; q=dns/txt;
  s=iport01; t=1793856714; x=1795066314;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=L7WQrt8ziK1PB1qcGh9M0QxeKDeAoHcHLL3+/QZ7i0M=;
  b=dUMJUw5i2nSKRaPKZ9o1jsZVekekx3oEvgK1a2pa3A+32dISoijEo7So
   C098M/ZjB+ubzzj17cG2gNkJsII/vVFBl1OT6BcC1MiI+q4fCPt1UWmxn
   oj5Pr4/njS/x8FNJjdAoDMtSYjCNDAHUE3x7sHhzhSqg8iN/yVuUe+seG
   zTTRR8ciW/Nx7plAbpk0uGMDzVutSMAOeG4G9iNtSAxfox/obZ0stbOh9
   8MUVQbRKxhsqihkW4fTkLznO3y3zbFK6qsopwqGQthTLmEAlhUaPWcqOP
   9CVT07o+R3NxuZFilUwblw1edH3Zd7It4GSbMSnrp0w8e3Yu6EK0sPnxa
   Q==;
X-CSE-ConnectionGUID: YZ5gsMlySnSjzDW6GidqCQ==
X-CSE-MsgGUID: CazjrmGQQNqJ/dnVpzARvQ==
X-IPAS-Result: =?us-ascii?q?A0BIAgASFOxq/4//Ja1aHgEBCxIMggULgld1YUJJlCqCI?=
 =?us-ascii?q?QOeIYF+DwEBAQ9EDQQBAYQ/RgKOHQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMyARgBPRwDAQIvKyMIEAmDAgGCdAIBE?=
 =?us-ascii?q?bw+giyBAYMpAT8CQ1DbMwELFAGBOIVAiCNdGAGCSoIzJxsbgXKBFYNpgQWBX?=
 =?us-ascii?q?AEBA4EkIYZeBIIigQyBWh6MegKBUoZwSIEeA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM+F4EHGwYFgR2BHoESgQddgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQ?=
 =?us-ascii?q?xJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgVhCAINDHI5EDAeJC8FHCZAGwoYG?=
 =?us-ascii?q?A1IESw3FRkEPm4Hki+CcRkHFmUTASoBgjKTMZI/oREKKIN4jCSVOhozqnELm?=
 =?us-ascii?q?H2OCpZRhGmBaDyBRwsHcBWDIglKGQ+OOYNrgX+DFMlIIzULMgEBBwIHDgMLg?=
 =?us-ascii?q?WiQAIF+AQE?=
IronPort-Data: A9a23:XI2+I6pAmtqTDbe7XE25GQAg4g5eBmJOZBIvgKrLsJaIsI4StFCzt
 garIBnXPazfazT2eYojOoi1oRsH6sTUzNM3HFc++39jRioU8ePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8E835pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0tdFXG5V0
 PgJEzY2bAKvuLyZwb6iYdA506zPLOGzVG8ekmtrwTecCbMtRorOBv2Uo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LU/rSn8/w7pX7Wz1EqFuWrLAf6GnIxws327/oWDbQUoHWGZ8IwBvE9
 goq+UzSCwMYLtmw8AOj61DriunxhTHSYpwrQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YfLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehW/a1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:ufCyeKzPwmSG5X94LJL4KrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:h40ubWPJ3e/diO5DaRs6+1UxHtEedEbf3lvvfWC5BX9CcejA
X-Talos-MUID: =?us-ascii?q?9a23=3A2GQZ0wxsQYolOkI8Jsier1VgNpOaqI+nGkIXlLo?=
 =?us-ascii?q?/gu+dF2t8PQmFnh2NXLZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544256548"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 05:31:49 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id B5DEC1800024F
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Nov 2026 05:31:49 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id 12669CC2EF3; Wed,  4 Nov 2026 21:31:49 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH  8/8] openssh: Fix CVE-2026-106552
Date: Wed,  4 Nov 2026 21:31:48 -0800
Message-Id: <20261105053148.2704106-8-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105053148.2704106-1-hthakar@cisco.com>
References: <20261105053148.2704106-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 05:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249441
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream OpenSSH 10.6p1 backport for
CVE-2026-106552. The fix is referenced in [1] and the advisory in [2].

[1] https://github.com/openssh/openssh-portable/commit/c07ea2180adebd6019a6ebdd89becb9d9f4b4897
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-106552

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106552.patch     | 64 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106552.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106552.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106552.patch
new file mode 100644
index 0000000000..3f54702383
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106552.patch
@@ -0,0 +1,64 @@
+From c07ea2180adebd6019a6ebdd89becb9d9f4b4897 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 1 Oct 2026 03:11:49 +0000
+Subject: [PATCH] upstream: sftp: be stricter in accepting paths returned by
+ the
+
+server for SSH_FXP_REALPATH or SSH2_FXP_READDIR replies, as these can be used
+in some situations to decide the destination path for recursive transfers.
+
+Report and patch from Junghoon Cho
+
+OpenBSD-Commit-ID: ad357002a1b75c87113f01086a9f0c12c36082d8
+
+CVE: CVE-2026-106552
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/c07ea2180adebd6019a6ebdd89becb9d9f4b4897]
+
+Backport Changes:
+- Omitted the upstream OpenBSD RCS revision-only hunks and retained the
+  OpenSSH 9.6p1 revision identifiers.
+- Added the complete destination normalization block after basename();
+  9.6p1 lacks the existing special case for ".." replaced upstream.
+
+(cherry picked from commit c07ea2180adebd6019a6ebdd89becb9d9f4b4897)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ sftp-client.c |  3 ++-
+ sftp.c        | 10 ++++++++++
+ 2 files changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/sftp-client.c b/sftp-client.c
+index 5cc8bb5..20d4e41 100644
+--- a/sftp-client.c
++++ b/sftp-client.c
+@@ -806,7 +806,8 @@ sftp_lsreaddir(struct sftp_conn *conn, const char *path, int print_flag,
+ 			 * These can be used to attack recursive ops
+ 			 * (e.g. send '../../../../etc/passwd')
+ 			 */
+-			if (strpbrk(filename, SFTP_DIRECTORY_CHARS) != NULL) {
++			if (*filename == '\0' ||
++			    strpbrk(filename, SFTP_DIRECTORY_CHARS) != NULL) {
+ 				error("Server sent suspect path \"%s\" "
+ 				    "during readdir of \"%s\"", filename, path);
+ 			} else if (dir) {
+diff --git a/sftp.c b/sftp.c
+index 487e539..a37c105 100644
+--- a/sftp.c
++++ b/sftp.c
+@@ -685,6 +685,16 @@ process_get(struct sftp_conn *conn, const char *src, const char *dst,
+ 			goto out;
+ 		}
+ 
++		/*
++		 * Special handling for destinations of '..' and remote roots.
++		 * In particular, never select the local root as an implicit
++		 * destination for a remote root.
++		 */
++		if (strcmp(filename, "..") == 0 ||
++		    (filename[0] != '\0' &&
++		    filename[strspn(filename, "/")] == '\0'))
++			filename = ".";
++
+ 		if (g.gl_matchc == 1 && dst) {
+ 			if (local_is_dir(dst)) {
+ 				abs_dst = sftp_path_append(dst, filename);
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 54cb2628f1..2056c2f3e8 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -51,6 +51,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-106584.patch \
            file://CVE-2026-106583.patch \
            file://CVE-2026-106582.patch \
+           file://CVE-2026-106552.patch \
            file://CVE-2026-73283.patch \
            file://CVE-2026-73282.patch \
            file://CVE-2026-73281.patch \
-- 
2.35.6

