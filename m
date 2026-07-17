Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90084C44519
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 05:21:06 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7272.1784265662627799325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 22:21:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ZLTv8vy1;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9086; q=dns/txt;
  s=iport01; t=1784265663; x=1785475263;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MxIVdUxNijaC/1hx0+4hRsgZYLLZSAcgUWhnbEYYwfk=;
  b=ZLTv8vy1JyotpnwNU4ZzUU6wctC9+io0vL2hVbBbqF3I8ZNzqC5PtCqZ
   HSkrrXStAwI8A+EzBT+PZALt1O7w6+bBrcdCLmqfEMEKlwVAt9+GT1CDM
   gaDsQ0bNjvKUTsKMLdaueE3zQ0VneyqxVFzeuhd+R+4vbkmjVembCqoMz
   Mq95I9M0KKnx6A0rDxefe3EPMA87I8tszaLTkD0ZQ2mDJgmBpxormWYDI
   zK02CnYxucRuOjI/Y10LFHD08sgJD3OicSav9Ti95P8VkxZcA5wfxzopt
   w0RKcVJyjfOKY7h29UFpofq1lwbROIEsuBd6FSncaV3FC+PvHlFaLUKpO
   A==;
X-CSE-ConnectionGUID: EpJdeSUOQa6TG8TNgzps4A==
X-CSE-MsgGUID: yBW0BPQPQle1EiLL700XFg==
X-IPAS-Result: =?us-ascii?q?A0AnAAByt1lq/47/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ0X0JJA4xviVgDnhuBfg8BAQEPRA0EAQGFBQKNUgImNAkOAQIEAwIDAQEBA?=
 =?us-ascii?q?QEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAzIBGAEtEBwDAQIvKyMIG?=
 =?us-ascii?q?YMCAYJ0AgERvHoaN4IsgQGDKAGBVNsuAQsUAYE4AYU+iCBcGAGEfCcbG4Fyg?=
 =?us-ascii?q?RQBgTuCLoEFgVwCA4IDhh8Egg0VehKBWh6Ec4I0iFpIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XgQwbBwWBHYE6gQCEdiMfAzl/gS91SnctaQESF4FOg?=
 =?us-ascii?q?hSBPgMLGA1IESw3FBsEPm4HjUgjgh8ZB4EOASsXGFAGSBtED5MoAQcMkiuhD?=
 =?us-ascii?q?woog3WMIY9ChXgaM6psC5h9jgqWUIRpgWg8gVlwFYMiCUoZD44qAwsLg2CFE?=
 =?us-ascii?q?8lFJDUCCQMvAQEHAgcOAwuBaIRhiyEtgU8BAQ?=
IronPort-Data: A9a23:jsOFkqDmmsouoxVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApGwlhDUGz
 mIXDWHSa6mON2H9fd0gbN7k8xgDv8WGn9A2OVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD8hWYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE7u1MAEwNAKoh87hLLjFy0
 /MKMCtRR0XW7w626OrTpuhEnM8vKozveYgYoHwllWyfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY1BPjDS0Un1lM/AYkmlf2tj2PXeDxDo1XTrq0yi4TW5FEpiui8YIqIIrRmQ+1EtHnAj
 Fr/x139D0g3Nfi7lmLdwlyj07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KJpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:XZGAmKxudRGeI5LZwLOpKrPwDr1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIC5IOa+HYPBxdkdvw5hW+HpILxdmK973tuMLlpk0dKz2Dr8pbnn9E4sHxKDwOeDV7
X-Talos-CUID: 9a23:P5V/c21ELYeoL5HQWIFkkLxfN9gHfnDm8VDpKhGEJjZVbrKHUUTM0fYx
X-Talos-MUID: 9a23:GPL0QAarsmqmlOBTphXT3BtaDf9R56n3JUEptcpe4/mqOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208";a="502898850"
Received: from rcdn-l-core-05.cisco.com ([173.37.255.142])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 05:21:01 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-05.cisco.com (Postfix) with ESMTPS id 1B35D180000B4;
	Fri, 17 Jul 2026 05:21:01 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id B920DCBF203; Thu, 16 Jul 2026 22:21:00 -0700 (PDT)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashishkumar Parmar <asparmar@cisco.com>
Subject: [wrynose][PATCH v2 3/6] rsync: Fix CVE-2026-43618
Date: Thu, 16 Jul 2026 22:20:56 -0700
Message-Id: <20260717052059.773645-4-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260717052059.773645-1-asparmar@cisco.com>
References: <20260717052059.773645-1-asparmar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: rcdn-l-core-05.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241121

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream v3.4.3 backport for
CVE-2026-43618. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/RsyncProject/rsync/commit/c44c90e9460c666c965446a8c0957f0b9fa4c66a
[2] https://github.com/RsyncProject/rsync/security/advisories/GHSA-g37v-g3gj-pmwq

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../rsync/files/CVE-2026-43618.patch          | 248 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.4.1.bb    |   1 +
 2 files changed, 249 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43618.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43618.patch b/meta/recipes-devtools/rsync/files/CVE-2026-43618.patch
