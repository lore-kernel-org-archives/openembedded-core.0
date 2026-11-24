Received: from aer-iport-1.cisco.com (aer-iport-1.cisco.com [173.38.203.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15269.1795517770998302844
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 02:56:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=SvdlX6El;
 spf=pass (domain: cisco.com, ip: 173.38.203.51, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5222; q=dns/txt;
  s=iport01; t=1795517771; x=1796727371;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ngu6uTvWGvAUlDcMFcyEgHxGf+zRqUwTnaHPKVZonO0=;
  b=SvdlX6El/7g86ujG4LcLtXa4wDVaEoNRuITWbBkKtKagykSW84uLsL8B
   MZpdNWLIlEeEHBe5v26xN3peBQvssrMrz0crfIvDoqqPd/XW2f595F3lV
   NWLkEE84r/srT8vRj/gIo97WHRK/2QuW945kOA1zZ3Ts+xwriUHpUXFLk
   6zKE00VrJiTb5pSIuDoe1G/pDKhYe4vIOTBK7ArB/EdaKO/BihE3vRwNR
   xGXQc0cPqB7/7efAkUmJMD07yi+cf60us52aPdE/cJ6PmxGDWMlKHW+WI
   +3BCOMoodm+8ojt2Oh4xxyQRxoL2oNhLR1juDihh6s3ikWUklEDRcCDIY
   w==;
X-CSE-ConnectionGUID: 4pJFcXglQJmPDZrtHfy89A==
X-CSE-MsgGUID: iMH2enWcQN6aGXg2X/GBjA==
X-IPAS-Result: =?us-ascii?q?A0BMAgD1agVr/8pK/pBaglmCV3VhQkkDhFSPU4IhA54pg?=
 =?us-ascii?q?X4PAQEBD0QNBAEBhD9GAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDZASAQIBAyMECwEYAT0cAwECAwImAgIrIwgQCYMCAYJ0A?=
 =?us-ascii?q?gERulx6fzOBAYMpAT8CQ1DbMwELFAGBCi6FQoMgAYUDXRgBgkqCMycbG4Fyg?=
 =?us-ascii?q?RWDaoEFgVwCA4U5gmoEgg0VehKBVB6DBIl1AoFPiElIgQIcA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBaAM1EioVbjIdgSM7Fy9YGwYFgRyBHoESgQNdgSsoXiGBCIF2AoJRggACA?=
 =?us-ascii?q?UlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJ?=
 =?us-ascii?q?C8FGiY+GwqBDCcfHhsOAh8QBhYhCxsYDUgRLDcVGQQ9AW4HlBSDEwcGUzUBK?=
 =?us-ascii?q?4FrQQ4BkwImAZI9oREKKIN5jCSVOhozqnILmH2OCpYHSoRqgWg8gVlwFYMiC?=
 =?us-ascii?q?UoZD445g2uFE8lIIzULAy8BAQcCBwEMAQMLgWiRfgEB?=
IronPort-Data: A9a23:92nL2aL3M9rZC0WKFE+RhZQlxSXFcZb7ZxGr2PjKsXjdYENShTYGy
 GAYXWmEbvaJa2P1Ko0laom18EkAsZeDyd8wTwId+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea9k3wWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmQvajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN0yFGMYNr0X/t9VBFlix
 +YECD4cPkGq0rfeLLKTEoGAh+wqIdOuOMYUvWttiGmAS/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A3NnwsYDUXUrsTIJslhO6yg3DlWzZZs1mS46Ew5gA/ySQviui1bYaOIbRmQ+1Uu2bCq
 2T59F3fXBg1BNPF+X2q2HCF07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcRQZ9UVuY98gzIkvOS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:ej2/KKl8uOQa5rmpoq3pyfwzAFfpDfIO3DAbv31ZSRFFG/Fw8P
 re+8jztCWE7Ar5N0tPpTntAsS9qDbnhP1ICOoqTNKftXfd2VdARbsKheCJ/9SjIVydygc378
 hdmsZFZOEYdWIbse/KpC+lDt0n3N6LtIqshevY0jNRaDsCUdAH0++8YTzranGfg2J9dOMEKK
 Y=
X-Talos-CUID: 9a23:He7HkGEESO5S6bPLqmI77Gw6EfAqdkT/yU/8EVWkKWh4GOy8HAo=
X-Talos-MUID: 9a23:mXvVsAg9WOiSiXuLylcQA8MpNeJIuamoN0s0t8sPlPmLbxw3FB2fpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="62805433"
Received: from aer-l-core-01.cisco.com ([144.254.74.202])
  by aer-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 10:56:08 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-01.cisco.com (Postfix) with ESMTPS id 6419034441
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:56:08 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 1846DCBF223; Tue, 24 Nov 2026 02:56:07 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail][PATCH 04/10] openssh: Fix CVE-2026-106582
Date: Tue, 24 Nov 2026 02:55:27 -0800
Message-Id: <20261124105533.348654-5-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124105533.348654-1-asparmar@cisco.com>
References: <20261124105533.348654-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251009
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/openssh/openssh-portable/commit/1d5340fce24526719e32aebc4c721fc228182ace
[2] https://ubuntu.com/security/CVE-2026-106582

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106582.patch     | 98 +++++++++++++++++++
 .../openssh/openssh_10.5p1.bb                 |  1 +
 2 files changed, 99 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106582.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106582.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106582.patch
new file mode 100644
index 0000000000..8471f99a38
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106582.patch
@@ -0,0 +1,98 @@
+From a85cb0087d0ee2788c3e85adad926455b646da3a Mon Sep 17 00:00:00 2001
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
+- Omit the upstream OpenBSD revision-only hunks.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ packet.c | 15 +++++++--------
+ 1 file changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/packet.c b/packet.c
+index 63dcb53..4c0cfb9 100644
+--- a/packet.c
++++ b/packet.c
+@@ -804,14 +804,13 @@ ssh_packet_init_compression(struct ssh *ssh)
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
+@@ -937,7 +936,7 @@ uncompress_buffer(struct ssh *ssh, struct sshbuf *in, struct sshbuf *out)
+ #else	/* WITH_ZLIB */
+ 
+ static int
+-start_compression_out(struct ssh *ssh, int level)
++start_compression_out(struct ssh *ssh)
+ {
+ 	return SSH_ERR_INTERNAL_ERROR;
+ }
+@@ -1043,7 +1042,7 @@ ssh_set_newkeys(struct ssh *ssh, int mode)
+ 		if ((r = ssh_packet_init_compression(ssh)) < 0)
+ 			return r;
+ 		if (mode == MODE_OUT) {
+-			if ((r = start_compression_out(ssh, 6)) != 0)
++			if ((r = start_compression_out(ssh)) != 0)
+ 				return r;
+ 		} else {
+ 			if ((r = start_compression_in(ssh)) != 0)
+@@ -1188,7 +1187,7 @@ ssh_packet_enable_delayed_compress(struct ssh *ssh)
+ 			if ((r = ssh_packet_init_compression(ssh)) != 0)
+ 				return r;
+ 			if (mode == MODE_OUT) {
+-				if ((r = start_compression_out(ssh, 6)) != 0)
++				if ((r = start_compression_out(ssh)) != 0)
+ 					return r;
+ 			} else {
+ 				if ((r = start_compression_in(ssh)) != 0)
diff --git a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
index 495c69c0ec..56e17632fc 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-106586_p2.patch \
            file://CVE-2026-106586_p3.patch \
            file://CVE-2026-106587.patch \
+           file://CVE-2026-106582.patch \
            "
 SRC_URI[sha256sum] = "d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3bd6cbd19218db11"
 
-- 
2.35.6

