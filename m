Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36411.1795585635193657001
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:47:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=UrQZ5Em2;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5218; q=dns/txt;
  s=iport01; t=1795585635; x=1796795235;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=LMqVopCLvhm3Ms0+NbOSo00BtYer52BNPfOf2lZwF+o=;
  b=UrQZ5Em2Tbv3UhHzKTyieXzUGDczk4yXQee59rVaZ+3imBQTL3iN8EAk
   cP2YhFnmQi4rx0tIIHN6UV8+HK42FZLXMFLRSlxWSkPEkqFoGeNMTI1q3
   CxuD95Qx7IDtkRRNrPEItVMEg5gJODDq6HM6uSBwp+wGutCuNb7nua2zk
   SR2vudKTYZxIT+FtmbDInw1iYQxQT1a3cBdYvxTArx6ApJfNVpfHKlkCB
   VlZOHksNWGOfM6hUCHEPC7YDr3HV1m8Zt6SpT8jw9HhBF1AUAukG3B/cU
   9Re1m5UsjXPWAmlFKJrn7sZuj8M6Rz3jmJhw307C3JUU8l/6oleq5k8v7
   w==;
X-CSE-ConnectionGUID: Ygd+IQY5Qg6g22P6RknZZA==
X-CSE-MsgGUID: ZyXIYStlT4S7zp7nPQ/ZYw==
X-IPAS-Result: =?us-ascii?q?A0BMAgAqdAZr/85K/pBaglmCV3VgQ0kDhFSPU4IhA54pg?=
 =?us-ascii?q?X4PAQEBD0QNBAEBhD9GAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDZASAQIBAyMECwEYAT0cAwECAwImAgIrIwgQCYMCAYJ0A?=
 =?us-ascii?q?xG6CXp/M4EBgykBPwJDUNszAQsUAYEKLoVCgyABhQRdGAGCS4IzJxsbgXKBF?=
 =?us-ascii?q?YNqgQWBXAIDhTmCagSCDRV6EoFUHoMEiXECgUmIUkiBAhwDWSwBVRMNCgsHB?=
 =?us-ascii?q?YFoAzUSKhVuMh2BIzsXL1gbBgWBHIEegRKBA12BKyheIYEIgXUCglGCAAIBS?=
 =?us-ascii?q?UEOB0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMBwkL?=
 =?us-ascii?q?wUZJjwbCoEMJx0eGQ4CKQYWIQs0GA1IESw3FRkEPQFuB5QTgxQHBlM1ASuBa?=
 =?us-ascii?q?0EOAZMCJgGSPaERCiiDeYwklToaM6pyC5h9jgqWB0qEaoFoPIFZcBWDIglKG?=
 =?us-ascii?q?Q+OOYNrhRPJSCYyCwMvAQEHAgcBDAEDC4FokX4BAQ?=
IronPort-Data: A9a23:88vBzKPVHZnJeD/vrR3wlsFynXyQoLVcMsEvi/4bfWQNrUoi1DcEn
 zBOW2qEO62CNGb2cop3Pti//EIOsJPUn9NkSnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmM/ErF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gWUsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj68RhAAIXBLxFw+kpDjsUz
 aIiKzY/XDnW0opawJrjIgVtrs0uNozveYgYoHwllWyfBvc9SpeFSKLPjTNa9G5s2oYUQKqYO
 JZfM2IxBPjDS0Un1lM/CI4+leShnFH0ciZTrxSeoq9fD237klQqjuiwb4C9ltqid9Rlv3eju
 mb6o1+mEAlFMuSmjgi07Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTXlyhrNG9i1WiQJRYM
 0ES9y8koKQ++UDtScPyNyBUu1aNswRZX59bFPc3rVnQjKHV+A2eQGMDS1atdeAbiSP/fhRyv
 nfhoj8jLWUHXGG9IZ5FyoqpkA==
