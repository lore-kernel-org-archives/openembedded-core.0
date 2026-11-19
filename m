Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8199.1795061920306621915
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 20:18:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=CNiBKx8d;
 spf=pass (domain: cisco.com, ip: 173.38.203.69, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6570; q=dns/txt;
  s=iport01; t=1795061920; x=1796271520;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=LccjFtQxG2r41TB5QESXMJ9icoHkDWYUzflOenBDURI=;
  b=CNiBKx8dP/ULywHyc696U+X3AvrL4fVmjg42f3QyxTzaaiagzRtVOW9E
   ri0KA0RRNw3nophS4B+NVKE6Qlp1+h/VAPNOKpmvBqVjdb92C9eAzJtSG
   /b9B8QU0J6p+izXQ+/UNP618FI+LiZkn7MtcQy5qGv63tqgqgKmIqd7ph
   qdRfTm4p3vFTbyfyeoPrxbU4lnSi0Quk7O2FB2yUoKA7D7+e05Raw0qJT
   3F8TSvypsGTyL86dzkn6Pp03CPT/J2WLbh8IsGW9mP1v9mfikGCrPXiPM
   ZOqcx9OBNzHTD8fV7n2W4m099rkrSNQvwAFN2ms7XQuHZN61q9ysABICw
   A==;
X-CSE-ConnectionGUID: c+QWJijJRPaI+WWXwJ7xLA==
X-CSE-MsgGUID: 9wpnqLSPQYC7j5Ajwet4Kw==
X-IPAS-Result: =?us-ascii?q?A0BeAwBZd/5q/81K/pBaglmDTGBDSZQqgiGeLBSBag8BA?=
 =?us-ascii?q?QEPNxoEAQGFBQKOIAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGXJATAgEDMgEYARsiUSsrgxsBgnQDuUOCLIEBgykBgVTZS4F0FYE4j?=
 =?us-ascii?q?WZ2hH0nG4FJRIR/hCmGYASDHBKQPIgKSIEeA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM7F4EHGwYFgRyBHoESgQNdgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQ?=
 =?us-ascii?q?xJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAeJC8FGiY+GwqBD?=
 =?us-ascii?q?CcfHhsOAg4YDUgRLDcVGQQ+bgeTUYMYFnkHgigQGKV1oRGEK4wklToaM6pym?=
 =?us-ascii?q?QikDk2EaoFoPIFZMxoIGxWDIglKGQ/eYiYyAjsBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:PaVyOKBFsle66hVW/2Piw5YqxClBgxIJ4kV8jS/XYbTApGl30TUOy
 zceDWnVPv7camfzct9zO4q+801VusCHnNBqOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCC+G+39BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQb8i2YvWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEyLZXM2M3P68iwu9WQl5xx
 eM6dyApR0XW7w626OrTpuhEj8k5ac2uN4QFtzQ4kXfSDO0tRtbIRKCiCd1whWtswJoTQbCBO
 4xDMWcHgBfoO3WjPn8GFYg3kOqAjXjkeDoeo1WQzUYyyzaJklctiuG2WDbTUo2VXcNMun2gn
 1PtoGakKxMFOcDD6iXQpxpAgceKx0sXQrk6E6W18PNvilCfymEfTRYRT1aTpfiillX4XMpSL
 UER8CcioaU+skuxQbHAswaQqXOe+xpZUN1KHqhitEeGy7Hf5ECSAW1soiN9VeHKffQeHVQCv
 mJlVfuwbdCzmNV5kU6gy4o=
IronPort-HdrOrdr: A9a23:UF2u36pPsmNf6r26HpHGW/saV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3A7m3AVmiTVQE+zkMr6/5fsk4LeDJueT7k81XRIW2?=
 =?us-ascii?q?CMW9IC4KqeUCyp7NAup87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A+GjlKAzmFVo7KuWZbWDS3wXwS1yaqPWxEEYUta4?=
 =?us-ascii?q?+gvivai4tEjWCgSjrYZByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="62634213"
Received: from aer-l-core-04.cisco.com ([144.254.74.205])
  by aer-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Nov 2026 04:18:38 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-04.cisco.com (Postfix) with ESMTPS id C5909180001C7
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:18:37 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 713C7CC1611; Wed, 18 Nov 2026 20:18:36 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v3 PATCH 00/27] python3-git: Security fixes
Date: Wed, 18 Nov 2026 20:18:35 -0800
Message-Id: <20261119041835.1637478-1-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261106144331.3354811-1-yurade@cisco.com>
References: <20261106144331.3354811-1-yurade@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: aer-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 04:18:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250608
Content-Type: text/plain; charset="utf-8"

Backport 27 GitPython security fixes covering 28 CVEs to the python3-git
3.1.43 recipe on wrynose. The series adds the fixes as patches and updates
the recipe to apply them.

CVE-2026-78678 and CVE-2026-78679 are addressed together. The CVE-2026-76222
fix includes a regression correction and follow-up patch, CVE-2026-73619
and CVE-2026-87819 are each carried in two patches. The patches retain
upstream references.

