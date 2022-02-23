Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FEAC4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 11:03:33 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web10.6206.1645614211392295196
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 03:03:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=h+VmcVsR;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1645614209; i=@fujitsu.com;
	bh=xuEjp9GSJGkklXZgLsl+i+jKRTizB6Zy+ItTt3OTNdQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=h+VmcVsRahECFX64nzFsbyeXn4rrG0D+0CkAEFyWy6GG4y3d/649tMJ7rPiuAnTGK
	 e9GPIVZLnNb3EMDlluqyl2ahly7tD/bM2CvU2Lp6/N3bD1iPwQzkjT6REFJJq0xAMw
	 VdqwJ7z7WYRL0txpoSvI7cxlctd7RrPmgX6KAFr/93PH0sgyWqHxpVIdYaHFAik7OE
	 PXNVQ46Hz7Ff3Bsy/3wTFSSAM3EpGPYRQRUE5vOCvGq+rLzJu7TVpo+i7ep5hj1XTm
	 OP8Ce7gZHRCF4fr0my2vnvhm/5mWrazKpJxopySOdJJLmMPXMlM0BDN+z9MNtUG2dq
	 U2dc9CWY64JpA==
Received: from [100.115.7.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id 2D/18-00700-18416126;
 Wed, 23 Feb 2022 11:03:29 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MxRbdBRCz
  J4PkrK4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePfxd/sBT+MKjas/sbcwPhBr4uRi0NIYAaT
  xK7Of6wQzglGiQ1T9jN3MXJysAmoSUy/dQMowcEhIqAncfWfKEiYWUBF4sXvHnYQW1jAWuLTp
  bdsIDaLgKrE4uY9YDavgJNE58XvYGMkBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL15A1ShKzL7czA
  JhV0jMmtXGNIGRdxaSlllIWhYwMq1itEwqykzPKMlNzMzRNTQw0DU0NNU11jW00Eus0k3USy3
  VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctLLdnECAywlGJmoR2M6/t+6h1ilORgUhLlvcYjliTE
  l5SfUpmRWJwRX1Sak1p8iFGGg0NJgtdZACgnWJSanlqRlpkDDHaYtAQHj5IIbwIfUJq3uCAxt
  zgzHSJ1ilFRSpyXQwgoIQCSyCjNg2uDRdglRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8ti
  BTeDLzSuCmvwJazAS0eEqWEMjikkSElFQD07xvnWk/Vrzcfozl8N/SPLuVGTk1qUf3rgmZqZz
  +0Y/j8jkeRp095gvWvfM4XZ0ZJ61xdX1QW2P01f1rY5Qr07lunG8U5ApYvXi/eueS+QlHtcpm
  K3lwlM0X6DAqdNdNdlTLT5S6EsB97FG469tDyX65R/4+ebWi1bxxc8Piz29UDyocV/hSGWsQs
  PCBcPXf5W6TK11rzSUVhV/+0v4y337u97UZ36cX8ddti5lqYnx14SzhNOG/06d8vhDk+ars3G
  S+xQeuLxJ/oFk6uVuZ6WzUPe4w33OHs45Hx8WrbHddWuks7j25wXNy2Z044YVHl/hWBOw70H5
  v50Ob3P22+V9uHVw/d2G7py3T37tHdiixFGckGmoxFxUnAgD6kWFpKwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-585.messagelabs.com!1645614208!7088!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20242 invoked from network); 23 Feb 2022 11:03:28 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-3.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Feb 2022 11:03:28 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 21NB3Mpq014052
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 11:03:28 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 23 Feb 2022 11:03:20 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] bind: upgrade 9.16.25 -> 9.16.26
Date: Wed, 23 Feb 2022 19:03:09 +0800
Message-ID: <1645614192-28889-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 11:03:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162252

Changelog:
==========
Log "quota reached" message when hard quota is reached when accepting a connection.

Add ECS support to the DLZ interface.

A failed view configuration during a named reconfiguration procedure could cause
inconsistencies in BIND internal structures, causing a crash or other unexpected errors.

rndc could crash when interrupted by a signal before receiving a response.