IronPort-HdrOrdr: A9a23:loyUMK6JTiqLjA8KkAPXwOrXdLJyesId70hD6qkXc20zTiX4rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: 9a23:tS2L52Mq2b4pbO5DaSZrt28tK50cfSPSli3ofXW7D1RbYejA
X-Talos-MUID: 9a23:WDosAwvwm2ljkJnzl82ntiBSFfZT/6CSVHtSg41ZvfG9ch5BJGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60368572"
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:47:13 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id D91D018000230
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:47:12 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 8F804CBF204; Tue, 24 Nov 2026 21:47:11 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 04/10] openssh: Fix CVE-2026-106582
Date: Tue, 24 Nov 2026 21:47:05 -0800
Message-Id: <20261125054711.2691239-5-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125054711.2691239-1-hthakar@cisco.com>
References: <20261125054711.2691239-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:47:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251138
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/openssh/openssh-portable/commit/1d5340fce24526719e32aebc4c721fc228182ace
[2] https://ubuntu.com/security/CVE-2026-106582

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106582.patch     | 97 +++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106582.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106582.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106582.patch
new file mode 100644
index 0000000000..53c5cb6f47
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106582.patch
@@ -0,0 +1,97 @@
+From 1d5340fce24526719e32aebc4c721fc228182ace Mon Sep 17 00:00:00 2001
+From: "job@openbsd.org" <job@openbsd.org>
+Date: Tue, 22 Sep 2026 04:38:09 +0000
+Subject: [PATCH] upstream: Disable LZ77 dictionary coder to avoid a potential
+
+side-channel leak
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+A chosen-plaintext attack method exists which makes use of
+dictionary-based compression to recover secrets from one channel by
+interacting with the SSH session's shared compression dictionary through
+another channel.
+
+Attacker-controlled input can recognizably reflect into the total length
+of transmitted ciphertexts by virtue of LZ77 replacing repeated strings
+with back-references into the SSH session's encoder search buffer,
+which is shared across all channels. For this reason, the documentation
+already recommended against enabling compression for connections that
+share trusted and untrusted traffic.
+
+As an extra precaution, use only Huffman coding when compressing
+plaintexts, as this algorithm does not use a dictionary. But, this
+results in a reduction of compression effectiveness.
+
+Inspired by "Crossing the Streams: SSH Plaintext Recovery via a Common
+Compression Context in Multiplexed Channels." by Fabian Bäumer and
+Marcus Brinkmann, preprint https://arxiv.org/abs/2609.07709 (2026)
+
+OK djm@ dtucker@
+
+OpenBSD-Commit-ID: 839e5e53ad76786d0e90bed530304e4e13acbba0
+
+CVE: CVE-2026-106582
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/1d5340fce24526719e32aebc4c721fc228182ace]
+
+Backport Changes:
+- Omitted the upstream packet.c OpenBSD revision-only hunk and retained
+  the Wrynose OpenSSH 10.3p1 revision.
+
+(cherry picked from commit 1d5340fce24526719e32aebc4c721fc228182ace)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ packet.c | 15 +++++++--------
+ 1 file changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/packet.c b/packet.c
+--- a/packet.c
++++ b/packet.c
+@@ -802,13 +802,12 @@ ssh_packet_init_compression(struct ssh *ssh)
+ #ifdef WITH_ZLIB
+ static int
+-start_compression_out(struct ssh *ssh, int level)
++start_compression_out(struct ssh *ssh)
+ {
+-	if (level < 1 || level > 9)
+-		return SSH_ERR_INVALID_ARGUMENT;
+-	debug("Enabling compression at level %d.", level);
++	debug("Enabling compression.");
+ 	if (ssh->state->compression_out_started == 1)
+ 		deflateEnd(&ssh->state->compression_out_stream);
+-	switch (deflateInit(&ssh->state->compression_out_stream, level)) {
++	switch (deflateInit2(&ssh->state->compression_out_stream,
++	    Z_BEST_SPEED, Z_DEFLATED, 15, 8, Z_HUFFMAN_ONLY)) {
+ 	case Z_OK:
+ 		ssh->state->compression_out_started = 1;
+ 		break;
+@@ -934,7 +933,7 @@ uncompress_buffer(struct ssh *ssh, struct sshbuf *in, struct sshbuf *out)
+ #else	/* WITH_ZLIB */
+ 
+ static int
+-start_compression_out(struct ssh *ssh, int level)
++start_compression_out(struct ssh *ssh)
+ {
+ 	return SSH_ERR_INTERNAL_ERROR;
+ }
+@@ -1040,7 +1039,7 @@ ssh_set_newkeys(struct ssh *ssh, int mode)
+ 		if ((r = ssh_packet_init_compression(ssh)) < 0)
+ 			return r;
+ 		if (mode == MODE_OUT) {
+-			if ((r = start_compression_out(ssh, 6)) != 0)
++			if ((r = start_compression_out(ssh)) != 0)
+ 				return r;
+ 		} else {
+ 			if ((r = start_compression_in(ssh)) != 0)
+@@ -1185,7 +1184,7 @@ ssh_packet_enable_delayed_compress(struct ssh *ssh)
+ 			if ((r = ssh_packet_init_compression(ssh)) != 0)
+ 				return r;
+ 			if (mode == MODE_OUT) {
+-				if ((r = start_compression_out(ssh, 6)) != 0)
++				if ((r = start_compression_out(ssh)) != 0)
+ 					return r;
+ 			} else {
+ 				if ((r = start_compression_in(ssh)) != 0)
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index 6037efb62c..ddf2483728 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -40,6 +40,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-106586_p2.patch \
            file://CVE-2026-106586_p3.patch \
            file://CVE-2026-106587.patch \
+           file://CVE-2026-106582.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6

