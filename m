Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECF1C61DB4
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 11:02:05 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14069.1787569317983428480
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 04:01:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=AsCBCh/H;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=859; q=dns/txt;
  s=iport01; t=1787569318; x=1788778918;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2OacykeeBO0D8MmshpW9mZVnKtLzIfWcVbEAT/L50rI=;
  b=AsCBCh/Hg/x3a44S01aYl/aRQWb3+INnTPLwJT7+Pu2OFgmlKvXd0sZw
   uE7BReASiyitxmSHxV32JwYXocDp/BaM5tPS9MyMh6UgnxIw9HKa+h2UT
   +QK1qtD+PX1SKlxFkxSCn/K4bGkUBOF9ZT89Ap/+ONTOBEB4CwsWmRkHP
   B761knPyVPheP6HWbUcY6yIHIwV1SfyeJMjHFJTCBwoppTy5Q5rgdt/OM
   v36Q2aWdSc3Cszp5tf0SSZpLIx+zn1cZ9EKF8t5rDQ/iKKymL/R7EXmuI
   pTLoZyfCE648LucT89SYsFQ3MdLhh25DMQIvfGcG9l7zME1DGCps7zzUR
   A==;
X-CSE-ConnectionGUID: LHZ8CdT5Sv+ti8meC1DMLw==
X-CSE-MsgGUID: 8V8zUPSVSj+71yTUTkA+Sw==
X-IPAS-Result: =?us-ascii?q?A0D2AgAuI4xq/5QQJK1RCYJZgld0XkNJk1kBoQ6Bfg8BA?=
 =?us-ascii?q?QEPMSAEAQGFBY1uAiY2Bw4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4ThlyGXTYBRjBcRIMCAYJ0A8JpgiyBAYR92zABCxQBBYEzhT+IIoVyJxsbg?=
 =?us-ascii?q?XKEfoQXeYV4BIIigQyBeJFiSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F?=
 =?us-ascii?q?4ENGwYFgR2BKIQQIxk2fIEJXoErKWQBEheBCYIHAoJaggUCAUlDDgdHIgsYD?=
 =?us-ascii?q?UgRLDcUGQQ+bgeOXh+CR4EOgV9QOpNrkXqhDwoog3aMIpU6GjOqbC6YWqRah?=
 =?us-ascii?q?GmBbwE0gVlwFYMiCUoZD95cJzI/BwIHDwKTcQEB?=
IronPort-Data: A9a23:SIKhWa5G/uMOQuTczAynbAxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 mJLCz+OafmDYGugetoia9y+pElX65/dx4I2Sldt+yg0Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajJOt/rawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eGa0qqs17PTx16
 78EKWAIYzvaq8eS3+fuIgVsrpxLwMjDNYcbvDRkiDreF/tjGMmFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP00n1lQ/UPrSmM+ki2f2dSZYsHqepLE85C7YywkZPL3FYIOKJ4zUG5wI9qqej
 jL4r3bEOiokD97clmOUzk+QhcaMpjyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXzFCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:Sh9VF6pXfUmEHRgs3KC3huMaV5oHeYIsimQD101hICG9vPb2qy
 nIpoV/6faaslcssR0b9OxoW5PwI080i6QU3WB5B97LN2PbUQCTQr2Kg7GP/9TIIVybygck79
 YCT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3A32K8JWospHeIMN1DkILakYPmUeQFQC32wEuNGFH?=
 =?us-ascii?q?7FWc5TbC+EHO13Lwxxg=3D=3D?=
X-Talos-MUID: 9a23:Nd1ZDQQsL+4GYWnaRXS8umFwCf9T3Z+sSx9UgKk7h8qtdhdvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,240,1779148800"; 
   d="scan'208";a="817586615"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Aug 2026 11:01:57 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 14E63180001C4;
	Mon, 24 Aug 2026 11:01:57 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id A91C4CC12A6; Mon, 24 Aug 2026 04:01:56 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][PATCH] vim: correct CVE_PRODUCT mapping
Date: Mon, 24 Aug 2026 04:01:56 -0700
Message-Id: <20260824110156.25560-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 11:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244085

From: Devansh Patel <devanshp@cisco.com>

The default "vim" mapping uses a vendor wildcard and also reports the
unrelated JetBrains Vim plugin and VSCodeVim extension.

Use "vim_development_group:vim" for the historical NVD configuration
identity and "vim:vim" for the active NVD dictionary CPE and configuration
identity.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-support/vim/vim_9.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/vim/vim_9.2.bb b/meta/recipes-support/vim/vim_9.2.bb
index fee9f055e9..d31d277fae 100644
--- a/meta/recipes-support/vim/vim_9.2.bb
+++ b/meta/recipes-support/vim/vim_9.2.bb
@@ -1,5 +1,7 @@
 require vim.inc
 
+CVE_PRODUCT = "vim_development_group:vim vim:vim"
+
 PROVIDES = "xxd"
 
 RDEPENDS:${PN} = "ncurses-terminfo-base ${PN}-xxd"
-- 
2.35.6

