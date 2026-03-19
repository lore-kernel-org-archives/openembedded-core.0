Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E771088E66
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 02:40:01 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2758.1773887998294426343
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 19:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ElG4FL8M;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773887996; x=1805423996;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ubeHsJnZIRK4elr+S82XfZr+Iz74uKg9e4e7EYAHM5E=;
  b=ElG4FL8MP+9WJHaV7hj/birG+MJ9Y3PcIxLfTkrPfqVGd1QnQTycjv7X
   Yn8vZPHhygMzPW2Nlu92PIAr+wfqsRJ09JepnId4BM9gwM64SQwTAHFxS
   +Rt4l9FNcerTNrZWZjwGWMBV0rUeVxnmyOVvL0bZQb8x6WjaHV9qAKj82
   N/b1DjogHXkD2Hmw48AdYKm+xhA9JYQJtktqMgzkKmYepVFBVIVdn+wCl
   cPHcHK4P7NbJ4QV9HdGfziEdVCopoqo9xH10/bGmjEdO5T7nCLaDiv5fT
   QSw9bnUnsMipH6pttyZUMRJJAtb+FqoSkxxJoNaqRndK2hKJ7h2yPjwZy
   w==;
X-CSE-ConnectionGUID: rtBVMiowRL2ktPhV174HKQ==
X-CSE-MsgGUID: LXr4BNrUSeWEtt/S+7wccQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="234510197"
X-IronPort-AV: E=Sophos;i="6.23,128,1770562800"; 
   d="scan'208";a="234510197"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 11:39:54 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 804FD1002834
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 02:39:56 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 318E01810797
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 02:39:56 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id CC6861801931
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 02:39:53 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v3] libpam: upgrade 1.7.1 -> 1.7.2
Date: Thu, 19 Mar 2026 10:39:47 +0800
Message-ID: <20260319023947.14118-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 02:40:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233456

1.Changelog:
  https://github.com/linux-pam/linux-pam/releases/tag/v1.7.2

2.Fix do_package QA Issue as default vendordir has been changed
  Refer to this commit https://github.com/linux-pam/linux-pam/commit/aea30822e2fa6f87faf2541da140f69dfdfee728

  ERROR: libpam-1.7.2-r0 do_package: QA Issue: libpam: Files/directories were installed but not shipped in any package:
  /usr/share/pam
  /usr/share/pam/environment
  /usr/share/pam/security
  /usr/share/pam/security/namespace.conf
  /usr/share/pam/security/group.conf
  /usr/share/pam/security/namespace.init
  /usr/share/pam/security/faillock.conf
  /usr/share/pam/security/access.conf
  /usr/share/pam/security/pam_env.conf
  /usr/share/pam/security/pwhistory.conf
  /usr/share/pam/security/time.conf
  /usr/share/pam/security/limits.conf

  Change vendordir to /etc to fix this issue for backward compatibility.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../recipes-extended/pam/{libpam_1.7.1.bb => libpam_1.7.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/pam/{libpam_1.7.1.bb => libpam_1.7.2.bb} (98%)

diff --git a/meta/recipes-extended/pam/libpam_1.7.1.bb b/meta/recipes-extended/pam/libpam_1.7.2.bb
similarity index 98%
rename from meta/recipes-extended/pam/libpam_1.7.1.bb
rename to meta/recipes-extended/pam/libpam_1.7.2.bb
index 470aea80f6..6955a5f2f6 100644
--- a/meta/recipes-extended/pam/libpam_1.7.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.2.bb
@@ -24,11 +24,11 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://pam-volatiles.conf \
            "
 
-SRC_URI[sha256sum] = "21dbcec6e01dd578f14789eac9024a18941e6f2702a05cf91b28c232eeb26ab0"
+SRC_URI[sha256sum] = "3d86b6383fb5fd9eb9578d2cd47d92801191f4bf3f9bc61419bfefc8aa1e531a"
 
 DEPENDS = "bison-native flex-native libxml2-native virtual/crypt"
 
-EXTRA_OEMESON = "-Ddocs=disabled -Dsecuredir=${base_libdir}/security"
+EXTRA_OEMESON = "-Ddocs=disabled -Dsecuredir=${base_libdir}/security -Dvendordir=${sysconfdir}"
 
 LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl,--undefined-version', '', d)}"
 
-- 
2.43.0


