Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36411.1795585635193657001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:47:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BSiLR8o8;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3721; q=dns/txt;
  s=iport01; t=1795585637; x=1796795237;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=DZ8HfMKAS1vgAMm/Az6HMhH9dbKol7yf+u7/8c34Myg=;
  b=BSiLR8o8yjEuumZd4yiJ2lwBLjUOOaGcAxtnDUllnrYIzE0hoiw16WkU
   dJYJfgrM1eQIXqyThB6ep0RCwheFZrgVJ6YFDl3hFTagRtEyUQeWfEweR
   qma3loDFo1klgy25B4fQknjW2i2abVaU7moaw8sXPIjDkKqVsL3bixibO
   q8A/1WLpF/i8IAf5sdS5oyAoT6BnEpcxC2e/Juk7msVVLigv00vURPERT
   uY6qLZOmxTzrRskf2FAGHo1N+x2+baJ4iFnqw78DMJfB5UKlWx0Nlhkzr
   o+kkyKVx6AUvcHugNk9WiOeLBFwSJREcryfoxsp5boTRBJ7kzbIASnIrO
   A==;
X-CSE-ConnectionGUID: ikw+wtqiR8OvEz/bE9mmgQ==
X-CSE-MsgGUID: LnQoYYnQSZ6hx6CqRZ9GpQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgAqdAZr/8tK/pBaglmCV3VgQ0kDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMyARgBPRwDAQIvKyMIEAmDAgGCdAMRuTcbN4Isg?=
 =?us-ascii?q?QGDKQE/AkNQ2zMBCxQBgTiFQoglXRgBgkuCMycbG4FygRWDaoEFgVwCA4FFh?=
 =?us-ascii?q?l4EgiJ6EoFUHox1AoFJiFJIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXg?=
 =?us-ascii?q?QcbBgWBHIEegRKBA12BKyheIYEIgXUCglGCAAIBSUEOB0VTCSVDEkckIggSC?=
 =?us-ascii?q?QETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMBwkLwUZJjwbCoEMJx0eGQ4CK?=
 =?us-ascii?q?QYWIQs0GA1IESw3FRkEPm4HlBODG3sTASuCLAalb6ERCiiDeYwklToaM6pyC?=
 =?us-ascii?q?5h9jgqWUYRqgWg8gVlwFYMiCUoZD445g2uFE8lIJjILAy8BAQcCBw4DC4Fok?=
 =?us-ascii?q?X4BAQ?=
IronPort-Data: A9a23:SsJ2WKBqfrSNfRVW/3ziw5YqxClBgxIJ4kV8jS/XYbTApDkj1mNRz
 DBNXm6OM63cY2SjfIgkbY+xoEoAuJGDzdM1OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCC+G+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb/gGYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEwvZxT14qJIwiqsFpLHMJ/
 9FJLTUCV0XW7w626OrTpuhEj8k5ac2uN4QFtzQ4l3fSDO0tRtbIRKCiCd1whWtswJoTQbCBO
 4xDMWEHgBfoO3WjPn8XFJI3n+6yrnL+aDZf7lmSoMLb5kCNlFcvgOWybbI5fPSuQ/xSr3een
 1n0oWTpXDoDDu7O5iK8pyfEaujn2HmTtJgpPLqg+/hnhVeeymAeBFgdUkG2if24kVKlHdVHJ
 koZ/yAjoaQ/+AqsVNaVYvGjiHeJpFsYHtFXCeB/sFvLwavP6AHfDW8BJtJcVOEbWAYNbWRC/
 je0cxnBXFSDbJX9paqhy4qp
IronPort-HdrOrdr: A9a23:ACvVXqGtnIKUkClipLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:1cpo3mxyBrfJ9/I9DpaABgUVGd9mbWHEzU2ABFGVGyFjZeyQTFCprfY=
X-Talos-MUID: 9a23:tVqrlguH1SAqFhzQc82noDdbM/ZZ5Z2VOh4NgcstovO2ZANoAmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60368575"
Received: from aer-l-core-02.cisco.com ([144.254.74.203])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:47:14 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-02.cisco.com (Postfix) with ESMTPS id 61EC218000143
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:47:14 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id A0BB7CBEFAB; Tue, 24 Nov 2026 21:47:11 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 09/10] openssh: Fix CVE-2026-106552
Date: Tue, 24 Nov 2026 21:47:10 -0800
Message-Id: <20261125054711.2691239-10-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125054711.2691239-1-hthakar@cisco.com>
References: <20261125054711.2691239-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:47:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251143
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/openssh/openssh-portable/commit/c07ea2180adebd6019a6ebdd89becb9d9f4b4897
[2] https://ubuntu.com/security/CVE-2026-106552

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106552.patch     | 63 +++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106552.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106552.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106552.patch
new file mode 100644
index 0000000000..a44d70a24f
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106552.patch
@@ -0,0 +1,63 @@
+From c07ea2180adebd6019a6ebdd89becb9d9f4b4897 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 1 Oct 2026 03:11:49 +0000
+Subject: [PATCH] upstream: sftp: be stricter in accepting paths returned by the
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
+- Omitted upstream OpenBSD revision-only hunks and retained the Wrynose
+  OpenSSH 10.3p1 context.
+
+(cherry picked from commit c07ea2180adebd6019a6ebdd89becb9d9f4b4897)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ sftp-client.c |  3 ++-
+ sftp.c        | 12 +++++++++---
+ 2 files changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/sftp-client.c b/sftp-client.c
+--- a/sftp-client.c
++++ b/sftp-client.c
+@@ -785,7 +785,8 @@ sftp_lsreaddir(struct sftp_conn *conn, const char *path,
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
+--- a/sftp.c
++++ b/sftp.c
+@@ -676,9 +676,15 @@ process_get(struct sftp_conn *conn, const char *src, const char *dst,
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
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 8545868d81..4f14ae9b06 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -43,6 +43,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-106582.patch \
            file://CVE-2026-106585.patch \
            file://CVE-2026-106583.patch \
+           file://CVE-2026-106552.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6

