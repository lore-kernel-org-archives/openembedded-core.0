Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F2EC5DF8F
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:07:30 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3034.1787216847341274971
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:07:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QMsBJCOK;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1552; q=dns/txt;
  s=iport01; t=1787216848; x=1788426448;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jypV4qRQcCe0uUGfl7R7w3wEhlqjYYHLOI49Ez0cRaQ=;
  b=QMsBJCOKKQUQ8elAaNVFwPbAqdF324F5/qOsQ5AUUvhRESRdznAXtIsm
   4BV8LJOkXdpxCkpRhT2TlkeQAe/nmWx5f0cgLGtgwv8RqO/rPy662GlbC
   0UT6tZ9I4dnw2ITVwJAh+x3eEv0uqVcyIVAH8Onyn1KMrNB07YIt6wkDc
   K4TieX/pl3q8zSfTn73VeiypB0pkmZnOZyqCG7yDhjA3xG1JGdro5vHzz
   mBLkvuFF5eirKT3E2YBGbCCOgbMJWpkkD6B3qSHicL4ktUFeTq8A9T58R
   H3JR190muIy6b2GBUg2e/qlHoJFiFJdNWexiQbN3HuC0Zn2UVJjGQoCUY
   g==;
X-CSE-ConnectionGUID: N6eMHyEiT0eGVbONEdvqGA==
X-CSE-MsgGUID: es3lWrjyTPurEkYl8zqTRQ==
X-IPAS-Result: =?us-ascii?q?A0D3AgAdw4Zq/5AQJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW0CJjYHDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgEYAS0wXESDAgGCdAMRwjKCLIEBgygBgVTbMAELFAEFgTOFP?=
 =?us-ascii?q?4gidoR8JxsbgXKEfoQXeYV4BIIigQyBeJFSSIEeA1ksAVUTDQoLBwWBZgM1E?=
 =?us-ascii?q?ioVbjIdgSM+F4ENGwYFgR2BKIQ3Ixk2fIEJXoErKmEBEheBCYIKAoJwggYCA?=
 =?us-ascii?q?UlFDgkXCxgNSBEsNxQZBD5uB45RIIJLPSMuAYFDpwqhDwoog3aMIZU6GjOqb?=
 =?us-ascii?q?C6YWqRahGmBbgE1gVlwFYMiCUoZD95cJzICOwIHAgcOAwuTZgEB?=
IronPort-Data: A9a23:FOLRlqMu3AQhM0vvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUp03jYBz
 WUfUTjXOa6CM2P0et9zPomzphkDvseHztUyS3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WV7lV
 e/a+ZWFZgf1gm8saAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69MwAWQWLKAZxr56Ll9E0
 to1JC4UQTnW0opawJrjIgVtrs0nKM+uOMYUvWttiGmGS/0nWpvEBa7N4Le03h9p2ZsIRqiYP
 pRfMGYzBPjDS0Un1lM/BJ8gleGzhmHXeDxDo1XTrq0yi4TW5Fwoi+GzaouFJLRmQ+1YhR2cm
 XjE7ljBHws3N+2bmSiczkiV07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcYX9wVF6gx7xuAj/KLpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:DOVtwqOnVIj+AsBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:ZNcTtW0z23/VjTraSAAirrxfPJ4oV13M4Xbse0KXN2xObpCZV0a/0fYx
X-Talos-MUID: 9a23:wGsrdQUiKB+agI7q/DL33zVdLsV535yzEm0OoJFWqdC4DxUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="813162986"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:07:28 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id E28E6180001DE;
	Thu, 20 Aug 2026 09:07:27 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 88838CC12A6; Thu, 20 Aug 2026 02:07:27 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH] python3-pycryptodomex: fix CVE_PRODUCT
Date: Thu, 20 Aug 2026 02:07:27 -0700
Message-Id: <20260820090727.61215-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:07:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243833

From: Tim Orling <tim.orling@konsulko.com>

The current pypi default "python:pycryptodomex" has no matching NVD CPE
or configuration identity. Use "pycryptodome:pycryptodomex", the active
NVD dictionary CPE and configuration identity for the packaged
distribution, so CVE-2023-52323 is properly reported as patched.

Note: The original commit targeted python3-pycryptodomex_3.23.0.bb. This
is adjusted for Scarthgap, where the recipe version is 3.20.0.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c2a2ae48add874f41c5b60ca90ba3a26ebb0fe38)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb
index 54578d2850..44f8d98d6a 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.20.0.bb
@@ -3,6 +3,8 @@ inherit python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "7a710b79baddd65b806402e14766c721aee8fb83381769c27920f26476276c1e"
 
+CVE_PRODUCT = "pycryptodome:pycryptodomex"
+
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/__pycache__/ \
-- 
2.35.6

