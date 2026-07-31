Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129CDC54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 05:56:43 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.698.1785477394175301809
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 22:56:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JQ8pEjh8;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7161; q=dns/txt;
  s=iport01; t=1785477394; x=1786686994;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=VzA5Fg7ah2c5nDu5H/dBzuAyb7m0taxw/kLyKqyQdMI=;
  b=JQ8pEjh84Hj+3iFVZxBiloHBk0L90GvrXRBeTLY2Mkf5qtLzTE5pRli0
   SmPxIs757tkTxzfyC60vxwMjSkdUl2VvyWl/ygyfurUdd4D64+IuZEf11
   wr6R8knrsGywdDYduWfOzTyTXZMav2pq5VVSMCOIiolJ0UGitE9WJx8KZ
   WV9l+Otjk4DZz9dm3zXCz5x26ey4DQuzJL6CDuAklnBaiHiDvjdPQ89Os
   bVWmMt7aEa0GUxNaFi1rSlqBFr1XtgPFD+k/yIBJq4fGV5keJtCQV3RWx
   PZ1MyWldymcbuNxGjLuQ1qcvlfBnH84g9NEP9lrLTlp/6E9IFadL141lQ
   w==;
X-CSE-ConnectionGUID: 0semIh++Rk6fOCd/jXog6Q==
X-CSE-MsgGUID: AOePkZ4rSEqn1jIzRXGkUA==
X-IPAS-Result: =?us-ascii?q?A0BhAwBvN2xq/4v/Ja1aglmDS19CSZQpgiEDnhsUgWoPA?=
 =?us-ascii?q?QEBD0QNBAEBhD9GAo1mAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhlsCAQMyARgBGyIgMSsrEQiDAgGCdAMRuwuCLIEBgygBgVTbO?=
 =?us-ascii?q?hWBOIU/iCB1hHwnGxuBcoR+gmECgUYEB4ZUBIINFXoSgyqFLIlfSIEeA1ksA?=
 =?us-ascii?q?VUTDQoLBwWBZgM1EioVbjIdgSM+F4ENGwcFgR2BKy+EUyMZNnyBL3VKdS1qE?=
 =?us-ascii?q?heBGoMxAoJfAwsYDUgRLDcUGQQ+bgeNaSCCPwEwDC0kAQckBYFSVRiTIJAdg?=
 =?us-ascii?q?h6hEgoog3WMIZU6GjOqbJkIjgqVcw1QhGmBaDyBQw8HcBU7gmcJShkPkiPOQ?=
 =?us-ascii?q?jw1AgkyAgcCBw4DC5FpASYHgU8BAQ?=
IronPort-Data: A9a23:Dca2Z6DnGLN/lxVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApGkkhGcFz
 moXDG6APvyJYTP1f4h2b47k9UoOuJOHy9BgOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYAD+g2YuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEm+5jCWA2fs4i+bh5JkpCs
 v4oLz9TV0XW7w626OrTpuhEnM8vKozveYgYoHwllWufBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGE+BPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FEoj+C8a4eII7RmQ+18uUugp
 VCa5V/UGxdDNv2N8wqq8U+F07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR6wpuO0okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/KOpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:azcb66o98VjT+EPbEkptWS8aV5oHeYIsimQD101hICG9Ffbo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a485+oJjsaEp2JKGxCe2CmLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3A8u5GkWhEDpZd1WeQz+i+RcmGBTJuKmbQyVbQYAy?=
 =?us-ascii?q?CCjhnb5aZDl2g/6w6qp87?=
X-Talos-MUID: 9a23:s0wfWAYVogQHYuBTnhjhvDJQaN1Tzr2oUUIsg682lMq5HHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,195,1779148800"; 
   d="scan'208";a="517093551"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 31 Jul 2026 05:56:33 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id EC0FE18000222
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:56:32 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 0AD4ECC037D; Fri, 31 Jul 2026 11:26:31 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 00/10] expat: Security fixes
Date: Fri, 31 Jul 2026 11:26:15 +0530
Message-Id: <20260731055625.4187716-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260717060437.2910653-1-deeratho@cisco.com>
References: <20260717060437.2910653-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 05:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242397

From: Deepak Rathore <deeratho@cisco.com>

This series backports security fixes for Expat 2.6.4 in Scarthgap.
The listed CVEs affect versions before 2.8.2, so this series carries
the relevant upstream fixes instead of upgrading the stable-branch
recipe.

Changes in v2:
- Rebased the series on current Scarthgap after upstream added Expat
  CVE-2026-41080-* and CVE-2026-45186-* patch entries.
- Appended this series after the current upstream Expat CVE patch stack,
  ending at CVE-2026-45186-07.patch.
- Removed the stale Backport Changes section from CVE-2026-56408 because
  its effective hunk lines match the referenced upstream commit.

- CVE-2026-56403: Signed integer overflow in storeAtts namespace URI
  construction, with related xcsdup overflow hardening from the same
  upstream pull request. Fixed by adding overflow guards before length
  conversion, allocation, and copy operations.
  Upstream: https://github.com/libexpat/libexpat/commit/12dc6d8d3d65f79471a94d8565f6bf1cf245f648
            https://github.com/libexpat/libexpat/commit/147c8f36d6277d5c6011c098370a8362aed47b15

- CVE-2026-56408: copyString could overflow while calculating the
  allocation size for a copied string. Fixed by adding the upstream
  allocation overflow guard while keeping the Scarthgap 2.6.4 loop
  structure.
  Upstream: https://github.com/libexpat/libexpat/commit/16e2efd867ea8567ffa012210b52ef5918e20817

