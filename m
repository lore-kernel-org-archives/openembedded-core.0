Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A95FBC87FCD
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 09:28:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8467.1753349299893048413
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 02:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9300d03ff4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56O7nfBv660552
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 02:28:19 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4838wx0e1s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 02:28:19 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Thu, 24 Jul 2025 02:28:18 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Thu, 24 Jul 2025 02:28:17 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3 3/4] lttng-tools: Upgrade 2.13.15 -> 2.14.0
Date: Thu, 24 Jul 2025 17:28:13 +0800
Message-ID: <20250724092814.4183226-3-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250724092814.4183226-1-mingli.yu@eng.windriver.com>
References: <20250724092814.4183226-1-mingli.yu@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Proofpoint-ORIG-GUID: FK8-aDJ5HmxWg6jvKwc_pT2CheDeUNr0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA3MCBTYWx0ZWRfX6e5eBuAJpqsR
 pXq0e59X935Al74ogPLIXtDXxGiXBYroXejHlGD3ibv1ey4PGE7JPOKUvJ/z5pTpYMdo1VC1byJ
 kqqFKxpA+jqIfI5GUUoJH8R4KuUnSu3qtRCxXxIFwIr7bxNf6BxdhNSjRRSB3Mjb8KvtMw3jdK6
 Q+MFW85ZhtQqV61AcrYnxBYC+IwVUAAiyvuhAoxctVot+oC4ZYXceUJhydM+zCDIyq7h2r+oZZV
 qnO0S4EICsRnuVhoeZhtUNKEUbBaLtBlVjrxM8U8S2/kCOgju8dnAYDoVFaJz1OImpPNsMCiHXM
 Au3yHGlRdKT/na0nStxoAuzw6UxkNOojkWIVKEaEyRPgF8vh1MFfYqCc/qJf0QPgRxaJoy9t96A
 LKIphggd
X-Authority-Analysis: v=2.4 cv=Gq5C+l1C c=1 sm=1 tr=0 ts=6881fcb3 cx=c_pps
 a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=a5LkSv8FAAAA:8
 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=7d_E57ReAAAA:8 a=pGLkceISAAAA:8
 a=a_U1oVfrAAAA:8 a=omOdbC7AAAAA:8 a=ag1SF4gXAAAA:8 a=PP3kfFr8Otq8dPhFP0gA:9
 a=HnplsV-4ino9p3AH:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=m9p5bXcFLgAA:10
 a=E2cWBXyb0kjxxB1PlMdk:22 a=FdTzh2GWekK77mhwV6Dw:22 a=jhqOcbufqs7Y1TYCrUUU:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: FK8-aDJ5HmxWg6jvKwc_pT2CheDeUNr0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507230196
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 56O7nfBv660552
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 09:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220828

From: Mingli Yu <mingli.yu@windriver.com>

* Remove 3 backported patch.
0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch
0001-compat-Define-off64_t-as-off_t-on-linux.patch
0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch

* Remove 0001-fix-lttng-tools-fails-to-compile-with-libxml2-2.14.0.patch
as the issue has been fixed in another way as [1].

* Rebase 0001-tests-do-not-strip-a-helper-library.patch and disable-tests=
.patch
to fuzz issue.

* Add babeltrace2 to DEPENDS to fix below configure error.
 | configure: error: libbabeltrace2 is required to build tests

* src/common/config/session.xsd is restructured to src/common/session.xsd=
 [2].

* Add 0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch to =
fix
the below buildpath QA issue.
ERROR: lttng-tools-2.14.0-r0 do_package_qa: QA Issue: File /usr/lib/lttng=
-tools/ptest/tests/utils/testapp/gen-ust-events-constructor/gen-ust-event=
s-c-constructor-so in package lttng-tools-ptest contains reference to TMP=
DIR [buildpaths]
ERROR: lttng-tools-2.14.0-r0 do_package_qa: QA Issue: lttng-tools-ptest: =
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events-constructor=
/gen-ust-events-c-constructor-so contains bad RPATH /buildarea3/myu2/yoct=
o/builds/ptest-2025-07-09/tmp/work/core2-64-poky-linux/lttng-tools/2.14.0=
/build/tests/utils/testapp/gen-ust-events-constructor [rpaths]
ERROR: lttng-tools-2.14.0-r0 do_package_qa: QA Issue: File /usr/lib/lttng=
-tools/ptest/tests/utils/testapp/gen-ust-events-constructor/gen-ust-event=
s-constructor-so in package lttng-tools-ptest contains reference to TMPDI=
R [buildpaths]
ERROR: lttng-tools-2.14.0-r0 do_package_qa: QA Issue: lttng-tools-ptest: =
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events-constructor=
/gen-ust-events-constructor-so contains bad RPATH /buildarea3/myu2/yocto/=
builds/ptest-2025-07-09/tmp/work/core2-64-poky-linux/lttng-tools/2.14.0/b=
uild/tests/utils/testapp/gen-ust-events-constructor [rpaths]

* Add the redpends for lttng-tools-ptest to fix the test failure.
 ERROR: tools/live/test_early_inactive_app.py
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Traceback (most recent call last):
  File "/usr/lib/lttng-tools/ptest/tests/regression/./tools/live/test_ear=
ly_inactive_app.py", line 21, in <module>
    import lttngtest
  File "/usr/lib/lttng-tools/ptest/tests/utils/lttngtest/__init__.py", li=
ne 9, in <module>
    from .environment import *
  File "/usr/lib/lttng-tools/ptest/tests/utils/lttngtest/environment.py",=
 line 13, in <module>
    import random
ModuleNotFoundError: No module named 'random'
ERROR: tools/live/test_early_inactive_app.py - missing test plan

ModuleNotFoundError: No module named 'random'
ModuleNotFoundError: No module named 'xml'
ModuleNotFoundError: No module named 'tempfile'
ModuleNotFoundError: No module named 'json'
ModuleNotFoundError: No module named 'bt2'

[1] https://github.com/lttng/lttng-tools/commit/2d2e77ddc9e3e63c3c658e824=
fb754f5a534a6ab
[2] https://github.com/lttng/lttng-tools/commit/4ae042345b4094e98611744d9=
ba6c92265058fdb

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...troy-flush-fix-session-daemon-abort-.patch |   53 -
 ...pat-Define-off64_t-as-off_t-on-linux.patch |   86 --
 ...fails-to-compile-with-libxml2-2.14.0.patch |   55 -
 ...onstructor-change-rpath-to-libdir-li.patch |   43 +
 ...skip_kernel_test-to-check-root-user-.patch | 1243 -----------------
 ...-tests-do-not-strip-a-helper-library.patch |    2 +-
 .../lttng/lttng-tools/disable-tests.patch     |   10 +-
 .../lttng/lttng-tools/run-ptest               |    2 +-
 ...tools_2.13.15.bb =3D> lttng-tools_2.14.0.bb} |   23 +-
 9 files changed, 65 insertions(+), 1452 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Fix-rotati=
