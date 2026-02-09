Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810F2EF0700
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 01:57:23 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38732.1770602237935972444
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 17:57:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Lgd23SvU;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770602236; x=1802138236;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pCtJYvZ5/hfpUjjrbCoyFw84d6Ga4+QfZXXn4s2SI0U=;
  b=Lgd23SvUJjcP2uJ5CgOl3go+CZdkdNIqiTSbHzyjS8MR1q2nWj6++hMQ
   iiW9RnmxLgNYq0GH4qIXre2dUeuBrc1iV5TANV4hmTkr6VhTyloUCMbgx
   AtJF6R5TPSN3e6EMsOrQ3Mu4OSr7DIMTz6new5nqs49TcPRe1gdU/AmxW
   f/YSYs+Lz9Y9XRj8Zt20vhGvjzBGuZflj/AMnXEErPh/bcHwZVLcVbxpk
   1AlFAQwosPwteUHwEq6h5K0SQvK7IGDH1kGMmqrTFVUaAvdWE3O84NgK6
   lBZmkWrOfQVshnSqhjEhqXrOPbJYYKwmZPQpf8Fe053ErGZr7Oa2AE4G8
   w==;
X-CSE-ConnectionGUID: B9GFyRqqTIuEbz4KpRjGrA==
X-CSE-MsgGUID: Lm4LEu71RQ+xorKHAOip2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="217568722"
X-IronPort-AV: E=Sophos;i="6.21,281,1763391600"; 
   d="scan'208";a="217568722"
Received: from unknown (HELO mail.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 10:57:14 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.fujitsu.com (Postfix) with ESMTPS id 3D5BF100034D
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 01:57:16 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id E3C0918019BB
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 01:57:15 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 885AD200020E
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Feb 2026 01:57:13 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v2] libpam: upgrade 1.7.1 -> 1.7.2
Date: Mon,  9 Feb 2026 09:57:00 +0800
Message-ID: <20260209015700.9622-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230703

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

  Change vendordir to /etc/security to fix this issue for backward compatibility.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../recipes-extended/pam/{libpam_1.7.1.bb => libpam_1.7.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/pam/{libpam_1.7.1.bb => libpam_1.7.2.bb} (98%)

diff --git a/meta/recipes-extended/pam/libpam_1.7.1.bb b/meta/recipes-extended/pam/libpam_1.7.2.bb
similarity index 98%
rename from meta/recipes-extended/pam/libpam_1.7.1.bb
rename to meta/recipes-extended/pam/libpam_1.7.2.bb
index 8fb67983ee..54c1054ba0 100644
--- a/meta/recipes-extended/pam/libpam_1.7.1.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.2.bb
@@ -24,11 +24,11 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://pam-volatiles.conf \
            "
 
-SRC_URI[sha256sum] = "21dbcec6e01dd578f14789eac9024a18941e6f2702a05cf91b28c232eeb26ab0"
+SRC_URI[sha256sum] = "3d86b6383fb5fd9eb9578d2cd47d92801191f4bf3f9bc61419bfefc8aa1e531a"
 
 DEPENDS = "bison-native flex-native libxml2-native virtual/crypt"
 
-EXTRA_OEMESON = "-Ddocs=disabled -Dsecuredir=${base_libdir}/security"
+EXTRA_OEMESON = "-Ddocs=disabled -Dsecuredir=${base_libdir}/security -Dvendordir=${sysconfdir}/security"
 
 LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl,--undefined-version', '', d)}"
 
-- 
2.43.0


