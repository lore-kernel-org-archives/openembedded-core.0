Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3BCCED60F
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 05:49:57 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.9233.1728452989262628057
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Oct 2024 22:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RHBhQkCf;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728452989; x=1759988989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NhpH+1Ag/L+i/gvRynQxDFg1wtcZy6JYIBkzSJQS4iU=;
  b=RHBhQkCf3v8JGhdFMFWKRse5hFN4rftunyLHYFKX2APPqY+uAMggTIt4
   hUgyrtlyluP+RsXV+NkgiCfIuugid4LLPj3U7oIghgvBeUiLc77XlKmLF
   vvrw2/qJzbkoz8yCz+3eMjg1gwB0jHW4a/BFgnny6lH/Q0u2F64lw9NCy
   q/gtP3hqfvxenPmPWrYvSkRJJdk8IQAnyR+EzDCFMNknJIkm2xX/fDw09
   vdmDEkgwQm8xtn1LkaxvK0PbR4e8/jxNtkZxrw7SWJQs6irZy188kt5M3
   D14KCuB59FmK1iK8toraFoUU6pvxLDZbeV+RgH0smaFYnVUaEpqYXUBT/
   g==;
X-CSE-ConnectionGUID: TJ+Gl3y4RlisJSrFn1Ptxw==
X-CSE-MsgGUID: ElLvw/E/SK2821ji9aln2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="163622133"
X-IronPort-AV: E=Sophos;i="6.11,189,1725289200"; 
   d="scan'208";a="163622133"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 14:49:47 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 29A3FD7AC5
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4D230DB9FC
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:42 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A2A4E40B62
	for <openembedded-core@lists.openembedded.org>; Wed,  9 Oct 2024 14:49:41 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 509161A01E9;
	Wed,  9 Oct 2024 13:49:41 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 26/26] xz: upgrade 5.6.2 -> 5.6.3
Date: Wed,  9 Oct 2024 13:49:15 +0800
Message-Id: <1728452955-25051-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
References: <1728452955-25051-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28718.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28718.005
X-TMASE-Result: 10--2.498400-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mr+KgiyLtJrSDGsuYyb68ajOVc
	569AcnKHCC8aAmGeO6nqXvXKPBg5BmVjCRquYdk+EXjPIvKd74BMkOX0UoduuWAN6i+va16uBoa
	RMwn0B/dTRs24pmpu6tIq66o1vYO6YwDOL7t3RyGeAiCmPx4NwGmRqNBHmBveeFIQTy0Zb4Y4Br
	ATwm8hoidET58jp62SK6N2mlitpjVT4MHxkyUn8DUmhg+TrZ9esNBAqiA9/OS2itjIl76usohle
	g0bsWQsfhyIYPvuZtRAjMX2YLupA2XlP7Kq21HYS7+RMq/2CK6rA4c7UV2fQpvi2PQO/FFQiz2u
	jrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Oct 2024 05:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205337

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/tukaani-project/xz/releases/tag/v5.6.3

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-extended/xz/{xz_5.6.2.bb => xz_5.6.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/xz/{xz_5.6.2.bb => xz_5.6.3.bb} (97%)

diff --git a/meta/recipes-extended/xz/xz_5.6.2.bb b/meta/recipes-extended/xz/xz_5.6.3.bb
similarity index 97%
rename from meta/recipes-extended/xz/xz_5.6.2.bb
rename to meta/recipes-extended/xz/xz_5.6.3.bb
index 96fc691ef7..67070850ab 100644
--- a/meta/recipes-extended/xz/xz_5.6.2.bb
+++ b/meta/recipes-extended/xz/xz_5.6.3.bb
@@ -28,7 +28,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c02de712b028a5cc7e22472e8f2b3db1 \
 SRC_URI = "https://github.com/tukaani-project/xz/releases/download/v${PV}/xz-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "8bfd20c0e1d86f0402f2497cfa71c6ab62d4cd35fd704276e3140bfb71414519"
+SRC_URI[sha256sum] = "b1d45295d3f71f25a4c9101bd7c8d16cb56348bbef3bbc738da0351e17c73317"
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI = "https://github.com/tukaani-project/xz/releases/"
 
-- 
2.34.1


