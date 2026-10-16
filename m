Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50C25CCA490
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:52:45 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14166.1792122758379997954
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VJMolb29;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5218; q=dns/txt;
  s=iport01; t=1792122758; x=1793332358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b0p18UgTa0VmWlsrkv43zM7vDFCI4ZcVkuSeYgFF36I=;
  b=VJMolb29/Hlq91wioGdLvrd7f0uYOIkbHFZ8IWPrHPV0aWGpWdVekemL
   t08zQFVwHorTX2udOhNIyMWAokvnGIQ9xuybfY8dZqUK7DwUeDXwhMVO7
   aYoAWehHSWOlSORG0e2HHwlQNLKCk0kHwNE2P7zdoa8P5e2WjdeTM2n3E
   /rUXkTJxzsuSsP24GqcfXuHYHoCozZElapRhc/L231WCgzZOHjAdLF5AT
   zno+4F7c+fGzHTwVMURG5axfxnua5inVnsDcVb9wvAT1z2r5GYMqCRryh
   LyTk4evaKuCVygpXsVZvL6pLN+WlhtnUASUKYXz3teWk4+MbRd4PHPDWH
   Q==;
X-CSE-ConnectionGUID: +hga9ZPNQE275TwIpXvGoQ==
X-CSE-MsgGUID: nytoUcE8QOimTVhNAV98dA==
X-IPAS-Result: =?us-ascii?q?A0DQAgCwntFq/5X/Ja1aglmCV3VgQ0kDhFSRcwOeHIF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOFQImNQgOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMjBAsBGAEtEBwDAQIDAiYCAisjCBAJgwIBgnQDE?=
 =?us-ascii?q?bxwen8zgQGDKQE/AkNQ2zIBCxQBBYEFLoVAgx8BhQNdGAGCSYIzJxsbgXKBF?=
 =?us-ascii?q?YNpgQWBXAIDhTiCagSCDRV6EoFaHoRwkDlIgQIcA1ksAVUTDQoLBwWBaAM1E?=
 =?us-ascii?q?ioVbjIdgSM+Fy9YGwYFgR2BIIIWIxk2eoEJXoErKWABEBeBCYIHAoJUggACA?=
 =?us-ascii?q?UlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXDHMMHQVyCAINCQcpGA1IE?=
 =?us-ascii?q?Sw3FRkEPQFuB5IUHoJeBwZTNQErgWtBDgGTAiYBkj2hDwoog3aMIpU6GjOqb?=
 =?us-ascii?q?wuYfY4KlgVKhGmBagI4gVlwFYMiCUoZD445g2uFE8lHJzILAy8BAQcCBwEMA?=
 =?us-ascii?q?QMLgWiRfgEB?=
IronPort-Data: A9a23:6EgWual1SG3UhQBMiqMxdh3o5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJUDvUa6qNY2X2Kth3OYm//EpUsZ6GzdFhSAQ/pH1kFltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtMsvzb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fc4Y9e8mM1loz
 NFCd20xcTGbt/yZx4vuH4GAhux7RCXqFJkUtnclyXTSCuwrBMmZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTaz/7C7pm9AusrnnjczRboUi9rqss6G+Vxwt0uFToGIeOJIXXHZkMwS50o
 ErA7nj+Pxo3ZOW4yD+5zHKKr9GezS/SDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzFeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:EDXs8qP+/8pvscBcTh+jsMiBIKoaSvp037Dk7S9MoHtuA6qlfq
 GV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmoFFeaTN5CBB/KXHyTj9Nco8y9+a963tr+Lfw3BxCTxOUchbnn9E4sLxKDwNeOGAbqBJb6
 ah2g==
X-Talos-CUID: 9a23:FKl7RGNfxze3fu5DGylo/R8mIuYcXyeCkUvPAleIF0lucejA
X-Talos-MUID: =?us-ascii?q?9a23=3AbjNasQ1GYI0Ypfy9ISSoxV1RHTUj5bWyD30GvMU?=
 =?us-ascii?q?/nMiBCRJwHR6j3WS7a9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536150417"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:52:37 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 51D6618000335;
	Fri, 16 Oct 2026 03:52:37 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id F05C3CBF204; Thu, 15 Oct 2026 20:52:36 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH 04/10] openssh: Fix CVE-2026-106582
Date: Thu, 15 Oct 2026 20:52:30 -0700
Message-Id: <20261016035236.442896-5-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016035236.442896-1-hthakar@cisco.com>
References: <20261016035236.442896-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 03:52:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247914

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
index a70ca30b15..129c62090f 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -39,6 +39,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-106586_p2.patch \
            file://CVE-2026-106586_p3.patch \
            file://CVE-2026-106587.patch \
+           file://CVE-2026-106582.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6


