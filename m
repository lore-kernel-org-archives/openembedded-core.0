Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36467.1795585637011898780
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:47:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=L3LqDK+6;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2904; q=dns/txt;
  s=iport01; t=1795585637; x=1796795237;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=cqsHpGGzu9OthNuNhXLFslwS/cQu4828r/dVZgBqRQA=;
  b=L3LqDK+6YlhEu7WSu58U2HrRgZ+Z3IH93TG6zTK3orjNYlT0PTqGUb7/
   UP4qtvi2XyRrskAWYOCtMBVfLM5P8197ZT8awkjNaAXsPnIGpeGZyz98g
   SCMFdy+XYuoQB6iWaCWh0JP+/Q5lh51wAL86LfkC8AGHs76rr/D61AIyS
   +5x/tyojYOwNU8+ziIjOrn3G1+8EhaTz0E5ikmi/MdPIICRM88uzthAr6
   96O84mMnmHfdIFGJsjJktg6eUQp8kSNNqa+avm0ztibqWfPjhNlhRLwws
   yR8y1CKhrb9lAzxYyFHN5fQFrwRRyRtnniZjUaEdr3kLvlAKjl5ZIBlAh
   Q==;
X-CSE-ConnectionGUID: 6xhiMQ0ZRniDA89Flo+6Xg==
X-CSE-MsgGUID: /Z5xcR7BTMSvqFAbeQTs/w==
X-IPAS-Result: =?us-ascii?q?A0BJAgD8dAZr/8xK/pBaglmCV3VgQ0kDlCeCIQOeKYF+D?=
 =?us-ascii?q?wEBAQ9EDQQBAYQ/RgKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCdAMRuXCBeTOBA?=
 =?us-ascii?q?YMpAT8CQ1DbMwELFAGBOIVCiCVdGAGEficbG4FyhH+BBYFcAgOCKoV5BIIie?=
 =?us-ascii?q?hKBVB6MdQKBSYhSSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFg?=
 =?us-ascii?q?RyBHoESgQNdgSsoXiGBCIF1AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosC?=
 =?us-ascii?q?oEaNTwJJj8VDGcLGgVhCAINDHQ5EDAcJC8FGSY8GwqBDCcdHhkOAikGFiELN?=
 =?us-ascii?q?BgNSBEsNxUZBD5uB5QTgxQHAXoTASuCLJM4kj2hEQoog3mMJJU6GjOqcguYf?=
 =?us-ascii?q?Y4KlWlohGqBaDyBWXAVgyIJShkPjjmDa4UTyUgmMgsDLwEBBwIHDgMLgWiRf?=
 =?us-ascii?q?gEB?=
IronPort-Data: A9a23:rYRmJaJLcq+p6NgYFE+RhJQlxSXFcZb7ZxGr2PjKsXjdYENS3jIHm
 DcaUW/Sb/yON2fxfdB/PY3k9kkE7cfRzoUxSlQd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea9k3wWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmQpajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN0wHEE3GLRAyNxxAE1np
 a02LDdOMCCM0rfeLLKTEoGAh+wqIdOuOMYUvWttiGmCS/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A3MHwsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FIpi+S2YYOOEjCMbYJnw1aTn
 D3sw0HCHAg0HdaS8AaetW3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxMGHt4VGOog5UTVkezf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ22FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:UQtskKo00nK2YujPwuOBw4YaV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3A8V6hU2s0NW6Nsictka+9IlMw6It7Yn3c6U6IEXW?=
 =?us-ascii?q?+CEpAGOy7TVjTppNrxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AzCTrRgyjwOKnAMUXvxnQJJ9RsiaaqOOcVVAGq8o?=
 =?us-ascii?q?sh+y/KzVeEj2QtQisBZByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60343913"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:47:14 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id 6734718000206
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:47:14 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 92FEACBF21E; Tue, 24 Nov 2026 21:47:11 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 05/10] openssh: Fix CVE-2026-106585
Date: Tue, 24 Nov 2026 21:47:06 -0800
Message-Id: <20261125054711.2691239-6-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125054711.2691239-1-hthakar@cisco.com>
References: <20261125054711.2691239-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251145
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/openssh/openssh-portable/commit/e0f85d83ccc15b1b218fa8a000fc29a2e3d2defd
[2] https://ubuntu.com/security/CVE-2026-106585

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106585.patch     | 44 +++++++++++++++++++
 .../openssh/openssh_10.3p1.bb                 |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106585.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106585.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106585.patch
new file mode 100644
index 0000000000..08f992f54c
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106585.patch
@@ -0,0 +1,44 @@
+From e0f85d83ccc15b1b218fa8a000fc29a2e3d2defd Mon Sep 17 00:00:00 2001
+From: "job@openbsd.org" <job@openbsd.org>
+Date: Tue, 22 Sep 2026 22:51:43 +0000
+Subject: [PATCH] upstream: Check that compressed payloads don't inflate beyond the
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
+- Omitted the upstream packet.c OpenBSD revision-only hunk and retained
+  the Wrynose OpenSSH 10.3p1 revision.
+
+(cherry picked from commit e0f85d83ccc15b1b218fa8a000fc29a2e3d2defd)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ packet.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/packet.c b/packet.c
+--- a/packet.c
++++ b/packet.c
+@@ -907,10 +907,12 @@ uncompress_buffer(struct ssh *ssh, struct sshbuf *in, struct sshbuf *out)
+ 		switch (status) {
+ 		case Z_OK:
+ 			if ((r = sshbuf_put(out, buf, sizeof(buf) -
+ 			    ssh->state->compression_in_stream.avail_out)) != 0)
+ 				return r;
++			if (sshbuf_len(out) >= PACKET_MAX_SIZE)
++				return SSH_ERR_INVALID_FORMAT;
+ 			break;
+ 		case Z_BUF_ERROR:
+ 			/*
+ 			 * Comments in zlib.h say that we should keep calling
+ 			 * inflate() until we get an error.  This appears to
+-- 
+2.43.0
diff --git a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
index ddf2483728..39ed9adc64 100644
--- a/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_10.3p1.bb
@@ -41,6 +41,7 @@ SRC_URI = "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.ta
            file://CVE-2026-106586_p3.patch \
            file://CVE-2026-106587.patch \
            file://CVE-2026-106582.patch \
+           file://CVE-2026-106585.patch \
            "
 SRC_URI[sha256sum] = "56682a36bb92dcf4b4f016fd8ec8e74059b79a8de25c15d670d731e7d18e45f4"
 
-- 
2.35.6

