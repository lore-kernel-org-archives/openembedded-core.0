Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF6BC61CE7
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 15:01:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18921.1749049257049548161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 08:00:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8250162873=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5544EbK2018125
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 08:00:56 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9rtpd0-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 08:00:56 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 4 Jun 2025 08:00:54 -0700
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 4 Jun 2025 08:00:54 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/3] nfs-utils: 2.8.2 -> 2.8.3
Date: Wed, 4 Jun 2025 08:01:01 -0700
Message-ID: <18c63e6317edfe84fd21bba3862949dc30c06ffb.1749049204.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1749049204.git.liezhi.yang@windriver.com>
References: <cover.1749049204.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: DnmmDf2rgPxHmO6TOD_0dJCRjzz5PVM4
X-Authority-Analysis: v=2.4 cv=VIHdn8PX c=1 sm=1 tr=0 ts=68405fa8 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=gu6fZOg2AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8
 a=9v3m73-Cgt0CSv_JcFQA:9 a=2RSlZUUhi9gRBrsHwhhZ:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDExMyBTYWx0ZWRfXwXCGAoYcPjxA CpWn9zfcu6s31berKDPJEhO9USGMzMX7jLAylTPtgwsLm8Wik4dACI5uQWliRk9XUpRl6Rl2kQt LLB2g5RiwjJ0GcOJH6V4g1/0TI1Kqx1tu7uOqkmLCOsREwjdYtEuCoyLE36uOkgXlY2/icGJ0Q7
 gmqZi4W6tiFRQNvKaiawqy5/Y5CT5E88ntMdg0arMm5KaAQIfq75GgBTVRA7HJrEYh7SKLsM2Vo CxnFlAs/gRjs8adYzN9IhuH4j9Br3BZ4w5Gkasw3+Sw3xeUH2dMZLujmsN3wfsocog38mF/RLes Tw2AC13FN5a5fh83dgdjfW8NK3H0bxNHMDIkx98XsamFMt2Fog/p/+H9XXJr/DaQ2qnp67XMbOr
 iid2QtQ6ub7NfyvL7RI1WdhS8by53YAHn9A+id1MHfBt8wKNHteCopQ6+Daym2YNtAhPpJPA
X-Proofpoint-ORIG-GUID: DnmmDf2rgPxHmO6TOD_0dJCRjzz5PVM4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506040113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 15:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217955

From: Robert Yang <liezhi.yang@windriver.com>

* Remove upstream merged patches:
0001-Fix-typecast-warning-with-clang.patch
0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...0001-Fix-typecast-warning-with-clang.patch | 32 ---------------
 ...mon.c-fix-a-formatting-error-with-cl.patch | 40 -------------------
 ...{nfs-utils_2.8.2.bb => nfs-utils_2.8.3.bb} |  4 +-
 3 files changed, 1 insertion(+), 75 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.8.2.bb => nfs-utils_2.8.3.bb} (96%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch
deleted file mode 100644
index f493a3051e..0000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-Fix-typecast-warning-with-clang.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 0a64c5ad17786796d84390e480a38b4f762229ae Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 18 Dec 2024 19:20:39 -0800
-Subject: [PATCH v2] Fix typecast warning with clang
-
-Fixes
-file.c:200:8: error: assigning to 'char *' from 'const char *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
-
-Upstream-Status: Submitted [https://marc.info/?l=linux-nfs&m=173463533411103&w=2]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Cc: Benjamin Coddington <bcodding@redhat.com>
-Cc: Steve Dickson <steved@redhat.com>
----
-v2: Make base as const char pointer insread of trying type punning
-
- support/nsm/file.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/support/nsm/file.c b/support/nsm/file.c
-index de122b0f..68f99bf0 100644
---- a/support/nsm/file.c
-+++ b/support/nsm/file.c
-@@ -184,7 +184,8 @@ static char *
- nsm_make_temp_pathname(const char *pathname)
- {
- 	size_t size;
--	char *path, *base;
-+	char *path;
-+	const char *base;
- 	int len;
- 
- 	size = strlen(pathname) + sizeof(".new") + 1;
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch
deleted file mode 100644
index a99ba284e0..0000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From cc59a7fe15b6ca2ee43cba0dc1d699323b36ffcc Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 21 Mar 2025 10:42:56 +0100
-Subject: [PATCH] support/nfs/xcommon.c: fix a formatting error with clang
-
-Specifically, this happens:
-
-| xcommon.c:101:24: error: format string is not a string literal [-Werror,-Wformat-nonliteral]
-|   101 |      vfprintf (stderr, fmt2, args);
-|       |                        ^~~~
-
-A similar approach (print \n seprately) is already used elsewhere in
-the same file.
-
-Upstream-Status: Submitted [via email to steved@redhat.com,linux-nfs@vger.kernel.org]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- support/nfs/xcommon.c | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/support/nfs/xcommon.c b/support/nfs/xcommon.c
-index 3989f0b..1d04dd1 100644
---- a/support/nfs/xcommon.c
-+++ b/support/nfs/xcommon.c
-@@ -94,13 +94,11 @@ xstrconcat4 (const char *s, const char *t, const char *u, const char *v) {
- void
- nfs_error (const char *fmt, ...) {
-      va_list args;
--     char *fmt2;
- 
--     fmt2 = xstrconcat2 (fmt, "\n");
-      va_start (args, fmt);
--     vfprintf (stderr, fmt2, args);
-+     vfprintf (stderr, fmt, args);
-+     fprintf (stderr, "\n");
-      va_end (args);
--     free (fmt2);
- }
- 
- /* Make a canonical pathname from PATH.  Returns a freshly malloced string.
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb
similarity index 96%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb
index 1f3afa0560..9668ac0e86 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.3.bb
@@ -22,13 +22,11 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfsserver \
            file://nfscommon \
            file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
-           file://0001-Fix-typecast-warning-with-clang.patch \
            file://0004-Use-nogroup-for-nobody-group.patch \
            file://0005-find-OE-provided-Kerberos.patch \
-           file://0003-support-nfs-xcommon.c-fix-a-formatting-error-with-cl.patch \
            "
 
-SRC_URI[sha256sum] = "a39bbea76ac0ab9e6e8699caf3c308b6b310c20d458e8fa8606196d358e7fb15"
+SRC_URI[sha256sum] = "11e7c5847a8423a72931c865bd9296e7fd56ff270a795a849183900961711725"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.49.0


