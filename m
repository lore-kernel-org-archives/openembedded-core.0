Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E578DC5DF8B
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:07:29 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3033.1787216847267349130
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:07:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RveaFJeq;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1314; q=dns/txt;
  s=iport01; t=1787216847; x=1788426447;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XDwH2qOc2NDL26WKBFG2Paj++kMNiT0CHij0GaNUUn4=;
  b=RveaFJeqAcdmGVAqlD5Wg7G2w3lcmWgXnixdXuuOgfxpL1WMvaxVAjdi
   DqV4n7ffgFbFzuvgKFJLlhSYgVyHUS1c46CKS+h5LH6eOHRiZlin5gbU8
   DVeZl1fTq4PE7QnLtfJGDRhIjbbBSth2MqAzfqNMefmGCs6HJpKlRyY7q
   Ont7XLwPIE7p4rmbNlwgdpNPySbotmmBndF3q0qhrrtbGbL4exqo6fY0f
   iCmjKewDrARFabaRu5c/FrNwTwh5/oPWol1HyFgdQjk6slIWAgaf8+FYG
   GO7CFNgJffxvEvkiOVIPeNKR1Bsyagbmwc5hdVXWyledth4nd23pIhKUs
   A==;
X-CSE-ConnectionGUID: qWx7JGZmTg65gRj0qcHqug==
X-CSE-MsgGUID: EcsRxr+RRl2wRz1oulRriQ==
X-IPAS-Result: =?us-ascii?q?A0BCAgAdw4Zq/40QJK1aglmCV3ReQ0mTWQGhDhSBag8BA?=
 =?us-ascii?q?QEPNxoEAQGFBY1tAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4ThlyGXSsLARgBLTBcRIMCAYJ0A8IMN4FZIDOBAYMoAYFU2zABCxQBBYEzh?=
 =?us-ascii?q?T+IInaEfCcbG4FyhH6EBIEMhXgEgiKBDIF4kVJIgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQ0bBgWBHYEohDcjGTZ8gQlegSsqYQESF4EJggoCgnCCB?=
 =?us-ascii?q?gIBSUUOCRcLGA1IESw3FBkEPm4HjlEggkuBDoFEpwqhDwoog3aMIZU6GjOqb?=
 =?us-ascii?q?C6YWqRahGmBaDyBWXAVgyIJShkP3lwnMgI7AgcCBw4DC5FqgR9dAQE?=
IronPort-Data: A9a23:NSD/sK8ini44Is1iWNA/DrUD1n+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 zEXXGDUbqyKZGDyKI92aoq28E5Q6MLUzoVhQAVtqyBEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsYjtFs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kvAp1H2MlFBF1Bq
 6EXEjJVdxujnv+5lefTpulE3qzPLeHiOIcZ/3UlxjbDALN+HdbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cOnWjOX9PYH46tOulmHD5aD1AgFmUvqEwpWPUyWSd1ZC9aYuMJIzVGZ09ckCwi
 2ndxXTjQSsgMIaA8yjc9W+ovPXOpHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPBWi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:xmEV/K/PDSeoeJ1PDPNuk+D0I+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WLK+UyFJ8SHzJ8/6Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:PCTtVGHNaW/Ak5X2qmJ+y15LOO8Xd0HSkirfGU3gEG1JUaCaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3ANM5VXA/oSIHsM/IiHKfo2reQf+pj+J6+EgM3q5F?=
 =?us-ascii?q?cpPOWbCttPw2HjQ3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="819168740"
Received: from alln-l-core-04.cisco.com ([173.36.16.141])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:07:26 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-04.cisco.com (Postfix) with ESMTPS id 4ABC2180004A8;
	Thu, 20 Aug 2026 09:07:26 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id DF02ECC12A7; Thu, 20 Aug 2026 02:07:25 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH] python3-click: fix CVE_PRODUCT
Date: Thu, 20 Aug 2026 02:07:25 -0700
Message-Id: <20260820090725.60696-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243827

From: Tim Orling <tim.orling@konsulko.com>

Recipe (PV): python3-click (8.1.7)
Before -> After python:click -> palletsprojects:click
Newly caught: CVE-2026-7246 (command injection in click.edit())
Status: unpatched (fixed 8.3.3)

Note: The original commit targeted python3-click_8.4.2.bb. This is
adjusted for Scarthgap, where the recipe version is 8.1.7. The unrelated
DESCRIPTION cleanup from the original commit is intentionally omitted.

AI-Generated: Claude Sonnet 5
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 30357a26d7ce490725d1b0ac3375047d00595a5c)
Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-click_8.1.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/python/python3-click_8.1.7.bb b/meta/recipes-devtools/python/python3-click_8.1.7.bb
index 7d91e1af83..b75d910889 100644
--- a/meta/recipes-devtools/python/python3-click_8.1.7.bb
+++ b/meta/recipes-devtools/python/python3-click_8.1.7.bb
@@ -14,6 +14,8 @@ inherit pypi setuptools3 ptest
 
 SRC_URI += "file://run-ptest"
 
+CVE_PRODUCT = "palletsprojects:click"
+
 RDEPENDS:${PN}-ptest += " \
 	python3-pytest \
 	python3-terminal \
-- 
2.35.6

