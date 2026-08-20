Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CC5C5DF86
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:08:00 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3039.1787216871415215919
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=lKyVZJiK;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1218; q=dns/txt;
  s=iport01; t=1787216871; x=1788426471;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=B8kT1+VWuQvvobPExZprAZsJ4nVUl/KMOHggcIZOh88=;
  b=lKyVZJiKJBraMfOQv7V50KAPherScKWm+3I8UvUfSinFNygwDu+BV1Vg
   ffzJZS8Qq5jt/KlaeTqC2WEwYtMtx8YgHfyju419r96pMmKxEdDruVecN
   7jIjVySS/xxHzInElPs2Md1ruuEBZItzWO1SjUJbcnDN/VDXJ96lemwrx
   9wkefNW85dfSUlRek48vszoRCqBZ8R4c3885Z10U9zwOJCAJmwUbJj6O/
   q5eSZfDz0zPcIkDATxH2x+6lIgpBADGqLQ9w8bLd4SAaF9gRuomug9d27
   I1JcarGw0d7zM5qoG32eUkHIWwcs38EbZVHV5kFYaf3RBlP0v4C3DRMio
   g==;
X-CSE-ConnectionGUID: vi/RJmNlQ9q620oh3VA3nA==
X-CSE-MsgGUID: mo006tyxSFCIGbWzKps96g==
X-IPAS-Result: =?us-ascii?q?A0BCAgBrwoZq/5EQJK1aglmCV3ReQ0mTWQGhDoF+DwEBA?=
 =?us-ascii?q?Q83GgQBAYUFjW0CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBD?=
 =?us-ascii?q?hOGXIZdKwsBGAEtMFxEgwIBgnQDEcIxgXkzgQGDKAGBVNswAQsUAQWBM4U/i?=
 =?us-ascii?q?CJ2hHwnGxuBcoR+hRCFeASCIoEMgXiRUkiBHgNZLAFVEw0KCwcFgWYDNRIqF?=
 =?us-ascii?q?W4yHYEjPheBDRsGBYEdgSiENyMZNnyBCV6BKyphARIXgQmCCgKCcIIGAgFJR?=
 =?us-ascii?q?Q4JFwsYDUgRLDcUGQQ+bgeOUSCCS4EOqE6hDwoog3aMIZU6GjOqbC6YWqRah?=
 =?us-ascii?q?GmBaDyBWXAVgyIJShkP3lwnMgI7AgcCBw4DC5NmAQE?=
IronPort-Data: A9a23:6IXar6vCJp/Ap/7nFP1XTN5yYefnVABfMUV32f8akzHdYApBsoF/q
 tZmKWnQafuNZjDxed1+bNy1/U0EusXdyNNrTAZp/ihhEyITgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/La+Us11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw5OcwO0NL0
 /gheSlTNEiEh7mI6em9Y7w57igjBJGD0II3s3Vky3TdSP0hW52GG/WM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZgp/5JEWxI9EglHzfiNRrkmVvYI84nPYy0p6172F3N/9KoXQFZQLwBfAz
 o7A12H+WklEKM2P8hSu012muf3shTiqBo1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFm4HY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:Lrt3UqDJNTPY0IblHemA55DYdb4zR+YMi2TDGXofdfUzSL38qy
 nAppUmPHPP5Qr5O0tQ++xoRpPhfZq0z/cciuMs1NyZMjUO1lHFEGhK1/qH/9SZIVycysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:pRKF/m25BoMICoRFQ8VK/7xfBMFiSF/Y6nPpclbmUz5uSOarYASW0fYx
X-Talos-MUID: 9a23:9o0+vwtF6bvxFH7ogM2ngTY6bJl08rSVJmssvp85qeqcLn0uNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="812896690"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:07:50 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id 9288918000203;
	Thu, 20 Aug 2026 09:07:50 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 38A5ECC12A8; Thu, 20 Aug 2026 02:07:50 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][wrynose][PATCH] python3-dbusmock: fix CVE_PRODUCT
Date: Thu, 20 Aug 2026 02:07:50 -0700
Message-Id: <20260820090750.61886-1-devanshp@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243835

From: Tim Orling <tim.orling@konsulko.com>

Recipe (PV): python3-dbusmock (0.38.1)
Before -> After: python:python_dbusmock -> python-dbusmock_project:python-dbusmock
Newly caught CVEs: CVE-2015-1326 (.pyc code exec via AddTemplate)
Status: patched (fixed 0.15.1)

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0405d7d4e476964239e1c27c987ec9c12372e95f)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb b/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
index cbd74b4059..ecec075f6f 100644
--- a/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
+++ b/meta/recipes-devtools/python/python3-dbusmock_0.38.1.bb
@@ -11,6 +11,8 @@ PYPI_PACKAGE = "python_dbusmock"
 inherit pypi python_setuptools_build_meta
 DEPENDS += "python3-setuptools-scm-native"
 
+CVE_PRODUCT = "python-dbusmock_project:python-dbusmock"
+
 RDEPENDS:${PN} += "\
     python3-dbus \
     python3-unittest \
-- 
2.35.6

