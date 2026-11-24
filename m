Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15517.1795517773918226553
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 02:56:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=UzkmI2uf;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3690; q=dns/txt;
  s=iport01; t=1795517774; x=1796727374;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=+tMsM6if/YtYzjas/f5Y7ERL5FlrLXkHh8rCXDCYmxY=;
  b=UzkmI2ufY/HkiN79FrL+rS3OklX3Zr36vkDRsI5K2SvzomJVBpdKK98l
   nK8n3QhheovSdAVl1iL4dln5JDQT2lAgy9PHNwB8fjBxBsoku8Sy6tT+v
   2uhYTsuHZM1ZpWYplXVRsIuIf8veKAAdDuSTHwwbncGOUT8UgBEv3Cv3v
   32WAX388aa65kJQiDaW7n8e9weQGp9d4yJUYYjEFgVM5HSA85V0BpOjUt
   6hIYPlcEaz0dkNZxHqoTaQfUr82nP9bbOkgfe6v8vB9EzNYFn6OabYxCG
   +PLJJiR4JjQ+LJyCD3JJb3B7hwMq7q4hoIe1Ue5e5fgra51KlTMXGFtng
   w==;
X-CSE-ConnectionGUID: Xh2hh7XURkKXDpgPZHhFog==
X-CSE-MsgGUID: 6e/rmJ2VQduXT5f+GX3IOQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgD3awVr/9JK/pBaglmCV3VhQkkDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMyARgBPRwDAQIvKyMIEAmDAgGCdAIBEboIGzeCL?=
 =?us-ascii?q?IEBgykBPwJDUNszAQsUAYE4hUKIJF0YAYJKgjMnGxuBcoEVg2qBBYFcAgOBR?=
 =?us-ascii?q?YZeBIIiehKBVB6MeQKBT4hJSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F?=
 =?us-ascii?q?4EHGwYFgRyBHoESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIE?=
 =?us-ascii?q?gkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBDCcfHhsOA?=
 =?us-ascii?q?h8QBhYhCxsYDUgRLDcVGQQ+bgeUFIMaexMBK4IsBqVvoREKKIN5jCSVOhozq?=
 =?us-ascii?q?nILmH2OCpZRhGqBaDyBWXAVgyIJShkPjjmDa4UTyUgjNQsDLwEBBwIHDgMLg?=
 =?us-ascii?q?WiRfgEB?=
IronPort-Data: A9a23:pHRBzKqK+ZVEZdDkx3KSB1h9RaFeBmJMZBIvgKrLsJaIsI4StFCzt
 garIBnQPKqNYmP3c411ao2x80kGuMDSn98wSlE+qi42FS9ApePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8sj/zgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8kg35pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0tZ3W2FOq
 swlEjMuXjybiNqE4LKVTeY506zPLOGzVG8eknht13TdSP0hW52GG/SM7t5D1zB2jcdLdRrcT
 5NFNXw1MUiGPEEJYA5PYH49tL/Aan3XeiZAoUiQrLAf6GnIxws327/oWDbQUoLSH50FxxfAz
 o7A1zr0RQsfFoah8DaYwk7xiKzgrXjaf7tHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QyXj66R6AGDCy1cH3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:sodjs6m7baFbiWbuNhYm8sxrcInpDfIA3DAbv31ZSRFFG/Fw8P
 re+MjzuiWbtN98YhwdcJW7Scq9qBDnhPtICPcqXItKNTOO0ADDEGgh1/qB/9SKIULDH4BmuZ
 uIC5IfNPTASX5nkM39/A60V/wkwNWB7eSUoN229QYLcemvAJsQljuQzW2gYytLeDU=
X-Talos-CUID: 9a23:9Jsq+G4rAWomFz/D+tssxE5OGsB6QkDnz1TgD1e3MVRJSJOSRgrF
X-Talos-MUID: 9a23:h0U1gQj0erq97/Xxt87xn8Mpasov+aGMUn40nYg2h5SKdgNAYBa6tWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60208190"
Received: from aer-l-core-09.cisco.com ([144.254.74.210])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 10:56:10 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-09.cisco.com (Postfix) with ESMTPS id E4F7718000123
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:56:09 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 2DDAFCBF231; Tue, 24 Nov 2026 02:56:07 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail][PATCH 09/10] openssh: Fix CVE-2026-106552
Date: Tue, 24 Nov 2026 02:55:32 -0800
Message-Id: <20261124105533.348654-10-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124105533.348654-1-asparmar@cisco.com>
References: <20261124105533.348654-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251018
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/openssh/openssh-portable/commit/c07ea2180adebd6019a6ebdd89becb9d9f4b4897
[2] https://ubuntu.com/security/CVE-2026-106552

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106552.patch     | 62 +++++++++++++++++++
 .../openssh/openssh_10.5p1.bb                 |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106552.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106552.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106552.patch
new file mode 100644
index 0000000000..edfe267052
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106552.patch
@@ -0,0 +1,62 @@
+From e6004a489f53846268117c975184e1c1a4ddc21c Mon Sep 17 00:00:00 2001
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
+- Omit the upstream OpenBSD revision-only hunks.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ sftp-client.c |  3 ++-
+ sftp.c        | 12 +++++++++---
+ 2 files changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/sftp-client.c b/sftp-client.c
+index 1f03112..9b7d0a0 100644
+--- a/sftp-client.c
++++ b/sftp-client.c
+@@ -791,7 +791,8 @@ sftp_lsreaddir(struct sftp_conn *conn, const char *path, int print_flag,
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
+index 31d8fa4..8cdcd44 100644
+--- a/sftp.c
++++ b/sftp.c
+@@ -675,9 +675,15 @@ process_get(struct sftp_conn *conn, const char *src, const char *dst,
+ 			goto out;
+ 		}
+ 
+-		/* Special handling for dest of '..' */
+-		if (strcmp(filename, "..") == 0)
+-			filename = "."; /* Download to dest, not dest/.. */
++		/*
++		 * Special handling for destinations of '..' and remote roots.
++		 * In particular, never select the local root as an implicit
++		 * destination for a remote root.
++		 */
++		if (strcmp(filename, "..") == 0 ||
++		    (filename[0] != '\0' &&
++		    filename[strspn(filename, "/")] == '\0'))
++			filename = ".";
+ 
+ 		if (g.gl_matchc == 1 && dst) {
+ 			if (local_is_dir(dst)) {
diff --git a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
index 4db5a42957..04454382c4 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
@@ -33,6 +33,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-106582.patch \
            file://CVE-2026-106585.patch \
            file://CVE-2026-106583.patch \
+           file://CVE-2026-106552.patch \
            "
 SRC_URI[sha256sum] = "d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3bd6cbd19218db11"
 
-- 
2.35.6

