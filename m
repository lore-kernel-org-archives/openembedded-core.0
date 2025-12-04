Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 618C2D1D879
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 06:44:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37676.1764830673189572027
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 22:44:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bCnF5/W1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44334587b6=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B46axHm2214406
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Dec 2025 06:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=2IQf74+mwT6zg+g7eOSLvwfMHpMgOuKjNYQKUmBhXIU=; b=bCnF5/W1j+g9
	huY+LtJsJCiNLDLsjuZiHddJUmBSo2l2wdYVtNCcgZF9tMyzWSwkd2GRoryPJOtN
	sRgMlh42ooqFMZb/MXAcPgjRxklkr6pJYNAjTLsIYVhUF0GKvrgnXvFwnp/f6KiL
	D31lfTHeu2ld8SFbePpSLU5audzx1uqezc1oiDLhSE1r2w16bWbGJHK+j0O475Bx
	ALNPAffqSnIFXQ+V+hOo1Jfx6qOlRVXJOXSJO+M4F0vod+ebs76jsJZRHbDS6uuS
	xXy5J7dycoV4iWxd0lnZBRODXxZO8oT6m0iDbRX1AGs1oI4bCDLsJgE7T+RAHjeo
	277wi195/w==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqp21x4ee-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 06:44:32 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 3 Dec 2025 22:44:29 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 3 Dec 2025 22:44:29 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 3/3] util-linux/util-linux-libuuid: upgrade from 2.41.1 to 2.41.2
Date: Thu, 4 Dec 2025 06:44:29 +0000
Message-ID: <20251204064429.559529-3-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251204064429.559529-1-Qi.Chen@windriver.com>
References: <20251204064429.559529-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: vaBJ5bySTP8TheFwv9aBCcXiQv-FK1TE
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=69312dd0 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=KVkWobFq-BrjWL36Ej8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA1MyBTYWx0ZWRfX91BmSuTO3AK/
 JfRoq0whAS92PZ4mbGZWAQc09r8/J7KNImw3+5IBESUMFjqRu9WEbOfIV14Hm5a1QK0DpSGe+PS
 DM9oudnSSdows8QiKcYB3HFnlzx4Lu9fDdl6eVW91FrYC1L+EJjUhREa+Vi5Zp0oalPIVhw134b
 1g++64v98TZClv4cY1/rnE98vvxUt4OPYL/Mq3jw8r3gC4k0cxPhfiOf5runA2aLZm5o6tcKotS
 LoD0TKRuTifOnBVCUxcogK3v43zqOyGkki/ZD2numhd/BDlt6wK1QPLwtktYbQfvURFCf8iqkHj
 i/KQywrIXKAEMfKwZgdiRpTNx0LwSLp+FAMhGN5E4xppKcU4DmlC+EPXWtm5FrqfbL0FwV0A9QZ
 0P6e8hji+8NLApagHHbSvvVQu1RahA==
X-Proofpoint-ORIG-GUID: vaBJ5bySTP8TheFwv9aBCcXiQv-FK1TE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 06:44:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227271

From: Chen Qi <Qi.Chen@windriver.com>

