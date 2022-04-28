Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9DD7C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 07:34:04 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.7102.1651131244000665777
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 00:34:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=TzAYpZbe;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1651131242; i=@fujitsu.com;
	bh=D2NERceGBvRinwrwqVDa2lMy2wrQnX60paLFQJEXCw0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=TzAYpZbeDuMDYj1vXfKlVfsp9viJeavNHX/XCjXINP1AAUWVj+0kktvBWxP8sauNz
	 AOvagG4NndQNHmcyVlg5SqKOLskzVU/+Y+M9snQ/4tAbFoAGf1Rncanhh53TryDzxX
	 hiIXaxMSlkzKyyo4irdO2tkPs7YTGNk7u0TDRSXUwmxrqX0JRJCLVNz57MSdEFd0Jw
	 hbS0aFNqwxhw3rg8EqkX0pKzztyvEzmE76kg96+YFqKEhSOrkZWdKHPkuCFRXZnNOP
	 Sx+FxJu4vJg7HTsxuJrcKb8vPNImrn/QVcBLIlmrAhajHUiv5cucelXCcvQC9GTIV1
	 axQLxUacodjXg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MxSTfTOSv
  JYO11bYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePs94WsBSv4K7ZdaWZtYJzG28XIxSEk8JhR
  Ysf542wQznkmiUV/JrNAOHsZJd5efs7YxcjJwSagIbF76mXmLkYODhEBPYmr/0RBwswCahJHX
  /5kBrGFBWwlGh5eBrNZBFQlrnw8zARi8wq4SLzp/cACYksIKEhMefieGSIuKHFy5hMWiDkSEg
  dfvGCGqFGSeHtpDyOEXSExa1YbE4StJnH13CbmCYz8s5C0z0LSvoCRaRWjdVJRZnpGSW5iZo6
  uoYGBrqGhqa6xqa6hiaVeYpVuol5qqW55anGJrpFeYnmxXmpxsV5xZW5yTopeXmrJJkZgWKYU
  K0/dwXh61U+9Q4ySHExKorxWpllJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4gxyBcoJFqempF
  WmZOcAYgUlLcPAoifDKGAOleYsLEnOLM9MhUqcYFaXEeVeB9AmAJDJK8+DaYHF5iVFWSpiXkY
  GBQYinILUoN7MEVf4VozgHo5Iwr5sT0BSezLwSuOmvgBYzAS1eWZQJsrgkESEl1cDkef+pX5A
  qh5KolvZa8eDIuuMvlrfaJ8pNlJ/SP0trm9yJmNuKTde8Dp693nOLRbMzOdXvuoiMeIJJdKBM
  1fmFte/nJRtUnY01WqJ9bYL7J5vMwCezDnud7zHmqZ1S0nN1l7+K9/HE88IyNve2/tO4E7FvG
  rdU3Zy88BbWjmDj9t9n9j3YfZpHvfSh59JnCnMi/8b8FvdO2ub1P1/gtLhhTbfWIp/Mjb6db1
  Iq7rCtkvJLSfrFuCde7NXevEPP7JPSGYzM9Z557jJ+JpZe+4vn2eYZDsd0/Xx3rLSeoRwjdb+
  lf1LHwcZrFzasa5zWlBN1/xyDWHT05LqZnhnHvefViB3jFjia815W+3BzjBJLcUaioRZzUXEi
  AMgRAMNGAwAA
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-18.tower-571.messagelabs.com!1651131241!12395!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20268 invoked from network); 28 Apr 2022 07:34:01 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Apr 2022 07:34:01 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 5569E100331
	for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:34:01 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 488241000F5
	for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 08:34:01 +0100 (BST)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 28 Apr 2022 08:33:47 +0100
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH] gnutls: Added fips support option.
Date: Thu, 28 Apr 2022 15:33:35 +0800
Message-ID: <1651131215-4196-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 07:34:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164933

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 meta/recipes-support/gnutls/gnutls_3.7.4.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-support/gnutls/gnutls_3.7.4.bb b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
index b34eb7f..5a34805 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=71391c8e0c1cfe68077e7fce3b586283 \
                     file://doc/COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 DEPENDS = "nettle gmp virtual/libiconv libunistring"
+DEPENDS:append:class-target = " gnutls-native"
 DEPENDS:append:libc-musl = " argp-standalone"
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
@@ -36,6 +37,7 @@ PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
 PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
 PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
 PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
+PACKAGECONFIG[fips] = "--enable-fips140-mode,--disable-fips140-mode"
 
 EXTRA_OECONF = " \
     --enable-doc \
@@ -59,6 +61,21 @@ do_configure:prepend() {
 	done
 }
 
+do_compile:prepend:class-target () {
+        if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true', 'false', d)}; then
+          sed -i -e "s#\$(builddir)/fipshmac#${STAGING_DIR_NATIVE}${libdir}/fipshmac#g" ${B}/lib/Makefile
+        fi
+}
+
+do_install:append:class-native() {
+        if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true', 'false', d)}; then
+          install -d ${D}${libdir}
+          install -d ${D}${libdir}/.libs
+          install -m 0755 ${B}/lib/fipshmac ${D}${libdir}/
+          install -m 0755 ${B}/lib/.libs/fipshmac ${D}${libdir}/.libs/
+        fi
+}
+
 PACKAGES =+ "${PN}-openssl ${PN}-xx"
 
 FILES:${PN}-dev += "${bindir}/gnutls-cli-debug"
-- 
1.8.3.1


