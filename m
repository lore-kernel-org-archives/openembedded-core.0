Received: from aer-iport-6.cisco.com (aer-iport-6.cisco.com [173.38.203.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14769.1795513786337538296
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 01:49:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NT/LXZAn;
 spf=pass (domain: cisco.com, ip: 173.38.203.68, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1078; q=dns/txt;
  s=iport01; t=1795513786; x=1796723386;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HV9fDzIORMTSWxCYEve77VQGN/8AootBVLPOOHNSQOw=;
  b=NT/LXZAnsRGVLw/1vKZAyT/kMVw3WErDwpJq8+qSj/eYct4e5luZkB9r
   5kCQYsT0chTXqBKNFPqVGS7l73468RH1f5jIItqnASzUbtEfEFeKoC/jc
   vMNTRsxaMPAKuJsc0jWXTyy7AoehrmBFAQFYspHynBQFWv4pQHxNqIjCq
   tIonrgrMwb6IsgAJ91kh/5PeSrh72l8Mlz7zo2H2jPLRKYqWZgJTexH//
   8x4pSJ4LYy9Au+007/MrTn8zxTcMaEy1E9uVORqZ8GR3i+vrbWLv8r/bO
   8yXzauEkFnpD9wq8VHGEcDqzK2PAZaiM++jtw08e+1KywpFADwWPkLyPR
   w==;
X-CSE-ConnectionGUID: s9Nf4iSsTnqWKfg+GTBDUw==
X-CSE-MsgGUID: DMivGbsfRauV4OTDc9vF4g==
X-IPAS-Result: =?us-ascii?q?A0BBAgBZWwVr/9NK/pBaglmCV3VgQ0kDlCeCIZ4sgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBkykCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4Thk8NkEsBGAFdXESDAgGCdAMRumSCLIEBgykBPwJDUNszAQsUAYE4hUKIJ?=
 =?us-ascii?q?HUBhH0nGxuBcoEVg2qBBYFcAgIYghOFeQSCIoEMjmuKGkiBHgNZLAFVEw0KC?=
 =?us-ascii?q?wcFgWgDNRIqFW4yHYEjOxeBBxsGBYEcgR6BEoEDXYErKF4hgQiBdgKCUYIAA?=
 =?us-ascii?q?gFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwH?=
 =?us-ascii?q?iQvBRomPhsKgQwnHx4bDgIfEAYWIQsbGA1IESw3FRkEPm4HlBSDGj1RLASBa?=
 =?us-ascii?q?ECTEZJkoREKKIN5jCSVOhozqnILmH2OCpVoaYRqgWg8gVlwFYMiCUoZD445g?=
 =?us-ascii?q?2uFE8lIJjICDC8BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:0nczAq0LPzW9MuQUvPbD5Ydwkn2cJEfYwER7XKvMYLTBsI5bpzMBz
 GYYDWuAbvbcamShKYpzaIqyo0kG7JKHm9NiGlA53Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ef3b9ANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcuaTpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGFxAQM9EZwf1LB3hx1
 vIXax8xRDy+mLfjqF67YrEEasULJcTxeYdasXZ6wHSAVbAtQIvIROPB4towMDUY35wSW6yDO
 4xGNXw1NU2ojx5nYj/7DLoykfmhgGL/axVTqUmeouw85G27IAlZjuC1aISOIY3iqcN9smOZu
 E3M5GrDCwwkaPuj5THU7Fzwibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYVVsAVF6gx7xuAj/OMpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:xx0LeqCW+ICC1tvlHemc55DYdb4zR+YMi2TDsHoBKyC9Hfb3qy
 nDppkmPHzP+VUssQ8b+OxoUZPoKRi3yXcf2+Ys1NmZMDUOwFHJEKhSqa3/3jbnByryssRZ1a
 tmbuxCLeeYNykesS4/izPIdOrJB7K8gcSVuds=
X-Talos-CUID: =?us-ascii?q?9a23=3AJrWEBmpHxjmUi7mxxdUho+rmUdt0VHOBzUzLH0m?=
 =?us-ascii?q?hNkVnR/66dXW8xbwxxg=3D=3D?=
X-Talos-MUID: 9a23:vr3umwTYqv5BrLN1RXTAoTB8G81z7Z6nFX5RtqkqsJiaG3B/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60006339"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 09:49:44 +0000
Received: from sjc-ads-4935.cisco.com (sjc-ads-4935.cisco.com [10.28.39.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id 0FDC21800031B
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:49:44 +0000 (GMT)
Received: by sjc-ads-4935.cisco.com (Postfix, from userid 1887503)
	id BB437CC2EF3; Tue, 24 Nov 2026 01:49:42 -0800 (PST)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH] zlib: Ignore CVE-2026-76844
Date: Tue, 24 Nov 2026 01:49:42 -0800
Message-Id: <20261124094942.1560147-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4935.cisco.com [10.28.39.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.39.199, sjc-ads-4935.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 09:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250996
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

Analysis:
- The current CNA record identifies webpack-dev-middleware as the
  affected product, rather than zlib [1].
- The webpack maintainer advisory confirms this product mapping [2].
- Hence ignoring this CVE for zlib as an incorrect product match.

Reference:
[1] https://www.cve.org/CVERecord?id=CVE-2026-76844
[2] https://github.com/webpack/webpack-dev-middleware/security/advisories/GHSA-g84c-rxfj-3j2c

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-core/zlib/zlib_1.3.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/zlib/zlib_1.3.2.bb b/meta/recipes-core/zlib/zlib_1.3.2.bb
index 8a23d98c..ef9bc62d 100644
--- a/meta/recipes-core/zlib/zlib_1.3.2.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.2.bb
@@ -50,3 +50,5 @@ BBCLASSEXTEND = "native nativesdk"
 
 # Adding 'CVE_PRODUCT' to avoid false detection of CVEs
 CVE_PRODUCT = "zlib:zlib gnu:zlib"
+
+CVE_STATUS[CVE-2026-76844] = "cpe-incorrect: This CVE affects webpack-dev-middleware, not zlib"
-- 
2.35.6

