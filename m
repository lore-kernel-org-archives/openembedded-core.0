Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDB6C55822
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 08:31:13 +0000 (UTC)
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35937.1785918670114963942
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2026 01:31:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Jrzg4U9t;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3265; q=dns/txt;
  s=iport01; t=1785918670; x=1787128270;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5/RoBy4yzcZjfYcGKxP77iBo2X0wH6HgDCY/2Vns6WE=;
  b=Jrzg4U9tZ7jhNHLr+q/xnxC4Bo986GUUsewDc0HapoAudNVagrRwcx+6
   dHmpwnEnTIA6DJ7EgnelUtxbOOEmlGGsSsPA/TqKBJmFrY8h/aG2CmgFU
   K6aAW8Swl9D+pPZ8nXkfoPUtgHSAzFveH6zqj/LoZwYS6ulfsuL3Mh32f
   47lz+e8wvRvt5i4j1jCZEfYpYYnY52B5Y7zY7xJGuTfgiL4axChg/tfIF
   f5s2OIRwxkRd0nUr0rrYrkvjDYFIv1bV7WCZywV1uxjty3+byK/13A1PI
   1yqs1zKg3BQLS2clrjzJxs+KC6F2AjW0/6USpHrjTy2Ztx9eN1E907UbL
   g==;
X-CSE-ConnectionGUID: BsEFjiSNSKas1RAtvVXJJg==
X-CSE-MsgGUID: mdQxHB0qSL6+iJpa/VOiJQ==
X-IPAS-Result: =?us-ascii?q?A0BeAwD/83Jq/9JK/pBaglmDS19CSZNZAU+CIZ4egXQKD?=
 =?us-ascii?q?wEBAQ8uDxQEAQGSbQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2GXQUxARgBXVgEPAiDAgGCdAMRvVqCLIEBgygBgVTbOhWBOIU/i?=
 =?us-ascii?q?CF2hHwnGxuBcoEVg2mCYQEEgU6GVASCInoSgyV3e406SIEeA1ksAVUTDQoLB?=
 =?us-ascii?q?wWBZgM1EioVbjIdgSM+F4ENGwcFgR2BKIRtIxk2fIEJXoEtKmUSF4EJgnsCg?=
 =?us-ascii?q?npvCxgNSBEsNxQZBD5uB41oIII/ARZ5K3uBCQ8ZDgMFHJMXkAyCHqESCiiDd?=
 =?us-ascii?q?YwhjT6HfBozqmyZCI4KlTaBGoRpgWg8gVlwFTuCZwkKQBkPlzbHDjw1AjsCB?=
 =?us-ascii?q?wIHDgMLkWotgU8BAQ?=
IronPort-Data: A9a23:kK0iQau7+nSrVlvAZaYdReaXc+fnVAJfMUV32f8akzHdYApBsoF/q
 tZmKTjTb6yDZTShfot2b4u0pE4Gu5aBm9E1TFZsr3hmHyMRgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYghclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/Lb9Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw0P1aL2NPz
 tojCzkWNyqqm/yI8JCZRbw57igjBJGD0II3s3x6iDWcBvE8TNWbEuPB5MRT23E7gcUm8fT2P
 pZFL2AyMFKfP1sVYw9/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9J4PTHJkExxfwS
 mTu+mjAEjEwbMWk7WTG81C0j6jxuiLZYddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz5RvIzu/f5ByUQzBVCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:/uusTqvK/wzw5YnDkl6yNr9I7skDRtV00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBED/exLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPIdurJBLK8gceVbSC09QYIcT1X
X-Talos-CUID: 9a23:untJsW77KduFi8yW1tss3lU5NMIkSVvm737LenWRFXhXeJ+3RgrF
X-Talos-MUID: 9a23:LFax4wurtuBIx2gDwM2ngT1bJOdCu72VLB5OkLceso66Ei1SAmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,206,1779148800"; 
   d="scan'208";a="57114919"
Received: from aer-l-core-09.cisco.com ([144.254.74.210])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Aug 2026 08:31:07 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-09.cisco.com (Postfix) with ESMTPS id 90F5218000121
	for <openembedded-core@lists.openembedded.org>; Wed,  5 Aug 2026 08:31:07 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 53EBBCC037D; Wed,  5 Aug 2026 14:01:06 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 0/8] curl: Security fixes
Date: Wed,  5 Aug 2026 14:00:55 +0530
Message-Id: <20260805083103.2633995-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-09.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Aug 2026 08:31:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242838

From: Deepak Rathore <deeratho@cisco.com>

This series addresses multiple curl security vulnerabilities affecting
the curl 8.19.0 version provided by the Wrynose branch.

Five changes backport upstream security fixes:

- CVE-2026-8286: Include TLS configuration when matching connections
  that may be upgraded using STARTTLS.
- CVE-2026-8927: Clear Digest authentication state when an
  environment-configured proxy changes.
- CVE-2026-8932: Include the complete mTLS client credential
  configuration in connection reuse and TLS session-cache matching.
- CVE-2026-8458: Include the SASL service name in connection reuse
  matching.
- CVE-2026-11856: Clear Digest authentication state when the origin,
  proxy, or credentials change.

Three changes add CVE_STATUS annotations for vulnerabilities whose
applicability depends on the Wrynose curl configuration:

- CVE-2026-8924 is not applicable because the recipe explicitly builds
    curl without Public Suffix List support using --without-libpsl.
- CVE-2026-9547 is not applicable because the vulnerable libssh backend
  is not available in the recipe. The supported libssh2 backend is not
  affected.
- CVE-2026-12064 is marked unpatched when the optional libssh2
  PACKAGECONFIG is enabled and not-applicable-config otherwise, because
  the affected SCP/SFTP support is provided through libssh2.

The manual adaptations required for curl 8.19.0 are documented in the
Backport Changes sections of the corresponding source patches.

Validation performed:

- All the curl patches are prepared on top of this upstream curl patch which is
under review: https://lists.openembedded.org/g/openembedded-core/topic/120530931
- All recipe changes apply using git am without three-way fallback.
- All existing Wrynose patches and the proposed source patches apply to
  the checksum-verified curl 8.19.0 source with no fuzz.
- A host build using the GnuTLS backend completed successfully.
- Regression tests 1686, 3303, and 3304 passed.

Deepak Rathore (8):
  curl: fix CVE-2026-8286
  curl: set CVE_STATUS for CVE-2026-8924
  curl: fix CVE-2026-8927
  curl: fix CVE-2026-8932
  curl: fix CVE-2026-8458
  curl: fix CVE-2026-11856
  curl: set CVE_STATUS for CVE-2026-9547
  curl: set CVE_STATUS for CVE-2026-12064

 .../curl/curl/CVE-2026-11856_p1.patch         |  372 ++++++
 .../curl/curl/CVE-2026-11856_p2.patch         |   72 ++
 .../curl/curl/CVE-2026-8286.patch             |   81 ++
 .../curl/curl/CVE-2026-8458.patch             |  202 +++
 .../curl/curl/CVE-2026-8927.patch             |  349 +++++
 .../curl/curl/CVE-2026-8932-dependent.patch   |   71 +
 .../curl/curl/CVE-2026-8932.patch             | 1148 +++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   11 +
 8 files changed, 2306 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-11856_p1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-11856_p2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8286.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8458.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8932-dependent.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8932.patch

-- 
2.35.6


