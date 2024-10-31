Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E90E6895D
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 08:34:35 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.7943.1730363672771790675
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 01:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Cp3UeTvJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730363673; x=1761899673;
  h=from:to:cc:subject:date:message-id;
  bh=xQmpV1cjqWLaEJSHcFj+j3t4pqG+e38YmtyPDs1SWUw=;
  b=Cp3UeTvJ7B/mSEhPcYuNCYBMry2DNxeUNkX54AEfNVjB80kPPMlPiuDN
   LAZMceNuaHtHDZZNxQCYe8ci8ed6QDMnYAblu10K5rgh/MSeNIM8xP6kn
   69xWZKWaLUEGXRCQuoI72ypyMFRf0MqTnUSibJHLYbtjkWL4+5eXVv069
   B7T1Wr7a34KQF8bnFHbJZ3wahCzrS5kZtffJETt3ltHQzdvJ/0nPozWMW
   Q19QKpP+2l7i0gGzXChkErse7vfOPkEqB4V/cFKusBdih3f4C77RC++0C
   FJIy9gIHv93MJ0PsQsyyiUroMpt87XXx1169V31YLK1ghMDBQxz7iAFXh
   g==;
X-CSE-ConnectionGUID: CoJ10LCDTlm76Dcb54relg==
X-CSE-MsgGUID: E0RSpm1QQTaC9UO5HoGUeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="178704498"
X-IronPort-AV: E=Sophos;i="6.11,247,1725289200"; 
   d="scan'208";a="178704498"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 17:34:31 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6DFA1D6EEE
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 17:34:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AA5F1D50A8
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 17:34:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 34237E2519
	for <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 17:34:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.135.104])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7C9BF1A000B;
	Thu, 31 Oct 2024 16:34:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-rdflib: upgrade 7.0.0 -> 7.1.1
Date: Thu, 31 Oct 2024 16:34:17 +0800
Message-Id: <1730363657-2753-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28764.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28764.006
X-TMASE-Result: 10-1.251000-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yXg2y0j5vXZGlEDhvi2wR87QarzCEH4/6oRM
	yN/ppM4nscy9L7UrjrsNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2h+t
	oLLKXwRGBkESMI05d4lzjFhM9hn+YXHEPHmpuRH0URSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0Nst
	CXmf87HI1EijIJpLgTGCd7ROKOCOcmrnqnTDII656Vf0lTACJnVhV2QNtVZG2M5bZrbDCZaUxns
	/yx0XZBH32GNbhT3QlGOOqYF781q/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Oct 2024 08:34:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206570

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2024.

Changelog:
 https://github.com/RDFLib/rdflib/blob/main/CHANGELOG.md#2024-10-17-rel

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rdflib_7.0.0.bb => python3-rdflib_7.1.1.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-rdflib_7.0.0.bb => python3-rdflib_7.1.1.bb} (71%)

diff --git a/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb b/meta/recipes-devtools/python/python3-rdflib_7.1.1.bb
similarity index 71%
rename from meta/recipes-devtools/python/python3-rdflib_7.0.0.bb
rename to meta/recipes-devtools/python/python3-rdflib_7.1.1.bb
index 4057c1dbbc..133c92ed4d 100644
--- a/meta/recipes-devtools/python/python3-rdflib_7.0.0.bb
+++ b/meta/recipes-devtools/python/python3-rdflib_7.1.1.bb
@@ -2,9 +2,9 @@ SUMMARY = "RDFLib is a pure Python package for working with RDF"
 HOMEPAGE = "https://github.com/RDFLib/rdflib"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=37d489c0cefe52a17e1d5007e196464a"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e1efde25e459057a815649b18cbefa5e"
 
-SRC_URI[sha256sum] = "9995eb8569428059b8c1affd26b25eac510d64f5043d9ce8c84e0d0036e995ae"
+SRC_URI[sha256sum] = "164de86bd3564558802ca983d84f6616a4a1a420c7a17a8152f5016076b2913e"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


