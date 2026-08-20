Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E558CC5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 09:38:06 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3584.1787218682449457310
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 02:38:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=jUriZKFE;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1436; q=dns/txt;
  s=iport01; t=1787218682; x=1788428282;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Q8IfMPfCEz9BnLMiNDDKAZwRhajVWn4fz982INMzNZs=;
  b=jUriZKFE3kh1LXOzmH0wASwsu8G4C9J73zyR2qD+UXuN05AfDuN2zyYX
   rqReOtwrXLyXU+3G2b53jb9EdaAGsK0eadpEJXR3ULP/ipjFSiF6Ss2bs
   8242UwCsbLuXzF5PPJfJhcA7stI41slssQGgFHsXvLzw8HQEGWHhrwEWl
   ohhpN0m6a518fYHcPnk0NzohEZpd5YJifo77WNXHT2zyWusjiGu2QM1Qq
   FOmwynE37NUlWnzpvdRKJtFXtndUe53GPQ/mjXd3s2jFtXQtE6upCjkfM
   Hq7Y3V5kQn31YFG6KTGAV2x86Y5YSmkRGjlnA8BmkoB9NsXXzJ7RjH0DO
   Q==;
X-CSE-ConnectionGUID: eMXILuY2TLa4Ln5/p7m99Q==
X-CSE-MsgGUID: 8CSN4Y2hS6el0eFUio4gJg==
X-IPAS-Result: =?us-ascii?q?A0AxAwARyoZq/5EQJK1RCYJZgld0XkNJk1kBgnCgHA8BA?=
 =?us-ascii?q?QEPNxoEAQGFBY1tAiY3Bg4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFg?=
 =?us-ascii?q?Q4ThlyGXTYBGAEtMFxEgwIBgnQDEcJKgiyBAYMoAYFU2zABCxQBBYEzhT+II?=
 =?us-ascii?q?naEfCcbG4FyhH6ECg15hXgEgg0VgQyBeIYriydIgR4DWSwBVRMNCgsHBYFmA?=
 =?us-ascii?q?zUSKhVuMh2BIz4XgQ0bBgWBHYEohDcjGTZ8gQlegSsqYQESF4EJggoCgnCCB?=
 =?us-ascii?q?gIBSUUOCRcLGA1IESw3FBkEPm4HjlEggks9UQGCZqVnoQ8KKIN2jCGVOhozq?=
 =?us-ascii?q?mwumFqkWoRpgX4mgVlwFYMiCUoZD95cJzICPQcCBw8CkXOBfgEB?=
IronPort-Data: A9a23:THv2fqAKM+AxzhVW/3/iw5YqxClBgxIJ4kV8jS/XYbTApDgh02cDy
 2oXXTqEP/6PMDamLd52Oo/l8EoEsJKAztJkOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZvCCeA+n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXmthh
 fuo+5eBYA/8imYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TEztBeLWUrDNck3u8rJWcTs
 uRHLWFcV0XW7w626OrTpuhEj8AnKozveYgYoHwllWGfBvc9SpeFSKLPjTNa9G5v3YYVQ7CHO
 YxANWcHgBfoO3WjPn8bBYw3mvyonlH0ciZTrxSeoq9fD237nFUgiuC3b4qPEjCMbZV+pWDEl
 zjGxDr0BkkXGuGezmaK0H3504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFC8u/SRjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxoYXZ9UVuY98gzIkvqS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6tV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:1JnI2a5tF4EZnPTDywPXwOTXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBKLZslnd8lXFh41g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:NfYEXGC9IvXOJ3v6EyRCxG8wB/F/TlnUkFPWfgigVmM4GYTAHA==
X-Talos-MUID: =?us-ascii?q?9a23=3A+D+iBg4Kf9JfGBTnyi02bPFZxow4yJ+IVHFXka5?=
 =?us-ascii?q?Yts3cOAJNOjDBgxa4F9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="819202782"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 09:38:01 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id 6FAB91800074C;
	Thu, 20 Aug 2026 09:38:01 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id 0DE07CC12A6; Thu, 20 Aug 2026 02:38:01 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][PATCH] python3-pycryptodomex: add shared CVE_PRODUCT identity
Date: Thu, 20 Aug 2026 02:38:01 -0700
Message-Id: <20260820093801.43714-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 09:38:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243846

From: Devansh Patel <devanshp@cisco.com>

The current pycryptodome:pycryptodomex mapping is an active NVD
dictionary CPE and NVD vulnerability-configuration identity. It reaches
CVE-2023-52323 but misses CVE-2018-15560, whose NVD configuration uses
pycryptodome:pycryptodome, another active dictionary CPE.

PyCryptodome and PyCryptodomex are built from the same upstream source,
and the affected AESNI source is also shipped by PyCryptodomex.

Add the shared active identity while retaining the existing dedicated
identity. This makes CVE-2018-15560 properly report as patched.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
index 148409c8d9..e2120d9972 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.23.0.bb
@@ -3,7 +3,7 @@ inherit python_setuptools_build_meta
 
 SRC_URI[sha256sum] = "71909758f010c82bc99b0abf4ea12012c98962fbf0583c2164f8b84533c2e4da"
 
-CVE_PRODUCT = "pycryptodome:pycryptodomex"
+CVE_PRODUCT = "pycryptodome:pycryptodome pycryptodome:pycryptodomex"
 
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.35.6

