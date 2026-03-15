Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A84ED58B24
	for <webhook@archiver.kernel.org>; Sun, 15 Mar 2026 13:02:31 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28177.1773579748770680523
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Mar 2026 06:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PxYKf0dg;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1534; q=dns/txt;
  s=iport01; t=1773579748; x=1774789348;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v3dh2RAS/RvWfwPyExnJb1Fs6s+D7NbW0QEbioZcGko=;
  b=PxYKf0dgf3Y06slBtykNo/kysX3Glz6HuvTdKzJ8Qk2HZBT5UFNLWKyh
   sdavexalFvtlBKaQvH2DUDb6GmBpLRwSF+jfJhJ4g6O933pjMAnF3/KGn
   iBFjjV5MVB+dezohzcISXx1APa27uWcFVNhl/ViX8+YTlZlQ2Z7hO1sHv
   MZvZrotekQEEIwnSHsKSzryusP4XaB1+RQ+gVzsrUM7YR5NRhX2cYLcUA
   QRYi+V5UPKzUa200FALjSWWlM6UYr9lQEAlOarSn2SDBLpEi/7mRqdbng
   TeRq5eSgBUHiGQpFy3Iiw5zCfuBuROQX9FVsFKLjAjEmU6wtUxApq2Ueo
   w==;
X-CSE-ConnectionGUID: MtodeJ/1TCOQwLFw1e/yCQ==
X-CSE-MsgGUID: uqd28lNPRJ26fyCurQLk0Q==
X-IPAS-Result: =?us-ascii?q?A0BbCADarLZp/5T/Ja1agjQQGoJEgQBfQkmUKoIhnh2Bf?=
 =?us-ascii?q?w8BAQEPNxoEAQGSKwImNQgOAQIEAQEBAQMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4ThlyHEwEYAV1cRIMCAYJzAgERtSyCLIEBgygBgVO1FBWBOIU8i?=
 =?us-ascii?q?Bl0hHonGxuBcoQHgWEaAYQKhXcEgiJ6FIc7BoM1iDZIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFmAzUSKhVuMh2BIz4XgQsbBwWFGg+IcnRtgRODLQMLGA1IESwUIxQbBD5uB?=
 =?us-ascii?q?416PYI0gQ+BRmk5IaVCoQ4KKIN0jB6VOhozqmuETJQ6pAlQhGiBagE5gVlwF?=
 =?us-ascii?q?YMiCUkZD444yikjNQI8AQcCBw4CgXORfQEB?=
IronPort-Data: A9a23:Z7WFyKvfpFeCL93QtMkewDNs2+fnVBJfMUV32f8akzHdYApBsoF/q
 tZmKTqBbquOYWGgeI8gbIuz/E4BucDcz9FhHgNuqSs9EC1HgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yIij8lkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFYzdJ5xYuajhKs/na9Us21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDS4pZiYJVOtzAZzsAEPgnXA9JHAatfo23hc9mcU
 7yhv7ToIesiFvWkdOjwz3C0HgkmVZCq9oMrLlCarcufwm+BKkfH5MxxKG8pZIBf681OVDQmG
 fwwcFjhbziZjO6whbb+Qe52i4F6dY/gPZgUvTdryjSx4fQOGM+YBf6Vo4UFgXFp2pAm8fX2P
 6L1bRJjYRnaagFPPX8cCYk1m6GjgXyXnzhw9wrK9fVmujGDpOB3+KX0PICFfvqyf+cPwEiJj
 X/cxkD6WihPYbRzzhLAqBpAnNTnmjv2Xo8XHrC0+vNmxVaU3GE7DBwNSUD9puG0jEO7Ud9TJ
 0EYvC00osAPGFeDVNLxWVi85XWDpBNZAoMWGOwh4wbLwa3Ri+qEOlU5ovd6QIROnKcLqfYCj
 zdlQ/uB6eRTjYCo
IronPort-HdrOrdr: A9a23:a0AMZ6g4AvpEA/liYzI97iKKEnBQXs8ji2hC6mlwRA09TyX+rb
 HNoB1173HJYVoqNU3I+urwW5VoP0m8yXcd2+B4Vt2ftWLd11dAQrsP0WKb+V3d8+mUzJ846U
 +mGJIObeHNMQ==
X-Talos-CUID: 9a23:+cZuH2OF4yoHk+5DfTVg+EM2XZkZWVrk01P+PBa1TndCcejA
X-Talos-MUID: 9a23:GcdQPAvtJZTqXvtq9s2nmShubpdsxZyUKhpTn4QtptO9ES8oAmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,122,1770595200"; 
   d="scan'208";a="707879118"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 15 Mar 2026 13:02:27 +0000
Received: from sjc-ads-3552.cisco.com (sjc-ads-3552.cisco.com [171.68.249.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id C3B1418000261
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:02:27 +0000 (GMT)
Received: by sjc-ads-3552.cisco.com (Postfix, from userid 1795984)
	id 6C834CC12B5; Sun, 15 Mar 2026 06:02:27 -0700 (PDT)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][master][PATCH 0/7] Pull request (cover letter only)
Date: Sun, 15 Mar 2026 05:59:41 -0700
Message-Id: <20260315125948.3002743-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.68.249.250, sjc-ads-3552.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Mar 2026 13:02:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233108

From: Deepak Rathore <deeratho@cisco.com>

This series extends a set of recipes to support native and nativesdk variants.
These packages are needed as host or SDK artifacts in certain dependency chains
(e.g., perf/tracing toolchains), where dependency resolution fails when only the
target variant exists.

None of the changes alter target package behavior; they solely enable the
required native/nativesdk build paths.

Testing:
  - Built each recipe as native/nativesdk on x86-64 with no errors.
  - Verified existing target builds are unaffected.

Deepak Rathore (7):
  python3-libarchive-c: extend recipe for native/nativesdk builds
  python3-magic: extend recipe for native/nativesdk builds
  python3-pyelftools: extend recipe for native/nativesdk
  valgrind: extend recipe for nativesdk builds
  libtraceevent: extend recipe for native/nativesdk builds
  libunwind: extend recipe for native/nativesdk builds
  numactl: extend recipe for native/nativesdk builds

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 meta/recipes-devtools/python/python3-libarchive-c_5.1.bb | 2 +-
 meta/recipes-devtools/python/python3-magic_0.4.27.bb     | 2 +-
 meta/recipes-devtools/python/python3-pyelftools_0.32.bb  | 2 +-
 meta/recipes-devtools/valgrind/valgrind_3.26.0.bb        | 1 +
 meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb | 1 +
 meta/recipes-support/libunwind/libunwind_1.8.3.bb        | 2 +-
 meta/recipes-support/numactl/numactl_2.0.19.bb           | 1 +
 7 files changed, 7 insertions(+), 4 deletions(-)

-- 
2.35.6

