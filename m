Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15268.1795517770774021141
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 02:56:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JnLUrjkz;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3198; q=dns/txt;
  s=iport01; t=1795517770; x=1796727370;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=F/VDp5LkrHbaeErrz0QMc0R6QsjD+Dx4wokNNPwULHg=;
  b=JnLUrjkzJf6NBcSTLXp3XMs2yNQ8AJRzqleTnhLvz8pZexMmf6ApLuKQ
   PRRH6QXMZBbXL3eH2jarJ9J8nFAlnBDTeTyN+MHttXZgFoY2C6wnuIHyA
   99v9nZEBIt/zlD4LzCLEmK3DPJZYXnrisOQEm6DhDEfv3zyC/AuTuU5uR
   EPfkyZrFeHAGo5sNV4jRQ9FHI40rmu0+nAv5CtN+DDFWUC4EiVbp1FsuG
   JDW1zqEDG96n/Ey7xFKjpC4G3JBjU27EXTWkphibBU1xa93StnJiA165F
   xITDAAuBIzPf5NwvN5Fc/6efalb5KXTDApBFBOYUEZMs9u+AM2oi+I2wU
   Q==;
X-CSE-ConnectionGUID: 2KfOB/dWTvGbgup1T9Dnjw==
X-CSE-MsgGUID: mf4OOlIwQ5W9jCFltL2UMA==
X-IPAS-Result: =?us-ascii?q?A0BYAwCCagVr/8tK/pBaglmDTGFCSZQqgiGeLIF+DwEBA?=
 =?us-ascii?q?Q83GgQBAZMpAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE?=
 =?us-ascii?q?4ZckEsBGAFdXESDAgGCdAIBumyCLIEBgykBgVTbPxWBOIVCiCR2hH0nGxuBc?=
 =?us-ascii?q?oR/gQWKBASCInoSjmuKGkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBB?=
 =?us-ascii?q?xsGBYEcgR6BEoEDXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJA?=
 =?us-ascii?q?RMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnHx4bDgIfE?=
 =?us-ascii?q?AYWIQsbGA1IESw3FRkEPm4HlBSCKHI9Ui8eggqldaERCiiDeYwklToaM6pym?=
 =?us-ascii?q?QikW4RqgWg8gVlwFYMiCUoZD4450kYjNT0BAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:YP8rc6qs8xHsXIIz92jd0memq5BeBmJMZBIvgKrLsJaIsI4StFCzt
 garIBnUOf2DMTGhctF/aYy//UtV6JXRmN83SVFsrCsyEXwW8ePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8sj/zgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8kg35pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0rxUD0Zks
 vAnFC4iZB+en7uKkZ69SPY506zPLOGzVG8eknht13TdSP0hW52GG/+M7t5D1zB2jcdLdRrcT
 5NFNXw1MUiGPEEJYA9MYH49tL/Aan3XeiZAoUiQrLAf6GnIxws327/oWDbQUoLSHJUNxxzCz
 o7A12H3XjY9MP2A8Ge6o3CHqOvTuXnGfatHQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QyXj66R6AGDCy1cFHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:S6r6BqsUQYzW5QCGCW0PH9yp7skDRtV00zEX/kB9WHVpm6uj5q
 KTdZsguyMc5Ax9ZJhCo6HiBED/exLhHPdOiOF7V4tKNzOIhILHFu1fBPPZowHIKmnZ6vNX07
 tmfuxVDd39CkU/sOPBiTPIdurJBLK8gceVbSC09QYIcT1X
X-Talos-CUID: 9a23:zWQvc2/M1PUwcC0b8AyVvxQ3FOcPNXHi8Gn/KUClET9VGZGTS0DFrQ==
X-Talos-MUID: 9a23:Gl0HmQZDqrG3L+BTsjGwoxZmFdhRvpv/CmsjlYki4fShHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,230,1787011200"; 
   d="scan'208";a="60180122"
