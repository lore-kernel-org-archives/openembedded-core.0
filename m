Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD55CC76196
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 08:59:58 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.39818.1681117193092097746
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Apr 2023 01:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ldvukgAH;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1681117191; i=@fujitsu.com;
	bh=ewBDyMPOf1MA8mAe3Y+Dn5OkRCMS9aosxIX8uGhMMZI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ldvukgAHjjrNSrmaLV7opMdvcYMgOH78nJAj+EUXErU8IcpDSZxptfUQC3VUust2X
	 38tONDp6g5fPjYbiDqXMPX26XO0hJCXNE7toBXOXg32RGTv3BAwxXFfMg4Al6TtrLg
	 k3m/lyoywuvcHIYlukN5MTyt89tQjMEb9DRbucR9rBRGL8mh7f8/VQKsS/s/Q3fRVK
	 f4YKcqeS8OUDDG7lg7d2pieLChy0uEUIN2OQtLIaUJ31ez2aGWdddp/QvzcxS1XUYQ
	 TCsqKaBQy3+ZU5Y3f1/HpBhmDZtlhq/+ZqLz7kEyZzxCTtNd/9BIscjYJbdwAxprCs
	 qkqDmxSapgbQA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRWlGSWpSXmKPExsViZ8ORpMt2wTj
  F4MsrZYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePGlnOsBVeEKtovL2RqYDwp0MXIxSEk8IBR
  YtGjFkYI5zKTxPMVH1kgnD2MEn1njgA5nBxsAlISN+7/Z+ti5OAQEdCTuPpPFCTMLKAi8eJ3D
  zuILSxgL/Hm7UlGEJtFQFVidvtaZhCbV8BJ4s7LJUwgtoSAgsSUh+/B4pwCzhJbHu9lBRkpBF
  RzaYM5RLmgxMmZT1ggxktIHHzxghmiVVFi9uVmFgi7QqJx+iGokWoSV89tYp7AKDgLSfssJO0
  LGJlWMZoXpxaVpRbpGhrpJRVlpmeU5CZm5uglVukm6qWW6ublF5Vk6BrqJZYX66UWF+sVV+Ym
  56To5aWWbGIEBm9KcZrbDsbffX/1DjFKcjApifJ2cRmnCPEl5adUZiQWZ8QXleakFh9ilOHgU
  JLgNTgLlBMsSk1PrUjLzAFGEkxagoNHSYQ36zxQmre4IDG3ODMdInWK0Zhj0+Ere5k5Ovd3HW
  AWYsnLz0uVEuflACkVACnNKM2DGwSL8EuMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHm3HQa
  awpOZVwK37xXQKUxAp3C5GICcUpKIkJJqYMpZXR3CcPWJ6NvvK+ZMeaR73f6b/OYfLQJcinpf
  7H7kBS31ORp52l5GocNKScZrydw7Mx4cCNTUY+E6nnmjcM9t8+3u/2dK2aaKvL53S93tuCCHR
  vFKMSnDmbpO/ToP+S+1be9t1fNf9eFw/spzpdsSVT/tPSXFMXe/xtIU+ymHw9ss9qmXVWpOjV
  PrLTSu21rduSNOc/3B0ywzz9bNsT1wP/LL2rSMm1c3nJ225QzX1ubUl/WrRW411E6V3NS6Y8F
  NPvbQpdITj4baP7AVtFeRcm6dfyfYIVe+Nvm//qcf525+eD7b8JbcLf9Z1SFJHF6ONxgUv51Q
  qmcKqX8lbBA6t2Zzjlkop7j554C1PUosxRmJhlrMRcWJAJOncgNrAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-728.messagelabs.com!1681117190!1441901!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27683 invoked from network); 10 Apr 2023 08:59:50 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-7.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Apr 2023 08:59:50 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 0CDF01CD
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:59:50 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 01CDD1C7
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 09:59:50 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 10 Apr 2023 09:59:48 +0100
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] acpica: upgrade 20220331 -> 20230331
Date: Mon, 10 Apr 2023 16:59:32 +0800
Message-ID: <1681117175-24783-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1681117175-24783-1-git-send-email-wangmy@fujitsu.com>
References: <1681117175-24783-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Apr 2023 08:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179854

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023.

Changelog:
==========
-Update all copyright notices to the year 2023. This effects all source
 modules, as well as utility signons.
-Add OS-specific support for Zephyr RTOS.
-Fix miscellaneous code that accesses various objects.
-Remove some dead code.
-Add C ?Flexible Array? support.
-Add support for 64 bit LoongArch compilation.
-Add first batch of RISC-V related definitions.
-Performed a global automated update to remove tabs, fix indentation
 issues, etc.
-Allow disabling of -Werror. For distro maintainers having '-Werror' can
 delay update of GCC. Since every GCC release might add new warnings that
 were not yet captured, it might break the build of packages. With this
 change, distros can now build with 'NOWERROR=TRUE' instead of patching
 either the errors or the makefiles. The default behavior keeps on using
 '-Werror'.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../acpica/{acpica_20220331.bb => acpica_20230331.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20220331.bb => acpica_20230331.bb} (91%)

diff --git a/meta/recipes-extended/acpica/acpica_20220331.bb b/meta/recipes-extended/acpica/acpica_20230331.bb
similarity index 91%
rename from meta/recipes-extended/acpica/acpica_20220331.bb
rename to meta/recipes-extended/acpica/acpica_20230331.bb
index 2c554f863a..01b8833f50 100644
--- a/meta/recipes-extended/acpica/acpica_20220331.bb
+++ b/meta/recipes-extended/acpica/acpica_20230331.bb
@@ -10,14 +10,14 @@ HOMEPAGE = "http://www.acpica.org/"
 SECTION = "console/tools"
 
 LICENSE = "Intel | BSD-3-Clause | GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=41a76b4b1f816240f090cf010fefebf0"
+LIC_FILES_CHKSUM = "file://source/compiler/aslcompile.c;beginline=7;endline=150;md5=79a69059b499bccc70a484459549758f"
 
 COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 
 DEPENDS = "m4-native flex-native bison-native"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix-${PV}.tar.gz"
-SRC_URI[sha256sum] = "acaff68b14f1e0804ebbfc4b97268a4ccbefcfa053b02ed9924f2b14d8a98e21"
+SRC_URI[sha256sum] = "0c5d695d605aaa61709f3c63f57a1a99b8902291723998446b0813b57ac310e2"
 
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
-- 
2.34.1


