Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8324.1795670697141948067
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 21:24:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=VSJlIVbG;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: braychur@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2711; q=dns/txt;
  s=iport01; t=1795670697; x=1796880297;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=3IAR6J6g4b8cLdDer9wmCrNuzygffQLCEEhHLVWhBvs=;
  b=VSJlIVbG9+WO1CPvFetoLppxwHNsgSRjBUrqIOAyOXmS1fMX8iIH8P8T
   YQ0jRnZkh0GNz0Y/JsKhJq/yCAbyVQsvqaavcTzU4WDIt+3f5KUS56FaF
   KE8bHSElNbmFMGMk4fu5b0hMI3nvlf3tjGdRXXgs4jI6xwH1pWWQgQg2x
   FdbFfhsgJnFaRd2Rgo3PX0kFhdpNp/otzhk3tFTWae37R57sFlOIAGhs3
   EvfFf660vGjKKsKTC6vKKdwCpbelJvGdQscCx/7iFyXvfXJ1dfahTsZCU
   ykv4ou/3fiID83yyI4Qy3DaOV8VCVBhQweO4HBsJX/G18PFq88g7Z03Pr
   Q==;
X-CSE-ConnectionGUID: auYasYDeSJqA1Y2U/DN5Kg==
X-CSE-MsgGUID: sHWTIvb9TDeGlxq7aJ3bGA==
X-IPAS-Result: =?us-ascii?q?A0BYAgCXwQdr/9NK/pBaglmCV3VhQkkDlCeBNWyLeZIzg?=
 =?us-ascii?q?X4PAQEBD0QNBAEBkyoCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NkEALARgBgTlEgwIBgnQCARG3Whs3gXkzgQGDKQE/AkNQ2UuBa?=
 =?us-ascii?q?AELFAGBOI1ndQGEficbgUlEhH+CYQKCLYV5BIMugXKXHEiBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWgDNRIqFW4yHYEjOxeBBxsGBYEcgR6BEoEDXYErKF4hgQiBdQKCUYIAA?=
 =?us-ascii?q?gFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwH?=
 =?us-ascii?q?CQvBRkmPBsKgQwnHR4ZDgIpBhYhC0MYDUgRLDcVGQQ+bgeUHIJQTQFYNQEHI?=
 =?us-ascii?q?wGBG4ERk3gDkXqhEYQrjCSVOhozhASmb5kIglmLMZU2gRyEaoFoPIFEDgdNI?=
 =?us-ascii?q?xWDIglKGQ+OLxWDYIUTyUgjNQIJAwUqAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:Ie7qva6RV7oypxK8SaS65AxRtGzGchMFZxGqfqrLsTDasY5as4F+v
 msdD2HSOKmJMWekeotyYNu0oRlSvsTdn9RkHgU6+39kZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOi78BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztOtfrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eNJAp8/1GLWx11
 +UxcQFXU1evob+Vz+fuIgVsrpxLwMjDNY4F/3UlxjbDALN/GdbIQr7B4plT2zJYasJmRKqCI
 ZBENXwwMFKaOkQn1lQ/UPrSmM+inHDueD1FsnqepLE85C7YywkZPL3FboGMJIXUHJ89ckCwv
 UL5w0XnCEAmGNGwzSqcrXuO3eXgtHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZHvd/7ESGzbDZpl/BQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:A3PIcqG1m/VAobWmpLqE2MeALOsnbusQ8zAXPidKOH5om6Oj+f
 xG8M536faWskdzZJhfo7G90cC7KBu2n6KdirN/AV7NZmXbUROTTL1K3M/F3yDqHTH4+6p20K
 dtdLU7NfjLZGIK6PoTJGKDYrEdKB7tytHNudvj
X-Talos-CUID: 9a23:DauDbm63FB+4XaBq0Nss/VMlE9sUXnDm7m75en7iNCFFbuC2RgrF
X-Talos-MUID: 9a23:UZ70uQZmnhMRheBTrB/TuBB8PpZUz6mBDFAUzpwk4MOrHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,234,1787011200"; 
   d="scan'208";a="63161612"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Nov 2026 05:24:54 +0000
Received: from sjc-ads-22316.cisco.com (sjc-ads-22316.cisco.com [171.70.24.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id 9E062180001C1
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 05:24:54 +0000 (GMT)
Received: by sjc-ads-22316.cisco.com (Postfix, from userid 1893719)
	id 4C93DCC1288; Wed, 25 Nov 2026 21:24:53 -0800 (PST)
From: Bansi Raychura <braychur@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] apt: upgrade 2.6.1 -> 2.6.2
Date: Wed, 25 Nov 2026 21:24:52 -0800
Message-Id: <20261126052452.2573514-1-braychur@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-22316.cisco.com [171.70.24.48];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.24.48, sjc-ads-22316.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 05:25:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251272
Content-Type: text/plain; charset="utf-8"

Upgrade to the upstream 2.6.2 security release to fix
CVE-2026-109518 [2]. The fix opens HTTP, rred and compressed store
output files exclusively so existing hardlinks cannot bypass download
verification. Resumed HTTP downloads preserve their partial data in a
new destination inode [1].

This release also includes out-of-bounds access hardening, a download
memory exhaustion fix and a test suite reliability improvement.
Fetch the release from the Debian security archive, where 2.6.2 is
published, and update its SHA256 checksum. Existing recipe patches
remain applicable without modification.

[1] https://salsa.debian.org/apt-team/apt/-/commit/81cacd2aeb7380a751e786ff3a83eef8e2d05adb
[2] https://security-tracker.debian.org/tracker/CVE-2026-109518

Signed-off-by: Bansi Raychura <braychur@cisco.com>
---
 meta/recipes-devtools/apt/{apt_2.6.1.bb => apt_2.6.2.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/apt/{apt_2.6.1.bb => apt_2.6.2.bb} (93%)

diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtools/apt/apt_2.6.2.bb
similarity index 93%
rename from meta/recipes-devtools/apt/apt_2.6.1.bb
rename to meta/recipes-devtools/apt/apt_2.6.2.bb
index 8b48de3498..eb0d648748 100644
--- a/meta/recipes-devtools/apt/apt_2.6.1.bb
+++ b/meta/recipes-devtools/apt/apt_2.6.2.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later"
 SECTION = "base"
 
 # Triehash script taken from https://github.com/julian-klode/triehash
-SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
+SRC_URI = "https://security.debian.org/debian-security/pool/updates/main/a/apt/${BPN}_${PV}.tar.xz \
            file://triehash \
            file://0001-Disable-documentation-directory-altogether.patch \
            file://0001-Fix-musl-build.patch \
@@ -27,11 +27,11 @@ SRC_URI:append:class-nativesdk = " \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
-SRC_URI[sha256sum] = "86b888c901fa2e78f1bf52a2aaa2f400ff82a472b94ff0ac6631939ee68fa6fd"
+SRC_URI[sha256sum] = "12c38c9b2b8159bc1780eb17acff0adf6d6b2dff3d560f557b9ad9f60b3cc63f"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-# the package is taken from snapshots.debian.org; that source is static and goes stale
-# so we check the latest upstream from a directory that does get updated
+# Fetch this release from the Debian security archive.
+# Use the regular Debian mirror to check for newer versions.
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/a/apt/"
 # apt seems to follow a peculiar version policy, where every *other* even version
 # is considered stable, e.g. 1.0, 1.4, 1.8, 2.2, 2.6, etc. As there is no way
-- 
2.35.6

