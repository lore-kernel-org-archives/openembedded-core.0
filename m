Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97ADAC5DF8D
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:08:00 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3038.1787216871405847851
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=lwhM0vcN;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1382; q=dns/txt;
  s=iport01; t=1787216871; x=1788426471;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Op6dbQ0tgCsIHL39/oo4xwtE4nPaHLJRVqoYWLM3P8k=;
  b=lwhM0vcNdZJ8vgLASyfCsG0CBGHCyds7m3JP/m2wEOHm+RxEw3JNunyM
   oY0EyOfi2EXS4UAjk8dBiexQSTeCrmGQb2bVi0ZmMn1q//faSA4I+Ci9p
   iVVc5GDPaOFskSwWJt0R6cHY/n49IF83fH1G/XM+17QXQRRp+vTuMi9nr
   qw/Vt2Pspaf9N+Ap0pNGdCZ+BJ1qjsMZ6Je9lqRI3aoHWGsIErGLNa5vA
   6tckEAWMwQI6gv9YxYOXLI1fCuzPfBKJkvQ7D9/5lw6E/i4JhHc0sYB9r
   /cdXg0HJylCf2JPjgdf6Pvg+5+Nr8r8RA/VRkURRQiDI/lNHWAKxJmt2Y
   Q==;
X-CSE-ConnectionGUID: kL0VlFLTS56buNfkgApwOg==
X-CSE-MsgGUID: Q0CkFFp2Q560SS28oEsnUg==
X-IPAS-Result: =?us-ascii?q?A0BCAgAdw4Zq/5EQJK1aglmCV3ReQ0mTWQGhDhSBag8BA?=
 =?us-ascii?q?QEPNxoEAQGFBY1tAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4ThlyGXSsLARgBLTBcRIMCAYJ0A8IMN4FZIDOBAYMoAYFU2zABCxQBBYEzh?=
 =?us-ascii?q?T+IInaEfCcbG4FyhH6EBIEMhXgEgiKBDIF4kVJIgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQ0bBgWBHYEohDcjGTZ8gQlegSsqYQESF4EJggoCgnCCB?=
 =?us-ascii?q?gIBSUUOCRcLGA1IESw3FBkEPm4HjlEggkuBDoFEpwqhDwoog3aMIZU6GjOqb?=
 =?us-ascii?q?C6YWqRahGmBaDyBWXAVgyIJShkP3lwnMgI7AgcCBw4DC5FqgR9dAQE?=
IronPort-Data: A9a23:AVikha4e1ERwkOaTg+KSsQxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 mtLDDjSO6uJMGCmeYt+Pd63/U9VvJ+AmtIxTQVkqyA9Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2QqajJNuvrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4ePqlAxOJZJV11q
 KISNRYDbR+qn/2Rz+fuIgVsrpxLwMjDNYcbvDRkiDreF/tjGcCFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0An1lQ/UPrSmM+ki2f2dSZYsHqepLE85C7YywkZPL3FYIOMI4DbFZQO9qqej
 lue1GfXLAlADYHBkQG+qCKrq/TJoCyuDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4Guk+7kSJj6HT+QvcXjhCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rd94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:SpgalqgaTVHGEofXvdmxrZaid3BQXvYji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8gTFh4pgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3AzityymijfEijoCfSUqO3D8XXFTJucVmF8nP+B3O?=
 =?us-ascii?q?DVDhjVZubSlC54LxDnJ87?=
X-Talos-MUID: 9a23:Ko/W2QSDMTdbSwLNRXTV3BphGulwuZ3zVhg2qs9WvOSfMxF/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="811149893"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:07:50 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id 7496B18000443;
	Thu, 20 Aug 2026 09:07:50 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 189BECC12A7; Thu, 20 Aug 2026 02:07:50 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH] python3-click: fix CVE_PRODUCT
Date: Thu, 20 Aug 2026 02:07:50 -0700
Message-Id: <20260820090750.61817-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243836

From: Tim Orling <tim.orling@konsulko.com>

Recipe (PV): python3-click (8.3.1)
Before -> After python:click -> palletsprojects:click
Newly caught: CVE-2026-7246 (command injection in click.edit())
Status: unpatched (fixed 8.3.3)

Note: The original commit targeted python3-click_8.4.2.bb. This is
adjusted for Wrynose, where the recipe version is 8.3.1. The unrelated
DESCRIPTION cleanup from the original commit is intentionally omitted.

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 30357a26d7ce490725d1b0ac3375047d00595a5c)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-click_8.3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-click_8.3.1.bb b/meta/recipes-devtools/python/python3-click_8.3.1.bb
index 1f42fe1a50..49204e96e1 100644
--- a/meta/recipes-devtools/python/python3-click_8.3.1.bb
+++ b/meta/recipes-devtools/python/python3-click_8.3.1.bb
@@ -12,6 +12,8 @@ SRC_URI[sha256sum] = "12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2f
 
 inherit pypi python_flit_core ptest-python-pytest
 
+CVE_PRODUCT = "palletsprojects:click"
+
 RDEPENDS:${PN}-ptest += " \
 	python3-pytest \
 	python3-terminal \
-- 
2.35.6

