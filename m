Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27792.1793856710351879545
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:31:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GPwNztgf;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2823; q=dns/txt;
  s=iport01; t=1793856710; x=1795066310;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=WWMEW/wTkzBC1Lh1Z/ZsPH/dSulJO1QVmrgRKfMf+fo=;
  b=GPwNztgfRkAFAs3nnZamlf83+zxeGYGgBAS9Z7gfMgXwy5YIPvcmgaDH
   KiZWZeTfvdyrqpltxhkqZfR+Hhi9yFOy+z+e7MVVRG2SnzeEPx1MEEbWD
   v9Bjcerg1hGsnxX4TLUdsUw6Ey1K5sXOAneeacHpsuwZM4AlTFdrAXL8e
   NOfwuEmqgvutQL4XU41B1/xgDGF48qxo9HTS1BSSk6tEEIR4ZlN0WuV4z
   IOgGVULq1hstSUVChONMJcf23YSJiSGkhIYMPKKwwBodgwoCjwBNvYluM
   E73JZ140OU6JrdqDGXneLtiyrbLr/NhQBcrIVqtusV0u5dEtAcAu8aYRY
   Q==;
X-CSE-ConnectionGUID: JZrGHMRMRWeteBSFNooFFA==
X-CSE-MsgGUID: F3yivTueRM2qvWY1o2Ylmw==
X-IPAS-Result: =?us-ascii?q?A0BIAgCDE+xq/47/Ja1aglmCV3VhQkmUKoIhA54hgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo4dAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYMCAYJ0AgERvD+BeTOBA?=
 =?us-ascii?q?YMpAT8CQ1DbMwELFAGBOIVAiCNdGAGEfScbG4FyhH6BBYFcAQEDgiqFeQSCI?=
 =?us-ascii?q?oEMgVoejHoCgVKGcEiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGB?=
 =?us-ascii?q?YEdgR6BEoEHXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaL?=
 =?us-ascii?q?AqBGjU8CSY/FQxkCxoFYQgCDQxyORAwHiQvBRwmQBsKGBgNSBEsNxUZBD5uB?=
 =?us-ascii?q?5IvgwoHAYENASoBlWOSP6ERCiiDeIwklToaM6pxC5h9jgqWUYRpgWg8gUcLB?=
 =?us-ascii?q?3AVgyIJShkPjjmDa4F/gxTJSCM1CzIBAQcCBw4DC4FohGGNHQEB?=
IronPort-Data: A9a23:fnqFm6mhHXcWVLaqTc1e4ATo5gzXJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIZXGCAM/nbYDGnftonbY63pEhX6sCGz9U1GwdsqS1nEVtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNs/7b8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fa8q4MlXJFtrz
 8MVND0nVT6lgOWY7pvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMieBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYD/7C7pm9AusrnnjczRboUi9rqss6G+Vxwt0uFToGIeJJoPUGJQJzy50o
 EropHX4HC0HOea6kyObzUP1gbX+mSbkDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBZCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:bXXn/qwd/PbAklYkQI3lKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3A39QF82oJQiyEi/UD4LzfdBPmUeIXaFL96U31GXC?=
 =?us-ascii?q?1FWtDc5OzTli+1ooxxg=3D=3D?=
X-Talos-MUID: 9a23:qYhTBgYNz3Oh1eBTmWT9hS9eKcpSxv63Fn88yJJcis2BKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="544765949"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 05:31:49 +0000
Received: from sjc-ads-2020.cisco.com (sjc-ads-2020.cisco.com [171.70.61.208])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 556111800020E
	for <openembedded-core@lists.openembedded.org>; Thu,  5 Nov 2026 05:31:49 +0000 (GMT)
Received: by sjc-ads-2020.cisco.com (Postfix, from userid 1887505)
	id F0091CC124C; Wed,  4 Nov 2026 21:31:48 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH  2/8] openssh: Fix CVE-2026-106585
Date: Wed,  4 Nov 2026 21:31:42 -0800
Message-Id: <20261105053148.2704106-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105053148.2704106-1-hthakar@cisco.com>
References: <20261105053148.2704106-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2020.cisco.com [171.70.61.208];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.61.208, sjc-ads-2020.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 05:31:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249435
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream OpenSSH 10.6p1 backport for
CVE-2026-106585. The fix is referenced in [1] and the advisory in [2].

[1] https://github.com/openssh/openssh-portable/commit/e0f85d83ccc15b1b218fa8a000fc29a2e3d2defd
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-106585

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../openssh/openssh/CVE-2026-106585.patch     | 40 +++++++++++++++++++
 .../openssh/openssh_9.6p1.bb                  |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106585.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2026-106585.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106585.patch
new file mode 100644
index 0000000000..32335237ba
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2026-106585.patch
@@ -0,0 +1,40 @@
+From e0f85d83ccc15b1b218fa8a000fc29a2e3d2defd Mon Sep 17 00:00:00 2001
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
+- Omitted the upstream OpenBSD RCS revision-only hunk and retained the
+  OpenSSH 9.6p1 revision identifier.
+
+(cherry picked from commit e0f85d83ccc15b1b218fa8a000fc29a2e3d2defd)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ packet.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/packet.c b/packet.c
+index aeab98c..e8852d3 100644
+--- a/packet.c
++++ b/packet.c
+@@ -800,6 +800,8 @@ uncompress_buffer(struct ssh *ssh, struct sshbuf *in, struct sshbuf *out)
+ 			if ((r = sshbuf_put(out, buf, sizeof(buf) -
+ 			    ssh->state->compression_in_stream.avail_out)) != 0)
+ 				return r;
++			if (sshbuf_len(out) >= PACKET_MAX_SIZE)
++				return SSH_ERR_INVALID_FORMAT;
+ 			break;
+ 		case Z_BUF_ERROR:
+ 			/*
diff --git a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
index 4266f05dd4..1e00522d16 100644
--- a/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
@@ -47,6 +47,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2026-106586_p1.patch \
            file://CVE-2026-106586_p2.patch \
            file://CVE-2026-106586_p3.patch \
+           file://CVE-2026-106585.patch \
            file://CVE-2026-73283.patch \
            file://CVE-2026-73282.patch \
            file://CVE-2026-73281.patch \
-- 
2.35.6

