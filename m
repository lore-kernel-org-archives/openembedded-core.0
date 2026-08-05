Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31E78C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 10:09:58 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37142.1785924597506927838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 03:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=W7Fjj2yb;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1398; q=dns/txt;
  s=iport01; t=1785924597; x=1787134197;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=FWDUj2fF5ZwYtpoenooEHSXeIo/9W2YkjVqJQKkP4R0=;
  b=W7Fjj2ybesOrQH+YJPAYRgxbk4x3vCcKEF6vMzxSOqqSu0VKaFrSipyb
   ANyc9S0WX7V1fiYmSSugvXB9z9MIQtEWrF1kKGlfDZXBlFYpeDoW2KlI7
   w/f5xde4mRgtYiFIT1PnosUBWnXf+mIrVbIWKfiD7dAQp6dPXVTxtnA/C
   etMev9MxuGTZheEjmScRU7aez6pSk7wwINBEBRo3vaIZLwUbjaMmYyDCy
   ZODcAdT0g5fBqh1wH3qRZ4P6vpTncGb1PJzDS+jJW4LKo/NREjIwa2C3w
   Kpd5trlORf/k5gHInQxLtI1ihn0efoLVLfHAUxxkGKUm/mGFDFQTma7gN
   Q==;
X-CSE-ConnectionGUID: /ZpD+wAMRmedj2YgdBZlTg==
X-CSE-MsgGUID: 62XY46wEQWGGat5msIveNQ==
X-IPAS-Result: =?us-ascii?q?A0BBAgDlCnNq/5MQJK1aglmCV3ReQ0mTWQGhDoF+DwEBA?=
 =?us-ascii?q?Q83GgQBAYUFjWgCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIZdNgEYAS0wXESDAgGCdAO9c4IsgQGDCR8BgVTbLgELFAEFgTOFP4ghh?=
 =?us-ascii?q?XInGxuBcoR+hRCFeASCInoSgXIGkFlIgR4DWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQ0bBwWBHYEohG0jGTZ8gQlegS0qZAESF4EJgnsCgnpvCxgNSBEsN?=
 =?us-ascii?q?xQZBD5uB41oIII/AYEOgT0ipm+hDwoog3WMIZU6GjOqbC6YWqRahGmBaDyBW?=
 =?us-ascii?q?XAVgyIJShkP3lwnMgI7AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:edXpA6wrId397PV94SZ6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkVWx
 mBNW2yBaK2NZzejeNx3PtnioxwD7cfVz4VjT1FprFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkaj9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJAYEJaFb5c9SO2RD+
 f5CGT8BRCKHu+3jldpXSsE07igiBMDvOIVavjRryivUSK9+B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUifC/FMEg9/5JYWkOq2j3/kcyVwo1OOrq1x6G/WpOB0+Oe8bYCIIoXWFa25mG7G/
 FL3ozrmLyglG/OW1WeA6VOyi8n2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl/BQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:3J3r8K1fXV6SbsbsPCm6WwqjBJ4kLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZqjz/5ICOAqVN/INjUO01HHEGgN1+ffKhTbaknDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IDjJ7MHd3ASV0mmhD0JbDqmLg==
X-Talos-CUID: 9a23:DTAM32z273z91P+cNGWvBgVTKNgJMWL06U3VLkO6U1dmRJenTWOfrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3A09tZtw+p5UK8qsyPzStutZyQf5ky05XyVl8gqKo?=
 =?us-ascii?q?plMCYaClrGimQqg3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,206,1779148800"; 
   d="scan'208";a="795250148"
Received: from alln-l-core-10.cisco.com ([173.36.16.147])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 10:09:56 +0000
Received: from sjc-ads-9357.cisco.com (sjc-ads-9357.cisco.com [10.30.212.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-10.cisco.com (Postfix) with ESMTPS id 6EC6B18000151;
	Wed,  5 Aug 2026 10:09:56 +0000 (GMT)
Received: by sjc-ads-9357.cisco.com (Postfix, from userid 1887503)
	id 149D6CC12A6; Wed,  5 Aug 2026 03:09:56 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH] sudo: set CVE_PRODUCT
Date: Wed,  5 Aug 2026 03:09:56 -0700
Message-Id: <20260805100956.2617709-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-9357.cisco.com [10.30.212.121];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.30.212.121, sjc-ads-9357.cisco.com
X-Outbound-Node: alln-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 10:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242854

From: Peter Marko <peter.marko@siemens.com>

This change removes currently open CVE-2025-64170 and CVE-2025-64517
from reports which are for "trifectatech:sudo-rs".

It also removes following "patched" ones:
* CVE-2023-42456 (memorysafety:sudo)
* CVE-2025-46717 (trifectatech:sudo)
* CVE-2025-46718 (trifectatech:sudo)
All these are also for "sudo-rs".

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0459398d31f74e9653cb55a57d8d0f6bfbdfa2ad)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
index 90672ed7af..69bd654d08 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p2.bb
@@ -10,6 +10,8 @@ PAM_SRC_URI = "file://sudo.pam"
 
 SRC_URI[sha256sum] = "4a38a1ab3adb1199257edc2a7c4a2bd714665eb605b04368843b06dada2cfcfb"
 
+CVE_PRODUCT = "gratisoft:sudo sudo:sudo sudo_project:sudo todd_miller:sudo"
+
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
 
-- 
2.35.6


