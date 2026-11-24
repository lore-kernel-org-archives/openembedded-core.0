Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13756.1795509645103571437
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 00:40:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=AitLFmMS;
 spf=pass (domain: cisco.com, ip: 173.38.203.69, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2449; q=dns/txt;
  s=iport01; t=1795509645; x=1796719245;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dgkoBVmDv1rfq11YpOPrqh4cfJ5Xufw3iB3dnIvudyI=;
  b=AitLFmMSMlDuWujvillU5gZgxRaSVKKMOSx3f0tUkDJknf4XMZqwajP0
   JsH5niLFmysvDt2yL+PvvlkQdvPEQEnFp0XtORiV7shC+vPv3vOW5oK+m
   sT7Vv+Ftaxnj8AYG4oMtORMvIGXy8LvOnAwoM7ODMaNLhNW7lYdhuYHw/
   C3V4peTCXMYDQ8XEsCtoC1UQirq+L3m9FKXYTO/Qxo9Tpf/un6++Gnisk
   XXwzUefnbv7ErJ7PQbjTFQzE3ijAF7dTAppWZ0Q9BfPqkQZJHCDGoxykf
   OISdLl7WR29qiRu1mmke5MfKPmxq9YisjGKDK1ERCZGEZLPRpi1v9IYiX
   g==;
X-CSE-ConnectionGUID: WJyXRNQkS368WqJ8U8aSfw==
X-CSE-MsgGUID: sTyqorRHTJyY6z4rRPNMhA==
X-IPAS-Result: =?us-ascii?q?A0BXAwCgSgVr/8pK/pBaglmELUJJlCqCIZFTjFmBfg8BA?=
 =?us-ascii?q?QEPUQQBAZMpAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4ZckEsBNEJcRIMCgnUCAbsPgiyBAYR+2z8VgTiFQogkdoR9JxsbgXKBFYNqg?=
 =?us-ascii?q?QWEC4V5BIIigQyBbIx/ihpIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXg?=
 =?us-ascii?q?QcbBgWBHIEegRKBA12BKyheIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSC?=
 =?us-ascii?q?QETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMB4kLwUaJj4bCoEMJx8eGw4CH?=
 =?us-ascii?q?xAGFiELGxgNSBEsNxUZBD5uB5QUgk1MAVY5gTyBG6V1oREKKIN5oV4aM6pym?=
 =?us-ascii?q?QijbREQTYRqgWg8gVlwFYMiUxkPjjnSRiM1PQEBBwIHDgMLgWiQAAImBAOBT?=
 =?us-ascii?q?wEB?=
IronPort-Data: A9a23:vNff7awdAo2Ag1+hd+96t+djxyrEfRIJ4+MujC+fZmUNrF6WrkUEy
 mcaXzuBP6uNYWLyf94gO4+0800P6JHQn4A2GwRsqVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH9aOWJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaDlMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJH4ULL0i3N90OjoQp
 cMBCmAwPhm4if3jldpXSsE07igiBMDmJsYb/3pn1zycVa9gSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNkyaC/FMEg9/5JYWlfywj2P6eidwo1OOrq1x6G/WpOB0+Oa2bIaMKoDXLSlTtl2kt
 3vB5V7ZPjMLBYKNlSC/ylSJhsaayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0UtdKVul/4waXx++MukCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:yXYTwamRkYP0Rr/X6VmThDIVpufpDfIc3DAbv31ZSRFFG/Fw8P
 re/sjzuiWbtN98YhwdcLO7Scq9qA3nlKKdiLN5VdzJYOCMggSVxe9ZgbcKuweBJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadE/DFCm5rY4ts3CBxWPGVXV50=
X-Talos-CUID: 9a23:8OoZO2MZCK3Oj+5DZwt2xHQyI8MeKSON827yc3LoAF1nV+jA
X-Talos-MUID: 9a23:ZdBkhQT4U0g2GLkeRXT3uCB7M91Sw5iMGXFTg8kcgfGiECxZbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="63441845"
Received: from aer-l-core-01.cisco.com ([144.254.74.202])
  by aer-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 08:40:43 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-01.cisco.com (Postfix) with ESMTPS id B35BF34419
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:40:42 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 6571CCC1634; Tue, 24 Nov 2026 00:40:41 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 0/8] cups: backport eight CVE fixes (2026-11-24)
Date: Tue, 24 Nov 2026 00:40:25 -0800
Message-Id: <20261124084033.72286-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-01.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 08:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250968
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

Backport eight upstream CUPS security changes to the CUPS 2.4.11 recipe
in OE-Core scarthgap. The recipe version and source archive checksum
are unchanged.

The series contains:

- CVE-2026-55453: control characters in quoted IPP attribute strings.
- CVE-2026-55467: control characters in fax destination and pre-dial
  strings.
- CVE-2026-55480: unsafe temporary PPD creation.
- CVE-2026-61702: missing attributes-natural-language validation.
- CVE-2026-107888: held jobs whose destination has disappeared.
- CVE-2026-107890: unnamed group separators in job creation requests.
- CVE-2026-107886: dangling class-printer array pointers after freeing.
- CVE-2026-107885: jobs held open beyond MultipleOperationTimeout.

Each change is carried as a separate source patch and added to SRC_URI
in cups.inc. The source patches retain their upstream messages and
release-note changes, with the corresponding CVE identifiers and
upstream commit URLs.

Ashishkumar Parmar (8):
  cups: Fix CVE-2026-55453
  cups: Fix CVE-2026-55467
  cups: Fix CVE-2026-55480
  cups: Fix CVE-2026-61702
  cups: Fix CVE-2026-107888
  cups: Fix CVE-2026-107890
  cups: Fix CVE-2026-107886
  cups: Fix CVE-2026-107885

 meta/recipes-extended/cups/cups.inc           |  8 ++
 .../cups/cups/CVE-2026-107885.patch           | 99 +++++++++++++++++++
 .../cups/cups/CVE-2026-107886.patch           | 41 ++++++++
 .../cups/cups/CVE-2026-107888.patch           | 61 ++++++++++++
 .../cups/cups/CVE-2026-107890.patch           | 41 ++++++++
 .../cups/cups/CVE-2026-55453.patch            | 52 ++++++++++
 .../cups/cups/CVE-2026-55467.patch            | 70 +++++++++++++
 .../cups/cups/CVE-2026-55480.patch            | 40 ++++++++
 .../cups/cups/CVE-2026-61702.patch            | 73 ++++++++++++++
 9 files changed, 485 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-107885.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-107886.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-107888.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-107890.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-55453.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-55467.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-55480.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-61702.patch


base-commit: fc4316861becc9f0d41857b49f6438929ab4c291
-- 
2.35.6

