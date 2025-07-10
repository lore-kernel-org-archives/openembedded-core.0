Return-Path: <Divya.Chellam@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 284E0C83F17
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 11:17:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6451.1752146231573196316
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Jul 2025 04:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=92865b89b7=divya.chellam@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A4e2wm004435
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 11:17:10 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pu19n68a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 11:17:10 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 10 Jul 2025 04:16:38 -0700
From: dchellam <divya.chellam@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 1/1] libpam: upgrade 1.7.0 -> 1.7.1
Date: Thu, 10 Jul 2025 16:46:43 +0530
Message-ID: <20250710111643.751741-1-divya.chellam@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: VNIOoHg0aOXY5xjnieJe9v04D6BWbfuy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE5OCBTYWx0ZWRfX4ARXlqOa4155 Gj3oDjRkH71MEHDZSbniILrn5A0ek4MC3kDl0H6REgZpM6Cp4z4tcUaozsPsF+lpNG14RWKiah7 Dzu3LsMvHO3h3WSqwePp0AlptsC/QXTZM9r6O8dgHM5WhSGJ3tnLwGizMuIMTRUG2Cz31/zOuk1
 NwSJym1dStrdJW1NcE5P5tLQ9l248rCUbAXFFCZXEXVqn5Z3chPvcl/C0tCB34182gdsXfTmhSl Pd4TCA4CoU9qWsfQXsS745GWZQpjBGiRlBnHN+IjyAuT/MhQkRB2ePLgc9sdVzydqbJ0w5944OU Oo1r47jxQAn/DPHlzw6vD27oKoQIEeyNcUSktswcxPeO7AwvmhJ9uk4QJ6xTeH6EtTKfMA0awh9 fPY86+aF
X-Authority-Analysis: v=2.4 cv=ZrntK87G c=1 sm=1 tr=0 ts=686fa136 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=omOdbC7AAAAA:8 a=P-IC7800AAAA:8 a=ag1SF4gXAAAA:8 a=t7CeM3EgAAAA:8
 a=qLfApxUun8_J0lj9rIQA:9 a=d3PnA9EDa4IxuAV0gXij:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: VNIOoHg0aOXY5xjnieJe9v04D6BWbfuy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2507080198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Jul 2025 11:17:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220117

From: Wang Mingyu <wangmy@fujitsu.com>

0001-meson.build-correct-check-for-existence-of-two-prepr.patch
removed since it's included in 1.7.1

Changelog:
===============
* pam_access: do not resolve ttys or display variables as hostnames.
* pam_access: added "nodns" option to disallow resolving of tokens as hostnames
  (CVE-2024-10963).
* pam_limits: added support for rttime (RLIMIT_RTTIME).
* pam_namespace: fixed potential privilege escalation (CVE-2025-6020).
* meson: added support of elogind as a logind provider.
* Multiple minor bug fixes, build fixes, portability fixes,
  documentation improvements, and translation updates.

(From OE-Core rev: 5e77c48e074a20e58a233ab5ed6d8ef09bbd55c8)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
---
 ...ect-check-for-existence-of-two-prepr.patch | 40 -------------------
 .../pam/{libpam_1.7.0.bb => libpam_1.7.1.bb}  |  3 +-
 2 files changed, 1 insertion(+), 42 deletions(-)
 delete mode 100644 meta/recipes-extended/pam/libpam/0001-meson.build-correct-check-for-existence-of-two-prepr.patch
 rename meta/recipes-extended/pam/{libpam_1.7.0.bb => libpam_1.7.1.bb} (97%)

diff --git a/meta/recipes-extended/pam/libpam/0001-meson.build-correct-check-for-existence-of-two-prepr.patch b/meta/recipes-extended/pam/libpam/0001-meson.build-correct-check-for-existence-of-two-prepr.patch
deleted file mode 100644
index ef087ffc06..0000000000
--- a/meta/recipes-extended/pam/libpam/0001-meson.build-correct-check-for-existence-of-two-prepr.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 9b5182d4781bcd6fb37a4030faf325965fde3e93 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Thu, 28 Nov 2024 20:32:17 +0100
-Subject: [PATCH] meson: correct check for existence of two preprocessor
- defines
-
-sizeof is meant for *types*, and in case of cross compiling
-the test program produced by it has incorrect syntax
-  __NR_keyctl something;
-and will always fail to compile.
-
-* meson.build: Use cc.get_define() instead of cc.sizeof() to check for
-preprocessor symbols.
-
-Co-authored-by: Dmitry V. Levin <ldv@strace.io>
-Upstream-Status: Backport [https://github.com/linux-pam/linux-pam/pull/861]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- meson.build | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index f6a7dafe9..307fed0aa 100644
---- a/meson.build
-+++ b/meson.build
-@@ -198,12 +198,12 @@ foreach ident: check_functions
-   endif
- endforeach
- 
--enable_pam_keyinit = cc.sizeof('__NR_keyctl', prefix: '#include <sys/syscall.h>') > 0
-+enable_pam_keyinit = cc.get_define('__NR_keyctl', prefix: '#include <sys/syscall.h>') != ''
- 
- if get_option('mailspool') != ''
-   cdata.set_quoted('PAM_PATH_MAILDIR', get_option('mailspool'))
- else
--  have = cc.sizeof('_PATH_MAILDIR', prefix: '#include <paths.h>') > 0
-+  have = cc.get_define('_PATH_MAILDIR', prefix: '#include <paths.h>') != ''
-   cdata.set('PAM_PATH_MAILDIR', have ? '_PATH_MAILDIR' : '"/var/spool/mail"')
- endif
- 
diff --git a/meta/recipes-extended/pam/libpam_1.7.0.bb b/meta/recipes-extended/pam/libpam_1.7.1.bb
similarity index 97%
rename from meta/recipes-extended/pam/libpam_1.7.0.bb
rename to meta/recipes-extended/pam/libpam_1.7.1.bb
index 4abc52bd93..68857c5138 100644
--- a/meta/recipes-extended/pam/libpam_1.7.0.bb
+++ b/meta/recipes-extended/pam/libpam_1.7.1.bb
@@ -22,10 +22,9 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/Linux-PAM-${PV}.tar.xz \
            file://pam.d/other \
            file://run-ptest \
            file://pam-volatiles.conf \
-           file://0001-meson.build-correct-check-for-existence-of-two-prepr.patch \
            "
 
-SRC_URI[sha256sum] = "57dcd7a6b966ecd5bbd95e1d11173734691e16b68692fa59661cdae9b13b1697"
+SRC_URI[sha256sum] = "21dbcec6e01dd578f14789eac9024a18941e6f2702a05cf91b28c232eeb26ab0"
 
 DEPENDS = "bison-native flex-native libxml2-native virtual/crypt"
 
-- 
2.40.0