new file mode 100644
index 0000000000..4e5cf2dc6d
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43618.patch
@@ -0,0 +1,248 @@
+From a93cfc86b6daa2dfd754bcbe261cf01afef056f4 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Wed, 29 Apr 2026 11:10:59 +1000
+Subject: [PATCH] token: harden compressed-token decoding against integer
+ overflow
+
+The receiver's three compressed-token decoders --
+recv_deflated_token (zlib), recv_zstd_token, and
+recv_compressed_token (lz4) -- accumulated rx_token (a 32-bit
+signed counter) without overflow checking. A malicious sender
+could craft a compressed-token stream that walked rx_token past
+INT32_MAX, with careful manipulation leaking process memory
+contents to the wire (environment variables, passwords, heap
+pointers, library pointers -- significantly weakening ASLR
+and facilitating further exploitation).
+
+Cap rx_token at MAX_TOKEN_INDEX = 0x7ffffffe. Fold the
+bookkeeping into recv_compressed_token_num() and
+recv_compressed_token_run() shared by all three decoders. Reject
+negative or out-of-range token values explicitly. Also cap the
+simple_recv_token literal-block length at the source: any
+wire-supplied length > CHUNK_SIZE is ill-formed (the matching
+simple_send_token never writes a chunk larger than CHUNK_SIZE),
+so reject before looping on attacker-controlled bytes.
+
+Reach: an authenticated daemon connection with compression
+enabled (the default for protocols >= 30 when both peers
+advertise it). Disabling compression on the daemon
+("refuse options = compress" in rsyncd.conf) is the available
+workaround.
+
+Reporter: Omar Elsayed (seks99x).
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+
+CVE: CVE-2026-43618
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/c44c90e9460c666c965446a8c0957f0b9fa4c66a]
+
+Backport Changes:
+- Resolved token.c context differences against Wrynose's 3.4.1
+  source, whose three decoder bodies do not all match upstream's
+  surrounding negative-token validation blocks.
+- The Wrynose hunk replaces the older per-decoder token bookkeeping
+  with the upstream recv_compressed_token_num() and
+  recv_compressed_token_run() helper calls at the matching zlib,
+  zstd, and lz4 decoder sites.
+
+(cherry picked from commit c44c90e9460c666c965446a8c0957f0b9fa4c66a)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ receiver.c |  11 +++++-
+ token.c    | 102 ++++++++++++++++++++++++++++++-----------------------
+ 2 files changed, 67 insertions(+), 46 deletions(-)
+
+diff --git a/receiver.c b/receiver.c
+index 8cf8366b..a487ad5a 100644
+--- a/receiver.c
++++ b/receiver.c
+@@ -318,7 +318,12 @@ static int receive_data(int f_in, char *fname_r, int fd_r, OFF_T size_r,
+ 		}
+ 	}
+ 
+-	while ((i = recv_token(f_in, &data)) != 0) {
++	while (1) {
++		data = NULL;
++		i = recv_token(f_in, &data);
++		if (i == 0)
++			break;
++
+ 		if (INFO_GTE(PROGRESS, 1))
+ 			show_progress(offset, total_size);
+ 
+@@ -326,6 +331,10 @@ static int receive_data(int f_in, char *fname_r, int fd_r, OFF_T size_r,
+ 			maybe_send_keepalive(time(NULL), MSK_ALLOW_FLUSH | MSK_ACTIVE_RECEIVER);
+ 
+ 		if (i > 0) {
++			if (!data) {
++				rprintf(FERROR, "Invalid literal token with no data [%s]\n", who_am_i());
++				exit_cleanup(RERR_PROTOCOL);
++			}
+ 			if (DEBUG_GTE(DELTASUM, 3)) {
+ 				rprintf(FINFO,"data recv %d at %s\n",
+ 					i, big_num(offset));
+diff --git a/token.c b/token.c
+index c108b3af..02dabd8d 100644
+--- a/token.c
++++ b/token.c
+@@ -291,6 +291,14 @@ static int32 simple_recv_token(int f, char **data)
+ 		int32 i = read_int(f);
+ 		if (i <= 0)
+ 			return i;
++		/* simple_send_token caps each literal chunk at CHUNK_SIZE;
++		 * reject anything larger so a hostile peer cannot drive the
++		 * read_buf below past our static CHUNK_SIZE buffer. */
++		if (i > CHUNK_SIZE) {
++			rprintf(FERROR, "invalid uncompressed token length %ld [%s]\n",
++				(long)i, who_am_i());
++			exit_cleanup(RERR_PROTOCOL);
++		}
+ 		residue = i;
+ 	}
+ 
+@@ -493,9 +501,52 @@ static char *cbuf;
+ static char *dbuf;
+ 
+ /* for decoding runs of tokens */
++#define MAX_TOKEN_INDEX ((int32)0x7ffffffe)
++
+ static int32 rx_token;
+ static int32 rx_run;
+ 
++static NORETURN void invalid_compressed_token(void)
++{
++	rprintf(FERROR, "invalid token number in compressed stream\n");
++	exit_cleanup(RERR_PROTOCOL);
++}
++
++static int32 recv_compressed_token_num(int f, int32 flag)
++{
++	if (flag & TOKEN_REL) {
++		int32 incr = flag & 0x3f;
++		if (rx_token > MAX_TOKEN_INDEX - incr)
++			invalid_compressed_token();
++		rx_token += incr;
++		flag >>= 6;
++	} else {
++		rx_token = read_int(f);
++		if (rx_token < 0 || rx_token > MAX_TOKEN_INDEX)
++			invalid_compressed_token();
++	}
++
++	if (flag & 1) {
++		rx_run = read_byte(f);
++		rx_run += read_byte(f) << 8;
++		if (rx_run <= 0 || rx_token > MAX_TOKEN_INDEX - rx_run)
++			invalid_compressed_token();
++		recv_state = r_running;
++	}
++
++	return -1 - rx_token;
++}
++
++static int32 recv_compressed_token_run(void)
++{
++	if (rx_run <= 0 || rx_token >= MAX_TOKEN_INDEX)
++		invalid_compressed_token();
++	++rx_token;
++	if (--rx_run == 0)
++		recv_state = r_idle;
++	return -1 - rx_token;
++}
++
+ /* Receive a deflated token and inflate it */
+ static int32 recv_deflated_token(int f, char **data)
+ {
+@@ -586,17 +637,7 @@ static int32 recv_deflated_token(int f, char **data)
+ 			}
+ 
+ 			/* here we have a token of some kind */
+-			if (flag & TOKEN_REL) {
+-				rx_token += flag & 0x3f;
+-				flag >>= 6;
+-			} else
+-				rx_token = read_int(f);
+-			if (flag & 1) {
+-				rx_run = read_byte(f);
+-				rx_run += read_byte(f) << 8;
+-				recv_state = r_running;
+-			}
+-			return -1 - rx_token;
++			return recv_compressed_token_num(f, flag);
+ 
+ 		case r_inflating:
+ 			rx_strm.next_out = (Bytef *)dbuf;
+@@ -616,10 +657,7 @@ static int32 recv_deflated_token(int f, char **data)
+ 			break;
+ 
+ 		case r_running:
+-			++rx_token;
+-			if (--rx_run == 0)
+-				recv_state = r_idle;
+-			return -1 - rx_token;
++			return recv_compressed_token_run();
+ 		}
+ 	}
+ }
+@@ -828,17 +866,7 @@ static int32 recv_zstd_token(int f, char **data)
+ 				return 0;
+ 			}
+ 			/* here we have a token of some kind */
+-			if (flag & TOKEN_REL) {
+-				rx_token += flag & 0x3f;
+-				flag >>= 6;
+-			} else
+-				rx_token = read_int(f);
+-			if (flag & 1) {
+-				rx_run = read_byte(f);
+-				rx_run += read_byte(f) << 8;
+-				recv_state = r_running;
+-			}
+-			return -1 - rx_token;
++			return recv_compressed_token_num(f, flag);
+ 
+ 		case r_inflated: /* zstd doesn't get into this state */
+ 			break;
+@@ -869,10 +897,7 @@ static int32 recv_zstd_token(int f, char **data)
+ 			break;
+ 
+ 		case r_running:
+-			++rx_token;
+-			if (--rx_run == 0)
+-				recv_state = r_idle;
+-			return -1 - rx_token;
++			return recv_compressed_token_run();
+ 		}
+ 	}
+ }
+@@ -992,17 +1017,7 @@ static int32 recv_compressed_token(int f, char **data)
+ 			}
+ 
+ 			/* here we have a token of some kind */
+-			if (flag & TOKEN_REL) {
+-				rx_token += flag & 0x3f;
+-				flag >>= 6;
+-			} else
+-				rx_token = read_int(f);
+-			if (flag & 1) {
+-				rx_run = read_byte(f);
+-				rx_run += read_byte(f) << 8;
+-				recv_state = r_running;
+-			}
+-			return -1 - rx_token;
++			return recv_compressed_token_num(f, flag);
+ 
+ 		case r_inflating:
+ 			avail_out = LZ4_decompress_safe(next_in, dbuf, avail_in, size);
+@@ -1018,10 +1033,7 @@ static int32 recv_compressed_token(int f, char **data)
+ 			break;
+ 
+ 		case r_running:
+-			++rx_token;
+-			if (--rx_run == 0)
+-				recv_state = r_idle;
+-			return -1 - rx_token;
++			return recv_compressed_token_run();
+ 		}
+ 	}
+ }
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
index 47e195ef24..f84f269692 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -26,6 +26,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://CVE-2026-43619_p4.patch \
            file://CVE-2026-43619_p5.patch \
            file://CVE-2026-43619_p6.patch \
+           file://CVE-2026-43618.patch \
            "
 SRC_URI[sha256sum] = "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf69850d65fd88c52"
 
-- 
2.35.6

