Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB1FE77199
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 09:01:35 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.16517.1736240494627017429
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jan 2025 01:01:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pxh8ASZd;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736240494; x=1767776494;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=T9bXh3MC58jIrlQZfdiP8w0gQ2U2L8yNwKJbPQwGk4E=;
  b=pxh8ASZdBFRq/oWSbdOcEe0eelwNF7zzPa/s90gbasM+4V3Fk6QUS01d
   l9mStl3Ps8b6eHBungYZJc0F9uNMi27gH8F/E07l9WRVSwwuOWFF/G+Ok
   5jbkYWsobZPDekghMX1ueC4F7t8NraNZHLdNEVXj4Q+GkNVzLGHNXp3Iz
   P0Jlwp4JzrlEpswQT82YGSAUSvOY3PKawgljl0IpwFDR8AETtoTu+9xkZ
   iGHyjOENsa8N3k+R3XVInwy6fLOmdmOjvdEQFlQqmafcl19rZCklip3DA
   HNLEurt5ZxqEbRJqBFWLkCM6uBv3SG7hf5kIunjMl8TJrT4dIzWrRISqA
   w==;
X-CSE-ConnectionGUID: nPS0b11sR1CRVa3IRkCXAg==
X-CSE-MsgGUID: dqKX2fhgSpiYt6fs1dKPlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="173804691"
X-IronPort-AV: E=Sophos;i="6.12,295,1728918000"; 
   d="scan'208";a="173804691"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 18:01:32 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 42015D5015
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:30 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 18A54CF7E4
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9CECB41185
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Jan 2025 18:01:29 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5759B1A0073;
	Tue,  7 Jan 2025 17:01:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 06/13] libtest-warnings-perl: upgrade 0.033 -> 0.037
Date: Tue,  7 Jan 2025 17:01:15 +0800
Message-Id: <1736240482-5243-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
References: <1736240482-5243-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28908.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28908.003
X-TMASE-Result: 10-0.077300-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrMVx/3ZYby794YeSlHZYFoqB8
	tGwEqygasTSv4e8JsEM4bJd2G5kbyZr/5QhTM8mCJ5oIExjxwScXivwflisSrKRdYB98+/gQtn/
	kGA5SbyDgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZYA3qL69rXq5Bb1
	8AokbsU6a4Qa1aHw/kgDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyuOUqSsdvttgeieHG2MK3xQ1sh
	ruxDB3wszpnqScYNqc0XMeMg9/6hvtz43TShNTfkmRJLbHzonHBB1QCGFE6AcIbfk18eg3+/r/b
	+dmSKFo6AH9/PcRd1xUpPR4VGZ8OzhiFp8LOC6Mh1j2M6LiVMg==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jan 2025 09:01:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209437

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- remove unneeded use of Import::Into
- fix tests that invoke Test::Warnings->import directly
- avoid redefinition warnings when $^W is enabled in tests
- allow tests to pass even when Import::Into is not installed
- add backcompat shim for cases where Test::More is loaded in tests
  after Test::Warnings
- fix Test2 compability for done_testing()
- Test2::Warnings added as a simple wrapper (for now)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...st-warnings-perl_0.033.bb => libtest-warnings-perl_0.037.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{libtest-warnings-perl_0.033.bb => libtest-warnings-perl_0.037.bb} (93%)

diff --git a/meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb b/meta/recipes-devtools/perl/libtest-warnings-perl_0.037.bb
similarity index 93%
rename from meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb
rename to meta/recipes-devtools/perl/libtest-warnings-perl_0.037.bb
index 17b4cc3c9e..1cdc93d776 100644
--- a/meta/recipes-devtools/perl/libtest-warnings-perl_0.033.bb
+++ b/meta/recipes-devtools/perl/libtest-warnings-perl_0.037.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=f98106ac3cc05d9cbebcdb8fbf7b7815"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Test-Warnings-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "b9c375719f2c61c5f97aa5ee6cf4c901a972347c415969379b0b51f67c48bbcb"
+SRC_URI[sha256sum] = "682de3e7a3e8ac9265c53d0e314b8b903294c5199c005bd37e808f4484c25df2"
 
 S = "${WORKDIR}/Test-Warnings-${PV}"
 
-- 
2.43.0


