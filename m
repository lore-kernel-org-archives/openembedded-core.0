Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1217.1793949576312656142
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Nov 2026 23:19:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=CJxqtVFS;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2962; q=dns/txt;
  s=iport01; t=1793949576; x=1795159176;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6KWQMXB0p1m3UgK4zDk2I+5EgCvTQsS31YdH/KUU5FY=;
  b=CJxqtVFSCwFXgdJifsz5q3SsVtB0FLK7GVTst1EW63xlj8GELBHTF8Z3
   MfI4cgyxoHSFPZYmAlx8HOLFDMdJG3cMYyzGGiYi0nP+nZe/Go9zsZghi
   xaQ++Kai66bxxFUYinf13MuqIHCNKOZFwNaf7zBlK/EQQrI28tq8IVB7Q
   jTM8v6lweuMti+dDsJe85JRi0+LbbLM26b1QRba3SVn36wblcJPijR/Sb
   6g8FW5Sd7fISZfYoBJBmXWmlS7KQrkYzOnvi4s+FDXzG4TUxffJ1HNuEH
   77ha6IwWdhf2zjQ0c8WcsV1HJ84T+vYJm3uvkth8ugMJvqajISyV3gLTv
   g==;
X-CSE-ConnectionGUID: iBhFvsbQSN6v0Q4Gp0llPQ==
X-CSE-MsgGUID: +KMO/cj3TzCxjje3AeAILg==
X-IPAS-Result: =?us-ascii?q?A0BfAwDtfu1q/4r/Ja1aglmDTGBDSZNaAYJwniSBfg8BA?=
 =?us-ascii?q?QEPLg8UBAEBhQWOHwImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QFQEEMQEYARsSMFgERIMCAYJ0AxG8EIIsgQGDKQE5AYEa2z8Vg?=
 =?us-ascii?q?TiFQIgjdoR9JxsbgXKBFYNpgmEFgiqFeQSCDRV6EoJdgiKJc4FThnlIgR4DW?=
 =?us-ascii?q?SwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB12BKyhdASGBC?=
 =?us-ascii?q?IF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGQLGgVhC?=
 =?us-ascii?q?AINDHQ5EDAeJC8FHCY+GwovGA1IESw3FRkEPm4Hkj2CHwFwAQFqJAEqAYIsD?=
 =?us-ascii?q?wKTJJJBoREKKIN4jCSNPod8GjOqcZkIjgqVVxJohGmBaDyBWXAVgyIJShkPl?=
 =?us-ascii?q?zfHMiYyAjsCBwIHDgMLk2YBAQ?=
IronPort-Data: A9a23:NZ3SqqnhSUIoNZUfx1RoRcjo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLCD/SbKmNMTT9fYxzYYW18kwBvMXRzoI1S1NlqypjH1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNs//b8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FYwy+shpGmt3z
 tpGNmg0Mj+b3+ay+IvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMiaBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQUaj/7C7pm9AusrnX8fjlRqUOcjaE2+GPUigd21dABNfKIJoDbG5gMxh/wS
 mTuvEfcJVYRNoej2xGV8HCh3cbCtALfV9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cF3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:wB8cZatGJTww1dKMbaJ88LOM7skDQNV00zEX/kB9WHVpmwKj+P
 xG+85rsCMc5wxxZJhNo7290cq7MBHhHOBOgbX5VI3KNGKNhILCFu9fBOXZrwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3lJxBQYzlvhFQpcYAUdAG0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3A9+qPXWtEhVt5aSgS227bZWEE6IskWH3z0mzaGnS?=
 =?us-ascii?q?eV3gxceG6UQeU/Jtdxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A0hx4Ww0yuifFJPwKnfXdPq/gaTUjoIeLLwcGk84?=
 =?us-ascii?q?6qeKUNy59YB6QpRWTTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,197,1787011200"; 
   d="scan'208";a="544965101"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 06 Nov 2026 07:19:35 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 41AA8180001CD;
	Fri,  6 Nov 2026 07:19:35 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id DDC26CC1611; Thu,  5 Nov 2026 23:19:34 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 0/9] curl: Security fixes
Date: Thu,  5 Nov 2026 23:19:23 -0800
Message-Id: <20261106071932.490299-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 07:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249598
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport nine additional security fixes to curl 8.19.0 on Wrynose.

This series applies on top of my earlier curl CVE series [1],
from CVE-2026-86414 through CVE-2026-18924.

These commits address MIME cleanup, HSTS expiration, SSH host
verification on redirects, output-file handling, FTP wildcard
callbacks, connection cleanup, credential removal from effective
URLs, interface-bound connection reuse and certificate parsing.

The CVE-2026-94266 commit includes the Git 2.53.0 compatibility
backport needed for the effective-URL behavior change. Keep that
companion change with the curl fix.

The CVE-2026-87866 commit carries the source fix for wolfSSL
pinning, including the shared ASN.1 parser and affected TLS callers.

[1] https://lists.openembedded.org/g/openembedded-core/message/249332

Darsh Kelaiya (9):
  curl: fix CVE-2026-92391
  curl: fix CVE-2026-87863
  curl: fix CVE-2026-86410
  curl: fix CVE-2026-92390
  curl: fix CVE-2026-92388
  curl: fix CVE-2026-92392
  curl: fix CVE-2026-94266
  curl: fix CVE-2026-107929
  curl: fix CVE-2026-87866

 ...l-stripping-creds-from-effective-url.patch | 140 ++++
 meta/recipes-devtools/git/git_2.53.0.bb       |   1 +
 .../curl/curl/CVE-2026-107929.patch           | 470 +++++++++++
 .../curl/curl/CVE-2026-86410.patch            | 102 +++
 .../curl/curl/CVE-2026-87863.patch            | 203 +++++
 .../curl/curl/CVE-2026-87866.patch            | 750 ++++++++++++++++++
 .../curl/curl/CVE-2026-92388_p1.patch         | 139 ++++
 .../curl/curl/CVE-2026-92388_p2.patch         |  33 +
 .../curl/curl/CVE-2026-92390_p1.patch         | 270 +++++++
 .../curl/curl/CVE-2026-92390_p2.patch         | 150 ++++
 .../curl/curl/CVE-2026-92391.patch            | 203 +++++
 .../curl/curl/CVE-2026-92392.patch            |  59 ++
 .../curl/curl/CVE-2026-94266_p1.patch         | 225 ++++++
 .../curl/curl/CVE-2026-94266_p2.patch         | 235 ++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |  12 +
 15 files changed, 2992 insertions(+)
 create mode 100644 meta/recipes-devtools/git/git/0001-http-handle-curl-stripping-creds-from-effective-url.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-107929.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-86410.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87863.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87866.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388_p1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388_p2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92390_p1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92390_p2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92391.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92392.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-94266_p1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-94266_p2.patch

-- 
2.35.6
