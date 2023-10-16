Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137F1CDB465
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 08:34:59 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.113068.1697445296259472977
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Oct 2023 01:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="135785738"
X-IronPort-AV: E=Sophos;i="6.03,228,1694703600"; 
   d="scan'208";a="135785738"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 17:34:54 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8537FCD7E2
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 17:34:51 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B55AFD9463
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 17:34:50 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9743F86511;
	Mon, 16 Oct 2023 17:34:49 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] shared-mime-info: upgrade 2.2 -> 2.3
Date: Mon, 16 Oct 2023 16:34:40 +0800
Message-Id: <1697445280-29811-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27938.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27938.006
X-TMASE-Result: 10-1.945000-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrHlg673CD1YYkt9BigJAcVlYM
	JR3dIrh25JbzyGgbwWW7dBytXCMbG2Vv7q3SEBmgqhcdnP91eXElJy85NfiMc7Kw8Hx0EGitsPg
	sj1zRh6J4DRXcBO+wiOaffHI8kAmiHY/bzRmIaZG5x7uAXGEprZiQDIJsDspXoHmOTZNdeMWUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLPYi6nffPw6fmuqZ
	n9B1LbVnkQ8uQn+NqTcw2XCtQqXiOt36Ksxi+MRcp6ocE20iF6Ek7/qSAdr5ZW8XPzgsA/Pdznb
	9kU1KMmIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Oct 2023 08:34:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189276

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
* Make update-mime-database compatible with MSVC (by porting it to C++)
* Fix description for audio/x-xi
* ci: Use ci-templates to build image
* CI: Use dnf5 instead of dnf
* use Title Case for mime type description
* ci: Use detached pipelines
* Make application/pgp-* not inherit from text/plain
* Change descriptions to say LibreOffice rather than OpenOffice
* `audio/x-wav`: Add missing sub-class relationship with `application/x-riff`

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/shared-mime-info/shared-mime-info_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
index 387dd7bbad..81a9259d7b 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "libxml2 itstool-native glib-2.0 shared-mime-info-native xmlto-native"
 
 SRC_URI = "git://gitlab.freedesktop.org/xdg/shared-mime-info.git;protocol=https;branch=master"
-SRCREV = "13695c7225c2f525a435e72739c33ac32bbfbbb9"
-PV = "2.2"
+SRCREV = "8e80a317f5c61a7f410330abea441e0b0b9280b5"
+PV = "2.3"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig gettext python3native mime
-- 
2.34.1


