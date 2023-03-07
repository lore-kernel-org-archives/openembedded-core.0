Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD27AC678D5
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 05:51:52 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web10.8388.1678168307576348568
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 21:51:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CIAWRQax;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678168305; i=@fujitsu.com;
	bh=f/8W+CXuarTVnOkbX9VTC/QG2cxvHclMptwcs9a6McQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=CIAWRQaxbnYD5b8EkND5FkeTagAKZZ6oz3hw6H+ZRs5wXBlCkzoMpr6TsoHl/Jgql
	 mo0sJSD9uw768AZz4zfBFhy5V9YgEYn93K1kS7tZx817HjZ/Lv9NQj8sGPNHOWy5dK
	 YRpRX7LzOUsPG4Ax42hVpnoo8lux2H8lS0ppEoAdDoxpGTosY0eqck64z2TNQIDeqt
	 VsMzYiPefn3xQG1ZXRE5wlJvxzeQAAECO//s92imJmGKQW1MVqzaRixLOx7VkiPB3b
	 FsX+T8AUTAYPRMvZmVa9vgM3XTISskO4GmtvnDW+fQFckaz4kHRLTibrljlrEiZFwz
	 wzD09WjfouMrA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRWlGSWpSXmKPExsViZ8ORqPvhAlu
  KQdsSS4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPFqtnMBXP5K25ceMjcwDiNt4uRk0NI4DGj
  xM9tSV2MXED2dSaJuff/skA4exglOj91soNUsQlISdy4/5+ti5GDQ0RAT+LqP1GQMLOAisSL3
  z1gJcIC/hLfzmxjBbFZgOI/rn9mASnnFXCSeHyAByQsIaAgMeXhe2YQm1dAUOLkzCcsEGMkJA
  6+eMEMUaMoMftyMwuEXSnR+uEXlK0mcfXcJuYJjPyzkLTPQtK+gJFpFaNpcWpRWWqRrqFeUlF
  mekZJbmJmjl5ilW6iXmqpbnlqcYmukV5iebFeanGxXnFlbnJOil5easkmRmAYphQrT9zBuKL3
  r94hRkkOJiVR3uv5bClCfEn5KZUZicUZ8UWlOanFhxhlODiUJHgTzwPlBItS01Mr0jJzgDEBk
  5bg4FES4X1yFijNW1yQmFucmQ6ROsWoKCXOmwTSJwCSyCjNg2uDxeElRlkpYV5GBgYGIZ6C1K
  LczBJU+VeM4hyMSsK830Cm8GTmlcBNfwW0mAlo8YX9LCCLSxIRUlINTNNtNz/e6eHj3+2z8V3
  xmSkHOYPDuTe7FxmzrK9VkJJ0ap328Nn9A492M/adq9x75cf2RMbYr3+mFAUKqwXH3lu28NU3
  rtIrrE9CHlfOvXrUbUPft/obKQnOD2dcP957YqqUYATrjK1n3p0RLdy16I7T5d+rRY98Wt6//
  KD39Olf8vS8dWYKVj/4/lTb1prfaq2HX2jMP0dtdpfF/kaSnruXhWy5UT3dI/mHs8K+TmuRCX
  4fbYvzSr/xPrl/ueoNz81Jtze/PXN564XPb1Sk4s/mpPl0TRc6OSVn35+L1/6nlTzOnsu5f43
  D+X82HIWv218tX2L3semD9YZUZdO7gVPL5qRrWJ6xnPWtJPARU9ZBJZbijERDLeai4kQApyI1
  Bz4DAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-571.messagelabs.com!1678168304!329344!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14347 invoked from network); 7 Mar 2023 05:51:44 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 7 Mar 2023 05:51:44 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id A1570100043
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Mar 2023 05:51:44 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 940C0100182
	for <openembedded-core@lists.openembedded.org>; Tue,  7 Mar 2023 05:51:44 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 7 Mar 2023 05:51:42 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH v2] vala: Fix install conflict when enable  multilib.
Date: Tue, 7 Mar 2023 13:51:31 +0800
Message-ID: <1678168291-14150-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 05:51:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178087

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
   file /usr/bin/vala-gen-introspect-0.56 conflicts between attempted installs of lib32-vala-0.56.3-r0.armv7ahf_neon and vala-0.56.3-r0.aarch64
   file /usr/bin/vapigen-wrapper conflicts between attempted installs
   of lib32-vala-0.56.3-r0.armv7ahf_neon and vala-0.56.3-r0.aarch64

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/vala/vala.inc | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/vala/vala.inc
index d3daee37dc..5f4d4ceb70 100644
--- a/meta/recipes-devtools/vala/vala.inc
+++ b/meta/recipes-devtools/vala/vala.inc
@@ -42,14 +42,20 @@ EXTRA_OECONF += " --disable-valadoc"
 # Vapigen wrapper needs to be available system-wide, because it will be used
 # to build vapi files from all other packages with vala support
 do_install:append:class-target() {
-        install -d ${D}${bindir_crossscripts}/
-        install ${B}/vapigen-wrapper ${D}${bindir_crossscripts}/
+        install -d ${D}${bindir_crossscripts}
+        install ${B}/vapigen-wrapper ${D}${bindir_crossscripts}
+        install ${B}/vapigen-wrapper ${D}${libdir}
 }
 
+FILES:${PN}-dev += "${libdir}/vapigen-wrapper"
+
 # Put vapigen wrapper into target sysroot so that it can be used when building
 # vapi files.
 SYSROOT_DIRS += "${bindir_crossscripts}"
 
+inherit multilib_script
+MULTILIB_SCRIPTS = "${PN}:${bindir}/vala-gen-introspect-0.56"
+
 SYSROOT_PREPROCESS_FUNCS:append:class-target = " vapigen_sysroot_preprocess"
 vapigen_sysroot_preprocess() {
         # Tweak the vapigen name in the vapigen pkgconfig file, so that it picks
@@ -65,4 +71,5 @@ PACKAGE_PREPROCESS_FUNCS += "vala_package_preprocess"
 
 vala_package_preprocess () {
 	sed -i -e 's:${RECIPE_SYSROOT}::g;' ${PKGD}${bindir_crossscripts}/vapigen-wrapper
+	rm -rf ${PKGD}${bindir_crossscripts}
 }
-- 
2.34.1