Changes in v2:
- Re-reviewed all patches and removed changes that were not needed for the backports.
- Restored upstream commit metadata and corrected CVE references.
- Updated Backport Changes notes to describe the differences from upstream.
- Removed trailing whitespace and regenerated the series diffstat.

Changes in v3:
- Restored the required trailing spaces.
- Added rationale explaining that CVE-2026-67324 and CVE-2026-87818 complete
  unsafe-option guards backported earlier in the series, without claiming
  that the published affected ranges include unmodified GitPython 3.1.43.

Yogita Urade (27):
  python3-git: fix CVE-2026-67326
  python3-git: fix CVE-2026-67323
  python3-git: Fix CVE-2026-67325
  python3-git: fix CVE-2026-67324
  python3-git: fix CVE-2026-67322
  python3-git: fix CVE-2026-69097
  python3-git: fix CVE-2026-73625
  python3-git: fix CVE-2026-73623
  python3-git: fix CVE-2026-73624
  python3-git: fix CVE-2026-73622
  python3-git: fix CVE-2026-73621
  python3-git: fix CVE-2026-73620
  python3-git: fix CVE-2026-73619
  python3-git: fix CVE-2026-76221
  python3-git: fix CVE-2026-76220
  python3-git: fix CVE-2026-76219
  python3-git: fix CVE-2026-76218
  python3-git: fix CVE-2026-76217
  python3-git: fix CVE-2026-76222
  python3-git: fix CVE-2026-78678 CVE-2026-78679
  python3-git: fix CVE-2026-78677
  python3-git: fix CVE-2026-78676
  python3-git: fix CVE-2026-78675
  python3-git: fix CVE-2026-87817
  python3-git: fix CVE-2026-87818
  python3-git: Fix CVE-2026-87819
  python3-git: fix CVE-2026-100689

 .../python/python3-git/CVE-2026-100689.patch  |  91 ++++
 .../python/python3-git/CVE-2026-67322.patch   | 171 +++++++
 .../python/python3-git/CVE-2026-67323.patch   | 356 ++++++++++++++
 .../python/python3-git/CVE-2026-67324.patch   |  94 ++++
 .../python3-git/CVE-2026-67325_p1.patch       |  49 ++
 .../python3-git/CVE-2026-67325_p2.patch       |  52 ++
 .../python/python3-git/CVE-2026-67326.patch   | 107 +++++
 .../python/python3-git/CVE-2026-69097.patch   |  60 +++
 .../python3-git/CVE-2026-73619_p1.patch       |  58 +++
 .../python3-git/CVE-2026-73619_p2.patch       |  43 ++
 .../python/python3-git/CVE-2026-73620.patch   | 130 +++++
 .../python/python3-git/CVE-2026-73621.patch   |  72 +++
 .../python/python3-git/CVE-2026-73622.patch   |  60 +++
 .../python/python3-git/CVE-2026-73623.patch   |  53 +++
 .../python/python3-git/CVE-2026-73624.patch   | 139 ++++++
 .../python/python3-git/CVE-2026-73625.patch   |  59 +++
 .../python/python3-git/CVE-2026-76217.patch   | 179 +++++++
 .../python/python3-git/CVE-2026-76218.patch   |  92 ++++
 .../python/python3-git/CVE-2026-76219.patch   | 153 ++++++
 .../python/python3-git/CVE-2026-76220.patch   |  65 +++
 .../python/python3-git/CVE-2026-76221.patch   |  59 +++
 .../CVE-2026-76222-regression.patch           |  39 ++
 .../python3-git/CVE-2026-76222_p1.patch       | 118 +++++
 .../python3-git/CVE-2026-76222_p2.patch       |  45 ++
 .../python/python3-git/CVE-2026-78675.patch   |  47 ++
 .../python/python3-git/CVE-2026-78676.patch   |  67 +++
 .../python/python3-git/CVE-2026-78677.patch   |  87 ++++
 .../CVE-2026-78678_CVE-2026-78679.patch       | 220 +++++++++
 .../python/python3-git/CVE-2026-87817.patch   | 443 ++++++++++++++++++
 .../python/python3-git/CVE-2026-87818.patch   |  56 +++
 .../python3-git/CVE-2026-87819_p1.patch       |  78 +++
 .../python3-git/CVE-2026-87819_p2.patch       | 146 ++++++
 .../python/python3-git_3.1.43.bb              |  32 ++
 33 files changed, 3520 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-100689.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67322.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67323.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67324.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67325_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67325_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-67326.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-69097.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73619_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73619_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73620.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73621.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73622.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73623.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73624.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-73625.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76217.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76218.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76219.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76220.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76221.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76222-regression.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76222_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-76222_p2.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-78675.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-78676.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-78677.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-78678_CVE-2026-78679.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-87817.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-87818.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-87819_p1.patch
 create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-87819_p2.patch

-- 
2.35.6

