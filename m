Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060E6CD3437
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 08:33:29 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.18513.1725352396205964088
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Sep 2024 01:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TSz9gRC/;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1725352400; x=1756888400;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=u4x08atNZLT4tzVCrckF36qzxdsL3RSJptSZJWffQ04=;
  b=TSz9gRC/cTiPOf91ehxmrUhDQoFcf3v5cesR8iRKuabhHmYTqdvba8du
   3uYR4gLJEK7DK4yzFQI4BoTgm5Y472VjA3sBkWKuvqJo2MZV8NgM6bD8z
   KK5NPtknyRLXIHFrYa2Y348mf304+a9dDYN9KVcEDPJ7gx5Lm6lDuOQrd
   O7MJRpSMkOOQql3oGPuxmuyo3BqE0b6dWbz1h8c1M0iEGTAB4fcfCse0P
   O/7pKU3LZNEYTDsMACTckG49amZvd84hhdsWZ3rbIPG6x8G6RKWwEOmbk
   qiZNX3EX5onHqbYwuV8W5mhB79Sqo3/IawuArzOdWD355fyOHG4fMBoKy
   g==;
X-CSE-ConnectionGUID: A7JfDkWgRXimDIXoMqXtqQ==
X-CSE-MsgGUID: xemRzzxFQgSvMGpwyBS4NA==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="151981189"
X-IronPort-AV: E=Sophos;i="6.10,198,1719846000"; 
   d="scan'208";a="151981189"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 17:33:19 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8705FD6473
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C0A3CD73A0
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 511166C811
	for <openembedded-core@lists.openembedded.org>; Tue,  3 Sep 2024 17:33:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E900B1A000D;
	Tue,  3 Sep 2024 16:33:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 15/22] python3-idna: upgrade 3.7 -> 3.8
Date: Tue,  3 Sep 2024 16:32:52 +0800
Message-Id: <1725352379-20334-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
References: <1725352379-20334-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28638.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28638.006
X-TMASE-Result: 10--1.583300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvozDhGeQC9Evq6
	5RK/zjY14CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDKIp/k2x3jvkRAISLmT6dDEHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w69h5
	cOe4A+qCE+dpv+bO3BLjsGBgFDytRza7La7aSq52T2tTD7Bn6v2nr3cday0JPnPtswch4lcNYVG
	R+K93Z9CxYaE6lJOhGCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 08:33:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204139

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix regression where IDNAError exception was not being produced for certain inputs.
- Add support for Python 3.13, drop support for Python 3.5 as it is no longer testable.
- Documentation improvements
- Updates to package testing using Github actions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-idna_3.7.bb => python3-idna_3.8.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-idna_3.7.bb => python3-idna_3.8.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-idna_3.7.bb b/meta/recipes-devtools/python/python3-idna_3.8.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-idna_3.7.bb
rename to meta/recipes-devtools/python/python3-idna_3.8.bb
index 713e803d03..95c3c8cc44 100644
--- a/meta/recipes-devtools/python/python3-idna_3.7.bb
+++ b/meta/recipes-devtools/python/python3-idna_3.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-TOU"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=204c0612e40a4dd46012a78d02c80fb1"
 
-SRC_URI[sha256sum] = "028ff3aadf0609c1fd278d8ea3089299412a7a8b9bd005dd08b9f8285bcb5cfc"
+SRC_URI[sha256sum] = "d838c2c0ed6fced7693d5e8ab8e734d5f8fda53a039c0164afb0b82e771e3603"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.34.1