Received: from aer-l-core-02.cisco.com ([144.254.74.203])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 10:56:08 +0000
Received: from sjc-ads-20495.cisco.com (sjc-ads-20495.cisco.com [171.70.188.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-02.cisco.com (Postfix) with ESMTPS id 57FCD1800017B
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:56:08 +0000 (GMT)
Received: by sjc-ads-20495.cisco.com (Postfix, from userid 1877012)
	id 0A31DCC1634; Tue, 24 Nov 2026 02:56:07 -0800 (PST)
From: "Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <asparmar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][blacksail][PATCH 00/10] openssh: Security fixes (2026-11-24)
Date: Tue, 24 Nov 2026 02:55:23 -0800
Message-Id: <20261124105533.348654-1-asparmar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-20495.cisco.com [171.70.188.248];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.188.248, sjc-ads-20495.cisco.com
X-Outbound-Node: aer-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 10:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251008
Content-Type: text/plain; charset="utf-8"

From: Ashishkumar Parmar <asparmar@cisco.com>

This series addresses eleven OpenSSH CVEs in the current Blacksail
openssh recipe. Eight patches backport upstream fixes; two set
CVE_STATUS for issues whose affected platform-specific code does
not apply to the configured Linux build.

The current Blacksail recipe already includes fixes for:

  CVE-2026-73283
  CVE-2026-73282
  CVE-2026-73281

Those fixes are part of the baseline and are not included or resent
in this ten-patch series.

The upstream-fix backports cover CVE-2026-106584,
CVE-2026-106586, CVE-2026-106587, CVE-2026-106582,
CVE-2026-106585, CVE-2026-106583, CVE-2026-106552,
CVE-2026-106553, and CVE-2026-106555. One patch addresses
both CVE-2026-106553 and CVE-2026-106555.

The CVE_STATUS patches address CVE-2026-106588 and
CVE-2026-106589.

Ashishkumar Parmar (10):
  openssh: Fix CVE-2026-106584
  openssh: Fix CVE-2026-106586
  openssh: Fix CVE-2026-106587
  openssh: Fix CVE-2026-106582
  openssh: Fix CVE-2026-106585
  openssh: Ignore CVE-2026-106588
  openssh: Ignore CVE-2026-106589
  openssh: Fix CVE-2026-106583
  openssh: Fix CVE-2026-106552
  openssh: Fix CVE-2026-106553 and CVE-2026-106555

 .../openssh/openssh/CVE-2026-106552.patch     |  62 ++++++++++++
 .../CVE-2026-106553_CVE-2026-106555_p1.patch  | 106 +++++++++++++++++++++
 .../CVE-2026-106553_CVE-2026-106555_p2.patch  |  81 ++++++++++++++++
 .../CVE-2026-106553_CVE-2026-106555_p3.patch  |  56 +++++++++++
 .../openssh/openssh/CVE-2026-106582.patch     |  98 +++++++++++++++++++
 .../openssh/openssh/CVE-2026-106583.patch     |  42 ++++++++
 .../openssh/openssh/CVE-2026-106584.patch     |  35 +++++++
 .../openssh/openssh/CVE-2026-106585.patch     |  38 ++++++++
 .../openssh/openssh/CVE-2026-106586_p1.patch  |  36 +++++++
 .../openssh/openssh/CVE-2026-106586_p2.patch  |  98 +++++++++++++++++++
 .../openssh/openssh/CVE-2026-106586_p3.patch  |  35 +++++++
 .../openssh/openssh/CVE-2026-106587.patch     |  56 +++++++++++
 .../openssh/openssh_10.5p1.bb                 |  14 +++
 13 files changed, 757 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106552.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p1.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p2.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106553_CVE-2026-106555_p3.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106582.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106583.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106584.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106585.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p1.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p2.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106586_p3.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-106587.patch


base-commit: 5b458838c126051c884c8cb5225c7265d1483ea6
-- 
2.35.6