on-destroy-flush-fix-session-daemon-abort-.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-compat-Def=
ine-off64_t-as-off_t-on-linux.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-fix-lttng-=
tools-fails-to-compile-with-libxml2-2.14.0.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-gen-ust-ev=
ents-constructor-change-rpath-to-libdir-li.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-tests-add-=
check_skip_kernel_test-to-check-root-user-.patch
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.15.bb =3D> lttng-tool=
s_2.14.0.bb} (92%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-rotation-dest=
roy-flush-fix-session-daemon-abort-.patch b/meta/recipes-kernel/lttng/ltt=
ng-tools/0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch
deleted file mode 100644
index e5c9677073..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-Fix-rotation-destroy-flu=
sh-fix-session-daemon-abort-.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From ea47622987d0947af3e8f75d16d52e27ebd60166 Mon Sep 17 00:00:00 2001
-From: Xiangyu Chen <xiangyu.chen@windriver.com>
-Date: Mon, 25 Mar 2024 18:20:14 +0800
-Subject: [PATCH] Fix: rotation-destroy-flush: fix session daemon abort i=
f no
- kernel module present
-
-Testing rotation-destroy-flush when no lttng kernel modules present, it =
would
-be failed with error message:
-
-  Error: Unable to load required module lttng-ring-buffer-client-discard
-  not ok 1 - Start session daemon
-  Failed test 'Start session daemon'
-  not ok 2 - Create session rotation_destroy_flush in -o /tmp/tmp.test_r=
ot ...
-  ...
-
-This because test script that sets the LTTNG_ABORT_ON_ERROR environment
-variable. It's this environment variable that causes the sessiond to han=
dle the
-kernel module loading failure as an abort rather than a warning.
-
-Using "check_skip_kernel_test" to detect whether the kernel module fails=
 to
-load is expected or not. If the failure is expected, the script won't se=
t that
-environment variable any more.
-
-Fixes: 3a174400
-("tests:add check_skip_kernel_test to check root user and lttng kernel m=
odules")
-
-Submitted [https://review.lttng.org/c/lttng-tools/+/12155]
-Upstream-Status: Backport [https://github.com/lttng/lttng-tools/commit/7=
8f5b22de60c114c5c83410015a08bdd212edc0b]
-Change-Id: I371e9ba717613e2940186f710cf3cccd35baed6c
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
----
- .../ust/rotation-destroy-flush/test_rotation_destroy_flush  | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/tests/regression/ust/rotation-destroy-flush/test_rotation_d=
estroy_flush b/tests/regression/ust/rotation-destroy-flush/test_rotation_=
destroy_flush
-index 8ef4f0d..e506b53 100755
---- a/tests/regression/ust/rotation-destroy-flush/test_rotation_destroy_=
flush
-+++ b/tests/regression/ust/rotation-destroy-flush/test_rotation_destroy_=
flush
-@@ -23,11 +23,11 @@ SIZE_LIMIT=3D$PAGE_SIZE
- NR_ITER=3D10
- NUM_TESTS=3D$((15*$NR_ITER))
-=20
--# Ensure the daemons invoke abort on error.
--export LTTNG_ABORT_ON_ERROR=3D1
--
- source $TESTDIR/utils/utils.sh
-=20
-+# Ensure the daemons invoke abort on error.
-+check_skip_kernel_test || export LTTNG_ABORT_ON_ERROR=3D1
-+
- # MUST set TESTDIR before calling those functions
- function run_app()
- {
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off=
64_t-as-off_t-on-linux.patch b/meta/recipes-kernel/lttng/lttng-tools/0001=
-compat-Define-off64_t-as-off_t-on-linux.patch
deleted file mode 100644
index e68feb2753..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-compat-Define-off64_t-as=
-off_t-on-linux.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From e5b2615aaad44a1c0d52da1469b28f99cfb12b5f Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?J=3DC3=3DA9r=3DC3=3DA9mie=3D20Galarneau?=3D
- <jeremie.galarneau@efficios.com>
-Date: Tue, 17 Jan 2023 16:57:35 -0500
-Subject: [PATCH] compat: off64_t is not defined by musl
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-This helps compile with latest musl, where off64_t is not defined unless
-_LARGEFILE64_SOURCE is defined. On glibc, _LARGEFILE64_SOURCE is defined
-if _GNU_SOURCE is defined, so the problem is only seen with musl.
-
-Since the project uses AC_SYS_LARGEFILE, which from the autoconf doc:
-"arrange for 64-bit file offsets, known as large-file support."
-
-As such, it is safe to assume off_t is 64-bit wide. This is checked by a
-static_assert to catch any platform where autoconf would let a 32-bit
-off_t slip.
-
-Submitted [https://review.lttng.org/c/lttng-tools/+/9268]
-Upstream-Status: Backport [https://github.com/lttng/lttng-tools/commit/5=
7fd993799a2b081c826f6fc8def32d28d526bfb]
-Reported-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: J=C3=A9r=C3=A9mie Galarneau <jeremie.galarneau@efficios.c=
om>
-Change-Id: If2c6007a8c85bc3f3065002af8a7538b882fb4a8
----
- src/common/compat/compat-fcntl.c |  5 ++++-
- src/common/compat/fcntl.h        | 10 +++-------
- 2 files changed, 7 insertions(+), 8 deletions(-)
-
-diff --git a/src/common/compat/compat-fcntl.c b/src/common/compat/compat=
-fcntl.c
-index 5c0bdc9..18bab0a 100644
---- a/src/common/compat/compat-fcntl.c
-+++ b/src/common/compat/compat-fcntl.c
-@@ -8,14 +8,17 @@
- #define _LGPL_SOURCE
- #include <common/compat/fcntl.h>
- #include <common/macros.h>
-+#include <common/bug.h>
-+#include <stdint.h>
- #include <unistd.h>
-=20
- #ifdef __linux__
-=20
- LTTNG_HIDDEN
--int compat_sync_file_range(int fd, off64_t offset, off64_t nbytes,
-+int compat_sync_file_range(int fd, off_t offset, off_t nbytes,
- 		unsigned int flags)
- {
-+	LTTNG_BUILD_BUG_ON(sizeof(off_t) !=3D sizeof(int64_t));
- #ifdef HAVE_SYNC_FILE_RANGE
- 	return sync_file_range(fd, offset, nbytes, flags);
- #else
-diff --git a/src/common/compat/fcntl.h b/src/common/compat/fcntl.h
-index 5e566e5..93b22b7 100644
---- a/src/common/compat/fcntl.h
-+++ b/src/common/compat/fcntl.h
-@@ -13,16 +13,12 @@
-=20
- #include <common/compat/errno.h>
-=20
--#if (defined(__CYGWIN__))
--typedef long long off64_t;
--#endif
--
- #if (defined(__FreeBSD__) || defined(__sun__))
- typedef off64_t loff_t;
- #endif
-=20
- #ifdef __linux__
--extern int compat_sync_file_range(int fd, off64_t offset, off64_t nbyte=
s,
-+extern int compat_sync_file_range(int fd, off_t offset, off_t nbytes,
- 		unsigned int flags);
- #define lttng_sync_file_range(fd, offset, nbytes, flags) \
- 	compat_sync_file_range(fd, offset, nbytes, flags)
-@@ -37,8 +33,8 @@ extern int compat_sync_file_range(int fd, off64_t offs=
et, off64_t nbytes,
- #define SYNC_FILE_RANGE_WAIT_BEFORE   0
- #define SYNC_FILE_RANGE_WRITE         0
-=20
--static inline int lttng_sync_file_range(int fd, off64_t offset,
--		off64_t nbytes, unsigned int flags)
-+static inline int lttng_sync_file_range(int fd, off_t offset,
-+		off_t nbytes, unsigned int flags)
- {
- 	return -ENOSYS;
- }
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-fix-lttng-tools-f=
ails-to-compile-with-libxml2-2.14.0.patch b/meta/recipes-kernel/lttng/ltt=
ng-tools/0001-fix-lttng-tools-fails-to-compile-with-libxml2-2.14.0.patch
deleted file mode 100644
index 7c2b893731..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-fix-lttng-tools-fails-to=
-compile-with-libxml2-2.14.0.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 0b19e10a8a52fab0bfadbac5ce70f1b2d185a1d1 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Wed, 21 May 2025 13:09:25 +0800
-Subject: [PATCH] fix lttng-tools fails to compile with libxml2 2.14.0+
-
-Description:
-| In file included from /srv/pokybuild/yocto-worker/qemux86-alt/build/bu=
ild/tmp/work/core2-32-poky-linux/lttng-tools/2.13.15/recipe-sysroot/usr/i=
nclude/libxml2/libxml/parser.h:25,
-|                  from ../../../../lttng-tools-2.13.15/src/common/confi=
g/session-config.c:29:
-| /srv/pokybuild/yocto-worker/qemux86-alt/build/build/tmp/work/core2-32-=
poky-linux/lttng-tools/2.13.15/recipe-sysroot/usr/include/libxml2/libxml/=
encoding.h:173:7: note: declared here
-|   173 |     } input XML_DEPRECATED_MEMBER;
-|       |       ^~~~~
-| ../../../../lttng-tools-2.13.15/src/common/config/session-config.c:432=
:15: error: called object is not a function or function pointer
-|   432 |         ret =3D handler->input(out_str, &out_len, (const xmlCh=
ar *) in_str, &in_len);
-|       |               ^~~~~~~
-| At top level:
-| cc1: note: unrecognized command-line option '-Wno-incomplete-setjmp-de=
claration' may have been intended to silence earlier diagnostics
-
-
-According to [1][2], the UTF-8 handler is
-```
-static xmlCharEncError
-UTF8ToUTF8(void *vctxt ATTRIBUTE_UNUSED,
-           unsigned char* out, int *outlen,
-           const unsigned char* in, int *inlen,
-           int flush ATTRIBUTE_UNUSED)
-```
-
-Update input.func with setting ATTRIBUTE_UNUSED params with NULL and 0
-
-[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/38f475072aefe032fff1=
dc058df3e56c1e7062fa
-[2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/69b83bb68e2a8ed0013f=
80c51b9a358714b00c9a#478024cc18a2cc8dbaed34076e9775f6827f413d_2188_2201
-
-Upstream-Status: Submitted [https://github.com/lttng/lttng-tools/pull/17=
0]
-Signed-off-by: Marko, Peter <Peter.Marko@siemens.com>
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- src/common/config/session-config.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/common/config/session-config.c b/src/common/config/sess=
ion-config.c
-index bb4e9fe..4042d34 100644
---- a/src/common/config/session-config.c
-+++ b/src/common/config/session-config.c
-@@ -429,7 +429,7 @@ static xmlChar *encode_string(const char *in_str)
- 		goto end;
- 	}
-=20
--	ret =3D handler->input(out_str, &out_len, (const xmlChar *) in_str, &i=
n_len);
-+	ret =3D handler->input.func(NULL, out_str, &out_len, (const xmlChar *)=
 in_str, &in_len, 0);
- 	if (ret < 0) {
- 		xmlFree(out_str);
- 		out_str =3D NULL;
---=20
-2.34.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-gen-ust-events-co=
nstructor-change-rpath-to-libdir-li.patch b/meta/recipes-kernel/lttng/ltt=
ng-tools/0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch
new file mode 100644
index 0000000000..562381b5fd
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-gen-ust-events-construct=
or-change-rpath-to-libdir-li.patch
@@ -0,0 +1,43 @@
+From 673e8ef4763ea9a9c67248e6a1a7eadfc4bc278d Mon Sep 17 00:00:00 2001
+From: Liu Yiding <liuyd.fnst@fujitsu.com>
+Date: Thu, 3 Jul 2025 19:00:25 +0800
+Subject: [PATCH] gen-ust-events-constructor: change rpath to $libdir lik=
e
+ others do
+
+set rpath to abs_builddir will cause issue like:
+ERROR: lttng-tools-2.14.0-r0 do_package_qa: QA Issue: File /usr/lib/lttn=
g-tools/ptest/tests/utils/testapp/gen-ust-events-constructor/gen-ust-even=
ts-c-constructor-so in package lttng-tools-ptest contains reference to TM=
PDIR [buildpaths]
+ERROR: lttng-tools-2.14.0-r0 do_package_qa: QA Issue: File /usr/lib/lttn=
g-tools/ptest/tests/utils/testapp/gen-ust-events-constructor/gen-ust-even=
ts-constructor-so in package lttng-tools-ptest contains reference to TMPD=
IR [buildpaths]
+
+userspace-probe-elf-binary and userspace-probe-sdt-binary set rpath to l=
ibdir
+ |$ grep -nr "rpath" */Makefile.am
+ |gen-ust-events-constructor/Makefile.am:29:                         -rp=
ath $(abs_builddir)
+ |userspace-probe-elf-binary/Makefile.am:8:libfoo_la_LDFLAGS =3D -shared=
 -module -avoid-version -rpath $(libdir)
+ |userspace-probe-sdt-binary/Makefile.am:25:libfoo_la_LDFLAGS =3D -modul=
e -shared -avoid-version -rpath $(libdir)
+ |userspace-probe-sdt-binary/Makefile.am:31:libbar_la_LDFLAGS =3D -modul=
e -shared -avoid-version -rpath $(libdir)
+ |userspace-probe-sdt-binary/Makefile.am:37:libzzz_la_LDFLAGS =3D -modul=
e -shared -avoid-version -rpath $(libdir)
+
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+
+Upstream-Status: Submitted [https://github.com/lttng/lttng-tools/pull/17=
1]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ tests/utils/testapp/gen-ust-events-constructor/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/utils/testapp/gen-ust-events-constructor/Makefile.am =
b/tests/utils/testapp/gen-ust-events-constructor/Makefile.am
+index 6c09cf585..3eb26fba2 100644
+--- a/tests/utils/testapp/gen-ust-events-constructor/Makefile.am
++++ b/tests/utils/testapp/gen-ust-events-constructor/Makefile.am
+@@ -26,7 +26,7 @@ else
+ # Force the shared flag on the noinst libraries since they are
+ # only built static by default
+ FORCE_SHARED_LIB_OPTIONS =3D -module -shared -avoid-version \
+-			   -rpath $(abs_builddir)
++			   -rpath $(libdir)
+=20
+ noinst_LTLIBRARIES +=3D libtp-so-provider.la libtp-so-define.la \
+ 	libtp-so_c-provider.la libtp-so_c-define.la
+--=20
+2.34.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-add-check_s=
kip_kernel_test-to-check-root-user-.patch b/meta/recipes-kernel/lttng/ltt=
ng-tools/0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch
deleted file mode 100644
index cb2c763b51..0000000000
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-add-check_skip_ker=
nel_test-to-check-root-user-.patch
+++ /dev/null
@@ -1,1243 +0,0 @@
-From 76976da4e01ce90923f61ba734e066faefb76beb Mon Sep 17 00:00:00 2001
-From: Xiangyu Chen <xiangyu.chen@windriver.com>
-Date: Mon, 12 Feb 2024 09:23:54 -0500
-Subject: [PATCH] tests: add check_skip_kernel_test to check root user an=
d
- lttng kernel modules
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-The current tests will run both userspace and kernel testing. Some of
-use cases only use lttng for one kind of tracing on an embedded
-device (e.g. userspace), so in this scenario, the kernel modules might
-not install to target rootfs, the test cases would be fail and exit.
-
-Add LTTNG_TOOLS_DISABLE_KERNEL_TESTS to skip the lttng kernel features
-test, this flag can be set via "make":
-
-  make check LTTNG_TOOLS_DISABLE_KERNEL_TESTS=3D1
-
-When this flag was set, all kernel related testcases would be marked as
-SKIP in result.
-
-Since the the LTTNG_TOOLS_DISABLE_KERNEL_TESTS was checked in function
-check_skip_kernel_test, lots of testcases also need to check root
-permission, so merging the root permission checking into
-check_skip_kernel_test.
-
-Upstream-Status: Backport from
-[https://git.lttng.org/?p=3Dlttng-tools.git;a=3Dcommit;h=3D3a1744008331a=
0604479d3d7461f77056fad3a64]
-
-Change-Id: I49a1f642a9869c21a69e0186c296fd917bd7b525
-Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: J=C3=A9r=C3=A9mie Galarneau <jeremie.galarneau@efficios.c=
om>
----
- tests/destructive/metadata-regeneration       |  8 +----
- tests/perf/test_perf_raw.in                   |  8 +----
- tests/regression/kernel/test_all_events       |  8 +----
- tests/regression/kernel/test_callstack        |  8 +----
- tests/regression/kernel/test_channel          |  8 +----
- tests/regression/kernel/test_clock_override   |  8 +----
- tests/regression/kernel/test_event_basic      |  8 +----
- tests/regression/kernel/test_kernel_function  |  8 +----
- tests/regression/kernel/test_lttng_logger     |  8 +----
- tests/regression/kernel/test_ns_contexts      |  8 +----
- .../regression/kernel/test_ns_contexts_change |  9 +----
- .../kernel/test_rotation_destroy_flush        |  8 +----
- .../regression/kernel/test_select_poll_epoll  |  8 +----
- tests/regression/kernel/test_syscall          |  8 +----
- tests/regression/kernel/test_userspace_probe  |  8 +----
- tests/regression/tools/clear/test_kernel      |  8 +----
- .../tools/filtering/test_invalid_filter       |  8 +----
- .../tools/filtering/test_unsupported_op       |  8 +----
- .../tools/filtering/test_valid_filter         |  8 +----
- tests/regression/tools/health/test_health.sh  | 10 ++----
- tests/regression/tools/health/test_thread_ok  |  9 +----
- tests/regression/tools/live/test_kernel       | 10 +++---
- tests/regression/tools/live/test_lttng_kernel |  8 +----
- tests/regression/tools/metadata/test_kernel   |  8 +----
- .../test_notification_kernel_buffer_usage     | 36 +++++++++----------
- .../test_notification_kernel_capture          | 23 ++++++------
- .../test_notification_kernel_error            | 23 ++++++------
- .../test_notification_kernel_instrumentation  | 23 ++++++------
- .../test_notification_kernel_syscall          | 19 +++++-----
- .../test_notification_kernel_userspace_probe  | 20 +++++------
- .../notification/test_notification_multi_app  | 14 +++-----
- ...test_notification_notifier_discarded_count |  9 +++--
- .../tools/regen-metadata/test_kernel          |  8 +----
- .../tools/regen-statedump/test_kernel         |  8 +----
- tests/regression/tools/rotation/test_kernel   |  8 +----
- tests/regression/tools/snapshots/test_kernel  |  8 +----
- .../tools/snapshots/test_kernel_streaming     |  8 +----
- .../streaming/test_high_throughput_limits     |  8 +----
- tests/regression/tools/streaming/test_kernel  |  8 +----
- .../tools/tracker/test_event_tracker          |  8 +----
- .../tools/trigger/test_add_trigger_cli        | 12 ++-----
- .../tools/trigger/test_list_triggers_cli      | 26 +++++---------
- .../tools/wildcard/test_event_wildcard        |  8 +----
- .../test_relayd_working_directory             |  4 +--
- .../ust/namespaces/test_ns_contexts_change    |  7 +---
- tests/regression/ust/test_event_perf          |  8 +----
- tests/utils/utils.sh                          | 35 ++++++++++++++++++
- 47 files changed, 166 insertions(+), 363 deletions(-)
-
-diff --git a/tests/destructive/metadata-regeneration b/tests/destructive=
/metadata-regeneration
-index b81e7af..36b130d 100755
---- a/tests/destructive/metadata-regeneration
-+++ b/tests/destructive/metadata-regeneration
-@@ -185,19 +185,13 @@ function test_ust_streaming ()
- 	rm -f ${file_sync_before_last}
- }
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
- if ! destructive_tests_enabled ; then
- 	echo 'You need to set the LTTNG_ENABLE_DESTRUCTIVE_TESTS to "will-brea=
k-my-system" as argument to run this test'
- 	echo 'Moreover, please make sure that ntp is not running while executi=
ng this test'
- 	exit 0
- fi
-=20
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test $NUM_TESTS "Skipping all tests." ||
- {
- 	start_lttng_relayd "-o $TRACE_PATH"
- 	start_lttng_sessiond
-diff --git a/tests/perf/test_perf_raw.in b/tests/perf/test_perf_raw.in
-index f293ccd..d35529a 100644
---- a/tests/perf/test_perf_raw.in
-+++ b/tests/perf/test_perf_raw.in
-@@ -137,12 +137,6 @@ function test_kernel_raw()
- 	rm -rf $TRACE_PATH
- }
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
- # MUST set TESTDIR before calling those functions
- plan_tests $NUM_TESTS
-=20
-@@ -154,7 +148,7 @@ have_libpfm
-=20
- test_ust_raw
-=20
--skip $isroot "Root access is needed for kernel testing, skipping." 9 ||
-+check_skip_kernel_test 9 ||
- {
- 	modprobe lttng-test
- 	test_kernel_raw
-diff --git a/tests/regression/kernel/test_all_events b/tests/regression/=
kernel/test_all_events
-index 2e20888..044f9b6 100755
---- a/tests/regression/kernel/test_all_events
-+++ b/tests/regression/kernel/test_all_events
-@@ -43,13 +43,7 @@ plan_tests $NUM_TESTS
-=20
- print_test_banner "$TEST_DESC"
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
- 	start_lttng_sessiond
-diff --git a/tests/regression/kernel/test_callstack b/tests/regression/k=
ernel/test_callstack
-index a4477fd..d8d6b5e 100755
---- a/tests/regression/kernel/test_callstack
-+++ b/tests/regression/kernel/test_callstack
-@@ -134,13 +134,7 @@ plan_tests $NUM_TESTS
-=20
- print_test_banner "$TEST_DESC"
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." "$NUM_TESTS" =
||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
- 	start_lttng_sessiond
-diff --git a/tests/regression/kernel/test_channel b/tests/regression/ker=
nel/test_channel
-index 9cc74c4..4c377bd 100755
---- a/tests/regression/kernel/test_channel
-+++ b/tests/regression/kernel/test_channel
-@@ -47,13 +47,7 @@ function test_channel_buffer_too_large()
- plan_tests $NUM_TESTS
- print_test_banner "$TEST_DESC"
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	start_lttng_sessiond
-=20
-diff --git a/tests/regression/kernel/test_clock_override b/tests/regress=
ion/kernel/test_clock_override
-index 7289289..48a3f92 100755
---- a/tests/regression/kernel/test_clock_override
-+++ b/tests/regression/kernel/test_clock_override
-@@ -172,13 +172,7 @@ TESTS=3D(
- TEST_COUNT=3D${#TESTS[@]}
- i=3D0
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
- 	trap signal_cleanup SIGTERM SIGINT
-diff --git a/tests/regression/kernel/test_event_basic b/tests/regression=
/kernel/test_event_basic
-index ac9ec05..387e2f7 100755
---- a/tests/regression/kernel/test_event_basic
-+++ b/tests/regression/kernel/test_event_basic
-@@ -73,13 +73,7 @@ plan_tests $NUM_TESTS
-=20
- print_test_banner "$TEST_DESC"
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test $NUM_TESTS "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
- 	start_lttng_sessiond
-diff --git a/tests/regression/kernel/test_kernel_function b/tests/regres=
sion/kernel/test_kernel_function
-index b1d5491..ea16cde 100755
---- a/tests/regression/kernel/test_kernel_function
-+++ b/tests/regression/kernel/test_kernel_function
-@@ -43,13 +43,7 @@ plan_tests $NUM_TESTS
-=20
- print_test_banner "$TEST_DESC"
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	start_lttng_sessiond_notap
- 	validate_lttng_modules_present
-diff --git a/tests/regression/kernel/test_lttng_logger b/tests/regressio=
n/kernel/test_lttng_logger
-index b8f7ded..00eaae8 100755
---- a/tests/regression/kernel/test_lttng_logger
-+++ b/tests/regression/kernel/test_lttng_logger
-@@ -110,13 +110,7 @@ plan_tests $NUM_TESTS
-=20
- print_test_banner "$TEST_DESC"
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
- 	start_lttng_sessiond
-diff --git a/tests/regression/kernel/test_ns_contexts b/tests/regression=
/kernel/test_ns_contexts
-index 7d447bc..1c71ea5 100755
---- a/tests/regression/kernel/test_ns_contexts
-+++ b/tests/regression/kernel/test_ns_contexts
-@@ -108,13 +108,7 @@ plan_tests $NUM_TESTS
- print_test_banner "$TEST_DESC"
-=20
-=20
--isroot=3D0
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." "$NUM_TESTS" =
&& exit 0
--
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." && exit 0
-=20
- system_has_ns=3D0
- if [ -d "/proc/$$/ns" ]; then
-diff --git a/tests/regression/kernel/test_ns_contexts_change b/tests/reg=
ression/kernel/test_ns_contexts_change
-index 42a6127..3f5e4ee 100755
---- a/tests/regression/kernel/test_ns_contexts_change
-+++ b/tests/regression/kernel/test_ns_contexts_change
-@@ -162,14 +162,7 @@ plan_tests $NUM_TESTS
-=20
- print_test_banner "$TEST_DESC"
-=20
--
--isroot=3D0
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." "$NUM_TESTS" =
&& exit 0
--
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." && exit 0
-=20
- system_has_ns=3D0
- if [ -d "/proc/$$/ns" ]; then
-diff --git a/tests/regression/kernel/test_rotation_destroy_flush b/tests=
/regression/kernel/test_rotation_destroy_flush
-index cb773d7..0af514b 100755
---- a/tests/regression/kernel/test_rotation_destroy_flush
-+++ b/tests/regression/kernel/test_rotation_destroy_flush
-@@ -120,13 +120,7 @@ TESTS=3D(
- TEST_COUNT=3D${#TESTS[@]}
- i=3D0
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
- 	trap signal_cleanup SIGTERM SIGINT
-diff --git a/tests/regression/kernel/test_select_poll_epoll b/tests/regr=
ession/kernel/test_select_poll_epoll
-index d8245a0..20f0ef0 100755
---- a/tests/regression/kernel/test_select_poll_epoll
-+++ b/tests/regression/kernel/test_select_poll_epoll
-@@ -374,13 +374,7 @@ if test $? !=3D 0; then
- 	exit 0
- fi
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
-=20
-diff --git a/tests/regression/kernel/test_syscall b/tests/regression/ker=
nel/test_syscall
-index 401a18a..219d947 100755
---- a/tests/regression/kernel/test_syscall
-+++ b/tests/regression/kernel/test_syscall
-@@ -664,13 +664,7 @@ plan_tests $NUM_TESTS
-=20
- print_test_banner "$TEST_DESC"
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
- 	start_lttng_sessiond
-diff --git a/tests/regression/kernel/test_userspace_probe b/tests/regres=
sion/kernel/test_userspace_probe
-index 1091ee6..5d984d6 100755
---- a/tests/regression/kernel/test_userspace_probe
-+++ b/tests/regression/kernel/test_userspace_probe
-@@ -815,13 +815,7 @@ fi
- plan_tests $NUM_TESTS
- print_test_banner "$TEST_DESC"
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
- 	start_lttng_sessiond
-diff --git a/tests/regression/tools/clear/test_kernel b/tests/regression=
/tools/clear/test_kernel
-index 06fb1c3..48250a7 100755
---- a/tests/regression/tools/clear/test_kernel
-+++ b/tests/regression/tools/clear/test_kernel
-@@ -536,12 +536,6 @@ plan_tests $NUM_TESTS
-=20
- print_test_banner "$TEST_DESC"
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
- streaming_tests=3D(test_kernel_streaming
- 	test_kernel_streaming_rotate_clear
- 	test_kernel_streaming_clear_rotate
-@@ -563,7 +557,7 @@ snapshot_tests=3D(test_kernel_streaming_snapshot
- 	test_kernel_local_snapshot
- )
-=20
--skip $isroot "Root access is needed. Skipping all kernel streaming test=
s." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping kernel streaming tests." =
||
- {
- 	trap signal_cleanup SIGTERM SIGINT
-=20
-diff --git a/tests/regression/tools/filtering/test_invalid_filter b/test=
s/regression/tools/filtering/test_invalid_filter
-index 7d9e524..8435e55 100755
---- a/tests/regression/tools/filtering/test_invalid_filter
-+++ b/tests/regression/tools/filtering/test_invalid_filter
-@@ -168,13 +168,7 @@ done
-=20
- test_bytecode_limit -u
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel invalid filter=
 tests." $NUM_KERNEL_TESTS ||
-+check_skip_kernel_test "$NUM_KERNEL_TESTS" "Skipping kernel invalid fil=
ter tests." ||
- {
- 	diag "Test kernel filters"
- 	i=3D0
-diff --git a/tests/regression/tools/filtering/test_unsupported_op b/test=
s/regression/tools/filtering/test_unsupported_op
-index 299247a..91eb86d 100755
---- a/tests/regression/tools/filtering/test_unsupported_op
-+++ b/tests/regression/tools/filtering/test_unsupported_op
-@@ -103,13 +103,7 @@ while [ "$i" -lt "$OP_COUNT" ]; do
- 	let "i++"
- done
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel unsupported fi=
lter operations tests." $NUM_KERNEL_TESTS ||
-+check_skip_kernel_test $NUM_KERNEL_TESTS "Skipping kernel unsupported f=
ilter operations tests." ||
- {
- 	diag "Test kernel unsupported filter operations"
-=20
-diff --git a/tests/regression/tools/filtering/test_valid_filter b/tests/=
regression/tools/filtering/test_valid_filter
-index e76ffa2..1ba7c79 100755
---- a/tests/regression/tools/filtering/test_valid_filter
-+++ b/tests/regression/tools/filtering/test_valid_filter
-@@ -1452,13 +1452,7 @@ KERNEL_FILTERS=3D(
-=20
- IFS=3D$OLDIFS
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel valid filter t=
ests." $NUM_KERNEL_TESTS ||
-+check_skip_kernel_test "$NUM_KERNEL_TESTS" "Skipping kernel valid filte=
r tests." ||
- {
- 	diag "Test kernel valid filters"
-=20
-diff --git a/tests/regression/tools/health/test_health.sh b/tests/regres=
sion/tools/health/test_health.sh
-index b3d6419..68716e6 100644
---- a/tests/regression/tools/health/test_health.sh
-+++ b/tests/regression/tools/health/test_health.sh
-@@ -82,7 +82,7 @@ function test_health
- 		diag "With UST consumer daemons"
- 		enable_ust_lttng_event_ok $SESSION_NAME $UST_EVENT_NAME $CHANNEL_NAME
-=20
--		skip $isroot "Root access is needed. Skipping kernel consumer health =
check test." "1" ||
-+		check_skip_kernel_test "1" "Skipping kernel consumer health check tes=
t." ||
- 		{
- 			diag "With kernel consumer daemon"
- 			lttng_enable_kernel_event $SESSION_NAME $KERNEL_EVENT_NAME $CHANNEL_=
NAME
-@@ -113,7 +113,7 @@ function test_health
-=20
-=20
- 	if [ ${test_needs_root} -eq 1 ]; then
--		skip ${isroot} "Root access needed for test \"${test_thread_name}\"."=
 "1" ||
-+		check_skip_kernel_test "1" "Skipping \"${test_thread_name}\"." ||
- 		{
- 			report_errors "${test_thread_error_string}" "${test_relayd}"
- 		}
-@@ -276,12 +276,6 @@ STDERR_PATH=3D$(mktemp --tmpdir tmp.test_health_std=
err_path.XXXXXX)
- TRACE_PATH=3D$(mktemp --tmpdir -d tmp.test_health_trace_path.XXXXXX)
- HEALTH_PATH=3D$(mktemp --tmpdir -d tmp.test_health_trace_path.XXXXXX)
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
- THREAD_COUNT=3D${#THREAD[@]}
- i=3D0
- while [ "$i" -lt "$THREAD_COUNT" ]; do
-diff --git a/tests/regression/tools/health/test_thread_ok b/tests/regres=
sion/tools/health/test_thread_ok
-index e84adb6..e5e2354 100755
---- a/tests/regression/tools/health/test_thread_ok
-+++ b/tests/regression/tools/health/test_thread_ok
-@@ -67,7 +67,7 @@ function test_thread_ok
- 	$CURDIR/$HEALTH_CHECK_BIN > ${STDOUT_PATH} 2> ${STDERR_PATH}
- 	report_errors
-=20
--	skip $isroot "Root access is needed. Skipping kernel consumer health c=
heck test." "5" ||
-+	check_skip_kernel_test "5" "Skipping kernel consumer health check test=
." ||
- 	{
- 		diag "With kernel consumer daemon"
- 		create_lttng_session_no_output $SESSION_NAME
-@@ -115,13 +115,6 @@ STDERR_PATH=3D$(mktemp --tmpdir tmp.test_thread_ok_=
stderr_path.XXXXXX)
- TRACE_PATH=3D$(mktemp --tmpdir -d tmp.test_thread_ok_trace_path.XXXXXX)
- HEALTH_PATH=3D$(mktemp --tmpdir -d tmp.test_thread_ok_trace_path.XXXXXX=
)
-=20
--# The manage kernel thread is only spawned if we are root
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
- test_thread_ok
-=20
- rm -rf ${HEALTH_PATH}
-diff --git a/tests/regression/tools/live/test_kernel b/tests/regression/=
tools/live/test_kernel
-index b622b52..fdaa09f 100755
---- a/tests/regression/tools/live/test_kernel
-+++ b/tests/regression/tools/live/test_kernel
-@@ -39,13 +39,11 @@ function clean_live_tracing()
- 	rm -rf $TRACE_PATH
- }
-=20
--# Need root access for kernel tracing.
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	plan_skip_all "Root access is needed. Skipping all tests."
-+check_skip_kernel_test &&
-+{
-+	plan_skip_all "Skipping all tests."
- 	exit 0
--fi
-+}
-=20
- modprobe lttng-test
-=20
-diff --git a/tests/regression/tools/live/test_lttng_kernel b/tests/regre=
ssion/tools/live/test_lttng_kernel
-index a23d937..1b93364 100755
---- a/tests/regression/tools/live/test_lttng_kernel
-+++ b/tests/regression/tools/live/test_lttng_kernel
-@@ -45,13 +45,7 @@ function clean_live_tracing()
- }
-=20
- # Need root access for kernel tracing.
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	modprobe lttng-test
-=20
-diff --git a/tests/regression/tools/metadata/test_kernel b/tests/regress=
ion/tools/metadata/test_kernel
-index 57cace6..26e95d9 100755
---- a/tests/regression/tools/metadata/test_kernel
-+++ b/tests/regression/tools/metadata/test_kernel
-@@ -91,13 +91,7 @@ plan_tests $NUM_TESTS
- print_test_banner "$TEST_DESC"
-=20
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel metadata tests=
." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping kernel metadata tests." |=
|
- {
- 	validate_lttng_modules_present
- 	modprobe lttng-test
-diff --git a/tests/regression/tools/notification/test_notification_kerne=
l_buffer_usage b/tests/regression/tools/notification/test_notification_ke=
rnel_buffer_usage
-index 76e69a7..8fdaabb 100755
---- a/tests/regression/tools/notification/test_notification_kernel_buffe=
r_usage
-+++ b/tests/regression/tools/notification/test_notification_kernel_buffe=
r_usage
-@@ -60,29 +60,27 @@ function test_buffer_usage_notification
- 	wait $APP_PID 2> /dev/null
- }
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--
--	validate_lttng_modules_present
--
-+check_skip_kernel_test &&
-+{
-+	plan_skip_all "Skipping all tests."
-+	rm -rf "$TEST_TMPDIR"
-+	exit 0
-+}
-=20
--	modprobe lttng-test
-+validate_lttng_modules_present
-=20
--	# Used on sessiond launch.
--	LTTNG_SESSIOND_ENV_VARS=3D"LTTNG_TESTPOINT_ENABLE=3D1 \
--		CONSUMER_PAUSE_PIPE_PATH=3D${TESTPOINT_PIPE_PATH} \
--		LD_PRELOAD=3D${TESTPOINT}"
--	start_lttng_sessiond_notap
-+modprobe lttng-test
-=20
--	test_buffer_usage_notification
-+# Used on sessiond launch.
-+LTTNG_SESSIOND_ENV_VARS=3D"LTTNG_TESTPOINT_ENABLE=3D1 \
-+	CONSUMER_PAUSE_PIPE_PATH=3D${TESTPOINT_PIPE_PATH} \
-+	LD_PRELOAD=3D${TESTPOINT}"
-+start_lttng_sessiond_notap
-=20
--	stop_lttng_sessiond_notap
--	rmmod lttng-test
-+test_buffer_usage_notification
-=20
--	rm -rf "${consumerd_pipe[@]}" 2> /dev/null
--else
--	# Kernel tests are skipped.
--	plan_tests $NUM_TESTS
--	skip 0 "Root access is needed. Skipping all kernel notification tests.=
" $NUM_TESTS
--fi
-+stop_lttng_sessiond_notap
-+rmmod lttng-test
-=20
-+rm -rf "${consumerd_pipe[@]}" 2> /dev/null
- rm -rf "$TEST_TMPDIR"
-diff --git a/tests/regression/tools/notification/test_notification_kerne=
l_capture b/tests/regression/tools/notification/test_notification_kernel_=
capture
-index 88f123d..0f8a2bc 100755
---- a/tests/regression/tools/notification/test_notification_kernel_captu=
re
-+++ b/tests/regression/tools/notification/test_notification_kernel_captu=
re
-@@ -31,22 +31,21 @@ function test_basic_error_path
- }
-=20
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	validate_lttng_modules_present
-+check_skip_kernel_test &&
-+{
-+	plan_skip_all "Skipping all tests."
-+	exit 0
-+}
-=20
--	modprobe lttng-test
-+validate_lttng_modules_present
-=20
--	start_lttng_sessiond_notap
-+modprobe lttng-test
-=20
--	test_basic_error_path
-+start_lttng_sessiond_notap
-=20
--	stop_lttng_sessiond_notap
--	rmmod lttng-test
-+test_basic_error_path
-=20
--else
--	# Kernel tests are skipped.
--	plan_tests $NUM_TESTS
--	skip 0 "Root access is needed. Skipping all kernel notification tests.=
" $NUM_TESTS
--fi
-+stop_lttng_sessiond_notap
-+rmmod lttng-test
-=20
- rm -f "$TESTAPP_STATE_PATH"
-diff --git a/tests/regression/tools/notification/test_notification_kerne=
l_error b/tests/regression/tools/notification/test_notification_kernel_er=
ror
-index 80fe6e5..b757ec2 100755
---- a/tests/regression/tools/notification/test_notification_kernel_error
-+++ b/tests/regression/tools/notification/test_notification_kernel_error
-@@ -30,23 +30,22 @@ function test_basic_error_path
- 	wait $APP_PID 2> /dev/null
- }
-=20
-+check_skip_kernel_test &&
-+{
-+	plan_skip_all "Skipping all tests."
-+	exit 0
-+}
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	validate_lttng_modules_present
-+validate_lttng_modules_present
-=20
--	modprobe lttng-test
-+modprobe lttng-test
-=20
--	start_lttng_sessiond_notap
-+start_lttng_sessiond_notap
-=20
--	test_basic_error_path
-+test_basic_error_path
-=20
--	stop_lttng_sessiond_notap
--	rmmod lttng-test
-+stop_lttng_sessiond_notap
-+rmmod lttng-test
-=20
--else
--	# Kernel tests are skipped.
--	plan_tests $NUM_TESTS
--	skip 0 "Root access is needed. Skipping all kernel notification tests.=
" $NUM_TESTS
--fi
-=20
- rm -f "$TESTAPP_STATE_PATH"
-diff --git a/tests/regression/tools/notification/test_notification_kerne=
l_instrumentation b/tests/regression/tools/notification/test_notification=
_kernel_instrumentation
-index 90545a5..705f770 100755
---- a/tests/regression/tools/notification/test_notification_kernel_instr=
umentation
-+++ b/tests/regression/tools/notification/test_notification_kernel_instr=
umentation
-@@ -28,22 +28,21 @@ function test_kernel_instrumentation_notification
- 	wait $APP_PID 2> /dev/null
- }
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	validate_lttng_modules_present
-+check_skip_kernel_test &&
-+{
-+	plan_skip_all "Skipping all tests."
-+	exit 0
-+}
-=20
--	modprobe lttng-test
-+validate_lttng_modules_present
-=20
--	start_lttng_sessiond_notap
-+modprobe lttng-test
-=20
--	test_kernel_instrumentation_notification
-+start_lttng_sessiond_notap
-=20
--	stop_lttng_sessiond_notap
--	rmmod lttng-test
-+test_kernel_instrumentation_notification
-=20
--else
--	# Kernel tests are skipped.
--	plan_tests $NUM_TESTS
--	skip 0 "Root access is needed. Skipping all kernel notification tests.=
" $NUM_TESTS
--fi
-+stop_lttng_sessiond_notap
-+rmmod lttng-test
-=20
- rm -f "$TESTAPP_STATE_PATH"
-diff --git a/tests/regression/tools/notification/test_notification_kerne=
l_syscall b/tests/regression/tools/notification/test_notification_kernel_=
syscall
-index d273cb5..7fa2353 100755
---- a/tests/regression/tools/notification/test_notification_kernel_sysca=
ll
-+++ b/tests/regression/tools/notification/test_notification_kernel_sysca=
ll
-@@ -31,19 +31,18 @@ function test_kernel_syscall_notification
- 	wait $APP_PID 2> /dev/null
- }
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	validate_lttng_modules_present
-+check_skip_kernel_test &&
-+{
-+	plan_skip_all "Skipping all tests."
-+	exit 0
-+}
-=20
--	start_lttng_sessiond_notap
-+validate_lttng_modules_present
-=20
--	test_kernel_syscall_notification
-+start_lttng_sessiond_notap
-=20
--	stop_lttng_sessiond_notap
-+test_kernel_syscall_notification
-=20
--else
--	# Kernel tests are skipped.
--	plan_tests $NUM_TESTS
--	skip 0 "Root access is needed. Skipping all kernel notification tests.=
" $NUM_TESTS
--fi
-+stop_lttng_sessiond_notap
-=20
- rm -f "$TESTAPP_STATE_PATH"
-diff --git a/tests/regression/tools/notification/test_notification_kerne=
l_userspace_probe b/tests/regression/tools/notification/test_notification=
_kernel_userspace_probe
-index 8ef8d70..abddd9b 100755
---- a/tests/regression/tools/notification/test_notification_kernel_users=
pace_probe
-+++ b/tests/regression/tools/notification/test_notification_kernel_users=
pace_probe
-@@ -29,18 +29,18 @@ function test_kernel_userspace_probe_notification
- 	wait $APP_PID 2> /dev/null
- }
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	validate_lttng_modules_present
-+check_skip_kernel_test &&
-+{
-+	plan_skip_all "Skipping all tests."
-+	exit 0
-+}
-+
-+validate_lttng_modules_present
-=20
--	start_lttng_sessiond_notap
-+start_lttng_sessiond_notap
-=20
--	test_kernel_userspace_probe_notification
-+test_kernel_userspace_probe_notification
-=20
--	stop_lttng_sessiond_notap
--else
--	# Kernel tests are skipped.
--	plan_tests $NUM_TESTS
--	skip 0 "Root access is needed. Skipping all kernel notification tests.=
" $NUM_TESTS
--fi
-+stop_lttng_sessiond_notap
-=20
- rm -f "$TESTAPP_STATE_PATH"
-diff --git a/tests/regression/tools/notification/test_notification_multi=
_app b/tests/regression/tools/notification/test_notification_multi_app
-index d8b6392..61891b5 100755
---- a/tests/regression/tools/notification/test_notification_multi_app
-+++ b/tests/regression/tools/notification/test_notification_multi_app
-@@ -411,22 +411,18 @@ function test_on_register_evaluation ()
- 	rm -rf "$output_dir"
- }
-=20
--
- TESTS=3D(
- 	test_multi_app_ust
- 	test_on_register_evaluation_ust
- )
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
-+check_skip_kernel_test "$NUM_TEST_KERNEL" "Skipping kernel multi-app no=
tification tests." || {
- 	validate_lttng_modules_present
- 	TESTS+=3D(
--	test_multi_app_kernel
--	test_on_register_evaluation_kernel
--)
--else
--        skip 0 "Root access is needed. Skipping all kernel multi-app no=
tification tests." $NUM_TEST_KERNEL
--fi
--
-+		test_multi_app_kernel
-+		test_on_register_evaluation_kernel
-+	)
-+}
-=20
- for fct_test in ${TESTS[@]};
- do
-diff --git a/tests/regression/tools/notification/test_notification_notif=
ier_discarded_count b/tests/regression/tools/notification/test_notificati=
on_notifier_discarded_count
-index 9850b49..778d37d 100755
---- a/tests/regression/tools/notification/test_notification_notifier_dis=
carded_count
-+++ b/tests/regression/tools/notification/test_notification_notifier_dis=
carded_count
-@@ -376,7 +376,8 @@ function test_ust_notifier_discarded_regardless_trig=
ger_owner
- test_ust_notifier_discarded_count
- test_ust_notifier_discarded_count_max_bucket
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
-+check_skip_kernel_test "$KERNEL_NUM_TESTS" "Skipping kernel notificatio=
n tests." ||
-+{
-=20
- 	validate_lttng_modules_present
-=20
-@@ -398,9 +399,7 @@ if [ "$(id -u)" =3D=3D "0" ]; then
- 	modprobe --remove lttng-test
-=20
- 	rm -rf "${sessiond_pipe[@]}" 2> /dev/null
--else
--	# Kernel tests are skipped.
--	skip 0 "Root access is needed. Skipping all kernel notification tests.=
" $KERNEL_NUM_TESTS
--fi
-+
-+}
-=20
- rm -rf "$TEST_TMPDIR"
-diff --git a/tests/regression/tools/regen-metadata/test_kernel b/tests/r=
egression/tools/regen-metadata/test_kernel
-index 49eea32..555a4e2 100755
---- a/tests/regression/tools/regen-metadata/test_kernel
-+++ b/tests/regression/tools/regen-metadata/test_kernel
-@@ -99,13 +99,7 @@ plan_tests $NUM_TESTS
-=20
- print_test_banner "$TEST_DESC"
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel streaming test=
s." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
-=20
-diff --git a/tests/regression/tools/regen-statedump/test_kernel b/tests/=
regression/tools/regen-statedump/test_kernel
-index 8a26135..bbbac39 100755
---- a/tests/regression/tools/regen-statedump/test_kernel
-+++ b/tests/regression/tools/regen-statedump/test_kernel
-@@ -39,13 +39,7 @@ plan_tests $NUM_TESTS
-=20
- print_test_banner "$TEST_DESC"
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel streaming test=
s." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
- 	start_lttng_sessiond
-diff --git a/tests/regression/tools/rotation/test_kernel b/tests/regress=
ion/tools/rotation/test_kernel
-index f5f1f55..efe3fd3 100755
---- a/tests/regression/tools/rotation/test_kernel
-+++ b/tests/regression/tools/rotation/test_kernel
-@@ -82,13 +82,7 @@ plan_tests $NUM_TESTS
-=20
- print_test_banner "$TEST_DESC"
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel streaming test=
s." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
-=20
-diff --git a/tests/regression/tools/snapshots/test_kernel b/tests/regres=
sion/tools/snapshots/test_kernel
-index abb2435..d918768 100755
---- a/tests/regression/tools/snapshots/test_kernel
-+++ b/tests/regression/tools/snapshots/test_kernel
-@@ -217,13 +217,7 @@ plan_tests $NUM_TESTS
-=20
- print_test_banner "$TEST_DESC"
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel snapshot tests=
" $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
-=20
- 	validate_lttng_modules_present
-diff --git a/tests/regression/tools/snapshots/test_kernel_streaming b/te=
sts/regression/tools/snapshots/test_kernel_streaming
-index 0c92dc7..dd965af 100755
---- a/tests/regression/tools/snapshots/test_kernel_streaming
-+++ b/tests/regression/tools/snapshots/test_kernel_streaming
-@@ -145,13 +145,7 @@ plan_tests $NUM_TESTS
-=20
- print_test_banner "$TEST_DESC"
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel streaming test=
s" $NUM_TESTS ||
-+check_skip_kernel_test $NUM_TESTS "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
-=20
-diff --git a/tests/regression/tools/streaming/test_high_throughput_limit=
s b/tests/regression/tools/streaming/test_high_throughput_limits
-index 2b9e3ad..c55d510 100755
---- a/tests/regression/tools/streaming/test_high_throughput_limits
-+++ b/tests/regression/tools/streaming/test_high_throughput_limits
-@@ -170,13 +170,7 @@ plan_tests $NUM_TESTS
-=20
- print_test_banner "$TEST_DESC"
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed to set bandwith limits. Skipping al=
l tests." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
-=20
- 	# Catch sigint and try to cleanup limits
-diff --git a/tests/regression/tools/streaming/test_kernel b/tests/regres=
sion/tools/streaming/test_kernel
-index 3333422..113eea7 100755
---- a/tests/regression/tools/streaming/test_kernel
-+++ b/tests/regression/tools/streaming/test_kernel
-@@ -47,13 +47,7 @@ plan_tests $NUM_TESTS
-=20
- print_test_banner "$TEST_DESC"
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel streaming test=
s." $NUM_TESTS ||
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
- {
- 	validate_lttng_modules_present
-=20
-diff --git a/tests/regression/tools/tracker/test_event_tracker b/tests/r=
egression/tools/tracker/test_event_tracker
-index cc0f698..de0c79d 100755
---- a/tests/regression/tools/tracker/test_event_tracker
-+++ b/tests/regression/tools/tracker/test_event_tracker
-@@ -466,13 +466,7 @@ test_event_track_untrack ust 0 "${EVENT_NAME}" "--p=
id --all"	# backward compat
- test_event_tracker ust 1 "${EVENT_NAME}" "--pid --all"	# backward compa=
t
- test_event_pid_tracker ust 1 "${EVENT_NAME}"
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel tracker tests.=
" $NUM_KERNEL_TESTS ||
-+check_skip_kernel_test "$NUM_KERNEL_TESTS" "Skipping kernel tracker tes=
ts." ||
- {
- 	diag "Test kernel tracker"
-=20
-diff --git a/tests/regression/tools/trigger/test_add_trigger_cli b/tests=
/regression/tools/trigger/test_add_trigger_cli
-index 98ecf62..d1763aa 100755
---- a/tests/regression/tools/trigger/test_add_trigger_cli
-+++ b/tests/regression/tools/trigger/test_add_trigger_cli
-@@ -34,12 +34,6 @@ tmp_stdout=3D$(mktemp --tmpdir -t test_parse_cli_trig=
ger_stdout.XXXXXX)
- tmp_stderr=3D$(mktemp --tmpdir -t test_parse_cli_trigger_stderr.XXXXXX)
- uprobe_elf_binary=3D"${TESTDIR}/utils/testapp/userspace-probe-elf-binar=
y/.libs/userspace-probe-elf-binary"
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	ist_root=3D1
--else
--	ist_root=3D0
--fi
--
- function test_success ()
- {
- 	local test_name=3D"$1"
-@@ -223,7 +217,7 @@ test_success "--exclude-name two" "trigger5" \
- 	--condition event-rule-matches --type=3Duser --name=3D'jean-*' --exclu=
de-name jean-chretien -x jean-charest \
- 	--action notify
-=20
--skip $ist_root "non-root user: skipping kprobe tests" 18 || {
-+check_skip_kernel_test 18 "Skipping kprobe tests." || {
- 	i=3D0
-=20
- 	for type in kprobe kernel:kprobe; do
-@@ -262,7 +256,7 @@ skip $ist_root "non-root user: skipping kprobe tests=
" 18 || {
- 	done
- }
-=20
--skip $ist_root "non-root user: skipping uprobe tests" 6 || {
-+check_skip_kernel_test 6 "Skipping uprobe tests." || {
- 	test_success "--condition event-rule-matches uprobe" "uprobe-trigger-0=
" \
- 		--name=3D"uprobe-trigger-0" \
- 		--condition event-rule-matches --type=3Dkernel:uprobe --location=3D${=
uprobe_elf_binary}:test_function --event-name=3Dma-probe \
-@@ -274,7 +268,7 @@ skip $ist_root "non-root user: skipping uprobe tests=
" 6 || {
- 		--action notify
- }
-=20
--skip $ist_root "non-root user: skipping syscall tests" 30 || {
-+check_skip_kernel_test 30 "Skipping syscall tests." || {
- 	test_success "--condition event-rule-matches one syscall" "syscall-tri=
gger-0" \
- 		--name=3D"syscall-trigger-0" \
- 		--condition event-rule-matches --type=3Dsyscall --name=3Dopen \
-diff --git a/tests/regression/tools/trigger/test_list_triggers_cli b/tes=
ts/regression/tools/trigger/test_list_triggers_cli
-index 2574e15..652a08c 100755
---- a/tests/regression/tools/trigger/test_list_triggers_cli
-+++ b/tests/regression/tools/trigger/test_list_triggers_cli
-@@ -36,22 +36,12 @@ uprobe_sdt_binary=3D$(realpath "${TESTDIR}/utils/tes=
tapp/userspace-probe-sdt-binar
- register_some_triggers_bin=3D$(realpath "${CURDIR}/utils/register-some-=
triggers")
-=20
- uid=3D$(id --user)
--gid=3D$(id --group)
-=20
--if [ "$uid" =3D=3D "0" ]; then
--	ist_root=3D1
--	ls "$uprobe_sdt_binary" >/dev/null 2>&1
--	if test $? =3D=3D 0; then
--		hast_sdt_binary=3D1
--	else
--		hast_sdt_binary=3D0
--	fi
--else
--	ist_root=3D0
--	hast_sdt_binary=3D0
-+sdt_binary_present=3D0
-+if [ -f "$uprobe_sdt_binary" ]; then
-+	sdt_binary_present=3D1
- fi
-=20
--
- test_top_level_options ()
- {
- 	diag "Listing top level options"
-@@ -2695,10 +2685,12 @@ start_lttng_sessiond_notap
-=20
- test_top_level_options
- test_event_rule_matches_tracepoint
--skip $ist_root "non-root user: skipping kprobe tests" 13 || test_event_=
rule_matches_probe
--skip $ist_root "non-root user: skipping uprobe tests" 9 || test_event_r=
ule_matches_userspace_probe_elf
--skip $(($ist_root && $hast_sdt_binary)) "skipping userspace probe SDT t=
ests" 9 || test_event_rule_matches_userspace_probe_sdt
--skip $ist_root "non-root user: skipping syscall tests" 17 || test_event=
_rule_matches_syscall
-+check_skip_kernel_test 48 "Skipping kprobe, uprobe, SDT and syscall tes=
ts." || {
-+	test_event_rule_matches_probe
-+	test_event_rule_matches_userspace_probe_elf
-+	skip $sdt_binary_present "No SDT binary. Skipping userspace probe SDT =
tests" 9 || test_event_rule_matches_userspace_probe_sdt
-+	test_event_rule_matches_syscall
-+}
- test_session_consumed_size_condition
- test_buffer_usage_conditions
- test_session_rotation_conditions
-diff --git a/tests/regression/tools/wildcard/test_event_wildcard b/tests=
/regression/tools/wildcard/test_event_wildcard
-index f69baff..14d9bb8 100755
---- a/tests/regression/tools/wildcard/test_event_wildcard
-+++ b/tests/regression/tools/wildcard/test_event_wildcard
-@@ -124,13 +124,7 @@ test_event_wildcard ust 1 'tp*tptest'
- test_event_wildcard ust 1 'tp**tptest'
- test_event_wildcard ust 1 'tp*test'
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--else
--	isroot=3D0
--fi
--
--skip $isroot "Root access is needed. Skipping all kernel wildcard tests=
." $NUM_KERNEL_TESTS ||
-+check_skip_kernel_test "$NUM_KERNEL_TESTS" "Skipping kernel wildcard te=
sts." ||
- {
- 	diag "Test kernel wildcards"
-=20
-diff --git a/tests/regression/tools/working-directory/test_relayd_workin=
g_directory b/tests/regression/tools/working-directory/test_relayd_workin=
g_directory
-index c7e784c..6bd1e50 100755
---- a/tests/regression/tools/working-directory/test_relayd_working_direc=
tory
-+++ b/tests/regression/tools/working-directory/test_relayd_working_direc=
tory
-@@ -145,9 +145,9 @@ function test_relayd_debug_permission()
- 	diag "Test lttng-relayd change working directory on non writable direc=
tory"
-=20
- 	if [ "$(id -u)" =3D=3D "0" ]; then
--	    is_user=3D0
-+		is_user=3D0
- 	else
--	    is_user=3D1
-+		is_user=3D1
- 	fi
-=20
- 	skip $is_user "Skipping permission debug output test; operation can't =
fail as root" 6 ||
-diff --git a/tests/regression/ust/namespaces/test_ns_contexts_change b/t=
ests/regression/ust/namespaces/test_ns_contexts_change
-index 8a4b62c..622241f 100755
---- a/tests/regression/ust/namespaces/test_ns_contexts_change
-+++ b/tests/regression/ust/namespaces/test_ns_contexts_change
-@@ -101,12 +101,7 @@ plan_tests $NUM_TESTS
-=20
- print_test_banner "$TEST_DESC"
-=20
--isroot=3D0
--if [ "$(id -u)" =3D=3D "0" ]; then
--	isroot=3D1
--fi
--
--skip $isroot "Root access is needed. Skipping all tests." "$NUM_TESTS" =
&& exit 0
-+check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." && exit 0
-=20
- system_has_ns=3D0
- if [ -d "/proc/$$/ns" ]; then
-diff --git a/tests/regression/ust/test_event_perf b/tests/regression/ust=
/test_event_perf
-index 33aab29..178959a 100755
---- a/tests/regression/ust/test_event_perf
-+++ b/tests/regression/ust/test_event_perf
-@@ -119,17 +119,11 @@ plan_tests $NUM_TESTS
-=20
- print_test_banner "$TEST_DESC"
-=20
--if [ "$(id -u)" =3D=3D "0" ]; then
--        isroot=3D1
--else
--        isroot=3D0
--fi
--
- start_lttng_sessiond
-=20
- test_parsing_raw
-=20
--skip $isroot "Root access is needed. Skipping UST perf tests." 8 ||
-+check_skip_kernel_test 8 "Skipping UST perf tests." ||
- {
- 	test_event_basic
- }
-diff --git a/tests/utils/utils.sh b/tests/utils/utils.sh
-index 35633fa..b6783ef 100644
---- a/tests/utils/utils.sh
-+++ b/tests/utils/utils.sh
-@@ -329,6 +329,41 @@ function conf_proc_count()
- 	echo
- }
-=20
-+# Usage:
-+# check_skip_kernel_test [NB_TESTS] [SKIP_MESSAGE]
-+# Return 0 if LTTNG_TOOLS_DISABLE_KERNEL_TESTS was set or the current u=
ser is not a root user
-+# If NB_TESTS is set, call skip() to skip number of tests.
-+# If NB_TESTS is empty, just output a reason with diag.
-+# An optional message can be added.
-+
-+function check_skip_kernel_test ()
-+{
-+	local num_tests=3D"$1"
-+	local skip_message=3D"$2"
-+
-+	# Check for skip test kernel flag
-+	if [ "$LTTNG_TOOLS_DISABLE_KERNEL_TESTS" =3D=3D "1" ]; then
-+		if ! test -z "$num_tests"; then
-+			skip 0 "LTTNG_TOOLS_DISABLE_KERNEL_TESTS was set.${skip_message+ }${=
skip_message}" "$num_tests"
-+		else
-+			diag "LTTNG_TOOLS_DISABLE_KERNEL_TESTS was set.${skip_message+ }${sk=
ip_message}"
-+		fi
-+		return 0
-+	fi
-+
-+	# Check if we are running as root
-+	if [ "$(id -u)" !=3D "0" ]; then
-+		if ! test -z "$num_tests"; then
-+			skip 0 "Root access is needed for kernel testing.${skip_message+ }${=
skip_message}" "$num_tests"
-+		else
-+			diag "Root access is needed for kernel testing.${skip_message+ }${sk=
ip_message}"
-+		fi
-+		return 0
-+	fi
-+
-+	return 1
-+}
-+
- # Check if base lttng-modules are present.
- # Bail out on failure
- function validate_lttng_modules_present ()
diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-stri=
p-a-helper-library.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-tes=
ts-do-not-strip-a-helper-library.patch
index 84c02a02cf..0547f30c02 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-hel=
per-library.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-do-not-strip-a-hel=
per-library.patch
@@ -1,4 +1,4 @@
-From 3f1f1dc868accca37d2f276ed741884698b38538 Mon Sep 17 00:00:00 2001
+From a45157a50e14d4bd244a3dd05d79c5703c819550 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 12 Dec 2019 16:52:07 +0100
 Subject: [PATCH] tests: do not strip a helper library
diff --git a/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch b/=
meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch
index b8971a69de..d32cf87535 100644
--- a/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch
+++ b/meta/recipes-kernel/lttng/lttng-tools/disable-tests.patch
@@ -1,4 +1,4 @@
-From 1fbd24512e8fce64b92efa846c301e45a7371ed2 Mon Sep 17 00:00:00 2001
+From 05cf8ed6cc42a2f6ff53009d0ae2713fe63f1245 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Tue, 14 Dec 2021 12:34:04 +0000
 Subject: [PATCH] lttng-tools: Disable problem tests
@@ -18,12 +18,12 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfo=
undation.org>
  1 file changed, 12 deletions(-)
=20
 diff --git a/tests/regression/Makefile.am b/tests/regression/Makefile.am
-index e556223..756fb98 100644
+index 7076488..e5be904 100644
 --- a/tests/regression/Makefile.am
 +++ b/tests/regression/Makefile.am
-@@ -29,18 +29,6 @@ TESTS =3D tools/base-path/test_ust \
- 	tools/crash/test_crash \
+@@ -40,18 +40,6 @@ SERIAL_TESTS =3D tools/base-path/test_ust \
  	tools/regen-metadata/test_ust \
+ 	tools/regen-statedump/test_kernel \
  	tools/regen-statedump/test_ust \
 -	tools/notification/test_notification_ust_error \
 -	tools/notification/test_notification_ust_buffer_usage \
@@ -39,4 +39,4 @@ index e556223..756fb98 100644
 -	tools/notification/test_notification_multi_app \
  	tools/rotation/test_ust \
  	tools/rotation/test_kernel \
- 	tools/rotation/test_save_load_mi \
+ 	tools/rotation/test_ust_kernel \
diff --git a/meta/recipes-kernel/lttng/lttng-tools/run-ptest b/meta/recip=
es-kernel/lttng/lttng-tools/run-ptest
index 39d93e2bbf..f4f7a3baea 100755
--- a/meta/recipes-kernel/lttng/lttng-tools/run-ptest
+++ b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
@@ -20,7 +20,7 @@ function validate_lttng_modules_present()
 	return 1
 }
=20
-export LD_LIBRARY_PATH=3DFIXMEPTESTPATH/tests/utils/testapp/userspace-pr=
obe-elf-binary/.libs
+export LD_LIBRARY_PATH=3DFIXMEPTESTPATH/tests/utils/testapp/userspace-pr=
obe-elf-binary/.libs:FIXMEPTESTPATH/tests/utils/testapp/gen-ust-events-co=
nstructor/.libs
 makeargs=3D"LOG_DRIVER_FLAGS=3D--ignore-exit top_srcdir=3DFIXMEPTESTPATH=
 top_builddir=3DFIXMEPTESTPATH"
=20
 #If current system doesn't have lttng kernel modules, disable lttng kern=
el related tests.
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.15.bb b/meta/reci=
pes-kernel/lttng/lttng-tools_2.14.0.bb
similarity index 92%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.15.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
index f39404afa0..da3bdd4052 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.15.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.14.0.bb
@@ -12,14 +12,23 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D40ef17463f=
bd6f377db3c47b1cbaded8 \
=20
 include lttng-platforms.inc
=20
-DEPENDS =3D "liburcu popt libxml2 util-linux bison-native"
+DEPENDS =3D "liburcu popt libxml2 util-linux bison-native babeltrace2"
 RDEPENDS:${PN} =3D "libgcc"
 RRECOMMENDS:${PN} +=3D "${LTTNGMODULES}"
 RDEPENDS:${PN}-ptest +=3D "make perl bash gawk babeltrace procps perl-mo=
dule-overloading coreutils util-linux kmod ${LTTNGMODULES} sed python3-co=
re grep binutils"
 RDEPENDS:${PN}-ptest:append:libc-glibc =3D " glibc-utils"
 RDEPENDS:${PN}-ptest:append:libc-musl =3D " musl-utils"
 # babelstats.pl wants getopt-long
-RDEPENDS:${PN}-ptest +=3D "perl-module-getopt-long"
+RDEPENDS:${PN}-ptest +=3D "perl-module-getopt-long \
+                         babeltrace2 \
+                         python3-logging \
+                         python3-math \
+                         python3-numbers \
+                         python3-json \
+                         python3-io \
+                         python3-shell \
+                         python3-xml \
+"
=20
 PYTHON_OPTION =3D "am_cv_python_pyexecdir=3D'${PYTHON_SITEPACKAGES_DIR}'=
 \
                  am_cv_python_pythondir=3D'${PYTHON_SITEPACKAGES_DIR}' \
@@ -36,13 +45,10 @@ SRC_URI =3D "https://lttng.org/files/lttng-tools/lttn=
g-tools-${PV}.tar.bz2 \
            file://run-ptest \
            file://lttng-sessiond.service \
            file://disable-tests.patch \
-           file://0001-compat-Define-off64_t-as-off_t-on-linux.patch \
-           file://0001-tests-add-check_skip_kernel_test-to-check-root-us=
er-.patch \
-           file://0001-Fix-rotation-destroy-flush-fix-session-daemon-abo=
rt-.patch \
-           file://0001-fix-lttng-tools-fails-to-compile-with-libxml2-2.1=
4.0.patch \
+           file://0001-gen-ust-events-constructor-change-rpath-to-libdir=
-li.patch \
            "
=20
-SRC_URI[sha256sum] =3D "96ea42351ee112c19dad9fdc7aae93b583d9f1722b217566=
4a381d2d337703c4"
+SRC_URI[sha256sum] =3D "d8c39c26cec13b7bd82551cd52a22efc358b888e36ebcf9c=
1b60ef1c3a3c2fd3"
=20
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
=20
@@ -84,7 +90,8 @@ do_install_ptest () {
         install -D "${B}/$f" "${D}${PTEST_PATH}/$f"
     done
=20
-    for f in tests/utils/tap-driver.sh config/test-driver src/common/con=
fig/session.xsd src/common/mi-lttng-4.1.xsd; do
+    for f in tests/utils/tap-driver.sh config/test-driver src/common/ses=
sion.xsd src/common/mi-lttng-4.1.xsd \
+             tests/regression/tests.serial; do
         install -D "${S}/$f" "${D}${PTEST_PATH}/$f"
     done
=20
--=20
2.34.1


