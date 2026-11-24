Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15516.1795517772211182997
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 02:56:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Tb1C/olQ;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2665; q=dns/txt;
  s=iport01; t=1795517772; x=1796727372;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=gnOG9wi7l34Yc2xF5ABdcqCqty5vVWpsRcjqkyewwos=;
  b=Tb1C/olQ/BhdWOYeM1Cf9PxFD4z7mVSBY6iKnZ0gMOjFuML1bjx43vQA
   /f6HdQcYKDyKFpNrkAiTVbV1aWTJ9kGjHQjGPt9zn5JKNbhVptoho/lQA
   JqwUMnnydGl5ZjPuv3V4DO2PAyTtKTEwpocSKL9NiwBmqlG6O3XUI8pES
   qsxZwT1JA23U9NDiANRaV7/vLpbfB6QzqbBmTe0TQlSDkUGoGpuzMqQvF
   1+L8EdHUaFlCC1ocB48LMOZJEg7hck/Iru21LCh+srQ8NLkL5fvG2rnB/
   qApOjjaC3/w6rgcpS3PVbyysRc8Y2/+RCLaLfvLID4TksO4jA8orv/cXl
   Q==;
X-CSE-ConnectionGUID: EhLgZ9GyR02AjGfBrX5G/g==
X-CSE-MsgGUID: t7UtfiWpSV6L8irmmGPU2A==
X-IPAS-Result: =?us-ascii?q?A0BJAgD1agVr/9FK/pBaglmCV3VhQkkDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCdAIBEbpcgXkzg?=
 =?us-ascii?q?QGDKQE/AkNQ2zMBCxQBgTiFQogkXRgBhH0nGxuBcoR/gQWBXAIDgiqFeQSCI?=
 =?us-ascii?q?noSgVQejHkCgU+ISUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBBxsGB?=
 =?us-ascii?q?YEcgR6BEoEDXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaL?=
 =?us-ascii?q?AqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bDgIfEAYWI?=
 =?us-ascii?q?QsbGA1IESw3FRkEPm4HlBSDEwcBgQ0BK4IskziSPaERCiiDeYwklToaM6pyC?=
 =?us-ascii?q?5h9jgqWUYRqgWg8gVlwFYMiCUoZD445g2uFE8lIIzULAy8BAQcCBw4DC4Fok?=
 =?us-ascii?q?X4BAQ?=
IronPort-Data: A9a23:OKQotq7CUCbWmJfOKgJHfwxRtGzGchMFZxGqfqrLsTDasY5as4F+v
 jZODGvVO/iCZTf1KN9zb4++8RxTu8XUztdmT1E9qyBmZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOi78BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztOsPrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eEI089dQmLnB0r
 aYxKh8DRAqz2s3xz+fuIgVsrpxLwMjDNY4F/3UlxjbDALN+EdbIQr7B4plT2zJYasJmRKqCI
 ZBENXwwMFKaO0wn1lQ/UPrSmM+hnWH2aThRsnqepLE85C7YywkZPL3FboKJJ4bWGZs9ckCwu
 j3742r4PQkhCoK7mTuf93eDvtKVtHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZHvd/7ESGzbDZpl7JQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:dDuDjq9Ek61Coh+fm7luk+D0I+orL9Y04lQ7vn2ZLiYlFvBw+P
 rBoB1273LJYXMqKRIdcLO7Scy9qA3nlKKdiLN5VdzJYOClghrLEGgI1+TfKlPbdxEWjtQ86Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: =?us-ascii?q?9a23=3AWsRlhWrZoca/UUYQZcZZCNfmUe0lVnLvnVjBGRf?=
 =?us-ascii?q?iIGRGRpePeQK/v6wxxg=3D=3D?=
X-Talos-MUID: 9a23:xj77AQqNw+Pt8MUzlP4ezy09Cdtm4pu2M35TtcUHocyBGhRNYR7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60452446"
Received: from aer-l-core-08.cisco.com ([144.254.74.209])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 10:56:10 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-08.cisco.com (Postfix) with ESMTPS id E03DC180001A3
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:56:09 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 1CDE6CBF224; Tue, 24 Nov 2026 02:56:07 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail][PATCH 05/10] openssh: Fix CVE-2026-106585
Date: Tue, 24 Nov 2026 02:55:28 -0800
Message-Id: <20261124105533.348654-6-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124105533.348654-1-asparmar@cisco.com>
References: <20261124105533.348654-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:56:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251016
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/openssh/openssh-portable/commit/e0f85d83ccc15b1b218fa8a000fc29a2e3d2defd
[2] https://ubuntu.com/security/CVE-2026-106585

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106585.patch     | 38 +++++++++++++++++++
 .../openssh/openssh_10.5p1.bb                 |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106585.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106585.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106585.patch
new file mode 100644
index 0000000000..66d6dab36c
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106585.patch
@@ -0,0 +1,38 @@
+From 69b2c79b0c36329027f06b3882e9c1640f2151cf Mon Sep 17 00:00:00 2001
+From: "job@openbsd.org" <job@openbsd.org>
+Date: Tue, 22 Sep 2026 22:51:43 +0000
+Subject: [PATCH] upstream: Check that compressed payloads don't inflate beyond
+ the
+
+maximum payload length
+
+From a report by Oleh Konko (1seal)
+
+OK djm@
+
+OpenBSD-Commit-ID: a0d3e7aa432777c28bfe23e5447ac117d6c151d9
+
+CVE: CVE-2026-106585
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/e0f85d83ccc15b1b218fa8a000fc29a2e3d2defd]
+
+Backport Changes:
+- Omit the upstream OpenBSD revision-only hunks.
+
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ packet.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/packet.c b/packet.c
+index 4c0cfb9..a89f95a 100644
+--- a/packet.c
++++ b/packet.c
+@@ -912,6 +912,8 @@ uncompress_buffer(struct ssh *ssh, struct sshbuf *in, struct sshbuf *out)
+ 			if ((r = sshbuf_put(out, buf, sizeof(buf) -
+ 			    ssh->state->compression_in_stream.avail_out)) != 0)
+ 				return r;
++			if (sshbuf_len(out) >= PACKET_MAX_SIZE)
++				return SSH_ERR_INVALID_FORMAT;
+ 			break;
+ 		case Z_BUF_ERROR:
+ 			/*
diff --git a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
index 56e17632fc..377b6b17e0 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.5p1.bb
@@ -31,6 +31,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-106586_p3.patch \
            file://CVE-2026-106587.patch \
            file://CVE-2026-106582.patch \
+           file://CVE-2026-106585.patch \
            "
 SRC_URI[sha256sum] = "d44d28a839ea9daf969cc69150fde59910b2b39361dad81a3bd6cbd19218db11"
 
-- 
2.35.6

