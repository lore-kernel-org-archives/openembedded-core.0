Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C323FCD12A0
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 07:10:57 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.130221.1712646653922232115
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 00:10:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=p8d/kG9q;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1712646655; x=1744182655;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=VEjurbGELGvxGDiQNHjVu3Xtec65qG7eSjJcZtgBxxw=;
  b=p8d/kG9qbDvHdjrh7LTjb0/iMJ0WcSz+gRKwAlrlB1cE0kXEDXkeZf9N
   iqAnaMwU+Lu+oF4PW0ZV5xqwdxL4ADs9g+sFU7rT7omenSbZ5C0n8uVWt
   ARvTk/EWKswqq14Czh4j8YpcRjl44Xb1EhGbKYUwfLlPY4XQjiEaOivh9
   aCMvu2aC6J72wLK3Nbp0bLfPzEMuuxa55fAc28GTLk1PskTndklv1HsQJ
   OeVryMWjQ81+fptjq3EeIOsAnsCSHOtzZqemsXPVz0fW3jzCMrpKgs3vv
   x4Y8EN9o+759RzoKFj2TwDOfRPJRtly8r0trl1Ll5QjpoIma+3r8OkREC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="143011378"
X-IronPort-AV: E=Sophos;i="6.07,189,1708354800"; 
   d="scan'208";a="143011378"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:10:52 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 263B0101DF4
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:50 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 52021C5205
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:49 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D2B9B4018B
	for <openembedded-core@lists.openembedded.org>; Tue,  9 Apr 2024 16:10:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 81DD61A0002;
	Tue,  9 Apr 2024 15:10:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 27/33] python3-pyasn1: upgrade 0.5.1 -> 0.6.0
Date: Tue,  9 Apr 2024 15:10:14 +0800
Message-Id: <1712646620-16608-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
References: <1712646620-16608-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28306.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28306.005
X-TMASE-Result: 10--0.458900-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrMVx/3ZYby7/VbZFdXapsKe79
	DJRUi35phgSBV7oGS48SuJRtSU84o39JXYBaBfzuxLSsi9FKAT3BOVz0JwcxlwV9fM+V9jt7ssb
	EkSX6c0kg9KDk3s1y5KI1Q85Nw6wpG3Jt29YAwfDdCok3ibXlQX0tCKdnhB58I/9UW5M5dRMQpr
	Z/7WnuveTCMddcL/gjxlblqLlYqXIaPs7Y6JI5mJlJxrbL0TaipazuP5mlZW1B7hqPecrHE6E35
	snpQj1MEsXvvQfd/Sd+kC/ayUxYoqfHW7pz6t9x8GzL02W1Rlv+v9v52ZIoWjoAf389xF3XFSk9
	HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 07:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198048

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Removed support for EOL Python 2.7, 3.6, 3.7
-Added support for previously missing RELATIVE-OID construct
-Updated link to Layman's Guide

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python-pyasn1.inc                  | 2 +-
 .../python/{python3-pyasn1_0.5.1.bb => python3-pyasn1_0.6.0.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyasn1_0.5.1.bb => python3-pyasn1_0.6.0.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-pyasn1.inc b/meta/recipes-devtools/python/python-pyasn1.inc
index 530ff1c7c3..7b269f2940 100644
--- a/meta/recipes-devtools/python/python-pyasn1.inc
+++ b/meta/recipes-devtools/python/python-pyasn1.inc
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[sha256sum] = "6d391a96e59b23130a5cfa74d6fd7f388dbbe26cc8f1edf39fdddf08d9d6676c"
+SRC_URI[sha256sum] = "3a35ab2c4b5ef98e17dfdec8ab074046fbda76e281c5a706ccd82328cfc8f64c"
 
 RDEPENDS:${PN}:class-target += " \
     python3-codecs \
diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.5.1.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-pyasn1_0.5.1.bb
rename to meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb
-- 
2.34.1


