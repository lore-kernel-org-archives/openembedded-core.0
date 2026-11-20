Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3709.1795172267676421292
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 02:57:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=lAscwBD1;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2406; q=dns/txt;
  s=iport01; t=1795172267; x=1796381867;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iEss5a7LyyEmOichh/lNgwV+v3hvjKkvUOWGo0Y5DPQ=;
  b=lAscwBD1lSiqX+Zq98V5o+TC4rGRwTdRdFqkEJ6DxSy5Du5kttDURILn
   kU6fRIdBb7VUyW6kYJ1Quzc+SWay2lXNsX/Lun9etpjW8Y/1EJw+CG4tD
   JswF5bKPDveuHH3dMOHRIdqtLfIg1z5Ns6bvciOi+gkP2HidFmT+n9jTQ
   N8fgR8HcTr1rsoRWUXRpU5akKrwCQCToeMf4TRF7OBkOupnJq6NS1lpZX
   E9klOAhumOuQi2QFVu2FAemGxIoYRRQVug5lhZKhkbc+ABnX+M2qFtk2P
   BekVh+ETy7ExaD59AiSwJ5iNecTd5Xacmmz7DBZBYQVW8Ui401T1S0oSg
   g==;
X-CSE-ConnectionGUID: RWt3lDu0StKP55JzwSuxTQ==
X-CSE-MsgGUID: la7r6MUpTq2VEHOvAGsPRQ==
X-IPAS-Result: =?us-ascii?q?A0BXAwDlJgBr/9NK/pBaglmELUJJlkueLIF+DwEBAQ9RB?=
 =?us-ascii?q?AEBhQWOIwImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGX?=
 =?us-ascii?q?JAVNgE0EjBcRIMCgnUCAbkPgiyBAYR+2z8VBYEzhUKIJHaEfScbG4FygRWDa?=
 =?us-ascii?q?oEFhAuFeQSCIoEMgWyMf4l3SIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F?=
 =?us-ascii?q?4EHGwYFgRyBHoESgQNdgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiC?=
 =?us-ascii?q?BIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bD?=
 =?us-ascii?q?gIfEAYNGA1IESw3FRkEPm4Hk2yCJyVNVjmBPFtApXWhEQoog3mhXhozqnKZC?=
 =?us-ascii?q?KNtEV2EaoFoPIFZcBWDIlMZD4450kYjNT0BAQcCBw4DC4FokAACJgQDgU8BA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:xo/t5qhSQ3T1im3Hp0Bv6yQ/X161NBEKZh0ujC45NGQN5FlHY01je
 htvUW7TbPqDY2XxLtBwPd6z9EMHsMfSn95kTwtl+H9gQyxjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn/SMhvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNsvjb8UoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUixfosBU1Tr
 ccECwhQMzKRmNmr0I6CH7wEasQLdKEHPasWt2slyXTSCuwrBMmbBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcWYz/7C7pm9AusrnDkazRCrVuPjaE2+GPUigd21dABNfKIK4zWHZoIzi50o
 ErC9jvjXDQnLOCGkwSo0lWyr8DUpRnCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q38kSJj6HT+QvcXzBCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rd94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:VC56zqgoklyiVznEw0OPECsZl3BQXvYji2hC6mlwRA09TyVXra
 +TdZMgpHrJYVkqOU3I9ersBEDiewK/yXcK2+ks1N6ZNWGM0ldAR7sN0WKN+VHd8gTFh4pgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3ABD3lVGuEDUc1xM6bhUacDxAq6IsfTWGGyFvNe3S?=
 =?us-ascii?q?kKl40FZ+HVmSN6J9dxp8=3D?=
X-Talos-MUID: 9a23:wCfkuATbPYiVjPuSRXTojW54auJV+5i3Un4gsbIYkuafDRZJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,222,1787011200"; 
   d="scan'208";a="59840758"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Nov 2026 10:57:45 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id 17E7018000B53;
	Fri, 20 Nov 2026 10:57:45 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id BCF49CC1634; Fri, 20 Nov 2026 02:57:43 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-Core][wrynose][PATCH 0/8] cups: backport eight CVE fixes (2026-11-20)
Date: Fri, 20 Nov 2026 02:57:12 -0800
Message-Id: <20261120105720.2197092-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 10:57:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250764
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This series backports eight upstream CUPS security fixes to the CUPS
2.4.16 recipe in OE-Core wrynose. The recipe version and source archive
checksum are unchanged.

The fixes address:

- CVE-2026-55453: control characters in quoted IPP attribute strings.
- CVE-2026-55467: control characters in fax destination and pre-dial
  strings.
- CVE-2026-55480: unsafe temporary PPD creation.
- CVE-2026-61702: missing attributes-natural-language validation.
- CVE-2026-107888: held jobs whose destination has disappeared.
- CVE-2026-107890: unnamed group separators in job creation requests.
- CVE-2026-107886: dangling class-printer array pointers after freeing.
- CVE-2026-107885: jobs held open beyond MultipleOperationTimeout.

Each fix is carried as a separate source patch and added to SRC_URI in
cups.inc. The source patches record the corresponding upstream commit
URLs, CVE identifiers and backport status.

Ashishkumar Parmar (8):
  cups: Fix CVE-2026-55453
  cups: Fix CVE-2026-55467
  cups: Fix CVE-2026-55480
  cups: Fix CVE-2026-61702
  cups: Fix CVE-2026-107888
  cups: Fix CVE-2026-107890
  cups: Fix CVE-2026-107886
  cups: Fix CVE-2026-107885

 meta/recipes-extended/cups/cups.inc           |   8 ++
 .../cups/cups/CVE-2026-107885.patch           | 102 ++++++++++++++++++
 .../cups/cups/CVE-2026-107886.patch           |  44 ++++++++
 .../cups/cups/CVE-2026-107888.patch           |  64 +++++++++++
 .../cups/cups/CVE-2026-107890.patch           |  44 ++++++++
 .../cups/cups/CVE-2026-55453.patch            |  45 ++++++++
 .../cups/cups/CVE-2026-55467.patch            |  63 +++++++++++
 .../cups/cups/CVE-2026-55480.patch            |  32 ++++++
 .../cups/cups/CVE-2026-61702.patch            |  76 +++++++++++++
 9 files changed, 478 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-107885.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-107886.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-107888.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-107890.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-55453.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-55467.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-55480.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-61702.patch


base-commit: ae5a301091f5b0574ea7444aab40b309b6d9f3f2
-- 
2.35.6
