Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AFB6C83F20
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 16:11:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.17864.1752250278022400553
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 09:11:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9287446b54=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BETEB3032705
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 09:11:17 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pyb5pprk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 09:11:17 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Fri, 11 Jul 2025 09:11:16 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Fri, 11 Jul 2025 09:11:15 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Praveen Kumar <praveen.kumar@windriver.com>
Subject: [oe-core][kirkstone][PATCH 2/2] sudo: upgrade 1.9.15p5 -> 1.9.17p1
Date: Fri, 11 Jul 2025 21:40:55 +0530
Message-ID: <20250711161055.47019-2-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250711161055.47019-1-praveen.kumar@windriver.com>
References: <20250711161055.47019-1-praveen.kumar@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE5OCBTYWx0ZWRfX6C8Cks/TPncx owoNIxlkaQXQZqpAvwXHcybFfxfHUUIguuPOk/kXpj0s7hL3WBwtTACFnGZaALg4RxSaATdgTvL meffYjlAQabYAn+083aTHUr3CPt46dSLdGxQ39bZS0vo03LrGfsKLsp8T8Edf2BvqzUJ97ywU/l
 JT1wRtMGoPsSd6uZL6cAEMm2dv3ixEY5CqMB322w6B9cai1t4i4+FODeJhC42Am8yexXquJXuSO onn2Jrz8CW4NJlQhRWJ+O2GUybMcSoKBOCtPeB5JZHeCtZuqosa7brscG6fwGM9pvio3/5RFnrI 16BwLqTrqe7GODioRD29xDqw2dgGV9kln04Gt8aXLx8BEFDPk46ZeCotrH+dJP5JgJs9sCUGKFu /v82Y+Dr
X-Authority-Analysis: v=2.4 cv=V5590fni c=1 sm=1 tr=0 ts=687137a5 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Wb1JkmetP80A:10 a=SETLuvH0AAAA:8 a=t7CeM3EgAAAA:8 a=-praE0YbAAAA:8 a=3tcz3bTJAAAA:8 a=Dy-nIOaOAAAA:8
 a=iJxi6EHRmY2kKV07RgMA:9 a=K2dp-gY6hJjlCEVBUzYH:22 a=FdTzh2GWekK77mhwV6Dw:22 a=c9viVvrXCFUxYxaP6N77:22 a=4EbjBm0RLgFgoQzmu6QD:22 a=jLki-nKXRYJekfbZoHwD:22
X-Proofpoint-ORIG-GUID: yJVzHnWeHfpAvrXw9U_uaaTYGpH9q7mS
X-Proofpoint-GUID: yJVzHnWeHfpAvrXw9U_uaaTYGpH9q7mS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2507080198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 16:11:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220156

Changelog:
===========
* Fixed CVE-2025-32462.  Sudo's -h (--host) option could be specified
   when running a command or editing a file.  This could enable a
   local privilege escalation attack if the sudoers file allows the
   user to run commands on a different host.

* Fixed CVE-2025-32463.  An attacker can leverage sudo's -R
  (--chroot) option to run arbitrary commands as root, even if
  they are not listed in the sudoers file.  The chroot support has
  been deprecated an will be removed entirely in a future release.

License-Update: Copyright updated to 2025

0001-sudo.conf.in-fix-conflict-with-multilib.patch refreshed for 1.9.17

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 ...o.conf.in-fix-conflict-with-multilib.patch |  7 ++-
 meta/recipes-extended/sudo/sudo.inc           |  2 +-
 .../{sudo_1.9.15p5.bb => sudo_1.9.17p1.bb}    | 54 ++++++++++++++++++-
 3 files changed, 57 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.15p5.bb => sudo_1.9.17p1.bb} (52%)

diff --git a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
index 041c717e00..1989c5abd7 100644
--- a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
+++ b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
@@ -1,4 +1,4 @@
-From 6e835350b7413210c410d3578cfab804186b7a4f Mon Sep 17 00:00:00 2001
+From 8c69192754ba73dd6e3273728a21aa73988f4bfb Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 17 Nov 2020 11:13:40 +0800
 Subject: [PATCH] sudo.conf.in: fix conflict with multilib
