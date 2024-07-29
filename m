Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668EAC52D54
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 01:10:31 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.46592.1722215428747032203
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jul 2024 18:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cPMWRQaI;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722215430; x=1753751430;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6hoEm27UDNc9XRySNKfjYVXyYGGEknsmw5Pzt8AXgK8=;
  b=cPMWRQaIA5L1KHqFCZADI5FZzWIPh3NzId6CXKsSMYuU/dHJslQx+JFF
   650hsTsCz30SsJFOb2bYF6A1mbKaFJJGa2DuwgwZ4BA7z8RXvB0p0Jw5Q
   +OmXzjRxFVTVAwgShPad87iL9yiRTeznd9Kc/MxZX1skTX/L1uMH+6kjz
   DozGOnP9Jd4YbmUAhjNbnQcwOYrDONAMjpsv6xsuajNo15joU329Mnp/B
   ltFa0eW+2bLPxNgtcEsm90JJhX9WxucSNUygRJrhDNt4k7V81UM2nFdTN
   oxJxnPEM0dz2jfcNZYGfKsaDor8vmKTqQiEOiT3og32/EBrGxX0F1wjT8
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11147"; a="168859954"
X-IronPort-AV: E=Sophos;i="6.09,245,1716217200"; 
   d="scan'208";a="168859954"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 10:10:27 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CA4D8C9440
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:23 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0EFCED5084
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 88D3A20071A1D
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 10:10:22 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3D0E01A0002;
	Mon, 29 Jul 2024 09:10:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/33] libtirpc: upgrade 1.3.4 -> 1.3.5
Date: Mon, 29 Jul 2024 09:09:45 +0800
Message-Id: <1722215408-27541-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
References: <1722215408-27541-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28560.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28560.004
X-TMASE-Result: 10--8.402400-10.000000
X-TMASE-MatchedRID: 242WXRytjV6jz0nOeth/yTo39wOA02LhGEfoClqBl87fUZT83lbkEJYv
	gWqjMEzaNYCBzzxsUnvZ5eN1eJMdpVpCIuRr0RxKP0HVIeixJdDBOVz0Jwcxl0fyM5VfgjG209D
	6Rw2zIrMPNxz2EvpSIL0+/nv6ad1Fk+ELgR0ZH/a0CVXYvqmAUQv/9UzFeXITFsz028Tu0fqXg7
	HyoX5nTX4fsU2Mo5fd5sVvz07dXFNnEiOEMYHj57FpbR9jggy4W9DGjPU7rM/fc2Xd6VJ+yu7qw
	E65RC4JayGr0D0+EpiMT9USpwSy0TBF7stuNMMxuLt50vtxBA5ReWnUUdhI9fLYTlynTXzTBoaR
	Mwn0B/dCEZY1TJxup22Qt0yaekNi8VPT7FT7X/yeAiCmPx4NwHJnzNw42kCxxEHRux+uk8h+ICq
	uNi0WJJ60kFdHbryDaOwwMsxGl5ROv3/Ow3QrR2BfYmtSSk5TftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 01:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202584

From: Wang Mingyu <wangmy@fujitsu.com>

ipv6.patch
removed since it's included in 1.3.5

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtirpc/libtirpc/ipv6.patch              | 52 -------------------
 .../{libtirpc_1.3.4.bb => libtirpc_1.3.5.bb}  |  6 +--
 2 files changed, 2 insertions(+), 56 deletions(-)
 delete mode 100644 meta/recipes-extended/libtirpc/libtirpc/ipv6.patch
 rename meta/recipes-extended/libtirpc/{libtirpc_1.3.4.bb => libtirpc_1.3.5.bb} (86%)

diff --git a/meta/recipes-extended/libtirpc/libtirpc/ipv6.patch b/meta/recipes-extended/libtirpc/libtirpc/ipv6.patch
deleted file mode 100644
index f746f986f4..0000000000
--- a/meta/recipes-extended/libtirpc/libtirpc/ipv6.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 077bbd32e8b7474dc5f153997732e1e6aec7fad6 Mon Sep 17 00:00:00 2001
-Message-Id: <077bbd32e8b7474dc5f153997732e1e6aec7fad6.1697120796.git.joerg.sommer@navimatix.de>
-From: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
-Date: Thu, 12 Oct 2023 16:22:59 +0200
-Subject: [PATCH] netconfig: remove tcp6, udp6 on --disable-ipv6
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-If the configuration for IPv6 is disabled, the netconfig should not contain
-settings for tcp6 and udp6.
-
-The test for the configure option didn't work, because it check the wrong
-variable.
-
-Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
-Upstream-Status: Submitted [libtirpc-devel@lists.sourceforge.net]
-Upstream-Status: Submitted [linux-nfs@vger.kernel.org]
----
- configure.ac    | 2 +-
- doc/Makefile.am | 5 +++++
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index fe6c517..b687f8d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -64,7 +64,7 @@ fi
- AC_ARG_ENABLE(ipv6,
- 	[AC_HELP_STRING([--disable-ipv6], [Disable IPv6 support @<:@default=no@:>@])],
- 	[],[enable_ipv6=yes])
--AM_CONDITIONAL(INET6, test "x$disable_ipv6" != xno)
-+AM_CONDITIONAL(INET6, test "x$enable_ipv6" != xno)
- if test "x$enable_ipv6" != xno; then
- 	AC_DEFINE(INET6, 1, [Define to 1 if IPv6 is available])
- fi
-diff --git a/doc/Makefile.am b/doc/Makefile.am
-index d42ab90..b9678f6 100644
---- a/doc/Makefile.am
-+++ b/doc/Makefile.am
-@@ -2,3 +2,8 @@ dist_sysconf_DATA	= netconfig bindresvport.blacklist
- 
- CLEANFILES	       = cscope.* *~
- DISTCLEANFILES	       = Makefile.in
-+
-+if ! INET6
-+install-exec-hook:
-+	$(SED) -i '/^tcp6\|^udp6/d' "$(DESTDIR)$(sysconfdir)"/netconfig
-+endif
--- 
-2.34.1
-
diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb
similarity index 86%
rename from meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb
rename to meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb
index aa526e9e1c..d4cd24ec0c 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.5.bb
@@ -9,12 +9,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f835cce8852481e4b2bbbdd23b5e47f3 \
 
 PROVIDES = "virtual/librpc"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
-	file://ipv6.patch \
-"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2"
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/libtirpc/files/libtirpc/"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)/"
-SRC_URI[sha256sum] = "1e0b0c7231c5fa122e06c0609a76723664d068b0dba3b8219b63e6340b347860"
+SRC_URI[sha256sum] = "9b31370e5a38d3391bf37edfa22498e28fe2142467ae6be7a17c9068ec0bf12f"
 
 CVE_STATUS[CVE-2021-46828] = "fixed-version: fixed in 1.3.3rc1 so not present in 1.3.3"
 
-- 
2.34.1


