Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECDB5CF0457
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:46 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.9175.1728452983448733881
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tf+qxy4i;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452983; x=1759988983;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8HWLmJBGSlxX02CCL5l+fhn40dZnqoXmnFdxlQ+vEDo=;
  b=tf+qxy4iFKKWK4TsQzhYBbWHxbnBf6qQTExfXY1h5YwOVy2mYlTT33Dt
   405tJAdvgWaJvvDmEvvRUwBIZJhWrw9cKr8EFQ6xzPHvdWev6+lZQ+SXe
   c5iCpLugXbLFQP/zF/bf+aKt1exlywfdDir1IBn4RHw9fw6NPkp/FOjMC
   zJN1Gra/3eD8uJn3PtntzTeQpq5i9AVnr2AHvhv2cEjvD3HxS/mmg4Lff
   FlXH/eVkww9lxil9MfTR9rRzdXp+a7gpMhqrlGo/Jra4kwXuRYiasO89E
   STTQphpxuK+Jx5xzXRFij4XbhtlE+Z5Bpuj9OFLxDCFhex+pMgqXZSzI3
   Q==;
X-CSE-ConnectionGUID: 1MS27ezuTfKFDE6i5hkoCg==
X-CSE-MsgGUID: Mg8et68YQ6uCzIq2vn9jBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="164232535"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="164232535"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:41 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 321D6C9444
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:39 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7D5BFD3F28
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:38 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A6AFE5A18
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:38 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BDDBC1A01E9;
	Wed,  9 Oct 2024 13:49:37 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/26] python3-setuptools-rust: upgrade 1.10.1 -> 1.10.2
Date: Wed,  9 Oct 2024 13:49:07 +0800
Message-Id: <1728452955-25051-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10-1.966400-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysTxwvzfR5Qyr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIN8pqleQItEF1vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzAkhhULGF4y6TMw
	ABXb9CqbJ/g3H8xxdOZSiLS4OC34IJQ7ep1VRF7DGWCPgawd6gYJOBghPnDYzqAKjgbQCNSuc85
	JMQ2ATUiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205329

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix deprecation warning from use of wheel.bdist_wheel.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...uptools-rust_1.10.1.bb => python3-setuptools-rust_1.10.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.10.1.bb => python3-setuptools-rust_1.10.2.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.10.2.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.10.2.bb
index d2881e9101..a58d57ac70 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.10.2.bb
@@ -9,7 +9,7 @@ BUGTRACKER = "https://github.com/PyO3/setuptools-rust/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 
-SRC_URI[sha256sum] = "d79035fc54cdf9342e9edf4b009491ecab06c3a652b37c3c137c7ba85547d3e6"
+SRC_URI[sha256sum] = "5d73e7eee5f87a6417285b617c97088a7c20d1a70fcea60e3bdc94ff567c29dc"
 
 PYPI_PACKAGE = "setuptools_rust"
 
-- 
2.34.1


