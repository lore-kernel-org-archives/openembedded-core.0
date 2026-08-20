Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 588D5C5DF87
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:08:00 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3040.1787216872934456438
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=IYXnLv74;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1412; q=dns/txt;
  s=iport01; t=1787216872; x=1788426472;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KKyKPkoc5h8Bl7d0Ik6okHnbG88K12SHdOx4IWejt5g=;
  b=IYXnLv74TrgKcOEr32W37gaH5R8K2ghA8G93u0Cqk4a17V3132q12dg+
   g0X665U8ISBSB/IFpoSV8coI6GM2NAo5Z/5z65eGZMbCKvTXr9ocR0kaf
   EtolQUsNeVgXFzEjG/Dr49YnCNobX/I3YBYpmyldOHEmsLxXo/0MsujTV
   hdcXs4lqiSN05vzbKtElXC9lnAcOoxbT3z7buupxhx1VZu6CiLUZvCUMg
   +I8hwmsty0i1JQB/NdiTEktBdVltUdwLmcQs5e1S9f/TLwOv5+Ud13Eit
   LxAb7er5FeTO5WVGkJZOycckEBUjEh7hWtMp5asgRE5lLh8Pa1EZAxYrp
   w==;
X-CSE-ConnectionGUID: gj0ewNkaTouQycyoAWS74A==
X-CSE-MsgGUID: Y9carjP4TKulUuengrTI0g==
X-IPAS-Result: =?us-ascii?q?A0DDAgCQw4Zq/5AQJK1RCYJZgld0XkNJk1kBoQ6Bfg8BA?=
 =?us-ascii?q?QEPNxoEAQGFBY1tAiY1CA4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4Zchl02ARgBLTBcRIMCAYJ0AxHCM4IsgQGDKAGBVNswAQsUAQWBM4U/i?=
 =?us-ascii?q?CJ2hHwnGxuBcoR+hBd5hXgEgiKBDIF4kVJIgR4DWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQ0bBgWBHYEohDcjGTZ8gQlegSsqYQESF4EJggoCgnCCBgIBS?=
 =?us-ascii?q?UUOCRcLGA1IESw3FBkEPm4HjlEggks9Iy4BqE2hDwoog3aMIZU6GjOqbC6YW?=
 =?us-ascii?q?qRahGmBaQE6gVlwFYMiCUoZD95cJzICOwIHAgcOAwuTZgEB?=
IronPort-Data: A9a23:3dPIiKyOoVbawopChKN6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkVVx
 zZNXGuDa/2CNzf9ett2boW3/RsFu8DQyN9hHFc5rFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHybuiJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkazNMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJE40ZYAH3OV+PWZTz
 O0TOTckUSvc28vjldpXSsE07igiBMDvOIVavjRryivUSK55B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUicC/FMEg9/5JYWkOq2j3/kcyVwo1OOrq1x6G/WpOB0+Oi3YYSPIo3SFa25mG6p9
 2nP5WbBXi05Kdii1DeD/WiQp7fAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl7GQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:J6nNf6PpzCbNtsBcTu2jsMiBIKoaSvp037Dk7S9MoHtuA6mlfq
 +V/cjzuSWYtN9zYgBDpTn/Asm9qBrnnPYfi7X5Vo3NYOCJggeVxahZnO/fKkXbak7D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:0D1vmm9JSSX9cNR1mjaVv0EWQs06VH7U8HDNGl6zGGFAd4bKFXbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AfNjfyQ2xLVVlv3sUpqFHUg6HITUj0vWlAVoPqck?=
 =?us-ascii?q?6mNSACDF9PTiHsBXvTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="829620908"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:07:52 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id 0DE5D180001DE;
	Thu, 20 Aug 2026 09:07:52 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 9EC03CC12A6; Thu, 20 Aug 2026 02:07:51 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH] python3-pycryptodomex: fix CVE_PRODUCT
Date: Thu, 20 Aug 2026 02:07:51 -0700
Message-Id: <20260820090751.62313-1-devanshp@cisco.com>
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
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243840

From: Tim Orling <tim.orling@konsulko.com>

The current pypi default "python:pycryptodomex" has no matching NVD CPE
or configuration identity. Use "pycryptodome:pycryptodomex", the active
NVD dictionary CPE and configuration identity for the packaged
distribution, so CVE-2023-52323 is properly reported as patched.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c2a2ae48add874f41c5b60ca90ba3a26ebb0fe38)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
index 43dba3faa3..148409c8d9 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
@@ -3,6 +3,8 @@ inherit python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "71909758f010c82bc99b0abf4ea12012c98962fbf0583c2164f8b84533c2e4da"
 
+CVE_PRODUCT = "pycryptodome:pycryptodomex"
+
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/__pycache__/ \
-- 
2.35.6