- CVE-2026-56404: addBinding could hit signed integer overflow while
  calculating namespace binding lengths. Fixed by adding upstream
  length and allocation bounds checks in the binding path.
  Upstream: https://github.com/libexpat/libexpat/commit/babfc48090977cbf7be24b2c48f6053dca75c164

- CVE-2026-56405: getAttributeId could hit signed integer overflow
  while sizing attribute ID storage. Fixed by applying the upstream
  overflow checks around the attribute name allocation.
  Upstream: https://github.com/libexpat/libexpat/commit/2c6c42d33689f6b266a5267b639e03cde17e53c0

- CVE-2026-56410: xmlwf resolveSystemId could overflow while joining
  base and system identifiers. Fixed by guarding both the length sum
  and the allocation multiplication.
  Upstream: https://github.com/libexpat/libexpat/commit/deeb97f7c88d17a16b0ea2521a13733abc283347
            https://github.com/libexpat/libexpat/commit/cee20e91bf14dc7f6d2fc48f0d70d86b2dc3afea

- CVE-2026-56406: XML_ParseBuffer was missing the overflow protection
  already used by XML_Parse. Fixed by adding the XML_Index overflow
  check, with the prerequisite XML_INDEX_MAX helper backported first.
  Upstream: https://github.com/libexpat/libexpat/commit/252ff1a307b1490ce0f430632791e7e52d7e43fd
            https://github.com/libexpat/libexpat/commit/99d8454fdf900a6d00c2a52748e6c0eeb507574d

- CVE-2026-56409: xmlwf output path construction could overflow while
  joining output directory and file name components. Fixed by adding
  upstream bounds checks before allocation.
  Upstream: https://github.com/libexpat/libexpat/commit/61f7cdda22546c4bee38dd2d3fa3d6e4aa64d33e

- CVE-2026-56411: xmlwf notation list allocation could overflow while
  sizing the notation table. Fixed by applying the upstream allocation
  checks and adapting cleanup to the Scarthgap 2.6.4 code path.
  Upstream: https://github.com/libexpat/libexpat/commit/528a4e5017e1bd3b48b689fd0c131df940ae3ea5

- CVE-2026-56407: Entity textLen handling could exceed signed integer
  limits. Fixed by capping entity textLen before storing it in the
  signed field.
  Upstream: https://github.com/libexpat/libexpat/commit/30c2fc179ce5d2b1b1bae30bbe0dfddeac894e13

- CVE-2026-56132: Shared DTD scaffolding could store past the
  scaffIndex allocation after parser-specific group sizes diverged.
  Fixed by tracking scaffIndexSize separately, growing scaffIndex from
  its actual allocation size, and backporting the regression test and
  related follow-up cleanups.
  Upstream: https://github.com/libexpat/libexpat/commit/3a4eaf47af8fd7abda38ea2c08308c91152061f3
            https://github.com/libexpat/libexpat/commit/58400483d7c97be316d7a77739c0a6af5d55932e
            https://github.com/libexpat/libexpat/commit/353919b3b9f2174073a557ac7d517a5f3cd0cbbf
            https://github.com/libexpat/libexpat/commit/bca93b4ba9e15fd84425568d772b69baebf790e4
            https://github.com/libexpat/libexpat/commit/08baa7ef9d168b99094249998fd78f8d190526e5

Validation:
- Built expat successfully after applying the full series.
- Built core-image-minimal successfully with ptest packages enabled.

Deepak Rathore (10):
  expat: fix CVE-2026-56403
  expat: fix CVE-2026-56408
  expat: fix CVE-2026-56404
  expat: fix CVE-2026-56405
  expat: fix CVE-2026-56410
  expat: fix CVE-2026-56406
  expat: fix CVE-2026-56409
  expat: fix CVE-2026-56411
  expat: fix CVE-2026-56407
  expat: fix CVE-2026-56132

 .../expat/expat/CVE-2026-56132_p1.patch       | 80 ++++++++++++++++++
 .../expat/expat/CVE-2026-56132_p2.patch       | 60 ++++++++++++++
 .../expat/expat/CVE-2026-56132_p3.patch       | 74 +++++++++++++++++
 .../expat/expat/CVE-2026-56132_p4.patch       | 60 ++++++++++++++
 .../expat/expat/CVE-2026-56132_p5.patch       | 56 +++++++++++++
 .../expat/expat/CVE-2026-56403_p1.patch       | 81 +++++++++++++++++++
 .../expat/expat/CVE-2026-56403_p2.patch       | 52 ++++++++++++
 .../expat/expat/CVE-2026-56404.patch          | 45 +++++++++++
 .../expat/expat/CVE-2026-56405.patch          | 30 +++++++
 .../expat/CVE-2026-56406-dependent.patch      | 59 ++++++++++++++
 .../expat/expat/CVE-2026-56406.patch          | 34 ++++++++
 .../expat/expat/CVE-2026-56407.patch          | 41 ++++++++++
 .../expat/expat/CVE-2026-56408.patch          | 29 +++++++
 .../expat/expat/CVE-2026-56409.patch          | 51 ++++++++++++
 .../expat/expat/CVE-2026-56410_p1.patch       | 46 +++++++++++
 .../expat/expat/CVE-2026-56410_p2.patch       | 39 +++++++++
 .../expat/expat/CVE-2026-56411.patch          | 50 ++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        | 17 ++++
 18 files changed, 904 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p3.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p4.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56132_p5.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56403_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56404.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56405.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406-dependent.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56406.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56407.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56408.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56409.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p1.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56410_p2.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56411.patch

-- 
2.35.6

