Return-Path: <praveen.kumar@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760B0C83F09
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 06:09:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8733.1752041339764656096
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 23:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=928594d0a8=praveen.kumar@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5693raJP001628;
	Tue, 8 Jul 2025 23:08:54 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47q3jn3jbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 08 Jul 2025 23:08:54 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Tue, 8 Jul 2025 23:08:38 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Tue, 8 Jul 2025 23:08:36 -0700
From: Praveen Kumar <praveen.kumar@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>,
        Praveen Kumar
	<praveen.kumar@windriver.com>
Subject: [oe-core][walnascar][PATCH 1/2] sudo: upgrade 1.9.16p2 -> 1.9.17
Date: Wed, 9 Jul 2025 11:38:45 +0530
Message-ID: <20250709060846.1931242-1-praveen.kumar@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: kbKeA7lcPiS9Z4I6ww-TKYSR2z_ZOe8i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE5OCBTYWx0ZWRfXx/We9q91Wa7g Qf+LWCV3Zkujla7LN2uvM2r2uTTGuUbipbhNDpZKm5148+J7tMlUKcGnCSlg0Oz2BFVrVRbe5gD I6Dt1kmv45mkOva2zXZe/8d3R3pwU/PXWLW7fcekJ7N5mtn7ezdgHmlL9JRRUrIj0jSEmqcTyk3
 I8+2U7ShR9E3iRwzH6nBy+0jAITm6g3TXDoRi7paDHg4Wm184SnRFOh6Jog8EX5X60Xl7MaIG5O cS4gy7ISxJpcywmhjlX/Pcn9qTYpmonKmB4nBkb2iZ2UPgA3EIs0FZtTxTX/KPrtxam+oNDiGsA /35bDo2KALXQrkUZPDaleniV/xCVSTGH0+Ml+ribwl5c5iMtbSEz4c7FuZ17TlYtqQKVRpiL/Is jkdSDn5V
X-Proofpoint-ORIG-GUID: kbKeA7lcPiS9Z4I6ww-TKYSR2z_ZOe8i
X-Authority-Analysis: v=2.4 cv=fv3cZE4f c=1 sm=1 tr=0 ts=686e0776 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Wb1JkmetP80A:10 a=SETLuvH0AAAA:8 a=omOdbC7AAAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8 a=-rdZmf_KNZBjDDHxh90A:9
 a=K2dp-gY6hJjlCEVBUzYH:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2507080198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 06:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220075

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright updated to 2025

0001-sudo.conf.in-fix-conflict-with-multilib.patch
refreshed for 1.9.17

(From OE-Core rev: c21ed3c8f4ca76ff7c65cf71a93759fad8846386)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9d41127b241133267449d81c92eb89123e8a6f48)

Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
---
 .../0001-sudo.conf.in-fix-conflict-with-multilib.patch      | 6 +++---
 meta/recipes-extended/sudo/sudo.inc                         | 2 +-
 .../sudo/{sudo_1.9.16p2.bb => sudo_1.9.17.bb}               | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.16p2.bb => sudo_1.9.17.bb} (96%)

diff --git a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
index ec0384e257..1989c5abd7 100644
--- a/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
+++ b/meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
@@ -1,4 +1,4 @@
-From 61ae82a2ba502492b6a78f248258abb71daeb227 Mon Sep 17 00:00:00 2001
+From 8c69192754ba73dd6e3273728a21aa73988f4bfb Mon Sep 17 00:00:00 2001
 From: Kai Kang <kai.kang@windriver.com>
 Date: Tue, 17 Nov 2020 11:13:40 +0800
 Subject: [PATCH] sudo.conf.in: fix conflict with multilib
@@ -20,7 +20,7 @@ Upstream-Status: Inappropriate [OE configuration specific]
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/examples/sudo.conf.in b/examples/sudo.conf.in
-index 2187457..0908d24 100644
+index bdd676c..094341c 100644
 --- a/examples/sudo.conf.in
 +++ b/examples/sudo.conf.in
 @@ -4,7 +4,7 @@
@@ -52,7 +52,7 @@ index 2187457..0908d24 100644
  # Sudo plugin directory:
 @@ -74,7 +74,7 @@
  # The default directory to use when searching for plugins that are
- # specified without a fully qualified path name.
+ # specified without a fully-qualified path name.
  #
 -#Path plugin_dir @plugindir@
 +#Path plugin_dir $plugindir
diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index 0afbf669f0..a23de1fcf7 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sudo.ws"
 BUGTRACKER = "http://www.sudo.ws/bugs/"
 SECTION = "admin"
 LICENSE = "ISC & BSD-3-Clause & BSD-2-Clause & Zlib"
-LIC_FILES_CHKSUM = "file://LICENSE.md;md5=0a6876cbeb2aa51837935ba3fd82ee87 \
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=2841c822e587db145364ca95e9be2ffa \
                     file://plugins/sudoers/redblack.c;beginline=1;endline=46;md5=03e35317699ba00b496251e0dfe9f109 \
                     file://lib/util/reallocarray.c;beginline=3;endline=15;md5=397dd45c7683e90b9f8bf24638cf03bf \
                     file://lib/util/fnmatch.c;beginline=3;endline=27;md5=004d7d2866ba1f5b41174906849d2e0f \
diff --git a/meta/recipes-extended/sudo/sudo_1.9.16p2.bb b/meta/recipes-extended/sudo/sudo_1.9.17.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.16p2.bb
rename to meta/recipes-extended/sudo/sudo_1.9.17.bb
index fbe507ad32..71d48f448d 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.16p2.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.17.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "976aa56d3e3b2a75593307864288addb748c9c136e25d95a9cc699aafa77239c"
+SRC_URI[sha256sum] = "3f212c69d534d5822b492d099abb02a593f91ca99f5afde5cb9bd3e1dcdad069"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.40.0


