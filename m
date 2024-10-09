Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0985DCF045C
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:47 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.9171.1728452975929969153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gaA23DMi;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452983; x=1759988983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=k0VEccdknJil5apTvBN+Sj4rqjIoq40b1YjGu4MoLzE=;
  b=gaA23DMiemW4ABcJa++WvJKPKcpmFOob6Cmb7vLbg4kMIdpTasrXrbl4
   I/Uu0KNS2i3a1L1LB1JtzLxGaqYWHqUH6XSlhHvwMc03bvZyECguMG3zK
   usMWdPJYDfN6FDPPo+5+XbeWQhOHykyidjiXnyKpJB9Y2EZ9JXIO/zMSn
   5e4LXQW0mcIChEsnt+wwMSkW1vW9FN43zis3lydDB5eNSjyDa2umiDwY3
   qn6zlaSZMsi3N57Y5Bb8Hj9NE3E4SWcRUyLhLNkX/E04Yz0jJkhRYltVC
   aeulrKu4vVdn5RbuBCiO1Hwd8vJ79OKPhMGMqpZr2JMrACrudzo9J3sIB
   g==;
X-CSE-ConnectionGUID: IqSSyonTQU+5/554dBLQdw==
X-CSE-MsgGUID: KxXomesOS3CI7EiXFw3KHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="164586954"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="164586954"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:42 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 09E98CA1E6
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:40 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 52ECDD73AE
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E76F740B62
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9610D1A01E9;
	Wed,  9 Oct 2024 13:49:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 20/26] python3-sphinx-rtd-theme: upgrade 2.0.0 -> 3.0.0
Date: Wed,  9 Oct 2024 13:49:09 +0800
Message-Id: <1728452955-25051-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10--0.663800-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrgjDdudOPBHr7fZJfDdCIXDWa
	L54cc4WntQTfQKYWqkH04jAPpZVWNxglY9Pk0RnHLG6gc1cSnZyX2rvknNYlE0z5vzLEGq8Dopb
	WdYhJdxA/J14NuGnso/OL9Z54Rd4QYlldA0POS1I/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365bsv8btnBHZ9itz9kIuTkBq6vvxILmKK/HBRFJJyf5BJeGEkIgdGU7nX6C0ePs7A07aLm7
	9W+wVodran/qTMt7yJrB+u+trDKNNmXMPYmi5wF/3e56Ix2coYAnFevr/PDAKsTNnh81Df8h91f
	H358U4LoXQHOZY+Ezb9q0Q0oXxCB8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205328

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Trigger search modal on "Search docs" input focus
- Show hidden version in selector if it's the current active version
- Show version/language selectors below the title
- Docs: do not sign Git tag
- Docs: update the installation note
- Theme option flyout to enable/disable theme's flyout
- Populate html_context with READTHEDOCS_* environment variables
- Tests: sphinxdev tox environment installs Sphinx from master
- Docs: update releasing
- Adjust the expected test_basic output to match Sphinx 7.3+
- Addons: integrate with new beta addons flyout
- Remove html5shiv
- Remove Sphinx<5 compatibility leftovers
- Remove pytest warnings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...inx-rtd-theme_2.0.0.bb => python3-sphinx-rtd-theme_3.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx-rtd-theme_2.0.0.bb => python3-sphinx-rtd-theme_3.0.0.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_2.0.0.bb b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.0.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-sphinx-rtd-theme_2.0.0.bb
rename to meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.0.bb
index 22b4d96444..f02f1fe42d 100644
--- a/meta/recipes-devtools/python/python3-sphinx-rtd-theme_2.0.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-rtd-theme_3.0.0.bb
@@ -14,7 +14,7 @@ RDEPENDS:${PN} += " \
 
 PYPI_PACKAGE = "sphinx_rtd_theme"
 
-SRC_URI[sha256sum] = "bd5d7b80622406762073a04ef8fadc5f9151261563d47027de09910ce03afe6b"
+SRC_URI[sha256sum] = "905d67de03217fd3d76fbbdd992034ac8e77044ef8063a544dda1af74d409e08"
 UPSTREAM_CHECK_REGEX ?= "/sphinx-rtd-theme/(?P<pver>(\d+[\.\-_]*)+)/"
 
 inherit setuptools3 pypi
-- 
2.34.1


