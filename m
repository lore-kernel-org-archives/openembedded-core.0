Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27968.1793856710413638174
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:31:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=UeweLQcm;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5368; q=dns/txt;
  s=iport01; t=1793856710; x=1795066310;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=juuUv/ln1DuYId3winw7MYRypeLGTb6sa4BubjKvB1k=;
  b=UeweLQcm2Kk0K22kU1qL5KRCNHrjDXOsna0zXW7xfc6NP21I3GsHqopk
   u/4POohHhJJLi6G5xQp1QE32l/+Kffoez63kKVgPNcClk5sO7KqZIBPqA
   APyvzR4bB1XBobytofnkVXxsI9+0TF3+aK3pMswCAlwxedEHkSZzguLho
   lT5bCX+PtiVH6Oidcu5yXhQfX5mCgjlVa3gyTmKuK97TnYolOtmRcPu3n
   8WemUxS5fMb61C1oaZevjl45FKD3hKpad/1JZKK7g917SViMVQb7HPO82
   tybIvFZ7d247E05WP8BCMK5xPS+J1AqqmSf6BuhRUEyT9TDPn+Yuekc8B
   g==;
X-CSE-ConnectionGUID: f5uqbdSZTautk/NmjyHAYg==
X-CSE-MsgGUID: t0AcOBbyQBuHjN2HYZBgzQ==
X-IPAS-Result: =?us-ascii?q?A0BLAgASFOxq/4//Ja1aHgEBCxIMggULgld1YUJJhFePU?=
 =?us-ascii?q?4IhA54hgX4PAQEBD0QNBAEBhD9GAo4dAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAyMECwEYAT0cAwECAwImAgIrIwgQC?=
 =?us-ascii?q?YMCAYJ0AgERvD56fzOBAYMpAT8CQ1DbMwELFAGBCi6FQIMfAYUDXRgBgkqCM?=
 =?us-ascii?q?ycbG4FygRWDaYEFgVwBAQOFOYJqBIINFYEMgVoegweJcwKBUoZwSIECHANZL?=
 =?us-ascii?q?AFVEw0KCwcFgWgDNRIqFW4yHYEjPhcvWBsGBYEdgR6BEoEHXYErKF4hgQiBd?=
 =?us-ascii?q?gKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxkCxoFYQgCD?=
 =?us-ascii?q?QxyORAwHiQvBRwmQBsKGBgNSBEsNxUZBD0BbgeSL4MKBwZTNQEqAYFrTwGTA?=
 =?us-ascii?q?iYBkj6hEQoog3iMJJU6GjOqcQuYfY4KlgdKhGmBaDyBRwsHcBWDIglKGQ+OO?=
 =?us-ascii?q?YNrgX+DFMlIIzULMgEBBwIHAQwBAwuBaJF+AQE?=
IronPort-Data: A9a23:VFb1aKp+THfIQN53fLKMBuv4JkVeBmJOZBIvgKrLsJaIsI4StFCzt
 garIBnXO/nbZmb3e911b4nn8U8D6J7VnIJgHQpt/yw0RitHpePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8E835pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0ugqHHhE+
 ccqFDkQchPEoee00ZKSe+Y506zPLOGzVG8ekmtrwTecCbMtRorOBv2Uo9RZxzw3wMtJGJ4yZ
 eJANmEpN0uGOUASfA5LU/rSn8/w7pX7Wz1EqFuWrLAf6GnIxws327/oWDbQUoHWGZgNzhjB+
 goq+UzlWjgRE/aV2AOv71KuoLXvrBHRV5ArQejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dUL
 FYZ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YfLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:2QmTFaFgUG/6bo5opLqEyseALOsnbusQ8zAXPidKOHtom62j5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqUuEiWpRGtldB8ATMHfjLnFL
X-Talos-CUID: =?us-ascii?q?9a23=3Aa2PbiWv5EGdvaJ6mq4ypl9AS6IsrL2DExnvrEXO?=
 =?us-ascii?q?xFHpqD5uQS06w0ZJrxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AAPZ1PQxRyGSWw4EemfHqw+IAkJaaqLj2IUsqu58?=
 =?us-ascii?q?XguOZFS5WYResvh64ULZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544508614"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 05:31:49 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 61AFA180003AC
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Nov 2026 05:31:49 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id 061FFCC124F; Wed,  4 Nov 2026 21:31:49 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH  5/8] openssh: Fix CVE-2026-106582
Date: Wed,  4 Nov 2026 21:31:45 -0800
Message-Id: <20261105053148.2704106-5-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105053148.2704106-1-hthakar@cisco.com>
References: <20261105053148.2704106-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 05:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249438
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream OpenSSH 10.6p1 backport for
CVE-2026-106582. The fix is referenced in [1] and the advisory in [2].

[1] https://github.com/openssh/openssh-portable/commit/1d5340fce24526719e32aebc4c721fc228182ace
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-106582

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106582.patch     | 100 ++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106582.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106582.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106582.patch
new file mode 100644
index 0000000000..a5c3882a78
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106582.patch
@@ -0,0 +1,100 @@
+From 1d5340fce24526719e32aebc4c721fc228182ace Mon Sep 17 00:00:00 2001
+From: "job@openbsd.org" <job@openbsd.org>
+Date: Tue, 22 Sep 2026 04:38:09 +0000
+Subject: [PATCH] upstream: Disable LZ77 dictionary coder to avoid a potential
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
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
+- Omitted the upstream OpenBSD RCS revision-only hunk and retained the
+  OpenSSH 9.6p1 revision identifier.
+
+(cherry picked from commit 1d5340fce24526719e32aebc4c721fc228182ace)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ packet.c | 15 +++++++--------
+ 1 file changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/packet.c b/packet.c
+index e8852d3..7f98cc2 100644
+--- a/packet.c
++++ b/packet.c
+@@ -691,14 +691,13 @@ ssh_packet_init_compression(struct ssh *ssh)
+ 
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
+@@ -826,7 +825,7 @@ uncompress_buffer(struct ssh *ssh, struct sshbuf *in, struct sshbuf *out)
+ #else	/* WITH_ZLIB */
+ 
+ static int
+-start_compression_out(struct ssh *ssh, int level)
++start_compression_out(struct ssh *ssh)
+ {
+ 	return SSH_ERR_INTERNAL_ERROR;
+ }
+@@ -931,7 +930,7 @@ ssh_set_newkeys(struct ssh *ssh, int mode)
+ 		if ((r = ssh_packet_init_compression(ssh)) < 0)
+ 			return r;
+ 		if (mode == MODE_OUT) {
+-			if ((r = start_compression_out(ssh, 6)) != 0)
++			if ((r = start_compression_out(ssh)) != 0)
+ 				return r;
+ 		} else {
+ 			if ((r = start_compression_in(ssh)) != 0)
+@@ -1039,7 +1038,7 @@ ssh_packet_enable_delayed_compress(struct ssh *ssh)
+ 			if ((r = ssh_packet_init_compression(ssh)) != 0)
+ 				return r;
+ 			if (mode == MODE_OUT) {
+-				if ((r = start_compression_out(ssh, 6)) != 0)
++				if ((r = start_compression_out(ssh)) != 0)
+ 					return r;
+ 			} else {
+ 				if ((r = start_compression_in(ssh)) != 0)
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index ce60645b01..4078c2665c 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -50,6 +50,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-106585.patch \
            file://CVE-2026-106584.patch \
            file://CVE-2026-106583.patch \
+           file://CVE-2026-106582.patch \
            file://CVE-2026-73283.patch \
            file://CVE-2026-73282.patch \
            file://CVE-2026-73281.patch \
-- 
2.35.6

