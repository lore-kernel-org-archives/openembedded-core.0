Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C994C5516D
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:50 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32609.1771565686307896284
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=HMl12DwL;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2360; q=dns/txt;
  s=iport01; t=1771565687; x=1772775287;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qQF7MV+QFxdCrzr3V3Nq1N46pCFkwHT60VjzoMRzcEI=;
  b=HMl12DwLh9mAGz/nR2Z+9ihoJSWxHLQWFmAQLLMps8MOldffook13i2/
   ESnNRiZ73AAghLxHJeeRswC2PdjUzUn9Dcn3y5aYbIK2U0/8I7zXP4ni4
   t4a8I26xxy1BHNC2tqUrMbEpXdKJBqu5vjrnd2LzeI2WA29WgDWFft0MZ
   w5+CFoashRPtjjrWfO74inxBKJf0GUr8pRmhwx4lYMbAe5qzlijpLcHpR
   JRWbx2LOxQ+iX8CyZhtE62isclf3S6r34YM0S4K/HanpK9BGQJcTJRgGf
   8PbGlSw1Fig67LPZMzjrzxlNpJvSv1/Euf5Q2ovIjru8MTjvOBSgVkq5p
   w==;
X-CSE-ConnectionGUID: fkaRtDUeTCK2aSUCLp0gKA==
X-CSE-MsgGUID: C6nkBhKsSOmAOHHJVAh/3Q==
X-IPAS-Result: =?us-ascii?q?A0A/BAC68Zdp/4//Ja1aglmCGDAPgVBCSZZLA54agX8PA?=
 =?us-ascii?q?QEBD1EEAQGFBwKNHwImNAkOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGXIZbAgEDMgFGECAxKysZgwKCdAIBp0+CLIEBhHzbJgELFAGBO?=
 =?us-ascii?q?IU8iBlaGoR6JxsbgXKEfYUQhXcEgiKBDpNPSIEeA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4ELGwcFh1MPiQV4boEggRsDCxgNSBEsNxQbBD5uB44vP4IzA?=
 =?us-ascii?q?QGBDTCCO6VhoQ4KKIN0oVgaM4QEpmeZBoJYoUo3hGiBaDyBWXAVgyJSGQ+PV?=
 =?us-ascii?q?QEHvTwiNTwCBwsBAQMJk2cBAQ?=
IronPort-Data: A9a23:0pMR9qLSlFZFOo4DFE+RhpQlxSXFcZb7ZxGr2PjKsXjdYENS3jcBy
 TcaWWmHM/qDNGqhLosjYYS0pBtXvpLcz4VrSwUd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnU0
 T/Oi5eHYgH9gWQsajl8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1gD0gMIaEl99pcIjtHz
 sEzDChVYTOq0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBU7AtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME+ojx5nYj/7DLo+kfuwj2XXeDxDo1XTrq0yi4TW5FIvgOK2bYqLJrRmQ+1+wECbj
 GLl5F/eBzg9FPy99xOFtSmV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KKpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:Ic13I6P+pHoGacBcTsajsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH5ZmpM
 Rdm2wUMqyIMbC85vyKhjWFLw==
X-Talos-CUID: 9a23:xSZIdm2U48vi8oWvfM8dvbxfFMMsSGHx8XrsCGziAF1UY5mNEVCz0fYx
X-Talos-MUID: 9a23:2HiAoQbenfKgY+BTnGHqhxtiF9xTxKGHL2Ats6svu47fDHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="668235864"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:46 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 894A618000246;
	Fri, 20 Feb 2026 05:34:45 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id B8E96CC8D06; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 21/34] cve-check: fix debug message
Date: Thu, 19 Feb 2026 21:34:30 -0800
Message-Id: <20260220053443.3006180-21-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231485

From: Daniel Turull <daniel.turull@ericsson.com>

Debug level was not added as a parameter, causing a warning.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 40157fcbd9066f261812ba665ec963b2e496aa53)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/classes/cve-check.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 3555a74c42..1641ed4aff 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -279,7 +279,7 @@ def cve_update(d, cve_data, cve, entry):
         cve_data[cve] = entry
         return
     # If we are updating, there might be change in the status
-    bb.debug("Trying CVE entry update for %s from %s to %s" % (cve, cve_data[cve]['abbrev-status'], entry['abbrev-status']))
+    bb.debug(1, "Trying CVE entry update for %s from %s to %s" % (cve, cve_data[cve]['abbrev-status'], entry['abbrev-status']))
     if cve_data[cve]['abbrev-status'] == "Unknown":
         cve_data[cve] = entry
         return
@@ -290,16 +290,16 @@ def cve_update(d, cve_data, cve, entry):
         if entry['status'] == "version-in-range" and cve_data[cve]['status'] == "version-not-in-range":
             # New result from the scan, vulnerable
             cve_data[cve] = entry
-            bb.debug("CVE entry %s update from Patched to Unpatched from the scan result" % cve)
+            bb.debug(1, "CVE entry %s update from Patched to Unpatched from the scan result" % cve)
             return
     if entry['abbrev-status'] == "Patched" and cve_data[cve]['abbrev-status'] == "Unpatched":
         if entry['status'] == "version-not-in-range" and cve_data[cve]['status'] == "version-in-range":
             # Range does not match the scan, but we already have a vulnerable match, ignore
-            bb.debug("CVE entry %s update from Patched to Unpatched from the scan result - not applying" % cve)
+            bb.debug(1, "CVE entry %s update from Patched to Unpatched from the scan result - not applying" % cve)
             return
     # If we have an "Ignored", it has a priority
     if cve_data[cve]['abbrev-status'] == "Ignored":
-        bb.debug("CVE %s not updating because Ignored" % cve)
+        bb.debug(1, "CVE %s not updating because Ignored" % cve)
         return
     bb.warn("Unhandled CVE entry update for %s from %s to %s" % (cve, cve_data[cve], entry))
 

