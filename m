Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36468.1795585637020144357
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:47:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Aajwl2Jp;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2897; q=dns/txt;
  s=iport01; t=1795585637; x=1796795237;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HfKwJynYF40AROgUuNU8jVKg/w3n3+yXiCmoTU3xhKc=;
  b=Aajwl2JpWcRnbz6pAddFAvK1GuB2HzmP5Jk9PCMIRflPfxtDOyBUMFjE
   g1129mK43eO8H1VGjl0eGG8C3G6Zy8G+a1Sz6fxaRQilFr+a1sR0kR37f
   7hcMaDW/Fs5AAY8ofUQzMze5hg/KQU3Wi10cf00nVov1naI1vJO6ReGaw
   7FbhYzqaUvc2Zk0oKYzjYC7ulNgVxSdV4QUuoXv8SgvufCQ4CRP7n5rKs
   LCYughjWISULktKzenMuFwKJ0FFN02O2Vcs4i9eJbvdxPkd7aWD/pHKH2
   vnY55IubokKvvhoNS/0/j5QP9k56OpafWzbbysnKlZ0cx3XnsO+/xQMyU
   g==;
X-CSE-ConnectionGUID: tNOv4KuFSGWIuHVn0U8zxQ==
X-CSE-MsgGUID: FGzxrO46Tr+fEpN/wm8Rig==
X-IPAS-Result: =?us-ascii?q?A0BXAwB8dQZr/81K/pBaglmDTGBDSZQqoE2Bfg8BAQEPN?=
 =?us-ascii?q?xoEAQGTKQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGX?=
 =?us-ascii?q?JBLARgBXVxEgwIBgnQDugCCLIEBgykBgVTbPxWBOIVCiCV2hH4nGxuBcoR/g?=
 =?us-ascii?q?QWEC4V5BIIiehKOZ4odSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHG?=
 =?us-ascii?q?wYFgRyBHoESgQNdgSsoXiGBCIF1AoJRggACAUlBDgdFUwklQxJHJCIIEgkBE?=
 =?us-ascii?q?xosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAcJC8FGSY8GwqBDCcdHhkOAikGF?=
 =?us-ascii?q?iELNBgNSBEsNxUZBD5uB5QTgilygQ8vHoIKpXWhEQoog3mMJJU6GjOqcpkIp?=
 =?us-ascii?q?FuEaoFoPIFZcBWDIglKGQ+OOdJGJjI9AQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:ocXKKKJ4RPg41RArFE+RhJQlxSXFcZb7ZxGr2PjKsXjdYENS0DYAn
 DZJDzrTb6zZZGbzco1+Ot++p0xX7ceDyNVhSQMd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea9k3wWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmQpajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1yKmYoYa4F1N1YPkBT1
 cIecA1dfAC60rfeLLKTEoGAh+wqIdOuOMYUvWttiGmFS/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A3MXwsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FIrgeG2bIaMEjCMbet6jFaCg
 T6Yw366DDwCEpuAzGq/833504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxMGHt4VGOog5UTVluzf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ22FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:ycOs+6iqRMV7YzYnqoNueQeTIHBQXuoji2hC6mlwRA09TyX+rb
 HNoB1173HJYVoqNU3I+urwW5VoP0m8yXcd2+B4Vt2ftWLd11dAQrsP0WKb+V3dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrMdKB3tytHOuQ8YpE0dKT1XVw==
X-Talos-CUID: 9a23:YbMwYm9C80KjxsHX0a6Vv1IyPd55UWDz91jvAlKYN2Axde2HWWbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3A1ZPahA+wt3fsxDv9CGHKhnWQf+lH8bS0LxxTrY9?=
 =?us-ascii?q?FteScE2tvPmenjTviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="62913441"
Received: from aer-l-core-04.cisco.com ([144.254.74.205])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 05:47:13 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-04.cisco.com (Postfix) with ESMTPS id C833F180004CB
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:47:12 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 77856CC1611; Tue, 24 Nov 2026 21:47:11 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 00/10] openssh: Security fixes (2026/11/25)
Date: Tue, 24 Nov 2026 21:47:01 -0800
Message-Id: <20261125054711.2691239-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:47:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251146
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This series addresses eleven OpenSSH CVEs in the Wrynose
openssh 10.3p1 recipe. Eight patches backport upstream fixes;
two set CVE_STATUS for issues whose affected platform-specific
code does not apply to the Wrynose Linux build.

The upstream-fix backports cover CVE-2026-106584,
CVE-2026-106586, CVE-2026-106587, CVE-2026-106582,
CVE-2026-106585, CVE-2026-106583, CVE-2026-106552,
CVE-2026-106553, and CVE-2026-106555. One patch addresses
both CVE-2026-106553 and CVE-2026-106555.

The CVE_STATUS patches address CVE-2026-106588 and
CVE-2026-106589.

Hetvi Thakar (10):
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

 .../openssh/openssh/CVE-2026-106552.patch     |  63 +++++++++++
 .../CVE-2026-106553_CVE-2026-106555_p1.patch  | 100 +++++++++++++++++
 .../CVE-2026-106553_CVE-2026-106555_p2.patch  |  80 ++++++++++++++
 .../CVE-2026-106553_CVE-2026-106555_p3.patch  |  42 ++++++++
 .../openssh/openssh/CVE-2026-106582.patch     |  97 +++++++++++++++++
 .../openssh/openssh/CVE-2026-106583.patch     |  35 ++++++
 .../openssh/openssh/CVE-2026-106584.patch     |  39 +++++++
 .../openssh/openssh/CVE-2026-106585.patch     |  44 ++++++++
 .../openssh/openssh/CVE-2026-106586_p1.patch  |  39 +++++++
 .../openssh/openssh/CVE-2026-106586_p2.patch  | 101 ++++++++++++++++++
 .../openssh/openssh/CVE-2026-106586_p3.patch  |  39 +++++++
 .../openssh/openssh/CVE-2026-106587.patch     |  62 +++++++++++
 .../openssh/openssh_10.3p1.bb                 |  14 +++
 13 files changed, 755 insertions(+)
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

-- 
2.35.6

