Return-Path: <hetpat@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8764FC53217
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 05:34:49 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32605.1771565685725808830
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 21:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VGiSlCJu;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: hetpat@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1396; q=dns/txt;
  s=iport01; t=1771565685; x=1772775285;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pChrlrj1HjSfy095E5SXgAbKy5rObB+g9wgjinCw6jU=;
  b=VGiSlCJur+QpFrVDvQ1OS6E+JoQhYmXntFJRfI4GQTCDhk/X2JKzY4/h
   SJp7bucyGKnvvjgzkVTHcdOr+gHADyIIVx9psF+rFwWLiCi77FwUJW5on
   2v1MkhBkkgwDbna/ktudf+PSyfw4s8iYhkBGW5gjqFYl4FNQeh+T5JGWv
   7zGD8Jh8V/CrD45N+hT68WxU+2QL6LmAW+jeWN26EV4K4FbXtz98Todg/
   Mb8iBQ3RHNQj9vI9W4D+3okBMWUv3plkuXHBR49T1lUCrG7tQ/csER83U
   hIhSE49SRKlQkPbY49aNUhLIjfA/iPAnWHxcUUE4FVd64qASzsItLRvA1
   g==;
X-CSE-ConnectionGUID: LPpH8oOwTdSSdx5v7xXQSA==
X-CSE-MsgGUID: fEW4kD7PQOqF4wBfaV96VQ==
X-IPAS-Result: =?us-ascii?q?A0CQBQC68Zdp/5P/Ja1aglmCSA+BUEJJlk6eGoF/DwEBA?=
 =?us-ascii?q?Q9RBAEBhQcCjR8CJjYHDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4ThlyGWwIBAzIBRhAgMSsrGYMCgnQCAadPgiyBAeAiAQsUAYE4hTyIG?=
 =?us-ascii?q?WsJhHonGxuBcoEVgnlvhAqBBoV3BIMwk09IgR4DWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQsbBwWCQoURD4kFeG6BIIEbAwsYDUgRLDcUGwQ+bgeOLz+CN?=
 =?us-ascii?q?IEOqEyhDgoog3ShWBozhASmZy6YWIJYogGEaIFvBDGBWXAVgyJSGQ+OX746I?=
 =?us-ascii?q?jU8AgcLAQEDCZFqgX0BAQ?=
IronPort-Data: A9a23:4BV+pqJb5qrBTcM7FE+RhpQlxSXFcZb7ZxGr2PjKsXjdYENSgWMCx
 mMYUW+OO/eIMWukLd1+bIi28hkPuZLUxoNgGlYd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnU0
 T/Oi5eHYgH9gWQsajl8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1KNFkWbYo/5dp7OlpC5
 aEGdyA9Vyuq0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAVbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MEuojx5nYj/7DLo+kfuwj2XXeDxDo1XTrq0yi4TW5FIuiOC2YYaNJbRmQ+1bs3nEp
 U6Zx13eGz9GK/aRwATUrEyV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/OMpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:WT7sd6PRIJ5tccBcTsajsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH5ZmpM
 Rdm2wUMqyIMbC85vyKhjWFLw==
X-Talos-CUID: 9a23:oDFNCmH6hJv8MpS7qmJDzFY0SscCbUHR90zcMxKmVnZZcYa8HAo=
X-Talos-MUID: 9a23:1fVzVgR4vjUFkm0bRXTiqQ4+N+s3252JEW5Rjr8IsvfVaxJJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.21,301,1763424000"; 
   d="scan'208";a="670039407"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Feb 2026 05:34:44 +0000
Received: from sjc-ads-8556.cisco.com (sjc-ads-8556.cisco.com [171.68.222.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id B421118000247;
	Fri, 20 Feb 2026 05:34:44 +0000 (GMT)
Received: by sjc-ads-8556.cisco.com (Postfix, from userid 1847788)
	id 5B15FCC8CF2; Thu, 19 Feb 2026 21:34:44 -0800 (PST)
From: "Het Patel -X (hetpat - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hetpat@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	vchavda@cisco.com
Subject: [openembedded-core] [scarthgap] [PATCH v1 02/34] cve_check: Update selftest with new status detail
Date: Thu, 19 Feb 2026 21:34:11 -0800
Message-Id: <20260220053443.3006180-2-hetpat@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260220053443.3006180-1-hetpat@cisco.com>
References: <20260220053443.3006180-1-hetpat@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.222.95, sjc-ads-8556.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 05:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231455

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ea7681ffc15cac970c395daab56ba264ac406cd6)
Signed-off-by: Het Patel <hetpat@cisco.com>
---
 meta/lib/oeqa/selftest/cases/cve_check.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/selftest/cases/cve_check.py
index 60cecd1328..a40272c919 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -217,9 +217,10 @@ CVE_CHECK_REPORT_PATCHED = "1"
             # m4 CVE should not be in logrotate
             self.assertNotIn("CVE-2008-1687", found_cves)
             # logrotate has both Patched and Ignored CVEs
+            detail = "version-not-in-range"
             self.assertIn("CVE-2011-1098", found_cves)
             self.assertEqual(found_cves["CVE-2011-1098"]["status"], "Patched")
-            self.assertEqual(len(found_cves["CVE-2011-1098"]["detail"]), 0)
+            self.assertEqual(found_cves["CVE-2011-1098"]["detail"], detail)
             self.assertEqual(len(found_cves["CVE-2011-1098"]["description"]), 0)
             detail = "not-applicable-platform"
             description = "CVE is debian, gentoo or SUSE specific on the way logrotate was installed/used"