The following two patches are dropped as they are in new version:
  util-linux/0001-include-mount-api-utils-avoid-using-sys-mount.h.patch
  util-linux/0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...2.41.1.bb => util-linux-libuuid_2.41.2.bb} |  0
 meta/recipes-core/util-linux/util-linux.inc   |  4 +-
 ...nt-api-utils-avoid-using-sys-mount.h.patch | 29 ----------
 ...st_sigstate.c-explicitly-reset-SIGIN.patch | 55 -------------------
 ...l-linux_2.41.1.bb => util-linux_2.41.2.bb} |  0
 5 files changed, 1 insertion(+), 87 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.41.1.bb => util-linux-libuuid_2.41.2.bb} (100%)
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-include-mount-api-utils-avoid-using-sys-mount.h.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch
 rename meta/recipes-core/util-linux/{util-linux_2.41.1.bb => util-linux_2.41.2.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index e7a3c5be9f..c29011ad61 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -19,10 +19,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch \
            file://0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch \
            file://0001-ts-kill-decode-use-RTMIN-from-kill-L-instead-of-hard.patch \
-           file://0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch \
-           file://0001-include-mount-api-utils-avoid-using-sys-mount.h.patch \
            "
 
-SRC_URI[sha256sum] = "be9ad9a276f4305ab7dd2f5225c8be1ff54352f565ff4dede9628c1aaa7dec57"
+SRC_URI[sha256sum] = "6062a1d89b571a61932e6fc0211f36060c4183568b81ee866cf363bce9f6583e"
 
 CVE_PRODUCT = "util-linux"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-include-mount-api-utils-avoid-using-sys-mount.h.patch b/meta/recipes-core/util-linux/util-linux/0001-include-mount-api-utils-avoid-using-sys-mount.h.patch
deleted file mode 100644
index 544f45362d..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-include-mount-api-utils-avoid-using-sys-mount.h.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 2a9b48d20d74f65ac708b3bcee6a7e2a61aadf88 Mon Sep 17 00:00:00 2001
-From: Karel Zak <kzak@redhat.com>
-Date: Thu, 21 Aug 2025 09:59:10 +0200
-Subject: [PATCH] include/mount-api-utils: avoid using sys/mount.h
-
-The file is unnecessary and introduces duplicate #define of MS_* macros.
-
-Fixes: https://github.com/util-linux/util-linux/issues/3674
-Signed-off-by: Karel Zak <kzak@redhat.com>
-Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/2a9b48d20d74f65ac708b3bcee6a7e2a61aadf88]
----
- include/mount-api-utils.h | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/include/mount-api-utils.h b/include/mount-api-utils.h
-index 920d6766a..e35524168 100644
---- a/include/mount-api-utils.h
-+++ b/include/mount-api-utils.h
-@@ -6,7 +6,6 @@
- #define UTIL_LINUX_MOUNT_API_UTILS
- 
- #ifdef HAVE_LINUX_MOUNT_H
--#include <sys/mount.h>
- #include <linux/mount.h>
- #include <linux/unistd.h>
- #include <sys/syscall.h>
--- 
-2.34.1
-
diff --git a/meta/recipes-core/util-linux/util-linux/0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch b/meta/recipes-core/util-linux/util-linux/0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch
deleted file mode 100644
index 324798cfd5..0000000000
--- a/meta/recipes-core/util-linux/util-linux/0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 383efe26a2a61b420d369cd2c23f03d1d690d425 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Mon, 28 Jul 2025 20:35:13 +0800
-Subject: [PATCH] tests/helpers/test_sigstate.c: explicitly reset SIGINT to
- default action after trapping
-
-After upgrading bash to 5.3 to contain commit [1], if SIGINT was trapped in
-asynchronous subshell, bash called set_signal_async_ignored to make sure
-processes that are created by this asynchronous subshell to ignore SIGINT.
-
-And it caused test case `kill/decode' failed, the signal INT was existed in
-both of Blocked and Ignored
-
-$ ./tests/run.sh --use-system-commands --parsable --show-diff   kill/decode
-...
-diff-{{{
-|--- /usr/lib/util-linux/ptest/tests/expected/kill/decode        2011-04-05 23:00:00.000000000 +0000
-|+++ /usr/lib/util-linux/ptest/tests/output/kill/decode  2025-07-28 12:09:46.279000000 +0000
-@@ -16,5 +16,5 @@
- Pending (thread): INT ILL
- Pending (process): USR1
- Blocked: INT ILL ABRT FPE USR1 SEGV TERM
--Ignored: HUP QUIT TRAP PIPE ALRM
-+Ignored: HUP INT QUIT TRAP PIPE ALRM
- Caught: ILL USR1
-}}}-diff
-...
-
-Explicitly reset SIGINT to default action after trapping, then the
-test case `kill/decode' works on both of old (<5.3) and new (>=5.3) bash
-
-[1] https://cgit.git.savannah.gnu.org/cgit/bash.git/commit/?h=devel&id=a5d2617c7a7e602ace1f4149987cdfd075c4e762
-
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/3666]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- tests/helpers/test_sigstate.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/helpers/test_sigstate.c b/tests/helpers/test_sigstate.c
-index 52c7dcb..b631ec2 100644
---- a/tests/helpers/test_sigstate.c
-+++ b/tests/helpers/test_sigstate.c
-@@ -68,6 +68,7 @@ int main(int argc _U_, char **argv _U_)
- 	sigignore(SIGPIPE);
- 	sigignore(SIGALRM);
- 
-+	signal(SIGINT, SIG_DFL);
- 	signal(SIGBUS, SIG_DFL);
- 	signal(SIGFPE, SIG_DFL);
- 	signal(SIGSEGV, SIG_DFL);
--- 
-2.34.1
-
diff --git a/meta/recipes-core/util-linux/util-linux_2.41.1.bb b/meta/recipes-core/util-linux/util-linux_2.41.2.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.41.1.bb
rename to meta/recipes-core/util-linux/util-linux_2.41.2.bb
-- 
2.43.0


