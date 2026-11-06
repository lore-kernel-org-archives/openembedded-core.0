Received: from rcdn-iport-4.cisco.com (rcdn-iport-4.cisco.com [173.37.86.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7518.1793976213994639424
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:43:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fFDRcRoS;
 spf=pass (domain: cisco.com, ip: 173.37.86.75, mailfrom: yurade@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6393; q=dns/txt;
  s=iport01; t=1793976214; x=1795185814;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J9SNdMko2ZpFfeIvXVZwm/pJ9cEn4ZNxurIHpqTfxeg=;
  b=fFDRcRoSK08qeKp+0HsgMzdzqrxOpC52gxj45bTzYdgE+KjKdx6VXAo+
   qk+4pGo9Bc+9nrgOcaB7WNwWq34cmELCfUhtzMpVaK4RSytyvS+JAvUso
   mjUKvouE+JJ3CfGXPRSFXnZvXgFPyZkNSrRVomUvpYO2muMYq3uf3pABh
   +FD/cK3PTnG7PCAHNoaMRmQkSQ6dt0pSYRRKeHiNmmp39XbF3L8VHq2bn
   8lMgDX/l+LscAiN1z41zZLUDPD44xTu+qysIWv3I4x68pBs6ZBxVV+Giz
   t/eaXqC99xYh1VIzIu62U33nOa/tY8OARYccvJdSV0KnuU5kJn37ejCwa
   g==;
X-CSE-ConnectionGUID: PQdK58WVR7WK/NoCyOQI8A==
X-CSE-MsgGUID: op/NtT4kS3mu2GzbPxdJ4Q==
X-IPAS-Result: =?us-ascii?q?A0BiBAAQ5u1q/5P/Ja1aglmDTGBDSZQqoEUUgWoPAQEBD?=
 =?us-ascii?q?zcaBAEBkyQCJjYHDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Th?=
 =?us-ascii?q?lyQSwEYARuBHoNGAYJ0A7xQgiyBAYMpAYFU2UuBdBWBOI1mdoR9JxuBSUSEf?=
 =?us-ascii?q?oQphmAEgy6QRYZ5SIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHGwYFg?=
 =?us-ascii?q?R2BHoESgQddgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosC?=
 =?us-ascii?q?oEaNTwJJj8VDGQLGgVhCAINDHQ5EDAeJC8FHCY+GwovGA1IESw3FRkEPm4Hk?=
 =?us-ascii?q?j2DEoEPB4I4GKV2oRGEKowklToaM6pxmQikDk2EaYFuATWBWTMaCBsVgyIJS?=
 =?us-ascii?q?hkP3hAmMgI7AQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:ODSBKKmU4xbeEQbbrYBfhLro5gzWJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLUTqBaP6CajHwc4sgYdvg/UsHsJbQndVqTlRur3o8EFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNs//b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FbUh9sUqUV5wz
 6MnC3craTuSoNuXkJvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMmbBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTZT/7C7pm9AusrmjiaTRUpXqepLE85C7YywkZPL3FbYaII4XbHpQO9qqej
 mXeuELlPk0ZD4ea1GCq4HiUluPtwRquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0W5Qd93L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXzBCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:TsyGsa5Aj/o5x6HbWgPXwPjXdLJyesId70hD6qkXc202TiX2ra
 6TdZgguCMc6wxhO03I5+rgBEDoexq1nvRICOIqUotKMjOLhILRFuFfxLqn5SH8ECvj8eMY/6
 Jhf69iTODUNzFB/KPHCM3SKadG/DFBm5rY4dvj8w==
X-Talos-CUID: =?us-ascii?q?9a23=3AtseuZGnxTfnD7UQoiy7MAudGHIHXOUXkwFSNc3C?=
 =?us-ascii?q?GMzlWa/qzTnSB35pFw+M7zg=3D=3D?=
X-Talos-MUID: 9a23:WRuCDgWq+paWY5Tq/Dj0wxd+CJtr2P+rFRoig58+q8WmaRUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="545119393"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 14:43:33 +0000
Received: from sjc-ads-7871.cisco.com (sjc-ads-7871.cisco.com [10.30.222.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 03F7D18000890
	for <openembedded-core@lists.openembedded.org>; Fri,  6 Nov 2026 14:43:33 +0000 (GMT)
Received: by sjc-ads-7871.cisco.com (Postfix, from userid 1889728)
	id 9B9CFCC1611; Fri,  6 Nov 2026 06:43:32 -0800 (PST)
From: Yogita Urade <yurade@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][v2 PATCH 00/27] python3-git: Security fixes
Date: Fri,  6 Nov 2026 06:43:04 -0800
Message-Id: <20261106144331.3354811-1-yurade@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-7871.cisco.com [10.30.222.158];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.30.222.158, sjc-ads-7871.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:43:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249664
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

Yogita Urade (27):
  python3-git: fix CVE-2026-67326
  python3-git: fix CVE-2026-67323
  python3-git: Fix CVE-2026-67325
  python3-git: Fix CVE-2026-67324
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

 .../python/python3-git/CVE-2026-100689.patch       |  91 +++++
 .../python/python3-git/CVE-2026-67322.patch        | 171 ++++++++
 .../python/python3-git/CVE-2026-67323.patch        | 356 +++++++++++++++++
 .../python/python3-git/CVE-2026-67324.patch        |  94 +++++
 .../python/python3-git/CVE-2026-67325_p1.patch     |  49 +++
 .../python/python3-git/CVE-2026-67325_p2.patch     |  52 +++
 .../python/python3-git/CVE-2026-67326.patch        | 107 +++++
 .../python/python3-git/CVE-2026-69097.patch        |  60 +++
 .../python/python3-git/CVE-2026-73619_p1.patch     |  58 +++
 .../python/python3-git/CVE-2026-73619_p2.patch     |  43 ++
 .../python/python3-git/CVE-2026-73620.patch        | 130 ++++++
 .../python/python3-git/CVE-2026-73621.patch        |  72 ++++
 .../python/python3-git/CVE-2026-73622.patch        |  60 +++
 .../python/python3-git/CVE-2026-73623.patch        |  53 +++
 .../python/python3-git/CVE-2026-73624.patch        | 139 +++++++
 .../python/python3-git/CVE-2026-73625.patch        |  59 +++
 .../python/python3-git/CVE-2026-76217.patch        | 179 +++++++++
 .../python/python3-git/CVE-2026-76218.patch        |  92 +++++
 .../python/python3-git/CVE-2026-76219.patch        | 153 +++++++
 .../python/python3-git/CVE-2026-76220.patch        |  65 +++
 .../python/python3-git/CVE-2026-76221.patch        |  59 +++
 .../python3-git/CVE-2026-76222-regression.patch    |  39 ++
 .../python/python3-git/CVE-2026-76222_p1.patch     | 118 ++++++
 .../python/python3-git/CVE-2026-76222_p2.patch     |  45 +++
 .../python/python3-git/CVE-2026-78675.patch        |  47 +++
 .../python/python3-git/CVE-2026-78676.patch        |  67 ++++
 .../python/python3-git/CVE-2026-78677.patch        |  87 ++++
 .../CVE-2026-78678_CVE-2026-78679.patch            | 220 ++++++++++
 .../python/python3-git/CVE-2026-87817.patch        | 443 +++++++++++++++++++++
 .../python/python3-git/CVE-2026-87818.patch        |  55 +++
 .../python/python3-git/CVE-2026-87819_p1.patch     |  78 ++++
 .../python/python3-git/CVE-2026-87819_p2.patch     | 146 +++++++
 meta/recipes-devtools/python/python3-git_3.1.43.bb |  32 ++
 33 files changed, 3519 insertions(+)
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
2.53.0

