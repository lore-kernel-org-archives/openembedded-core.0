Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62250C5DF87
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 10:30:07 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4066.1787221798940572678
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 03:29:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LN4N1Kcu;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1100; q=dns/txt;
  s=iport01; t=1787221798; x=1788431398;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rP1Y1NhQov7alCou0LMdgESnMN8lWFgNNmLxtxW639A=;
  b=LN4N1KcuuKZQugahmoFOO8Ov6OQyVqVOYVnX0OiWQEW3Bhib0QQ3qN2j
   mGB372TmCmsouOILancvtYacsSoksQK9IhZiP52iL94ouwOIi269oq+p2
   +alpemZIEOrvpCE3RDHZ/0gnEcvCB8ga2638yZBTDhuYqX7QN+OD8sN33
   KO9eNs0TfAcMZNohJ1bxClKOjoUcCmKNjgvQJOpiKAXL7bkTO0iUJ0QEo
   kSEDM1zM/xx5fGYSLQsoSa8/dXvxHuLsWHirxiGYRwunrCaw6eNhFukcr
   Qv6r9VpkhFfWGR9XLSctl5I2oB0yxGv4/9ve7urV+Zx7geff09SeAuEez
   Q==;
X-CSE-ConnectionGUID: 0aFJT+XaSPiBOH6i4StltQ==
X-CSE-MsgGUID: iOZ4CtJZRViUk74EGKOyKg==
X-IPAS-Result: =?us-ascii?q?A0D3AgBG1oZq/5UQJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW0CJjYHDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgEYAS0wXESDAgGCdAPCaoIsgQGDKAGBVNswAQsUAQWBM4U/i?=
 =?us-ascii?q?CJ2hHwnGxuBcoR+hBd5hXgEgiKBDIF4kVJIgR4DWSwBVRMNCgsHBYFmAzUSK?=
 =?us-ascii?q?hVuMh2BIz4XgQ0bBgWBHYEohDcjGTZ8gQlegSsqYQESF4EJggoCgnCCBgIBS?=
 =?us-ascii?q?UUOCRcLGA1IESw3FBkEPm4HjlEggks9USp1eqY1oQ8KKIN2jCGVOhozqmwum?=
 =?us-ascii?q?FqkWoRpgW8HLoFZcBWDIglKGQ/eXCcyAj0HAgcPApNxAQE?=
IronPort-Data: A9a23:o/yNrazL8UWsppX17MV6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUOn
 GYbCGnQa/qJZjahf90nb4SypBwBvMTWzd41SFQ4r1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkaDpMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJBk/E68kudZ+OllP3
 9s4djFRVQyHm9vjldpXSsE07igiBMDvOIVavjRryivUSK98B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUiRC/FMEg9/5JYWkOq2j3/kcyVwo1OOrq1x6G/WpOB0+Oi0aouEJ4zVHa25mG6Zg
 VCa1HjbMCskNeGclmao3VGLl8zAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NUF+t/7ESGzbDZpl/DQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSn1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:QPvt7ah3q+dBp2HmkDPGpcKtG3BQXvYji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8gTFh4pgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:V13ZX2BbATly5EX6E3Fu2mwoWfAsSUXc5lDwfU7kMnptVITAHA==
X-Talos-MUID: 9a23:DzMKFAYryomlwuBTthje2Bp+FvVS3aWTCx9RvLolnNinOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,233,1779148800"; 
   d="scan'208";a="812995870"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 10:29:58 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id D647D18000175;
	Thu, 20 Aug 2026 10:29:57 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 6DC4ACC12A6; Thu, 20 Aug 2026 03:29:57 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][PATCH] python3-mako: correct CVE_PRODUCT mapping
Date: Thu, 20 Aug 2026 03:29:57 -0700
Message-Id: <20260820102957.21693-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 10:30:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243851

From: Devansh Patel <devanshp@cisco.com>

The inherited "python:mako" mapping is not used for the packaged Mako
source and causes its vulnerability records to be missed.

Use "makotemplates:mako" for its historical NVD configuration identity
and "sqlalchemy:mako" for the current NVD dictionary CPE, NVD
configuration, and CNA affected-data identity.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-mako_1.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-mako_1.4.1.bb b/meta/recipes-devtools/python/python3-mako_1.4.1.bb
index 7ab2000c8f..fb989cb21c 100644
--- a/meta/recipes-devtools/python/python3-mako_1.4.1.bb
+++ b/meta/recipes-devtools/python/python3-mako_1.4.1.bb
@@ -10,6 +10,8 @@ inherit pypi python_setuptools_build_meta ptest-python-pytest
 
 SRC_URI[sha256sum] = "d7904710b662996425a21627710c4777c45053146942cf8a7aebf757c92b8c27"
 
+CVE_PRODUCT = "makotemplates:mako sqlalchemy:mako"
+
 DEPENDS += "python3-wheel-native"
 
 RDEPENDS:${PN} = "python3-html \
-- 
2.35.6