Correctly detect and enable UDP recvmmsg support in all versions of libuv that support it.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-avoid-start-failure-with-bind-user.patch               | 0
 .../0001-named-lwresd-V-and-start-log-hide-build-options.patch  | 0
 .../bind-ensure-searching-for-json-headers-searches-sysr.patch  | 0
 .../bind/{bind-9.16.25 => bind-9.16.26}/bind9                   | 0
 .../bind/{bind-9.16.25 => bind-9.16.26}/conf.patch              | 0
 .../bind/{bind-9.16.25 => bind-9.16.26}/generate-rndc-key.sh    | 0
 .../init.d-add-support-for-read-only-rootfs.patch               | 0
 .../make-etc-initd-bind-stop-work.patch                         | 0
 .../bind/{bind-9.16.25 => bind-9.16.26}/named.service           | 0
 .../bind/{bind_9.16.25.bb => bind_9.16.26.bb}                   | 2 +-
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/bind/{bind-9.16.25 => bind-9.16.26}/0001-avoid-start-failure-with-bind-user.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.25 => bind-9.16.26}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.25 => bind-9.16.26}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.25 => bind-9.16.26}/bind9 (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.25 => bind-9.16.26}/conf.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.25 => bind-9.16.26}/generate-rndc-key.sh (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.25 => bind-9.16.26}/init.d-add-support-for-read-only-rootfs.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.25 => bind-9.16.26}/make-etc-initd-bind-stop-work.patch (100%)
 rename meta/recipes-connectivity/bind/{bind-9.16.25 => bind-9.16.26}/named.service (100%)
 rename meta/recipes-connectivity/bind/{bind_9.16.25.bb => bind_9.16.26.bb} (98%)

diff --git a/meta/recipes-connectivity/bind/bind-9.16.25/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.16.26/0001-avoid-start-failure-with-bind-user.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.25/0001-avoid-start-failure-with-bind-user.patch
rename to meta/recipes-connectivity/bind/bind-9.16.26/0001-avoid-start-failure-with-bind-user.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.25/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.16.26/0001-named-lwresd-V-and-start-log-hide-build-options.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.25/0001-named-lwresd-V-and-start-log-hide-build-options.patch
rename to meta/recipes-connectivity/bind/bind-9.16.26/0001-named-lwresd-V-and-start-log-hide-build-options.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.25/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.16.26/bind-ensure-searching-for-json-headers-searches-sysr.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.25/bind-ensure-searching-for-json-headers-searches-sysr.patch
rename to meta/recipes-connectivity/bind/bind-9.16.26/bind-ensure-searching-for-json-headers-searches-sysr.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.25/bind9 b/meta/recipes-connectivity/bind/bind-9.16.26/bind9
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.25/bind9
rename to meta/recipes-connectivity/bind/bind-9.16.26/bind9
diff --git a/meta/recipes-connectivity/bind/bind-9.16.25/conf.patch b/meta/recipes-connectivity/bind/bind-9.16.26/conf.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.25/conf.patch
rename to meta/recipes-connectivity/bind/bind-9.16.26/conf.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.25/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.16.26/generate-rndc-key.sh
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.25/generate-rndc-key.sh
rename to meta/recipes-connectivity/bind/bind-9.16.26/generate-rndc-key.sh
diff --git a/meta/recipes-connectivity/bind/bind-9.16.25/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.16.26/init.d-add-support-for-read-only-rootfs.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.25/init.d-add-support-for-read-only-rootfs.patch
rename to meta/recipes-connectivity/bind/bind-9.16.26/init.d-add-support-for-read-only-rootfs.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.25/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.16.26/make-etc-initd-bind-stop-work.patch
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.25/make-etc-initd-bind-stop-work.patch
rename to meta/recipes-connectivity/bind/bind-9.16.26/make-etc-initd-bind-stop-work.patch
diff --git a/meta/recipes-connectivity/bind/bind-9.16.25/named.service b/meta/recipes-connectivity/bind/bind-9.16.26/named.service
similarity index 100%
rename from meta/recipes-connectivity/bind/bind-9.16.25/named.service
rename to meta/recipes-connectivity/bind/bind-9.16.26/named.service
diff --git a/meta/recipes-connectivity/bind/bind_9.16.25.bb b/meta/recipes-connectivity/bind/bind_9.16.26.bb
similarity index 98%
rename from meta/recipes-connectivity/bind/bind_9.16.25.bb
rename to meta/recipes-connectivity/bind/bind_9.16.26.bb
index 7c16376b58..877d0a2fed 100644
--- a/meta/recipes-connectivity/bind/bind_9.16.25.bb
+++ b/meta/recipes-connectivity/bind/bind_9.16.26.bb
@@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
            file://0001-avoid-start-failure-with-bind-user.patch \
            "
 
-SRC_URI[sha256sum] = "9fa328850f82843ef8b7bf1ff5322cb68b110273a33f375ba41f35270f5e1ff3"
+SRC_URI[sha256sum] = "70b39a5eb71650358ec9ba41da3050d32aeac0aeb4a466684b23f35affa7fb45"
 
 UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
 # stay at 9.16 follow the ESV versions divisible by 4
-- 
2.25.1


