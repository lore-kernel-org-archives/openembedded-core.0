Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36922.1795588397491191052
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 22:33:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=AB6NO6fT;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3295; q=dns/txt;
  s=iport01; t=1795588397; x=1796797997;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zSdCilUVBhBqY4O1N3DnDDSsWeErZizbOtvqiYlpoAk=;
  b=AB6NO6fTFL5xx8dL/tlxtkVS/b+2Zi7YW1TXINFtr1sotPGt28XMBNxg
   Vxy6MlsItER8kO+Czd6wcpM9oojwmwVQiyzPorqmMJwgcN00YIEYkuC7e
   HQ6xR1Ol3xMUl2rcgUcIYOEGBlq5luXeo/ikUTsStKfyd+BaIHXhQMjgP
   N+Nqj1Yv9W0aplaabgc0tnR3lPl/2rn8dX5e6mbT/BKJVNd2MZHfUSVDZ
   qXfaOvRA+WJ1Y/N1UIi/eLhzBNnigxgnAsQjnGjJneN7/1qmm6QAsHanR
   oEBFfsUKqVsE6N5NsRFcv0RnaBUdODAL6eCUI2LMzVYInzpa+3KrbyrNc
   A==;
X-CSE-ConnectionGUID: UmybLqAmSwK5A2dawuv8Fw==
X-CSE-MsgGUID: DTNV55ohSUeEARM/ZSU5ZQ==
X-IPAS-Result: =?us-ascii?q?A0BcAwCufwZr/8xK/pBaglmDTGBDSQSTVgGCcJ4sgX4PA?=
 =?us-ascii?q?QEBD0QNBAEBhQWOJAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QFTYBGAEtMFxEgwIBgnQDEblRgiyBAYMpAYFU2z8VgTiFQogld?=
 =?us-ascii?q?oR+JxsbgXKEf4JhBBiIDASCInoSglYJjAiBS4hSSIEeA1ksAVUTDQoLBwWBa?=
 =?us-ascii?q?AM1EioVbjIdgSM7F4EHGwYFgRyBHoESgQNdgSsoXQEhgQiBdQKCUYIAAgFJQ?=
 =?us-ascii?q?Q4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHCQvB?=
 =?us-ascii?q?RkmPBsKgQwnHR4ZDgIpBhYhCzQYDUgRLDcVGQQ+bgeUE4IocxZ5BySCBAImk?=
 =?us-ascii?q?zeSPqERCiiDeYwklToaM6pymQiOCpZRhGqBaDyBWXAVO4IzAQEyCQpAGQ+OK?=
 =?us-ascii?q?wIXiHPJSCYyAgE6AQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:zOWMV6/kkpktSreuoPtGDrUD1H+TJUtcMsCJ2f8bNWPcYEJGY0x3x
 zMZUDiFb/yLZzHwfYgibIzjo00B7ZHWy9QwSwtqqi5EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazhJs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kLOJwS3v9eBFpR1
 qExcjwEcQ2d18yplefTpulE3qzPLeHiMZlavjRryivUSK59B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6YP3WjOX9PYH46tOuri332cixRgFmUvqEwpWPUyWSd1ZCzaIGIIYXXGq25mG60m
 kT4ojn+AionOfG28x/CwEmR2932yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRu13fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:1wj5Ta4yG5bLmAwEtQPXwP7XdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBPPZsl7dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrIdKB3tytHPuQ8YpE0dKj1XVw==
X-Talos-CUID: 9a23:FTLJZW9gFEIcBekNi5WVv3MRC8oBa1TY92jzfmbiBW92VaPFZ0DFrQ==
X-Talos-MUID: 9a23:qU+B6QY50i7mh+BTmwPKumw/M8dT3qmDIXoo1qc9hpS2DHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60353157"
Received: from aer-l-core-03.cisco.com ([144.254.74.204])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 06:33:15 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-03.cisco.com (Postfix) with ESMTPS id 02368180006F3;
	Wed, 25 Nov 2026 06:33:15 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 3E515CC1611; Tue, 24 Nov 2026 22:33:13 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 0/2] expat: backport two CVE fixes (25-11-2026)
Date: Tue, 24 Nov 2026 22:33:07 -0800
Message-Id: <20261125063309.3652971-1-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 06:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251164
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport two additional Expat security fixes to 2.8.3 on Wrynose.
Apply these patches after my earlier three-patch series [1], with
the v2 replacement for patch 3/3, CVE-2026-118370 [2]. The recipe
updates follow v2's removal of the separate tokenizer-count patch.

CVE-2026-115506 adds early entity-expansion checks, together with the
required string and hash helpers, their corrections and regression
tests. Include upstream's follow-up handling for CDATA sections,
comments and processing instructions.

Convert the projected XML_Char-unit count to bytes with checked
multiplication, correcting the upstream preflight's UTF-16 undercount.
Include a bounded regression requiring rejection before any character
data reaches the application.

CVE-2026-124317 checks that a complete multibyte sequence is available
before invoking an application's unknown-encoding conversion callback.
Its regression test uses the XML_Char helpers introduced by the first
patch, so apply the patches in order.

[1] https://patchwork.yoctoproject.org/project/oe-core/list/?series=52975
[2] https://patchwork.yoctoproject.org/project/oe-core/patch/20261124171628.1617804-1-dkelaiya%40cisco.com/

Darsh Kelaiya (2):
  expat: fix CVE-2026-115506
  expat: fix CVE-2026-124317

 .../expat/expat/CVE-2026-115506-dependent_p1.patch |  33 +
 .../expat/expat/CVE-2026-115506-dependent_p2.patch | 297 ++++++++
 .../expat/expat/CVE-2026-115506-dependent_p3.patch |  61 ++
 .../expat/expat/CVE-2026-115506-dependent_p4.patch |  95 +++
 .../expat/expat/CVE-2026-115506-dependent_p5.patch | 240 ++++++
 .../expat/expat/CVE-2026-115506-dependent_p6.patch |  57 ++
 .../expat/expat/CVE-2026-115506-dependent_p7.patch | 106 +++
 .../expat/expat/CVE-2026-115506-dependent_p8.patch |  60 ++
 .../expat/expat/CVE-2026-115506_p1.patch           | 815 +++++++++++++++++++++
 .../expat/expat/CVE-2026-115506_p2.patch           | 255 +++++++
 .../expat/expat/CVE-2026-115506_p3.patch           | 701 ++++++++++++++++++
 .../expat/expat/CVE-2026-124317_p1.patch           |  54 ++
 .../expat/expat/CVE-2026-124317_p2.patch           | 106 +++
 meta/recipes-core/expat/expat_2.8.3.bb             |  13 +
 14 files changed, 2893 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p3.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p4.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p5.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p6.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p7.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506-dependent_p8.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-115506_p3.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-124317_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-124317_p2.patch

-- 
2.35.6
