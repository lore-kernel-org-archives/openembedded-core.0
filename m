Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 482D2D32D69
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 09:25:46 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.82432.1731403535222004954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Nov 2024 01:25:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=e8NeL6U7;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731403536; x=1762939536;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=HmIJ5/S6ZuiIGAsGDTvJ/3N5YWYW77bGdf9iuQy/Vuw=;
  b=e8NeL6U7WnugQdvSD2IqUq2bZypl/Q1FYfmQMnLvmHJxFAJQ4sOdwshZ
   +WDJbRlyWV29ONtVrmbbhDd+Ej2oMbMD+BaC3iDw631H9dGQslt7okKMG
   FOJsMx/QQoSsV4tsXJ78dFj5VWewsCqQKwLbEF/D8IEi2nuRQVa26aUL7
   4fTtVjsb1qhlpFEfKYjvSRVUOJQ6/ItVBwoMFew2Jv9oeGpgPzLPymIIm
   h9OCbBAcIn1agbSwgLH9N2NKRSawWnAXJVRAHPB59KldDXevQbHFfKepq
   +BZNZkPLXrvk9jUhb20EwktH8sl3YnPMXHS4RsAj1yOkOoDwpie5YWnpa
   w==;
X-CSE-ConnectionGUID: gn7rhw0TQBmCf7hmsSjf5g==
X-CSE-MsgGUID: KzC+Uvj/SOmsqHc20089ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="182315548"
X-IronPort-AV: E=Sophos;i="6.12,147,1728918000"; 
   d="scan'208";a="182315548"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 18:25:34 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 07F7DD6EAA
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:33 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9667828CD9
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 32D0E6BCC2
	for <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 18:25:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D5F461A000A;
	Tue, 12 Nov 2024 17:25:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 30/47] python3-flit-core: upgrade 3.9.0 -> 3.10.1
Date: Tue, 12 Nov 2024 17:24:26 +0800
Message-Id: <1731403483-21399-30-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28792.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28792.006
X-TMASE-Result: 10--13.406900-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/yUIIxwDaU5mrMVVFhl7NwvMwAYdq1VTXo2Sl
	82u3/XbpzXCukHGwyn2GOrQETBnJLVUasdkyfBDvOGTV4fFD6yDb4QM/D7zGtwvrbFcH4G2rhN0
	Kb2jI1UnJDvFr4liuHN7J5X5VmQ0MWrN4/58ppmK5x7uAXGEprWIw13TP8dlT/gMNehoKqTvom0
	18IDU8WU6ESzBNvR5hdskSexkA2tvNot95wtWvJt9JA2lmQRNUVBDQSDMig9EH8UzOewTxw+79D
	JRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOn6y0mNkW0aSYkAyCbA7KV5soi2XrUn/Jn6Kd
	MrRsL14qtq5d3cxkNRXaZD8cTk9uPyFvp0CxNDqs7tWLdVVbooGJpHTjK0doOEBIQS8+shQ=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Nov 2024 09:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207017

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- The sdist of "flit_core" now includes the corresponding tests
- flit publish can now use PyPI tokens stored in keyring
- The --python option can now take the path of a virtualenv folder, as an
  alternative to a Python executable
- Flit will work with current development versions of Pythona again
- The flit command line package now requires Python 3.8 or above
- The metadata in packages now has the names of optional dependency groups
  ("extras") normalised, complying with version 2.3 of the metadata standard
- The flit command line package now depends on pip
- Fix potential substitution of environment variables into passwords read
  from .pypirc files
- A warning is now shown when building packages which specify the old
  flit.buildapi backend, which should be replaced by flit_core.buildapi
- Avoid using the deprecated datetime.utcfromtimestamp()
- Flit now has a SECURITY.md file in the Github repository
- The tests for flit_core are no longer part of the installed package,
  reducing the size of the wheels

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-flit-core_3.9.0.bb => python3-flit-core_3.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-flit-core_3.9.0.bb => python3-flit-core_3.10.1.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb b/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-flit-core_3.9.0.bb
rename to meta/recipes-devtools/python/python3-flit-core_3.10.1.bb
index b0bef4b6b6..acd2f866f7 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "https://github.com/pypa/flit/issues"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41eb78fa8a872983a882c694a8305f08"
 
-SRC_URI[sha256sum] = "d75edf5eb324da20d53570a6a6f87f51e606eee8384925cd66a90611140844c7"
+SRC_URI[sha256sum] = "9c6258ae76d218ce60f9e39a43ca42006a3abcc5c44ea6bb2a1daa13857a8f1a"
 
 inherit pypi python_flit_core
 
-- 
2.34.1