@@ -15,13 +15,12 @@ Update the comments in sudo.conf.in to avoid the conflict.
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
 Upstream-Status: Inappropriate [OE configuration specific]
-
 ---
  examples/sudo.conf.in | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/examples/sudo.conf.in b/examples/sudo.conf.in
-index 2187457..0908d24 100644
+index bdd676c..094341c 100644
 --- a/examples/sudo.conf.in
 +++ b/examples/sudo.conf.in
 @@ -4,7 +4,7 @@
@@ -53,7 +52,7 @@ index 2187457..0908d24 100644
  # Sudo plugin directory:
 @@ -74,7 +74,7 @@
  # The default directory to use when searching for plugins that are
- # specified without a fully qualified path name.
+ # specified without a fully-qualified path name.
  #
 -#Path plugin_dir @plugindir@
 +#Path plugin_dir $plugindir
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index d3b6bf1ad8..a8323f8b6d 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=5100e20d35f9015f9eef6bdb27ba194f \
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2841c822e587db145364ca95e9be2ffa \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo_1.9.15p5.bb b/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
similarity index 52%
rename from meta/recipes-extended/sudo/sudo_1.9.15p5.bb
rename to meta/recipes-extended/sudo/sudo_1.9.17p1.bb
index 8e542015ad..c5d57da9f0 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.15p5.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17p1.bb
@@ -1,3 +1,55 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE.md
+# +++ LICENSE.md
+# @@ -1,6 +1,6 @@
+#  Sudo is distributed under the following license:
+#
+# -    Copyright (c) 1994-1996, 1998-2023
+# +    Copyright (c) 1994-1996, 1998-2025
+#          Todd C. Miller <Todd.Miller@sudo.ws>
+#
+#      Permission to use, copy, modify, and distribute this software for any
+# @@ -247,9 +247,9 @@
+#
+#  The file arc4random.c bears the following license:
+#
+# -    Copyright (c) 1996, David Mazieres <dm@uun.org>
+# -    Copyright (c) 2008, Damien Miller <djm@openbsd.org>
+# -    Copyright (c) 2013, Markus Friedl <markus@openbsd.org>
+# +    Copyright (c) 1996, David Mazieres <dm@uun.org>
+# +    Copyright (c) 2008, Damien Miller <djm@openbsd.org>
+# +    Copyright (c) 2013, Markus Friedl <markus@openbsd.org>
+#      Copyright (c) 2014, Theo de Raadt <deraadt@openbsd.org>
+#
+#      Permission to use, copy, modify, and distribute this software for any
+# @@ -282,7 +282,7 @@
+#
+#  The file getentropy.c bears the following license:
+#
+# -    Copyright (c) 2014 Theo de Raadt <deraadt@openbsd.org>
+# +    Copyright (c) 2014 Theo de Raadt <deraadt@openbsd.org>
+#      Copyright (c) 2014 Bob Beck <beck@obtuse.com>
+#
+#      Permission to use, copy, modify, and distribute this software for any
+# @@ -299,7 +299,7 @@
+#
+#  The embedded copy of zlib bears the following license:
+#
+# -    Copyright (C) 1995-2022 Jean-loup Gailly and Mark Adler
+# +    Copyright (C) 1995-2024 Jean-loup Gailly and Mark Adler
+#
+#      This software is provided 'as-is', without any express or implied
+#      warranty.  In no event will the authors be held liable for any damages
+#
+#
+
 require sudo.inc
 
 SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
@@ -7,7 +59,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "558d10b9a1991fb3b9fa7fa7b07ec4405b7aefb5b3cb0b0871dbc81e3a88e558"
+SRC_URI[sha256sum] = "ff607ea717072197738a78f778692cd6df9a7e3e404565f51de063ca27455d32"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.40.0


