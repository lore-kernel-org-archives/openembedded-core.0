Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE98BC5DF8E
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:08:00 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3264.1787216871830146334
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=O7ByBavY;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1534; q=dns/txt;
  s=iport01; t=1787216871; x=1788426471;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2o6Ly8gnLCdvotZGn1GLOHEWDTr8vVFTIn0Sc4pMFS8=;
  b=O7ByBavYVB8KOoO3odhm19wTUyB/12SeP6IWNbRuBAfdnzShXVgfnr1q
   KLX4TZIToyMLBU8PFTpQHWoAsgy0mB5q32oJ7gzquAjKamO+pF4gqHfiY
   witG0wzHM5XseMEiOvZjh0Yi+DPL4x5ZBQFL4yijBiSAHen/fRsTG8T1L
   NUcGHwuAY7E+ZqtJ9xIzXPJagmYZFHdOlLnb2wryyGEByRnR6RlgAoGLQ
   UzdKpWWls5sl1IzxLso+VsQnY0FqxukXSpYnR2uJz5Rje/QOCCUEffXpq
   8M2VHKnGs2tnbMGpTqDWRVHmmrOJy432HAyiCi2GTBEfv29hkpht2kPlv
   A==;
X-CSE-ConnectionGUID: 908qHk8HQCK3a+yMSXr7Iw==
X-CSE-MsgGUID: KZFNhb8ESKKlKZj1a2EdZw==
X-IPAS-Result: =?us-ascii?q?A0BCAgCfwoZq/5EQJK1RCYJZgld0XkNJk1kBgnCeHoF+D?=
 =?us-ascii?q?wEBAQ83GgQBAYUFjW0CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXIZdNgEYAS0wXESDAgGCdAPCP4IsgQGDKAGBVNswAQsUAQWBM4U/i?=
 =?us-ascii?q?CJ2hHwnGxuBcoR+hBd5hXgEgiKBDJNKSIEeA1ksAVUTDQoLBwWBZgM1EioVb?=
 =?us-ascii?q?jIdgSM+F4ENGwYFgR2BKIQ3Ixk2fIEJXoErKmEBEheBCYIKAoJwggYCAUlFD?=
 =?us-ascii?q?gkXCxgNSBEsNxQZBD5uB45RIIJLATxRgUSnCqEPCiiDdowhlToaM6psLphap?=
 =?us-ascii?q?FqEaYFoPEaBE3AVgyIJShkP3lwnMgI7AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:lqnH6qtg9sxyj3kNaxbCcpLDZufnVABfMUV32f8akzHdYApBsoF/q
 tZmKWDSaPbYZzOmLdp2bIXl8xtVvJXcz4VmTlFu/ypjRSIagMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/La+Us11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwq74nGEFNp
 dwhAxNWZ1OSotmG2u2aVbw57igjBJGD0II3s3Vky3TdSP0hW52GG/WM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZgp/5JEWxI9EglHzfiNRrkmVvYI84nPYy0p6172F3N/9KoXRFJ8NxB3Fz
 o7A10fLLDcaPoyy8hmm9lGehLbGxw73ap1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFm4HY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:/sFQbaCRuGry6rblHemA55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGhK1/qH/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:DhLJCGx6+mfBIXvLDmBhBgVFQpA8Un6N7E77ABSxSndMc42PFn6PrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AAE+baAyCfYXkGAo+GIcLe80WCWmaqIecJmYNm8U?=
 =?us-ascii?q?rgOqnMQ9COW6U1hm7cJByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="813920235"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:07:51 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id E90CA18000203;
	Thu, 20 Aug 2026 09:07:50 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 8ED2CCC12A7; Thu, 20 Aug 2026 02:07:50 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH] python3-attrs: fix CVE_PRODUCT
Date: Thu, 20 Aug 2026 02:07:50 -0700
Message-Id: <20260820090750.62087-1-devanshp@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243837

From: Tim Orling <tim.orling@konsulko.com>

No new CVEs are caught, but attrs_project:attrs matches the upstream
NVD dictionary CPE. The pypi.bbclass default "python:attrs" generates
the wrong product identity for the packaged attrs source.

This changes the generated product identity, but the Wrynose
sbom-cve-check database snapshot has no current CVE report delta.

Note: The original commit targeted python3-attrs_26.1.0.bb. This is
adjusted for Wrynose, where the recipe version is 25.4.0.

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bc07eddb82fe42ecf86e685450ec0b5c9d3a9ce1)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-attrs_25.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-attrs_25.4.0.bb b/meta/recipes-devtools/python/python3-attrs_25.4.0.bb
index 7bc581b875..c3f5a155ca 100644
--- a/meta/recipes-devtools/python/python3-attrs_25.4.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_25.4.0.bb
@@ -7,6 +7,8 @@ SRC_URI[sha256sum] = "16d5969b87f0859ef33a48b35d55ac1be6e42ae49d5e853b597db70c35
 
 inherit pypi ptest-python-pytest python_hatchling
 
+CVE_PRODUCT = "attrs_project:attrs"
+
 DEPENDS += " \
     python3-hatch-vcs-native \
     python3-hatch-fancy-pypi-readme-native \
-- 
2.35.6

