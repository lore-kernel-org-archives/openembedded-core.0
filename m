Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2487.1793771623046540596
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 21:53:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DO5g1zCL;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=99587; q=dns/txt;
  s=iport01; t=1793771623; x=1794981223;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nRvKtAq+QrEWLNSeWMVMNqFTaEa8XpwUuMAIaajoO/o=;
  b=DO5g1zCLAO/ZeFWI7Js19mDDNB57y9hb68V9Pjmg5lkQLVYdjNE3DNQd
   K3/WZR7GoQoQ49+4jomOiOFWlcPY0HZRGalvO3mUv7il1Hu24sLsOhAlB
   ywurmee/MbucGOZ/7ImZo8DT6vkMJfOLjuiLcyBHRtxoTsJCojTNpMH/T
   vSDDOCRgX3PNouDi3hj35OQ1XaDRclp0CLRssBolPKxpwkrRepCpAi0ZT
   fNOR0DMnvsxyLrp3hJ88fb0aHhuZdmzbQdby5ZmxVhLQeLRFd4cwAl9HU
   meHOaqlmhJ4r2mt5D803gnzzFCvMV+2CrLegAnkLl++ZbNerC1kD/8ivk
   Q==;
X-CSE-ConnectionGUID: l9IHG2xcSRm3A+e1tzcgRA==
X-CSE-MsgGUID: s1XVLoNXT9q4rxS5Iu4SFQ==
X-IPAS-Result: =?us-ascii?q?A0AcAACOx+pq/4z/Ja1aFgYBAQEBAQEHAQESAQEEBAEBg?=
 =?us-ascii?q?XwHAQELAYJWdWBDSQOMb4lZA4ETilKFZ4xUFIFkBg8BAQEPLgYdBAEBghKCc?=
 =?us-ascii?q?wKOHAImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QE?=
 =?us-ascii?q?gECAQMBGQECCgsBGAEoBRAcAwECLyAHBCMIGYMCAYI6AzcDEbpBgXkzgQGDK?=
 =?us-ascii?q?QE/AkNQ2EwNgloBCxQBgTgBhT+Cf4UkXRgBhH0nGxuBcoEUAYE7gTh2gQWBG?=
 =?us-ascii?q?kIBAxiBAAljhiAEgg0VgQyBWhgGMjOCIoMbhlsCiEJIgR4DWSwBVRMNCgsHB?=
 =?us-ascii?q?YFoAzUSKhVuMh2BIz4XgQcbBgWBHYEegRKBB12BKyhdASGBCIF2AoJRggACA?=
 =?us-ascii?q?UlBDgdFUwklQxJHJCIIEgkBExosCoEaNTwJJj8VDGYLGgVhCAINDHQ5EDAeJ?=
 =?us-ascii?q?C8FHCZAGwoUGA1IESw3FRkEPm4Hki2CTjELBgEBDQgXBAwTCQEQCAIHEwEHD?=
 =?us-ascii?q?BgETDUMBwECFB4EDxgFAQUBBAMhDwILAi0DkkMUCQcKkBaCIYE1iXqUQTBxC?=
 =?us-ascii?q?iiDeIwkjT6CAIV8GjOEBIFXkkKDVY5/C5h9glmLMRaDdJErNAsOAhY3hGmBa?=
 =?us-ascii?q?DyBWXAVO4JnCQlBGQ+BHI0RAQsLgVEngWiFE4F+x0omMgEBAQEHAy8BAQcCB?=
 =?us-ascii?q?w4DC4FokR5gAQE?=
IronPort-Data: A9a23:sPFH0q1eLgrA6OUHyPbD5YJwkn2cJEfYwER7XKvMYLTBsI5bp2RSy
 mZJDTuBPPrcM2fyftlybo7j9xwBupHdyoVgGQU43Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcsaTpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGCBAXHaJC6u1MO2QV3
 L8VcSwfZR+5rrfjqF67YrEEasULNsLnOsYb/3pn1zycVa1gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNUiYC/FMEg9/5JYWkOSlgnD+YjRwo1OOrq1x6G/WpOB0+OWxa4uMJoPQFK25mG6D/
 1L422PfMi1LLYCF2QHY02/wvcH2yHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rbyyjVSzc9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7CQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:EZAFyqpyLhg0dZPAMizqIhsaV5oJeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ANV0mlhD0Jcjpy1SZNNXB7OaY=
X-Talos-CUID: =?us-ascii?q?9a23=3AGvdVB2u1YxvSnGbc+RZtKCSq6IshI1z94y3AKHS?=
 =?us-ascii?q?CDD1AC7DMVU2b95lNxp8=3D?=
X-Talos-MUID: 9a23:pjGlZAU6AfRrYKHq/CS1tA9GM+FY3/W3VFodqsgnppW/GxUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,194,1787011200"; 
   d="scan'208";a="543914729"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Nov 2026 05:53:41 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id BC9A6180001FA;
	Wed,  4 Nov 2026 05:53:40 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 68664CBF203; Tue,  3 Nov 2026 21:53:40 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 3/3] acl: fix CVE-2026-54370
Date: Tue,  3 Nov 2026 21:53:35 -0800
Message-Id: <20261104055335.2080900-4-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261104055335.2080900-1-dkelaiya@cisco.com>
References: <20261104055335.2080900-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 05:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249328
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the getfacl [1], setfacl [3], setfacl --restore [4] and
chacl [5] hardening identified by [2]. These changes use directory
descriptors and symlink-safe operations instead of repeatedly
resolving full pathnames. They require the new APIs and shared
compatibility helpers from the preceding CVE-2026-54369 backport.

Include the following prerequisite changes:

Add fchmodat compatibility code [6]. Hardened setfacl uses this
for permission changes when the kernel lacks the required
AT_SYMLINK_NOFOLLOW or AT_EMPTY_PATH support.

Rename the original walker to old_walk_tree [7]. This preserves
its callers while the new walker interface is introduced and
stages their migration; the rename does not itself fix the CVE.

Add the directory-fd-based walk_tree implementation [8]. The
getfacl and setfacl fixes use its callback interface to operate
relative to directory descriptors.

Add openat2 detection and a syscall wrapper [9]. The restore fix
uses this interface with RESOLVE_NO_SYMLINKS to resolve directory
components without following symbolic links.

Preserve upstream compatibility behavior [10-12]: physical restore
uses -P; non-physical restore remains available with warnings when
openat2 support is enabled. Physical directory resolution fails
rather than silently falling back when openat2 is unavailable.

Retain ACL 2.3.2's .test harness and include the upstream restore
regression test as restore-symlinks.test so ptest packages it
without the root/restore.test exclusion.

[1] https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=2ee940139e9bba5005a3d987a6daecdda909089e
[2] https://security-tracker.debian.org/tracker/CVE-2026-54370
[3] https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=2c03ceefa0610d551d9cc089ce0a404cbe2d34b4
[4] https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=54e14e9bc545f505b379d0792a2748d9baf88700
[5] https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=601cc884a548ae9e9d246ae749e54b3272e4b1d7
[6] https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=c3492ef76587ce1e652bbb1bdf99f8ea6224b364
[7] https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=f7210d140298ccc73b2b1713635e7c39d58a8eeb
[8] https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=39b00348f5911e4e5937ddfb079cc456288b3cd3
[9] https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=7244f425227a23533f0b0b41c717dbd59736b907
[10] https://www.openwall.com/lists/oss-security/2026/06/29/1#:~:text=%2D%20When%20walking%20directory%20trees,throughout%20the%20code.
[11] https://www.openwall.com/lists/oss-security/2026/06/29/1#:~:text=Support%20for%20specific%20AT_%2A%20flags,these%20operations%20will%20fail.
[12] https://www.openwall.com/lists/oss-security/2026/06/29/1#:~:text=%2D%20As%20mentioned%20above%2C%20the%20%2D%2Drestore%20option,the%20operation%20will%20fail.

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../acl/CVE-2026-54370-dependent_p1.patch     | 168 ++++
 .../acl/CVE-2026-54370-dependent_p2.patch     | 761 ++++++++++++++++++
 .../acl/CVE-2026-54370-dependent_p3.patch     | 439 ++++++++++
 .../acl/CVE-2026-54370-dependent_p4.patch     | 140 ++++
 .../attr/acl/CVE-2026-54370_p1.patch          | 299 +++++++
 .../attr/acl/CVE-2026-54370_p2.patch          | 403 ++++++++++
 .../attr/acl/CVE-2026-54370_p3.patch          | 603 ++++++++++++++
 .../attr/acl/CVE-2026-54370_p4.patch          | 213 +++++
 meta/recipes-support/attr/acl_2.3.2.bb        |   8 +
 9 files changed, 3034 insertions(+)
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p1.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p2.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p3.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p4.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370_p1.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370_p2.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370_p3.patch
 create mode 100644 meta/recipes-support/attr/acl/CVE-2026-54370_p4.patch

diff --git a/meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p1.patch b/meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p1.patch
new file mode 100644
index 00000000000..c8a70ba3c63
--- /dev/null
+++ b/meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p1.patch
@@ -0,0 +1,168 @@
+From 9e97fa6569529fe28af7839f0e83e3a01eb631ab Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruenba@redhat.com>
+Date: Tue, 16 Jun 2026 22:44:07 +0200
+Subject: [PATCH] Add fchmodat syscall backwards compatibility code
+
+Support for the AT_SYMLINK_NOFOLLOW flag was added in commit 09da082b07bb
+("fs: Add fchmodat2()") and support for the AT_EMPTY_PATH flag was added in
+commit 5daeb41a6fc9d ("fchmodat2: add support for AT_EMPTY_PATH"), both
+merged in kernel version 6.6 from October 2023.
+
+Add a fchmodat_compat() wrapper that detects when the kernel doesn't support
+those features and fall back to chmod("/proc/self/fd/<dirfd>", mode) when
+necessary.
+
+CVE: CVE-2026-54370
+Upstream-Status: Backport [https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=c3492ef76587ce1e652bbb1bdf99f8ea6224b364]
+
+Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
+(cherry picked from commit c3492ef76587ce1e652bbb1bdf99f8ea6224b364)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ include/Makemodule.am     |  1 +
+ include/fchmodat_compat.h | 12 ++++++
+ libmisc/Makemodule.am     |  1 +
+ libmisc/fchmodat_compat.c | 88 +++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 102 insertions(+)
+ create mode 100644 include/fchmodat_compat.h
+ create mode 100644 libmisc/fchmodat_compat.c
+
+diff --git a/include/Makemodule.am b/include/Makemodule.am
+index 36fc1c3..30d1fda 100644
+--- a/include/Makemodule.am
++++ b/include/Makemodule.am
+@@ -2,6 +2,7 @@ noinst_HEADERS += \
+ 	include/libacl.h \
+ 	include/acl.h \
+ 	include/acl_ea.h \
++	include/fchmodat_compat.h \
+ 	include/misc.h \
+ 	include/visibility-hidden.h \
+ 	include/walk_tree.h \
+diff --git a/include/fchmodat_compat.h b/include/fchmodat_compat.h
+new file mode 100644
+index 0000000..c10f8ad
+--- /dev/null
++++ b/include/fchmodat_compat.h
+@@ -0,0 +1,12 @@
++#ifndef FCHMODAT_COMPAT_H
++#define FCHMODAT_COMPAT_H
++
++#include <fcntl.h>
++
++int fchmodat_compat(int dirfd, const char *pathname, mode_t mode, int flags);
++
++#ifndef DECLARATIONS_ONLY
++# define fchmodat fchmodat_compat
++#endif
++
++#endif /* FCHMODAT_COMPAT_H */
+diff --git a/libmisc/Makemodule.am b/libmisc/Makemodule.am
+index 4099098..07b03c6 100644
+--- a/libmisc/Makemodule.am
++++ b/libmisc/Makemodule.am
+@@ -5,6 +5,7 @@ noinst_HEADERS += \
+ 
+ libmisc_la_SOURCES = \
+ 	libmisc/uid_gid_lookup.c \
++	libmisc/fchmodat_compat.c \
+ 	libmisc/getxattrat_compat.c \
+ 	libmisc/high_water_alloc.c \
+ 	libmisc/listxattrat_compat.c \
+diff --git a/libmisc/fchmodat_compat.c b/libmisc/fchmodat_compat.c
+new file mode 100644
+index 0000000..dd2a8b8
+--- /dev/null
++++ b/libmisc/fchmodat_compat.c
+@@ -0,0 +1,88 @@
++/*
++  File: fchmodat_compat.c
++
++  Copyright (C) 2026 Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
++
++  This library is free software; you can redistribute it and/or
++  modify it under the terms of the GNU Lesser General Public
++  License as published by the Free Software Foundation; either
++  version 2.1 of the License, or (at your option) any later version.
++
++  This library is distributed in the hope that it will be useful,
++  but WITHOUT ANY WARRANTY; without even the implied warranty of
++  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++  Lesser General Public License for more details.
++
++  You should have received a copy of the GNU Lesser General Public
++  License along with this library; if not, see <https://www.gnu.org/licenses/>.
++*/
++
++#include "config.h"
++#include <unistd.h>
++#include <fcntl.h>
++#include <sys/stat.h>
++#include <errno.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include "libmisc/proc-self-fd.h"
++
++#define DECLARATIONS_ONLY
++#include "fchmodat_compat.h"
++
++/*
++ * Support for the AT_SYMLINK_NOFOLLOW flag was added in commit 09da082b07bb
++ * ("fs: Add fchmodat2()") and support for the AT_EMPTY_PATH flag was added in
++ * commit 5daeb41a6fc9d ("fchmodat2: add support for AT_EMPTY_PATH"), both
++ * merged in kernel version 6.6 from October 2023.
++ */
++
++static int no_symlink_nofollow;
++
++int fchmodat_compat(int dirfd, const char *pathname, mode_t mode, int flags)
++{
++	struct proc_self_fd_buffer buffer;
++	int fd = dirfd;
++	int ret;
++
++	if ((flags & AT_SYMLINK_NOFOLLOW) && no_symlink_nofollow)
++			goto no_symlink_nofollow;
++	if ((flags & AT_EMPTY_PATH) && no_symlink_nofollow) {
++		if (!*pathname)
++			goto proc_self_fd_path;
++		flags &= ~AT_EMPTY_PATH;
++	}
++	ret = fchmodat(dirfd, pathname, mode, flags);
++	if (ret != -1)
++		return ret;
++	if (errno == ENOTSUP && (flags & AT_SYMLINK_NOFOLLOW)) {
++		no_symlink_nofollow = 1;
++		goto no_symlink_nofollow;
++	}
++	if (errno == EINVAL && (flags & AT_EMPTY_PATH)) {
++		no_symlink_nofollow = 1;
++		goto proc_self_fd_path;
++	}
++	return ret;
++
++no_symlink_nofollow:
++	if (*pathname) {
++		int open_flags = O_PATH | O_CLOEXEC;
++		if (flags & AT_SYMLINK_NOFOLLOW)
++			open_flags |= O_NOFOLLOW;
++		fd = openat(dirfd, pathname, open_flags);
++		if (fd == -1)
++			return -1;
++	}
++	/* fall through */
++
++proc_self_fd_path:
++	ret = chmod(proc_self_fd_path(fd, &buffer), mode);
++	if (ret == -1 && errno == ENOENT)
++		errno = EBADF;
++	if (fd != dirfd) {
++		int saved_errno = errno;
++		close(fd);
++		errno = saved_errno;
++	}
++	return ret;
++}
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p2.patch b/meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p2.patch
new file mode 100644
index 00000000000..cd904c6ac4b
--- /dev/null
+++ b/meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p2.patch
@@ -0,0 +1,761 @@
+From 5234b62884727c1ce151cb259954cc78abb6471a Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruenba@redhat.com>
+Date: Tue, 9 Jun 2026 08:15:30 +0200
+Subject: [PATCH] Rename walk_tree to old_walk_tree
+
+CVE: CVE-2026-54370
+Upstream-Status: Backport [https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=f7210d140298ccc73b2b1713635e7c39d58a8eeb]
+
+Backport Changes:
+- Retain ACL 2.3.2's libmisc source ordering for uid_gid_lookup.c.
+- Rename the original walker without the later __acl symbol macro.
+
+Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
+(cherry picked from commit f7210d140298ccc73b2b1713635e7c39d58a8eeb)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ include/Makemodule.am   |   2 +-
+ include/old_walk_tree.h |  40 +++++++
+ include/walk_tree.h     |  40 -------
+ libmisc/Makemodule.am   |   4 +-
+ libmisc/old_walk_tree.c | 258 ++++++++++++++++++++++++++++++++++++++++
+ libmisc/walk_tree.c     | 258 ----------------------------------------
+ tools/do_set.c          |   2 +-
+ tools/getfacl.c         |   6 +-
+ tools/setfacl.c         |   6 +-
+ 9 files changed, 308 insertions(+), 308 deletions(-)
+ create mode 100644 include/old_walk_tree.h
+ delete mode 100644 include/walk_tree.h
+ create mode 100644 libmisc/old_walk_tree.c
+ delete mode 100644 libmisc/walk_tree.c
+
+diff --git a/include/Makemodule.am b/include/Makemodule.am
+index 30d1fda..3926bda 100644
+--- a/include/Makemodule.am
++++ b/include/Makemodule.am
+@@ -4,8 +4,8 @@ noinst_HEADERS += \
+ 	include/acl_ea.h \
+ 	include/fchmodat_compat.h \
+ 	include/misc.h \
++	include/old_walk_tree.h \
+ 	include/visibility-hidden.h \
+-	include/walk_tree.h \
+ 	include/xattrat.h \
+ 	include/xattrat_compat.h
+ 
+diff --git a/include/old_walk_tree.h b/include/old_walk_tree.h
+new file mode 100644
+index 0000000..fbc469e
+--- /dev/null
++++ b/include/old_walk_tree.h
+@@ -0,0 +1,40 @@
++/*
++  File: old_walk_tree.h
++
++  Copyright (C) 2007 Andreas Gruenbacher <a.gruenbacher@computer.org>
++
++  This library is free software; you can redistribute it and/or
++  modify it under the terms of the GNU Lesser General Public
++  License as published by the Free Software Foundation; either
++  version 2.1 of the License, or (at your option) any later version.
++
++  This library is distributed in the hope that it will be useful,
++  but WITHOUT ANY WARRANTY; without even the implied warranty of
++  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++  Lesser General Public License for more details.
++
++  You should have received a copy of the GNU Lesser General Public
++  License along with this library; if not, see <https://www.gnu.org/licenses/>.
++*/
++
++#ifndef __WALK_TREE_H
++#define __WALK_TREE_H
++
++#define WALK_TREE_RECURSIVE		0x01
++#define WALK_TREE_PHYSICAL		0x02
++#define WALK_TREE_LOGICAL		0x04
++#define WALK_TREE_DEREFERENCE		0x08
++#define WALK_TREE_DEREFERENCE_TOPLEVEL	0x10
++#define WALK_TREE_ONE_FILESYSTEM	0x20
++
++#define WALK_TREE_TOPLEVEL	0x100
++#define WALK_TREE_SYMLINK	0x200
++#define WALK_TREE_FAILED	0x400
++
++struct stat;
++
++extern int old_walk_tree(const char *path, int walk_flags, unsigned int num,
++		     int (*func)(const char *, const struct stat *, int,
++				 void *), void *arg);
++
++#endif
+diff --git a/include/walk_tree.h b/include/walk_tree.h
+deleted file mode 100644
+index 4773194..0000000
+--- a/include/walk_tree.h
++++ /dev/null
+@@ -1,40 +0,0 @@
+-/*
+-  File: walk_tree.h
+-
+-  Copyright (C) 2007 Andreas Gruenbacher <a.gruenbacher@computer.org>
+-
+-  This library is free software; you can redistribute it and/or
+-  modify it under the terms of the GNU Lesser General Public
+-  License as published by the Free Software Foundation; either
+-  version 2.1 of the License, or (at your option) any later version.
+-
+-  This library is distributed in the hope that it will be useful,
+-  but WITHOUT ANY WARRANTY; without even the implied warranty of
+-  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-  Lesser General Public License for more details.
+-
+-  You should have received a copy of the GNU Lesser General Public
+-  License along with this library; if not, see <https://www.gnu.org/licenses/>.
+-*/
+-
+-#ifndef __WALK_TREE_H
+-#define __WALK_TREE_H
+-
+-#define WALK_TREE_RECURSIVE		0x01
+-#define WALK_TREE_PHYSICAL		0x02
+-#define WALK_TREE_LOGICAL		0x04
+-#define WALK_TREE_DEREFERENCE		0x08
+-#define WALK_TREE_DEREFERENCE_TOPLEVEL	0x10
+-#define WALK_TREE_ONE_FILESYSTEM	0x20
+-
+-#define WALK_TREE_TOPLEVEL	0x100
+-#define WALK_TREE_SYMLINK	0x200
+-#define WALK_TREE_FAILED	0x400
+-
+-struct stat;
+-
+-extern int walk_tree(const char *path, int walk_flags, unsigned int num,
+-		     int (*func)(const char *, const struct stat *, int,
+-				 void *), void *arg);
+-
+-#endif
+diff --git a/libmisc/Makemodule.am b/libmisc/Makemodule.am
+index 07b03c6..26e802b 100644
+--- a/libmisc/Makemodule.am
++++ b/libmisc/Makemodule.am
+@@ -10,12 +10,12 @@ libmisc_la_SOURCES = \
+ 	libmisc/high_water_alloc.c \
+ 	libmisc/listxattrat_compat.c \
+ 	libmisc/next_line.c \
++	libmisc/old_walk_tree.c \
+ 	libmisc/proc-self-fd.c \
+ 	libmisc/quote.c \
+ 	libmisc/removexattrat_compat.c \
+ 	libmisc/setxattrat_compat.c \
+-	libmisc/unquote.c \
+-	libmisc/walk_tree.c
++	libmisc/unquote.c
+ 
+ if NEED_XATTRAT
+ libmisc_la_SOURCES += \
+diff --git a/libmisc/old_walk_tree.c b/libmisc/old_walk_tree.c
+new file mode 100644
+index 0000000..2202e0c
+--- /dev/null
++++ b/libmisc/old_walk_tree.c
+@@ -0,0 +1,258 @@
++/*
++  File: old_walk_tree.c
++
++  Copyright (C) 2007 Andreas Gruenbacher <a.gruenbacher@computer.org>
++
++  This library is free software; you can redistribute it and/or
++  modify it under the terms of the GNU Lesser General Public
++  License as published by the Free Software Foundation; either
++  version 2.1 of the License, or (at your option) any later version.
++
++  This library is distributed in the hope that it will be useful,
++  but WITHOUT ANY WARRANTY; without even the implied warranty of
++  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++  Lesser General Public License for more details.
++
++  You should have received a copy of the GNU Lesser General Public
++  License along with this library; if not, see <https://www.gnu.org/licenses/>.
++*/
++
++#include "config.h"
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <unistd.h>
++#include <sys/time.h>
++#include <sys/resource.h>
++#include <dirent.h>
++#include <stdio.h>
++#include <string.h>
++#include <errno.h>
++
++#include "old_walk_tree.h"
++
++struct entry_handle {
++	struct entry_handle *prev, *next;
++	dev_t dev;
++	ino_t ino;
++	DIR *stream;
++	long pos;
++};
++
++struct walk_tree_args {
++	char path[FILENAME_MAX];
++	int walk_flags;
++	int (*func)(const char *, const struct stat *, int, void *);
++	void *arg;
++	int depth;
++	struct entry_handle dirs;
++	struct entry_handle *closed;
++	unsigned int num_dir_handles;
++	struct stat st;
++	dev_t dev;
++};
++
++static int walk_tree_visited(struct entry_handle *dirs, dev_t dev, ino_t ino)
++{
++	struct entry_handle *i;
++
++	for (i = dirs->next; i != dirs; i = i->next)
++		if (i->dev == dev && i->ino == ino)
++			return 1;
++	return 0;
++}
++
++static int walk_tree_rec(struct walk_tree_args *args)
++{
++	int follow_symlinks = (args->walk_flags & WALK_TREE_LOGICAL) ||
++			      ((args->walk_flags & WALK_TREE_DEREFERENCE) &&
++			       !(args->walk_flags & WALK_TREE_PHYSICAL) &&
++			       args->depth == 0);
++	int have_dir_stat = 0, flags = args->walk_flags, err;
++	struct entry_handle dir;
++
++	/*
++	 * If (walk_flags & WALK_TREE_PHYSICAL), do not traverse symlinks.
++	 * If (walk_flags & WALK_TREE_LOGICAL), traverse all symlinks.
++	 * Otherwise, traverse only top-level symlinks.
++	 */
++	if (args->depth == 0)
++		flags |= WALK_TREE_TOPLEVEL;
++
++	if (lstat(args->path, &args->st) != 0)
++		return args->func(args->path, NULL, flags | WALK_TREE_FAILED,
++				  args->arg);
++
++	if (flags & WALK_TREE_ONE_FILESYSTEM) {
++		if (args->dev == 0)
++			args->dev = args->st.st_dev;
++		else if (args->st.st_dev != args->dev)
++			return 0;
++	}
++
++	if (S_ISLNK(args->st.st_mode)) {
++		flags |= WALK_TREE_SYMLINK;
++		if ((flags & WALK_TREE_DEREFERENCE) ||
++		    ((flags & WALK_TREE_TOPLEVEL) &&
++		     (flags & WALK_TREE_DEREFERENCE_TOPLEVEL))) {
++			if (stat(args->path, &args->st) != 0)
++				return args->func(args->path, NULL,
++						  flags | WALK_TREE_FAILED,
++						  args->arg);
++			dir.dev = args->st.st_dev;
++			dir.ino = args->st.st_ino;
++			have_dir_stat = 1;
++		}
++	} else if (S_ISDIR(args->st.st_mode)) {
++		dir.dev = args->st.st_dev;
++		dir.ino = args->st.st_ino;
++		have_dir_stat = 1;
++	}
++	err = args->func(args->path, &args->st, flags, args->arg);
++
++	/*
++	 * Recurse if WALK_TREE_RECURSIVE and the path is:
++	 *      a dir not from a symlink
++	 *      a link and follow_symlinks
++	 */
++        if ((flags & WALK_TREE_RECURSIVE) &&
++	    ((!(flags & WALK_TREE_SYMLINK) && S_ISDIR(args->st.st_mode)) ||
++	     ((flags & WALK_TREE_SYMLINK) && follow_symlinks))) {
++		struct dirent *entry;
++
++		/*
++		 * Check if we have already visited this directory to break
++		 * endless loops.
++		 *
++		 * If we haven't stat()ed the file yet, do an opendir() for
++		 * figuring out whether we have a directory, and check whether
++		 * the directory has been visited afterwards. This saves a
++		 * system call for each non-directory found.
++		 */
++		if (have_dir_stat && walk_tree_visited(&args->dirs, dir.dev, dir.ino))
++			return err;
++
++		if (args->num_dir_handles == 0 && args->closed->prev != &args->dirs) {
++close_another_dir:
++			/* Close the topmost directory handle still open. */
++			args->closed = args->closed->prev;
++			args->closed->pos = telldir(args->closed->stream);
++			closedir(args->closed->stream);
++			args->closed->stream = NULL;
++			args->num_dir_handles++;
++		}
++
++		dir.stream = opendir(args->path);
++		if (!dir.stream) {
++			if (errno == ENFILE && args->closed->prev != &args->dirs) {
++				/* Ran out of file descriptors. */
++				args->num_dir_handles = 0;
++				goto close_another_dir;
++			}
++
++			/*
++			 * PATH may be a symlink to a regular file, or a dead
++			 * symlink which we didn't follow above.
++			 */
++			if (errno != ENOTDIR && errno != ENOENT)
++				err += args->func(args->path, NULL, flags |
++						 WALK_TREE_FAILED, args->arg);
++			return err;
++		}
++
++		/* See walk_tree_visited() comment above... */
++		if (!have_dir_stat) {
++			if (stat(args->path, &args->st) != 0)
++				goto skip_dir;
++			dir.dev = args->st.st_dev;
++			dir.ino = args->st.st_ino;
++			if (walk_tree_visited(&args->dirs, dir.dev, dir.ino))
++				goto skip_dir;
++		}
++
++		/* Insert into the list of handles. */
++		dir.next = args->dirs.next;
++		dir.prev = &args->dirs;
++		dir.prev->next = &dir;
++		dir.next->prev = &dir;
++		args->num_dir_handles--;
++
++		while ((entry = readdir(dir.stream)) != NULL) {
++			char *path_end;
++
++			if (!strcmp(entry->d_name, ".") ||
++			    !strcmp(entry->d_name, ".."))
++				continue;
++			path_end = strchr(args->path, 0);
++			if ((path_end - args->path) + strlen(entry->d_name) + 1 >=
++			    FILENAME_MAX) {
++				errno = ENAMETOOLONG;
++				err += args->func(args->path, NULL,
++						  flags | WALK_TREE_FAILED,
++						  args->arg);
++				continue;
++			}
++			*path_end++ = '/';
++			strcpy(path_end, entry->d_name);
++			args->depth++;
++			err += walk_tree_rec(args);
++			args->depth--;
++			*--path_end = 0;
++			if (!dir.stream) {
++				/* Reopen the directory handle. */
++				dir.stream = opendir(args->path);
++				if (!dir.stream)
++					return err + args->func(args->path,
++								NULL,
++								flags | WALK_TREE_FAILED,
++								args->arg);
++				seekdir(dir.stream, dir.pos);
++
++				args->closed = args->closed->next;
++				args->num_dir_handles--;
++			}
++		}
++
++		/* Remove from the list of handles. */
++		dir.prev->next = dir.next;
++		dir.next->prev = dir.prev;
++		args->num_dir_handles++;
++
++	skip_dir:
++		if (closedir(dir.stream) != 0)
++			err += args->func(args->path, NULL,
++					 flags | WALK_TREE_FAILED, args->arg);
++	}
++	return err;
++}
++
++int old_walk_tree(const char *path, int walk_flags, unsigned int num,
++	      int (*func)(const char *, const struct stat *, int, void *),
++	      void *arg)
++{
++	struct walk_tree_args args;
++
++	args.num_dir_handles = num;
++	if (args.num_dir_handles < 1) {
++		struct rlimit rlimit;
++
++		args.num_dir_handles = 1;
++		if (getrlimit(RLIMIT_NOFILE, &rlimit) == 0 &&
++		    rlimit.rlim_cur >= 2)
++			args.num_dir_handles = rlimit.rlim_cur / 2;
++	}
++	args.dirs.next = &args.dirs;
++	args.dirs.prev = &args.dirs;
++	args.closed = &args.dirs;
++	if (strlen(path) >= FILENAME_MAX) {
++		errno = ENAMETOOLONG;
++		return func(path, NULL, WALK_TREE_FAILED, arg);
++	}
++	strcpy(args.path, path);
++	args.walk_flags = walk_flags;
++	args.func = func;
++	args.arg = arg;
++	args.depth = 0;
++	args.dev = 0;
++
++	return walk_tree_rec(&args);
++}
+diff --git a/libmisc/walk_tree.c b/libmisc/walk_tree.c
+deleted file mode 100644
+index 0aa5f35..0000000
+--- a/libmisc/walk_tree.c
++++ /dev/null
+@@ -1,258 +0,0 @@
+-/*
+-  File: walk_tree.c
+-
+-  Copyright (C) 2007 Andreas Gruenbacher <a.gruenbacher@computer.org>
+-
+-  This library is free software; you can redistribute it and/or
+-  modify it under the terms of the GNU Lesser General Public
+-  License as published by the Free Software Foundation; either
+-  version 2.1 of the License, or (at your option) any later version.
+-
+-  This library is distributed in the hope that it will be useful,
+-  but WITHOUT ANY WARRANTY; without even the implied warranty of
+-  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+-  Lesser General Public License for more details.
+-
+-  You should have received a copy of the GNU Lesser General Public
+-  License along with this library; if not, see <https://www.gnu.org/licenses/>.
+-*/
+-
+-#include "config.h"
+-#include <sys/types.h>
+-#include <sys/stat.h>
+-#include <unistd.h>
+-#include <sys/time.h>
+-#include <sys/resource.h>
+-#include <dirent.h>
+-#include <stdio.h>
+-#include <string.h>
+-#include <errno.h>
+-
+-#include "walk_tree.h"
+-
+-struct entry_handle {
+-	struct entry_handle *prev, *next;
+-	dev_t dev;
+-	ino_t ino;
+-	DIR *stream;
+-	long pos;
+-};
+-
+-struct walk_tree_args {
+-	char path[FILENAME_MAX];
+-	int walk_flags;
+-	int (*func)(const char *, const struct stat *, int, void *);
+-	void *arg;
+-	int depth;
+-	struct entry_handle dirs;
+-	struct entry_handle *closed;
+-	unsigned int num_dir_handles;
+-	struct stat st;
+-	dev_t dev;
+-};
+-
+-static int walk_tree_visited(struct entry_handle *dirs, dev_t dev, ino_t ino)
+-{
+-	struct entry_handle *i;
+-
+-	for (i = dirs->next; i != dirs; i = i->next)
+-		if (i->dev == dev && i->ino == ino)
+-			return 1;
+-	return 0;
+-}
+-
+-static int walk_tree_rec(struct walk_tree_args *args)
+-{
+-	int follow_symlinks = (args->walk_flags & WALK_TREE_LOGICAL) ||
+-			      ((args->walk_flags & WALK_TREE_DEREFERENCE) &&
+-			       !(args->walk_flags & WALK_TREE_PHYSICAL) &&
+-			       args->depth == 0);
+-	int have_dir_stat = 0, flags = args->walk_flags, err;
+-	struct entry_handle dir;
+-
+-	/*
+-	 * If (walk_flags & WALK_TREE_PHYSICAL), do not traverse symlinks.
+-	 * If (walk_flags & WALK_TREE_LOGICAL), traverse all symlinks.
+-	 * Otherwise, traverse only top-level symlinks.
+-	 */
+-	if (args->depth == 0)
+-		flags |= WALK_TREE_TOPLEVEL;
+-
+-	if (lstat(args->path, &args->st) != 0)
+-		return args->func(args->path, NULL, flags | WALK_TREE_FAILED,
+-				  args->arg);
+-
+-	if (flags & WALK_TREE_ONE_FILESYSTEM) {
+-		if (args->dev == 0)
+-			args->dev = args->st.st_dev;
+-		else if (args->st.st_dev != args->dev)
+-			return 0;
+-	}
+-
+-	if (S_ISLNK(args->st.st_mode)) {
+-		flags |= WALK_TREE_SYMLINK;
+-		if ((flags & WALK_TREE_DEREFERENCE) ||
+-		    ((flags & WALK_TREE_TOPLEVEL) &&
+-		     (flags & WALK_TREE_DEREFERENCE_TOPLEVEL))) {
+-			if (stat(args->path, &args->st) != 0)
+-				return args->func(args->path, NULL,
+-						  flags | WALK_TREE_FAILED,
+-						  args->arg);
+-			dir.dev = args->st.st_dev;
+-			dir.ino = args->st.st_ino;
+-			have_dir_stat = 1;
+-		}
+-	} else if (S_ISDIR(args->st.st_mode)) {
+-		dir.dev = args->st.st_dev;
+-		dir.ino = args->st.st_ino;
+-		have_dir_stat = 1;
+-	}
+-	err = args->func(args->path, &args->st, flags, args->arg);
+-
+-	/*
+-	 * Recurse if WALK_TREE_RECURSIVE and the path is:
+-	 *      a dir not from a symlink
+-	 *      a link and follow_symlinks
+-	 */
+-        if ((flags & WALK_TREE_RECURSIVE) &&
+-	    ((!(flags & WALK_TREE_SYMLINK) && S_ISDIR(args->st.st_mode)) ||
+-	     ((flags & WALK_TREE_SYMLINK) && follow_symlinks))) {
+-		struct dirent *entry;
+-
+-		/*
+-		 * Check if we have already visited this directory to break
+-		 * endless loops.
+-		 *
+-		 * If we haven't stat()ed the file yet, do an opendir() for
+-		 * figuring out whether we have a directory, and check whether
+-		 * the directory has been visited afterwards. This saves a
+-		 * system call for each non-directory found.
+-		 */
+-		if (have_dir_stat && walk_tree_visited(&args->dirs, dir.dev, dir.ino))
+-			return err;
+-
+-		if (args->num_dir_handles == 0 && args->closed->prev != &args->dirs) {
+-close_another_dir:
+-			/* Close the topmost directory handle still open. */
+-			args->closed = args->closed->prev;
+-			args->closed->pos = telldir(args->closed->stream);
+-			closedir(args->closed->stream);
+-			args->closed->stream = NULL;
+-			args->num_dir_handles++;
+-		}
+-
+-		dir.stream = opendir(args->path);
+-		if (!dir.stream) {
+-			if (errno == ENFILE && args->closed->prev != &args->dirs) {
+-				/* Ran out of file descriptors. */
+-				args->num_dir_handles = 0;
+-				goto close_another_dir;
+-			}
+-
+-			/*
+-			 * PATH may be a symlink to a regular file, or a dead
+-			 * symlink which we didn't follow above.
+-			 */
+-			if (errno != ENOTDIR && errno != ENOENT)
+-				err += args->func(args->path, NULL, flags |
+-						 WALK_TREE_FAILED, args->arg);
+-			return err;
+-		}
+-
+-		/* See walk_tree_visited() comment above... */
+-		if (!have_dir_stat) {
+-			if (stat(args->path, &args->st) != 0)
+-				goto skip_dir;
+-			dir.dev = args->st.st_dev;
+-			dir.ino = args->st.st_ino;
+-			if (walk_tree_visited(&args->dirs, dir.dev, dir.ino))
+-				goto skip_dir;
+-		}
+-
+-		/* Insert into the list of handles. */
+-		dir.next = args->dirs.next;
+-		dir.prev = &args->dirs;
+-		dir.prev->next = &dir;
+-		dir.next->prev = &dir;
+-		args->num_dir_handles--;
+-
+-		while ((entry = readdir(dir.stream)) != NULL) {
+-			char *path_end;
+-
+-			if (!strcmp(entry->d_name, ".") ||
+-			    !strcmp(entry->d_name, ".."))
+-				continue;
+-			path_end = strchr(args->path, 0);
+-			if ((path_end - args->path) + strlen(entry->d_name) + 1 >=
+-			    FILENAME_MAX) {
+-				errno = ENAMETOOLONG;
+-				err += args->func(args->path, NULL,
+-						  flags | WALK_TREE_FAILED,
+-						  args->arg);
+-				continue;
+-			}
+-			*path_end++ = '/';
+-			strcpy(path_end, entry->d_name);
+-			args->depth++;
+-			err += walk_tree_rec(args);
+-			args->depth--;
+-			*--path_end = 0;
+-			if (!dir.stream) {
+-				/* Reopen the directory handle. */
+-				dir.stream = opendir(args->path);
+-				if (!dir.stream)
+-					return err + args->func(args->path,
+-								NULL,
+-								flags | WALK_TREE_FAILED,
+-								args->arg);
+-				seekdir(dir.stream, dir.pos);
+-
+-				args->closed = args->closed->next;
+-				args->num_dir_handles--;
+-			}
+-		}
+-
+-		/* Remove from the list of handles. */
+-		dir.prev->next = dir.next;
+-		dir.next->prev = dir.prev;
+-		args->num_dir_handles++;
+-
+-	skip_dir:
+-		if (closedir(dir.stream) != 0)
+-			err += args->func(args->path, NULL,
+-					 flags | WALK_TREE_FAILED, args->arg);
+-	}
+-	return err;
+-}
+-
+-int walk_tree(const char *path, int walk_flags, unsigned int num,
+-	      int (*func)(const char *, const struct stat *, int, void *),
+-	      void *arg)
+-{
+-	struct walk_tree_args args;
+-
+-	args.num_dir_handles = num;
+-	if (args.num_dir_handles < 1) {
+-		struct rlimit rlimit;
+-
+-		args.num_dir_handles = 1;
+-		if (getrlimit(RLIMIT_NOFILE, &rlimit) == 0 &&
+-		    rlimit.rlim_cur >= 2)
+-			args.num_dir_handles = rlimit.rlim_cur / 2;
+-	}
+-	args.dirs.next = &args.dirs;
+-	args.dirs.prev = &args.dirs;
+-	args.closed = &args.dirs;
+-	if (strlen(path) >= FILENAME_MAX) {
+-		errno = ENAMETOOLONG;
+-		return func(path, NULL, WALK_TREE_FAILED, arg);
+-	}
+-	strcpy(args.path, path);
+-	args.walk_flags = walk_flags;
+-	args.func = func;
+-	args.arg = arg;
+-	args.depth = 0;
+-	args.dev = 0;
+-
+-	return walk_tree_rec(&args);
+-}
+diff --git a/tools/do_set.c b/tools/do_set.c
+index b510032..a958ede 100644
+--- a/tools/do_set.c
++++ b/tools/do_set.c
+@@ -37,7 +37,7 @@
+ #include "sequence.h"
+ #include "do_set.h"
+ #include "parse.h"
+-#include "walk_tree.h"
++#include "old_walk_tree.h"
+ 
+ 
+ extern const char *progname;
+diff --git a/tools/getfacl.c b/tools/getfacl.c
+index 5a45c04..8ef774b 100644
+--- a/tools/getfacl.c
++++ b/tools/getfacl.c
+@@ -37,7 +37,7 @@
+ #include <getopt.h>
+ #include "misc.h"
+ #include "user_group.h"
+-#include "walk_tree.h"
++#include "old_walk_tree.h"
+ 
+ #define POSIXLY_CORRECT_STR "POSIXLY_CORRECT"
+ 
+@@ -736,7 +736,7 @@ int main(int argc, char *argv[])
+ 				if (*line == '\0')
+ 					continue;
+ 
+-				had_errors += walk_tree(line, walk_flags, 0,
++				had_errors += old_walk_tree(line, walk_flags, 0,
+ 							do_print, NULL);
+ 			}
+ 			if (!feof(stdin)) {
+@@ -745,7 +745,7 @@ int main(int argc, char *argv[])
+ 				had_errors++;
+ 			}
+ 		} else
+-			had_errors += walk_tree(argv[optind], walk_flags, 0,
++			had_errors += old_walk_tree(argv[optind], walk_flags, 0,
+ 						do_print, NULL);
+ 		optind++;
+ 	} while (optind < argc);
+diff --git a/tools/setfacl.c b/tools/setfacl.c
+index 86ba733..cb05975 100644
+--- a/tools/setfacl.c
++++ b/tools/setfacl.c
+@@ -33,7 +33,7 @@
+ #include "sequence.h"
+ #include "parse.h"
+ #include "do_set.h"
+-#include "walk_tree.h"
++#include "old_walk_tree.h"
+ 
+ #define POSIXLY_CORRECT_STR "POSIXLY_CORRECT"
+ 
+@@ -310,14 +310,14 @@ int next_file(const char *arg, seq_t seq)
+ 
+ 	if (strcmp(arg, "-") == 0) {
+ 		while ((line = __acl_next_line(stdin)))
+-			errors = walk_tree(line, walk_flags, 0, do_set, &args);
++			errors = old_walk_tree(line, walk_flags, 0, do_set, &args);
+ 		if (!feof(stdin)) {
+ 			fprintf(stderr, _("%s: Standard input: %s\n"),
+ 				progname, strerror(errno));
+ 			errors = 1;
+ 		}
+ 	} else {
+-		errors = walk_tree(arg, walk_flags, 0, do_set, &args);
++		errors = old_walk_tree(arg, walk_flags, 0, do_set, &args);
+ 	}
+ 	return errors ? 1 : 0;
+ }
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p3.patch b/meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p3.patch
new file mode 100644
index 00000000000..0daa3261e9b
--- /dev/null
+++ b/meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p3.patch
@@ -0,0 +1,439 @@
+From faf0010982141d0644280beada5c9ea957960436 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruenba@redhat.com>
+Date: Tue, 9 Jun 2026 08:42:16 +0200
+Subject: [PATCH] Add the new walk_tree helper
+
+CVE: CVE-2026-54370
+Upstream-Status: Backport [https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=39b00348f5911e4e5937ddfb079cc456288b3cd3]
+
+Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
+(cherry picked from commit 39b00348f5911e4e5937ddfb079cc456288b3cd3)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ include/Makemodule.am |   1 +
+ include/walk_tree.h   |  40 +++++
+ libmisc/Makemodule.am |   1 +
+ libmisc/walk_tree.c   | 340 ++++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 382 insertions(+)
+ create mode 100644 include/walk_tree.h
+ create mode 100644 libmisc/walk_tree.c
+
+diff --git a/include/Makemodule.am b/include/Makemodule.am
+index 3926bda..3e2a47b 100644
+--- a/include/Makemodule.am
++++ b/include/Makemodule.am
+@@ -6,6 +6,7 @@ noinst_HEADERS += \
+ 	include/misc.h \
+ 	include/old_walk_tree.h \
+ 	include/visibility-hidden.h \
++	include/walk_tree.h \
+ 	include/xattrat.h \
+ 	include/xattrat_compat.h
+ 
+diff --git a/include/walk_tree.h b/include/walk_tree.h
+new file mode 100644
+index 0000000..60df8da
+--- /dev/null
++++ b/include/walk_tree.h
+@@ -0,0 +1,40 @@
++/*
++  File: walk_tree.h
++
++  Copyright (C) 2007-2026 Andreas Gruenbacher <a.gruenbacher@computer.org>
++
++  This library is free software; you can redistribute it and/or
++  modify it under the terms of the GNU Lesser General Public
++  License as published by the Free Software Foundation; either
++  version 2.1 of the License, or (at your option) any later version.
++
++  This library is distributed in the hope that it will be useful,
++  but WITHOUT ANY WARRANTY; without even the implied warranty of
++  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++  Lesser General Public License for more details.
++
++  You should have received a copy of the GNU Lesser General Public
++  License along with this library; if not, see <https://www.gnu.org/licenses/>.
++*/
++
++#ifndef __WALK_TREE_H
++#define __WALK_TREE_H
++
++enum walk_flags {
++	WALK_TREE_RECURSIVE = 0x01,
++	WALK_TREE_PHYSICAL = 0x02,
++	WALK_TREE_LOGICAL = 0x04,
++	WALK_TREE_ONE_FILESYSTEM = 0x08,
++
++	WALK_TREE_TOPLEVEL = 0x100,
++	WALK_TREE_FAILED = 0x200,
++};
++
++struct stat;
++
++extern int walk_tree(const char *pathname, enum walk_flags walk_flags,
++		     int (*func)(int, const char *, const char *,
++				 unsigned char, enum walk_flags, void *),
++		     void *arg);
++
++#endif
+diff --git a/libmisc/Makemodule.am b/libmisc/Makemodule.am
+index 26e802b..9d656ca 100644
+--- a/libmisc/Makemodule.am
++++ b/libmisc/Makemodule.am
+@@ -13,6 +13,7 @@ libmisc_la_SOURCES = \
+ 	libmisc/old_walk_tree.c \
+ 	libmisc/proc-self-fd.c \
+ 	libmisc/quote.c \
++	libmisc/walk_tree.c \
+ 	libmisc/removexattrat_compat.c \
+ 	libmisc/setxattrat_compat.c \
+ 	libmisc/unquote.c
+diff --git a/libmisc/walk_tree.c b/libmisc/walk_tree.c
+new file mode 100644
+index 0000000..5b1b576
+--- /dev/null
++++ b/libmisc/walk_tree.c
+@@ -0,0 +1,340 @@
++/*
++  File: walk_tree.c
++
++  Copyright (C) 2007-2026 Andreas Gruenbacher <a.gruenbacher@computer.org>
++
++  This library is free software; you can redistribute it and/or
++  modify it under the terms of the GNU Lesser General Public
++  License as published by the Free Software Foundation; either
++  version 2.1 of the License, or (at your option) any later version.
++
++  This library is distributed in the hope that it will be useful,
++  but WITHOUT ANY WARRANTY; without even the implied warranty of
++  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++  Lesser General Public License for more details.
++
++  You should have received a copy of the GNU Lesser General Public
++  License along with this library; if not, see <https://www.gnu.org/licenses/>.
++*/
++
++#include "config.h"
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <unistd.h>
++#include <fcntl.h>
++#include <sys/time.h>
++#include <sys/resource.h>
++#include <dirent.h>
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <errno.h>
++
++#include "walk_tree.h"
++
++struct dir_stack_entry {
++	struct dir_stack_entry *parent;
++	DIR *stream;
++	long pos;
++	dev_t dev;
++	ino_t ino;
++};
++
++struct dir_hash_entry {
++	struct dir_hash_entry *next;
++	dev_t dev;
++	ino_t ino;
++};
++
++#define DIR_HASH_SIZE 128
++
++struct walk_tree_args {
++	enum walk_flags walk_flags;
++	int (*func)(int, const char *, const char *, unsigned char,
++		    enum walk_flags, void *);
++	void *arg;
++	int depth;
++	unsigned int num_dir_handles;
++	dev_t dev;
++	struct dir_hash_entry **dir_hash;
++};
++
++static int dir_visited(struct dir_stack_entry *entry, dev_t dev, ino_t ino)
++{
++	while (entry) {
++		if (entry->dev == dev && entry->ino == ino)
++			  return 1;
++		entry = entry->parent;
++	}
++	return 0;
++}
++
++static unsigned int dir_hash(dev_t dev, ino_t ino)
++{
++	return (dev ^ ino) % DIR_HASH_SIZE;
++}
++
++static int dir_hash_insert_unique(struct walk_tree_args *args, struct stat *st)
++{
++	unsigned int bucket = dir_hash(st->st_dev, st->st_ino);
++	struct dir_hash_entry *entry;
++
++	if (!args->dir_hash) {
++		/* allocate the directory hash table */
++		args->dir_hash = calloc(DIR_HASH_SIZE, sizeof(*args->dir_hash));
++		if (!args->dir_hash)
++			return -1;
++	}
++
++	entry = args->dir_hash[bucket];
++	while (entry) {
++		if (entry->dev == st->st_dev && entry->ino == st->st_ino)
++			return 1;
++		entry = entry->next;
++	}
++
++	entry = malloc(sizeof(*entry));
++	if (!entry)
++		return -1;
++
++	entry->dev = st->st_dev;
++	entry->ino = st->st_ino;
++	entry->next = args->dir_hash[bucket];
++	args->dir_hash[bucket] = entry;
++	return 0;
++}
++
++static char *new_dirname(const char *dirname, const char *pathname)
++{
++	size_t dirlen, pathlen;
++	char *newname, *n;
++	int need_slash;
++
++	if (*dirname == '\0' && *pathname == '.' &&
++	    (*(pathname+1) == '/' || *(pathname+1) == '\0')) {
++		pathname++;
++		while (*pathname == '/')
++			pathname++;
++	}
++
++	dirlen = strlen(dirname);
++	pathlen = strlen(pathname);
++	need_slash = (pathlen > 0 && pathname[pathlen - 1] != '/');
++	n = newname = malloc(dirlen + pathlen + need_slash + 1);
++	if (newname == NULL)
++		return NULL;
++	memcpy(n, dirname, dirlen);
++	n += dirlen;
++	memcpy(n, pathname, pathlen);
++	n += pathlen;
++	if (need_slash)
++		*n++ = '/';
++	*n++ = '\0';
++	return newname;
++}
++
++static int walk_tree_rec(int dirfd, const char *dirname, const char *pathname,
++			 unsigned char dirtype, struct walk_tree_args *args,
++			 struct dir_stack_entry *parent_dir)
++{
++	enum walk_flags walk_flags = args->walk_flags;
++	struct dir_stack_entry this_dir = {
++		.parent = parent_dir,
++	};
++	int follow;
++	struct stat st;
++	char *mydirname = NULL;
++	int dir_open_flags;
++	int fd = -1;
++	struct dirent *entry;
++	int err = 0;
++
++	if (args->depth == 0)
++		walk_flags |= WALK_TREE_TOPLEVEL;
++
++	follow = (walk_flags & WALK_TREE_LOGICAL) ||
++		 (!(walk_flags & WALK_TREE_PHYSICAL) && !args->depth);
++
++	if (!(walk_flags & WALK_TREE_RECURSIVE) ||
++	    (dirtype != DT_UNKNOWN &&
++	     dirtype != DT_DIR &&
++	     (dirtype != DT_LNK ||
++	      ((walk_flags & WALK_TREE_PHYSICAL) &&
++	       !(walk_flags & WALK_TREE_TOPLEVEL)))))
++		goto visit_this;
++
++	if (args->num_dir_handles == 0) {
++		struct dir_stack_entry *top;
++
++close_another_parent:
++		/* Close the topmost parent directory handle still open. */
++		top = parent_dir;
++		if (!top || !top->stream) {
++			errno = ENFILE;
++			goto fail;
++		}
++		while (top->parent && top->parent->stream)
++			top = top->parent;
++		top->pos = telldir(top->stream);
++		closedir(top->stream);
++		top->stream = NULL;
++		args->num_dir_handles++;
++	}
++
++	dir_open_flags = O_RDONLY | O_DIRECTORY | (follow ? 0 : O_NOFOLLOW);
++	fd = openat(dirfd, pathname, dir_open_flags);
++	if (fd == -1) {
++		if (errno == ENOTDIR || errno == ENOENT || errno == ELOOP)
++			goto visit_this;
++		if (errno != ENFILE)
++			goto fail;
++		/* Ran out of file descriptors. */
++		args->num_dir_handles = 0;
++		goto close_another_parent;
++	}
++	args->num_dir_handles--;
++	if (dirtype == DT_UNKNOWN && !follow)
++		dirtype = DT_DIR;
++
++	if (fstat(fd, &st) == -1)
++		goto fail;
++	if (walk_flags & WALK_TREE_ONE_FILESYSTEM) {
++		if (args->dev == 0)
++			args->dev = st.st_dev;
++		else if (st.st_dev != args->dev)
++			goto dir_visited;
++	}
++
++	if (walk_flags & WALK_TREE_LOGICAL) {
++		if (dir_visited(parent_dir, st.st_dev, st.st_ino))
++			goto dir_visited;
++		this_dir.dev = st.st_dev;
++		this_dir.ino = st.st_ino;
++	} else {
++		int ret = dir_hash_insert_unique(args, &st);
++		if (ret == 1)
++			goto dir_visited;
++		if (ret == -1)
++			goto fail;
++	}
++	goto visit_this;
++
++dir_visited:
++	close(fd);
++	fd = -1;
++	if (dirtype == DT_UNKNOWN) {
++		if (fstatat(dirfd, pathname, &st, AT_SYMLINK_NOFOLLOW) == -1)
++			goto fail;
++		dirtype = IFTODT(st.st_mode);
++	}
++	if (dirtype == DT_DIR)
++		goto out;
++
++visit_this:
++	err += args->func(dirfd, dirname, pathname, dirtype,
++			  walk_flags, args->arg);
++
++	if (fd == -1)
++		goto out;
++	this_dir.stream = fdopendir(fd);
++	if (this_dir.stream == NULL)
++		goto fail;
++
++	mydirname = new_dirname(dirname, pathname);
++	if (mydirname == NULL)
++		goto fail;
++
++	args->depth++;
++	while ((entry = readdir(this_dir.stream)) != NULL) {
++		if (!strcmp(entry->d_name, ".") ||
++		    !strcmp(entry->d_name, ".."))
++			continue;
++
++		err += walk_tree_rec(fd, mydirname, entry->d_name,
++				     entry->d_type, args, &this_dir);
++
++		if (!this_dir.stream) {
++			/* Reopen the directory handle. */
++			fd = openat(dirfd, pathname, dir_open_flags);
++			if (fd == -1)
++				goto fail_depth;
++			args->num_dir_handles--;
++			this_dir.stream = fdopendir(fd);
++			if (!this_dir.stream)
++				goto fail_depth;
++			seekdir(this_dir.stream, this_dir.pos);
++		}
++	}
++	args->depth--;
++
++	if (closedir(this_dir.stream) != 0) {
++		this_dir.stream = NULL;
++		goto fail;
++	}
++	this_dir.stream = NULL;
++
++out:
++	free(mydirname);
++	if (this_dir.stream) {
++		closedir(this_dir.stream);
++		args->num_dir_handles++;
++		fd = -1;
++	}
++	if (fd != -1) {
++		close(fd);
++		args->num_dir_handles++;
++	}
++	return err;
++
++fail:
++	err += args->func(dirfd, dirname, pathname, dirtype,
++			  walk_flags | WALK_TREE_FAILED, args->arg);
++	goto out;
++
++fail_depth:
++	args->depth--;
++	goto fail;
++}
++
++/*
++ * If (walk_flags & WALK_TREE_PHYSICAL), do not traverse symlinks.
++ * If (walk_flags & WALK_TREE_LOGICAL), traverse all symlinks.
++ * Otherwise, traverse only top-level symlinks.
++ */
++int walk_tree(const char *pathname, enum walk_flags walk_flags,
++	      int (*func)(int, const char *, const char *, unsigned char,
++			  enum walk_flags, void *),
++	      void *arg)
++{
++	struct walk_tree_args args = {
++		.walk_flags = walk_flags,
++		.func = func,
++		.arg = arg,
++	};
++	struct rlimit rlimit;
++	int err;
++
++	/* number of directory file descriptors to keep open at a time */
++	if (getrlimit(RLIMIT_NOFILE, &rlimit) != 0)
++		rlimit.rlim_cur = 0;
++	args.num_dir_handles = rlimit.rlim_cur / 4 + 1;
++
++	err = walk_tree_rec(AT_FDCWD, "", pathname, DT_UNKNOWN, &args, NULL);
++
++	if (args.dir_hash) {
++		/* destroy the directory hash table */
++		int n;
++
++		for (n = 0; n < DIR_HASH_SIZE; n++) {
++			struct dir_hash_entry *entry = args.dir_hash[n];
++			while (entry) {
++				struct dir_hash_entry *next = entry->next;
++				free(entry);
++				entry = next;
++			}
++		}
++		free(args.dir_hash);
++	}
++
++	return err;
++}
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p4.patch b/meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p4.patch
new file mode 100644
index 00000000000..a78ed510f34
--- /dev/null
+++ b/meta/recipes-support/attr/acl/CVE-2026-54370-dependent_p4.patch
@@ -0,0 +1,140 @@
+From d3012ad3c4dbe81f7b33eddc02c14d930a0742fc Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruenba@redhat.com>
+Date: Sat, 20 Jun 2026 16:17:02 +0200
+Subject: [PATCH] Add openat2 syscall wrapper
+
+Add a syscall wrapper for the openat2() syscall added in kernel version v5.6
+from March 2020.
+
+On systems where the openat2() syscall is available but shouldn't be used, use
+the --disable-openat2 configure option.
+
+CVE: CVE-2026-54370
+Upstream-Status: Backport [https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=7244f425227a23533f0b0b41c717dbd59736b907]
+
+Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
+(cherry picked from commit 7244f425227a23533f0b0b41c717dbd59736b907)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ configure.ac          | 14 ++++++++++++++
+ include/Makemodule.am |  1 +
+ include/openat2.h     | 16 ++++++++++++++++
+ libmisc/Makemodule.am |  7 +++++++
+ libmisc/openat2.c     | 30 ++++++++++++++++++++++++++++++
+ 5 files changed, 68 insertions(+)
+ create mode 100644 include/openat2.h
+ create mode 100644 libmisc/openat2.c
+
+diff --git a/configure.ac b/configure.ac
+index 22d5084..c3353f6 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -34,6 +34,20 @@ AC_SYS_LARGEFILE
+ AM_PROG_AR
+ LT_INIT
+ 
++AC_CHECK_FUNCS(openat2)
++AC_CHECK_HEADERS([linux/openat2.h])
++AC_CHECK_DECL([__NR_openat2], [], [], [[#include <sys/syscall.h>]])
++if test "x$ac_cv_have_decl___NR_openat2" = xyes -a \
++	"x$ac_cv_header_linux_openat2_h" = xyes; then
++	use_openat2=yes
++else
++	use_openat2=no
++fi
++AM_CONDITIONAL([USE_OPENAT2], [test "x$use_openat2" = xyes])
++AM_CONDITIONAL([HAVE_OPENAT2], [test "x$ac_cv_func_openat2" = xyes])
++AS_IF([test "x$use_openat2" = xyes],
++      [AC_DEFINE([USE_OPENAT2], [1], [Define to use openat2 syscall])])
++
+ AC_CHECK_FUNCS(getxattrat setxattrat listxattrat removexattrat)
+ AM_CONDITIONAL([NEED_XATTRAT],
+ 	       [test "x$ac_cv_func_getxattrat" = xno -o \
+diff --git a/include/Makemodule.am b/include/Makemodule.am
+index 3e2a47b..43a136a 100644
+--- a/include/Makemodule.am
++++ b/include/Makemodule.am
+@@ -5,6 +5,7 @@ noinst_HEADERS += \
+ 	include/fchmodat_compat.h \
+ 	include/misc.h \
+ 	include/old_walk_tree.h \
++	include/openat2.h \
+ 	include/visibility-hidden.h \
+ 	include/walk_tree.h \
+ 	include/xattrat.h \
+diff --git a/include/openat2.h b/include/openat2.h
+new file mode 100644
+index 0000000..d267895
+--- /dev/null
++++ b/include/openat2.h
+@@ -0,0 +1,16 @@
++#ifndef MISC_OPENAT2_H
++#define MISC_OPENAT2_H
++
++#include "config.h"
++#include <stdint.h>
++
++#ifdef USE_OPENAT2
++#include <linux/openat2.h>
++
++#ifndef HAVE_OPENAT2
++int openat2(int dirfd, const char *pathname, const struct open_how *how,
++	    size_t size);
++#endif
++#endif
++
++#endif /* MISC_OPENAT2_H */
+diff --git a/libmisc/Makemodule.am b/libmisc/Makemodule.am
+index 9d656ca..e45a82a 100644
+--- a/libmisc/Makemodule.am
++++ b/libmisc/Makemodule.am
+@@ -22,3 +22,10 @@ if NEED_XATTRAT
+ libmisc_la_SOURCES += \
+ 	libmisc/xattrat.c
+ endif
++
++if USE_OPENAT2
++if !HAVE_OPENAT2
++libmisc_la_SOURCES += \
++	libmisc/openat2.c
++endif
++endif
+diff --git a/libmisc/openat2.c b/libmisc/openat2.c
+new file mode 100644
+index 0000000..bdc78e1
+--- /dev/null
++++ b/libmisc/openat2.c
+@@ -0,0 +1,30 @@
++/*
++  File: openat2.c
++
++  Copyright (C) 2026 Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
++
++  This library is free software; you can redistribute it and/or
++  modify it under the terms of the GNU Lesser General Public
++  License as published by the Free Software Foundation; either
++  version 2.1 of the License, or (at your option) any later version.
++
++  This library is distributed in the hope that it will be useful,
++  but WITHOUT ANY WARRANTY; without even the implied warranty of
++  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++  Lesser General Public License for more details.
++
++  You should have received a copy of the GNU Lesser General Public
++  License along with this library; if not, see <https://www.gnu.org/licenses/>.
++*/
++
++#include "config.h"
++#include <sys/syscall.h>
++#include <unistd.h>
++
++#include "openat2.h"
++
++int openat2(int dirfd, const char *pathname, const struct open_how *how,
++	    size_t size)
++{
++	return syscall(__NR_openat2, dirfd, pathname, how, size);
++}
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/attr/acl/CVE-2026-54370_p1.patch b/meta/recipes-support/attr/acl/CVE-2026-54370_p1.patch
new file mode 100644
index 00000000000..b977a92b337
--- /dev/null
+++ b/meta/recipes-support/attr/acl/CVE-2026-54370_p1.patch
@@ -0,0 +1,299 @@
+From b8a5843fafde6563bc1e7a9e9314f7a1075fc6a0 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruenba@redhat.com>
+Date: Tue, 9 Jun 2026 08:43:16 +0200
+Subject: [PATCH] harden getfacl
+
+Switch to the new walk_tree helper that uses directory file descriptors and
+relative paths instead of building full pathnames.  On the final pathname
+component, use functions that only follow symlinks when requested (stat() ->
+fstatat(), acl_get_file() -> acl_get_file_at()).  This prevents getfacl from
+accidentally following a symlink an attacker may have planted.
+
+A notable change is that commands like 'getfacl -P symlink' will now fail with
+an ELOOP error ("Too many levels of symbolic links").  Previously, command-line
+arguments that refer to symbolic links were silently ignored in -P (--physical)
+mode.
+
+Fixes: CVE-2026-54370 ("acl < 2.4.0 TOCTOU Symlink Traversal via getfacl/setfacl")
+
+CVE: CVE-2026-54370
+Upstream-Status: Backport [https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=2ee940139e9bba5005a3d987a6daecdda909089e]
+
+Backport Changes:
+- Retain ACL 2.3.2's FILE argument in the tabular output helper.
+- Update its caller to use the safe walker display name and stat.
+- Retain existing option variable linkage while changing walk_flags.
+
+Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
+(cherry picked from commit 2ee940139e9bba5005a3d987a6daecdda909089e)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ tools/getfacl.c | 111 ++++++++++++++++++++++++++++++------------------
+ 1 file changed, 70 insertions(+), 41 deletions(-)
+
+diff --git a/tools/getfacl.c b/tools/getfacl.c
+index 8ef774b..2077820 100644
+--- a/tools/getfacl.c
++++ b/tools/getfacl.c
+@@ -4,6 +4,7 @@
+ 
+   Copyright (C) 1999-2002
+   Andreas Gruenbacher, <andreas.gruenbacher@gmail.com>
++  Copyright 2026 Andreas Gruenbacher <andreas.gruenbacher@gmail.com>
+  	
+   This program is free software; you can redistribute it and/or modify
+   it under the terms of the GNU General Public License as published by
+@@ -30,6 +31,7 @@
+ #include <limits.h>
+ #include <stdlib.h>
+ #include <unistd.h>
++#include <fcntl.h>
+ #include <string.h>
+ #include <sys/stat.h>
+ #include <dirent.h>
+@@ -37,7 +39,7 @@
+ #include <getopt.h>
+ #include "misc.h"
+ #include "user_group.h"
+-#include "old_walk_tree.h"
++#include "walk_tree.h"
+ 
+ #define POSIXLY_CORRECT_STR "POSIXLY_CORRECT"
+ 
+@@ -70,7 +72,7 @@ static const struct option long_options[] = {
+ const char *progname;
+ const char *cmd_line_options;
+ 
+-int walk_flags = WALK_TREE_DEREFERENCE_TOPLEVEL;
++enum walk_flags walk_flags = 0;
+ int opt_print_acl;
+ int opt_print_default_acl;
+ int opt_strip_leading_slash = 1;
+@@ -325,7 +327,7 @@ int show_line(FILE *stream, struct name_list **acl_names,  acl_t acl,
+ 	return 0;
+ }
+ 
+-int do_show(FILE *stream, const char *path_p, const struct stat *st,
++int do_show(FILE *stream, const char *fullname, const struct stat *st,
+             acl_t acl, acl_t dacl)
+ {
+ 	struct name_list *acl_names = get_list(st, acl),
+@@ -364,7 +366,7 @@ int do_show(FILE *stream, const char *path_p, const struct stat *st,
+ 		if (ret < 0)
+ 			return ret;
+ 	}
+-	fprintf(stream, "# file: %s\n", xquote(path_p, "\n\r"));
++	fprintf(stream, "# file: %s\n", xquote(fullname, "\n\r"));
+ 	while (acl_names != NULL || dacl_names != NULL) {
+ 		acl_tag_t acl_tag, dacl_tag;
+ 
+@@ -423,11 +425,11 @@ int do_show(FILE *stream, const char *path_p, const struct stat *st,
+  * of the file PATH_P.
+  */
+ static acl_t
+-acl_get_file_mode(const char *path_p)
++acl_get_from_file_mode_at(int dirfd, const char *pathname, int at_flags)
+ {
+ 	struct stat st;
+ 
+-	if (stat(path_p, &st) != 0)
++	if (fstatat(dirfd, pathname, &st, at_flags) != 0)
+ 		return NULL;
+ 	return acl_from_mode(st.st_mode);
+ }
+@@ -444,15 +446,32 @@ flagstr(mode_t mode)
+ 	return str;
+ }
+ 
+-int do_print(const char *path_p, const struct stat *st, int walk_flags, void *unused)
++static int do_print(int dirfd, const char *dirname, const char *pathname,
++		    unsigned char dirtype, enum walk_flags walk_flags,
++		    void *unused)
+ {
++	static char *__fullname;
++	const char *fullname;
+ 	const char *default_prefix = NULL;
+ 	acl_t acl = NULL, default_acl = NULL;
++	struct stat st;
++	int at_flags;
+ 	int error = 0;
+ 
++	if (*dirname) {
++		free(__fullname);
++		__fullname = NULL;
++		if (asprintf(&__fullname, "%s%s", dirname, pathname) == -1) {
++			fprintf(stderr, "%s: %s", progname, strerror(errno));
++			return 1;
++		}
++		fullname = __fullname;
++	} else
++		fullname = pathname;
++
+ 	if (walk_flags & WALK_TREE_FAILED) {
+-		fprintf(stderr, "%s: %s: %s\n", progname, xquote(path_p, "\n\r"),
+-			strerror(errno));
++		fprintf(stderr, "%s: %s: %s\n", progname,
++			xquote(fullname, "\n\r"), strerror(errno));
+ 		return 1;
+ 	}
+ 
+@@ -461,21 +480,37 @@ int do_print(const char *path_p, const struct stat *st, int walk_flags, void *un
+ 	 * skip symlinks altogether, and when doing a half-logical walk, we
+ 	 * skip all non-toplevel symlinks. 
+ 	 */
+-	if ((walk_flags & WALK_TREE_SYMLINK) &&
+-	    ((walk_flags & WALK_TREE_PHYSICAL) ||
+-	     !(walk_flags & (WALK_TREE_TOPLEVEL | WALK_TREE_LOGICAL))))
+-		return 0;
++	at_flags = AT_SYMLINK_NOFOLLOW;
++	if ((walk_flags & WALK_TREE_LOGICAL) ||
++	    ((walk_flags & WALK_TREE_TOPLEVEL) &&
++	     !(walk_flags & WALK_TREE_PHYSICAL)))
++	       at_flags = 0;
++
++	if (dirtype == DT_LNK && (at_flags & AT_SYMLINK_NOFOLLOW))
++		goto cleanup;
++
++	if (fstatat(dirfd, pathname, &st, at_flags) != 0)
++		goto fail;
++	if (S_ISLNK(st.st_mode)) {
++		if (!(walk_flags & WALK_TREE_TOPLEVEL))
++			goto cleanup;
++		errno = ELOOP;
++		goto fail;
++	}
+ 
+ 	if (opt_print_acl) {
+-		acl = acl_get_file(path_p, ACL_TYPE_ACCESS);
++		acl = acl_get_file_at(dirfd, pathname, at_flags,
++				      ACL_TYPE_ACCESS);
+ 		if (acl == NULL && (errno == ENOSYS || errno == ENOTSUP))
+-			acl = acl_get_file_mode(path_p);
++			acl = acl_get_from_file_mode_at(dirfd, pathname,
++							at_flags);
+ 		if (acl == NULL)
+ 			goto fail;
+ 	}
+ 
+-	if (opt_print_default_acl && S_ISDIR(st->st_mode)) {
+-		default_acl = acl_get_file(path_p, ACL_TYPE_DEFAULT);
++	if (opt_print_default_acl && S_ISDIR(st.st_mode)) {
++		default_acl = acl_get_file_at(dirfd, pathname, at_flags,
++					      ACL_TYPE_DEFAULT);
+ 		if (default_acl == NULL) {
+ 			if (errno != ENOSYS && errno != ENOTSUP)
+ 				goto fail;
+@@ -493,34 +528,30 @@ int do_print(const char *path_p, const struct stat *st, int walk_flags, void *un
+ 		default_prefix = "default:";
+ 
+ 	if (opt_strip_leading_slash) {
+-		if (*path_p == '/') {
++		if (*fullname == '/') {
+ 			if (!absolute_warning) {
+ 				fprintf(stderr, _("%s: Removing leading "
+ 					"'/' from absolute path names\n"),
+-				        progname);
++					progname);
+ 				absolute_warning = 1;
+ 			}
+-			while (*path_p == '/')
+-				path_p++;
+-		} else if (*path_p == '.' && *(path_p+1) == '/')
+-			while (*++path_p == '/')
+-				/* nothing */ ;
+-		if (*path_p == '\0')
+-			path_p = ".";
++			while (*fullname == '/')
++				fullname++;
++		}
+ 	}
+ 
+ 	if (opt_tabular)  {
+-		if (do_show(stdout, path_p, st, acl, default_acl) != 0)
++		if (do_show(stdout, fullname, &st, acl, default_acl) != 0)
+ 			goto fail;
+ 	} else {
+ 		if (opt_comments) {
+-			printf("# file: %s\n", xquote(path_p, "\n\r"));
++			printf("# file: %s\n", xquote(fullname, "\n\r"));
+ 			printf("# owner: %s\n",
+-			       xquote(user_name(st->st_uid, opt_numeric), " \t\n\r"));
++			       xquote(user_name(st.st_uid, opt_numeric), " \t\n\r"));
+ 			printf("# group: %s\n",
+-			       xquote(group_name(st->st_gid, opt_numeric), " \t\n\r"));
+-			if ((st->st_mode & (S_ISVTX | S_ISUID | S_ISGID)) && !posixly_correct)
+-				printf("# flags: %s\n", flagstr(st->st_mode));
++			       xquote(group_name(st.st_gid, opt_numeric), " \t\n\r"));
++			if ((st.st_mode & (S_ISVTX | S_ISUID | S_ISGID)) && !posixly_correct)
++				printf("# flags: %s\n", flagstr(st.st_mode));
+ 		}
+ 		if (acl != NULL) {
+ 			char *acl_text = acl_to_any_text(acl, NULL, '\n',
+@@ -557,8 +588,7 @@ cleanup:
+ 	return error;
+ 
+ fail:
+-	fprintf(stderr, "%s: %s: %s\n", progname, xquote(path_p, "\n\r"),
+-		strerror(errno));
++	fprintf(stderr, "%s: %s: %s\n", progname, fullname, strerror(errno));
+ 	error = -1;
+ 	goto cleanup;
+ }
+@@ -589,7 +619,7 @@ void help(void)
+ "  -P, --physical          physical walk, do not follow symbolic links\n"
+ "  -t, --tabular           use tabular output format\n"
+ "  -n, --numeric           print numeric user/group identifiers\n"
+-"      --one-file-system   skip files on different filesystems\n"
++"      --one-file-system   don't descend into directories on other filesystems\n"
+ "  -p, --absolute-names    don't strip leading '/' in pathnames\n"));
+ 	}
+ #endif
+@@ -666,7 +696,7 @@ int main(int argc, char *argv[])
+ 			case 'L':  /* follow all symlinks */
+ 				if (posixly_correct)
+ 					goto synopsis;
+-				walk_flags |= WALK_TREE_LOGICAL | WALK_TREE_DEREFERENCE;
++				walk_flags |= WALK_TREE_LOGICAL;
+ 				walk_flags &= ~WALK_TREE_PHYSICAL;
+ 				break;
+ 
+@@ -674,8 +704,7 @@ int main(int argc, char *argv[])
+ 				if (posixly_correct)
+ 					goto synopsis;
+ 				walk_flags |= WALK_TREE_PHYSICAL;
+-				walk_flags &= ~(WALK_TREE_LOGICAL | WALK_TREE_DEREFERENCE |
+-						WALK_TREE_DEREFERENCE_TOPLEVEL);
++				walk_flags &= ~WALK_TREE_LOGICAL;
+ 				break;
+ 
+ 			case 's':  /* skip files with only base entries */
+@@ -713,7 +742,7 @@ int main(int argc, char *argv[])
+ 				help();
+ 				return 0;
+ 
+-			case ':':  /* option missing */
++			case ':':  /* argument missing */
+ 			case '?':  /* unknown option */
+ 			default:
+ 				goto synopsis;
+@@ -736,7 +765,7 @@ int main(int argc, char *argv[])
+ 				if (*line == '\0')
+ 					continue;
+ 
+-				had_errors += old_walk_tree(line, walk_flags, 0,
++				had_errors += walk_tree(line, walk_flags,
+ 							do_print, NULL);
+ 			}
+ 			if (!feof(stdin)) {
+@@ -745,7 +774,7 @@ int main(int argc, char *argv[])
+ 				had_errors++;
+ 			}
+ 		} else
+-			had_errors += old_walk_tree(argv[optind], walk_flags, 0,
++			had_errors += walk_tree(argv[optind], walk_flags,
+ 						do_print, NULL);
+ 		optind++;
+ 	} while (optind < argc);
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/attr/acl/CVE-2026-54370_p2.patch b/meta/recipes-support/attr/acl/CVE-2026-54370_p2.patch
new file mode 100644
index 00000000000..0f6efeeb2a3
--- /dev/null
+++ b/meta/recipes-support/attr/acl/CVE-2026-54370_p2.patch
@@ -0,0 +1,403 @@
+From 28d24088e44b651394c83440504353ef130c1e3d Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruenba@redhat.com>
+Date: Tue, 9 Jun 2026 08:43:46 +0200
+Subject: [PATCH] harden setfacl
+
+Switch to the new walk_tree helper that uses directory file descriptors and
+relative paths instead of building full pathnames.  On the final pathname
+component, use functions that only follow symlinks when requested (stat() ->
+fstatat(), acl_get_file() -> acl_get_file_at(), chmod() -> fchmodat(),
+acl_set_file() -> acl_set_file_at(), acl_delete_def_file() ->
+acl_delete_def_file_at()).  This prevents setfacl from accidentally following a
+symlink an attacker may have planted.
+
+A notable change is that commands like 'setfacl -P ... symlink' will now fail
+with an ELOOP error ("Too many levels of symbolic links").  Previously,
+command-line arguments that refer to symbolic links were silently ignored in
+-P (--physical) mode.
+
+(The --restore option is hardened in a separate patch.)
+
+Fixes: CVE-2026-54370 ("acl < 2.4.0 TOCTOU Symlink Traversal via getfacl/setfacl")
+
+CVE: CVE-2026-54370
+Upstream-Status: Backport [https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=2c03ceefa0610d551d9cc089ce0a404cbe2d34b4]
+
+Backport Changes:
+- Retain existing walk_flags linkage with the new enum type.
+
+Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
+(cherry picked from commit 2c03ceefa0610d551d9cc089ce0a404cbe2d34b4)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ man/man1/setfacl.1 |  1 -
+ tools/do_set.c     | 98 +++++++++++++++++++++++++++++++---------------
+ tools/do_set.h     |  5 ++-
+ tools/setfacl.c    | 18 ++++-----
+ 4 files changed, 79 insertions(+), 43 deletions(-)
+
+diff --git a/man/man1/setfacl.1 b/man/man1/setfacl.1
+index 1ccaa11..cc826df 100644
+--- a/man/man1/setfacl.1
++++ b/man/man1/setfacl.1
+@@ -130,7 +130,6 @@ This option cannot be mixed with `\-\-restore'.
+ .TP 4
+ .I \-P, \-\-physical
+ Physical walk, do not follow symbolic links to directories.
+-This also skips symbolic link arguments.
+ Only effective in combination with \-R.
+ This option cannot be mixed with `\-\-restore'.
+ .TP 4
+diff --git a/tools/do_set.c b/tools/do_set.c
+index a958ede..2ff533c 100644
+--- a/tools/do_set.c
++++ b/tools/do_set.c
+@@ -31,13 +31,14 @@
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <unistd.h>
++#include <fcntl.h>
+ #include <dirent.h>
+ #include <ftw.h>
+ #include "misc.h"
+ #include "sequence.h"
+ #include "do_set.h"
+ #include "parse.h"
+-#include "old_walk_tree.h"
++#include "walk_tree.h"
+ 
+ 
+ extern const char *progname;
+@@ -124,7 +125,7 @@ clone_entry(
+ void
+ print_test(
+ 	FILE *file,
+-	const char *path_p,
++	const char *fullname,
+ 	const struct stat *st,
+ 	const acl_t acl,
+ 	const acl_t default_acl)
+@@ -134,7 +135,7 @@ print_test(
+ 	acl_text = acl_to_any_text(acl, NULL, ',', TEXT_ABBREVIATE);
+ 	default_acl_text =
+ 		acl_to_any_text(default_acl, "d:", ',', TEXT_ABBREVIATE);
+-	fprintf(file, "%s: %s,%s\n", path_p,
++	fprintf(file, "%s: %s,%s\n", fullname,
+ 		acl_text ? acl_text : "*",
+ 		default_acl_text ? default_acl_text : "*");
+ 	acl_free(acl_text);
+@@ -167,7 +168,9 @@ set_perm(
+ 
+ static int
+ retrieve_acl(
+-	const char *path_p,
++	int dirfd,
++	const char *pathname,
++	int at_flags,
+ 	acl_type_t type,
+ 	const struct stat *st,
+ 	acl_t *old_acl,
+@@ -177,7 +180,7 @@ retrieve_acl(
+ 		return 0;
+ 	*acl = NULL;
+ 	if (type == ACL_TYPE_ACCESS || S_ISDIR(st->st_mode)) {
+-		*old_acl = acl_get_file(path_p, type);
++		*old_acl = acl_get_file_at(dirfd, pathname, at_flags, type);
+ 		if (*old_acl == NULL && (errno == ENOSYS || errno == ENOTSUP)) {
+ 			if (type == ACL_TYPE_DEFAULT)
+ 				*old_acl = acl_init(0);
+@@ -251,18 +254,23 @@ remove_extended_entries(
+ 
+ 
+ #define RETRIEVE_ACL(type) do { \
+-	error = retrieve_acl(path_p, type, st, old_xacl, xacl); \
++	error = retrieve_acl(dirfd, pathname, at_flags, type, &st, \
++			     old_xacl, xacl); \
+ 	if (error) \
+ 		goto fail; \
+ 	} while(0)
+ 
+ int
+ do_set(
+-	const char *path_p,
+-	const struct stat *st,
+-	int walk_flags,
++	int dirfd,
++	const char *dirname,
++	const char *pathname,
++	unsigned char dirtype,
++	enum walk_flags walk_flags,
+ 	void *arg)
+ {
++	static char *__fullname;
++	const char *fullname;
+ 	struct do_set_args *args = arg;
+ 	acl_t old_acl = NULL, old_default_acl = NULL;
+ 	acl_t acl = NULL, default_acl = NULL;
+@@ -274,9 +282,23 @@ do_set(
+ 	char *acl_text;
+ 	int acl_modified = 0, default_acl_modified = 0;
+ 	int acl_mask_provided = 0, default_acl_mask_provided = 0;
++	struct stat st;
++	int at_flags;
++
++	if (*dirname) {
++		free(__fullname);
++		__fullname = NULL;
++		if (asprintf(&__fullname, "%s%s", dirname, pathname) == -1) {
++			fprintf(stderr, "%s: %s", progname, strerror(errno));
++			return 1;
++		}
++		fullname = __fullname;
++	} else
++		fullname = pathname;
+ 
+ 	if (walk_flags & WALK_TREE_FAILED) {
+-		fprintf(stderr, "%s: %s: %s\n", progname, path_p, strerror(errno));
++		fprintf(stderr, "%s: %s: %s\n", progname, fullname,
++			strerror(errno));
+ 		return 1;
+ 	}
+ 
+@@ -285,11 +307,23 @@ do_set(
+ 	 * skip symlinks altogether, and when doing a half-logical walk, we
+ 	 * skip all non-toplevel symlinks. 
+ 	 */
+-	if ((walk_flags & WALK_TREE_SYMLINK) &&
+-	    ((walk_flags & WALK_TREE_PHYSICAL) ||
+-	     !(walk_flags & (WALK_TREE_TOPLEVEL | WALK_TREE_LOGICAL))))
++
++	at_flags = AT_SYMLINK_NOFOLLOW;
++	if ((walk_flags & WALK_TREE_LOGICAL) ||
++	    ((walk_flags & WALK_TREE_TOPLEVEL) &&
++	     !(walk_flags & WALK_TREE_PHYSICAL)))
++		at_flags = 0;
++
++	if (dirtype == DT_LNK && (at_flags & AT_SYMLINK_NOFOLLOW))
+ 		return 0;
+ 
++	if (fstatat(dirfd, pathname, &st, at_flags) != 0)
++		goto fail;
++	if (S_ISLNK(st.st_mode)) {
++		errno = ELOOP;
++		goto fail;
++	}
++
+ 	/* Execute the commands in seq (read ACLs on demand) */
+ 	error = seq_get_cmd(args->seq, SEQ_FIRST_CMD, &cmd);
+ 	if (error == 0)
+@@ -316,7 +350,7 @@ do_set(
+ 		/* Check for `X', and replace with `x' as appropriate. */
+ 		if (perm & CMD_PERM_COND_EXECUTE) {
+ 			perm &= ~CMD_PERM_COND_EXECUTE;
+-			if (S_ISDIR(st->st_mode) || has_execute_perms(*xacl))
++			if (S_ISDIR(st.st_mode) || has_execute_perms(*xacl))
+ 				perm |= CMD_PERM_EXECUTE;
+ 		}
+ 
+@@ -407,8 +441,9 @@ do_set(
+ 		if (error > 0) {
+ 			acl_text = acl_to_any_text(acl, NULL, ',', 0);
+ 			fprintf(stderr, _("%s: %s: Malformed access ACL "
+-				"`%s': %s at entry %d\n"), progname, path_p,
+-				acl_text, acl_error(error), which_entry+1);
++				"`%s': %s at entry %d\n"), progname,
++				fullname, acl_text, acl_error(error),
++				which_entry+1);
+ 			acl_free(acl_text);
+ 			errors++;
+ 			goto cleanup;
+@@ -435,7 +470,7 @@ do_set(
+ 			acl_text = acl_to_any_text(default_acl, NULL, ',', 0);
+ 			fprintf(stderr, _("%s: %s: Malformed default ACL "
+ 			                  "`%s': %s at entry %d\n"),
+-				progname, path_p, acl_text,
++				progname, fullname, acl_text,
+ 				acl_error(error), which_entry+1);
+ 			acl_free(acl_text);
+ 			errors++;
+@@ -444,7 +479,7 @@ do_set(
+ 	}
+ 
+ 	/* Only directories can have default ACLs */
+-	if (default_acl && !S_ISDIR(st->st_mode) && (walk_flags & WALK_TREE_RECURSIVE)) {
++	if (default_acl && !S_ISDIR(st.st_mode) && (walk_flags & WALK_TREE_RECURSIVE)) {
+ 		/* In recursive mode, ignore default ACLs for files */
+ 		acl_free(default_acl);
+ 		default_acl = NULL;
+@@ -463,7 +498,7 @@ do_set(
+ 
+ 	/* update the file system */
+ 	if (opt_test) {
+-		print_test(stdout, path_p, st,
++		print_test(stdout, fullname, &st,
+ 		           acl, default_acl);
+ 		goto cleanup;
+ 	}
+@@ -473,17 +508,15 @@ do_set(
+ 
+ 		equiv_mode = acl_equiv_mode(acl, &mode);
+ 
+-		if (acl_set_file(path_p, ACL_TYPE_ACCESS, acl) != 0) {
++		if (acl_set_file_at(dirfd, pathname, at_flags, ACL_TYPE_ACCESS,
++				    acl) != 0) {
+ 			if (errno == ENOSYS || errno == ENOTSUP) {
+ 				if (equiv_mode != 0)
+ 					goto fail;
+ 				else {
+-					struct stat st;
+-
+-					if (stat(path_p, &st) != 0)
+-						goto fail;
+ 					mode |= st.st_mode & 07000;
+-					if (chmod(path_p, mode) != 0)
++					if (fchmodat(dirfd, pathname, mode,
++						     at_flags) != 0)
+ 						goto fail;
+ 				}
+ 			} else
+@@ -492,21 +525,23 @@ do_set(
+ 		args->mode = mode;
+ 	}
+ 	if (default_acl) {
+-		if (S_ISDIR(st->st_mode)) {
++		if (S_ISDIR(st.st_mode)) {
+ 			if (acl_entries(default_acl) == 0) {
+-				if (acl_delete_def_file(path_p) != 0 &&
++				if (acl_delete_def_file_at(dirfd, pathname,
++							   at_flags) != 0 &&
+ 				    errno != ENOSYS && errno != ENOTSUP)
+ 					goto fail;
+ 			} else {
+-				if (acl_set_file(path_p, ACL_TYPE_DEFAULT,
+-						 default_acl) != 0)
++				if (acl_set_file_at(dirfd, pathname, at_flags,
++						    ACL_TYPE_DEFAULT,
++						    default_acl) != 0)
+ 					goto fail;
+ 			}
+ 		} else {
+ 			if (acl_entries(default_acl) != 0) {
+ 				fprintf(stderr, _("%s: %s: Only directories "
+ 						"can have default ACLs\n"),
+-					progname, path_p);
++					progname, fullname);
+ 				errors++;
+ 				goto cleanup;
+ 			}
+@@ -527,7 +562,8 @@ cleanup:
+ 	return errors;
+ 	
+ fail:
+-	fprintf(stderr, "%s: %s: %s\n", progname, path_p, strerror(errno));
++	fprintf(stderr, "%s: %s: %s\n", progname, fullname,
++		strerror(errno));
+ 	errors++;
+ 	goto cleanup;
+ }
+diff --git a/tools/do_set.h b/tools/do_set.h
+index 15566f3..460e369 100644
+--- a/tools/do_set.h
++++ b/tools/do_set.h
+@@ -23,13 +23,14 @@
+ #define __DO_SET_H
+ 
+ #include "sequence.h"
++#include "walk_tree.h"
+ 
+ struct do_set_args {
+ 	seq_t seq;
+ 	mode_t mode;
+ };
+ 
+-extern int do_set(const char *path_p, const struct stat *stat_p, int flags,
+-		  void *arg);
++extern int do_set(int dirfd, const char *dirname, const char *pathname,
++		  unsigned char dirtype, enum walk_flags flags, void *arg);
+ 
+ #endif  /* __DO_SET_H */
+diff --git a/tools/setfacl.c b/tools/setfacl.c
+index cb05975..6c504a7 100644
+--- a/tools/setfacl.c
++++ b/tools/setfacl.c
+@@ -24,6 +24,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <unistd.h>
++#include <fcntl.h>
+ #include <errno.h>
+ #include <sys/stat.h>
+ #include <dirent.h>
+@@ -33,7 +34,7 @@
+ #include "sequence.h"
+ #include "parse.h"
+ #include "do_set.h"
+-#include "old_walk_tree.h"
++#include "walk_tree.h"
+ 
+ #define POSIXLY_CORRECT_STR "POSIXLY_CORRECT"
+ 
+@@ -74,7 +75,7 @@ static const struct option long_options[] = {
+ const char *progname;
+ const char *cmd_line_options, *cmd_line_spec;
+ 
+-int walk_flags = WALK_TREE_DEREFERENCE_TOPLEVEL;
++enum walk_flags walk_flags = 0;
+ int opt_recalculate;  /* recalculate mask entry (0=default, 1=yes, -1=no) */
+ int opt_promote;  /* promote access ACL to default ACL */
+ int opt_test;  /* do not write to the file system.
+@@ -184,7 +185,7 @@ restore(
+ 		}
+ 
+ 		args.mode = 0;
+-		error = do_set(path_p, &st, 0, &args);
++		error = do_set(AT_FDCWD, "", path_p, DT_UNKNOWN, WALK_TREE_PHYSICAL, &args);
+ 		if (error != 0) {
+ 			status = 1;
+ 			goto resume;
+@@ -310,14 +311,14 @@ int next_file(const char *arg, seq_t seq)
+ 
+ 	if (strcmp(arg, "-") == 0) {
+ 		while ((line = __acl_next_line(stdin)))
+-			errors = old_walk_tree(line, walk_flags, 0, do_set, &args);
++			errors = walk_tree(line, walk_flags, do_set, &args);
+ 		if (!feof(stdin)) {
+ 			fprintf(stderr, _("%s: Standard input: %s\n"),
+ 				progname, strerror(errno));
+ 			errors = 1;
+ 		}
+ 	} else {
+-		errors = old_walk_tree(arg, walk_flags, 0, do_set, &args);
++		errors = walk_tree(arg, walk_flags, do_set, &args);
+ 	}
+ 	return errors ? 1 : 0;
+ }
+@@ -590,14 +591,13 @@ int main(int argc, char *argv[])
+ 				break;
+ 
+ 			case 'L':  /* follow symlinks */
+-				walk_flags |= WALK_TREE_LOGICAL | WALK_TREE_DEREFERENCE;
++				walk_flags |= WALK_TREE_LOGICAL;
+ 				walk_flags &= ~WALK_TREE_PHYSICAL;
+ 				break;
+ 
+ 			case 'P':  /* do not follow symlinks */
+ 				walk_flags |= WALK_TREE_PHYSICAL;
+-				walk_flags &= ~(WALK_TREE_LOGICAL | WALK_TREE_DEREFERENCE |
+-						WALK_TREE_DEREFERENCE_TOPLEVEL);
++				walk_flags &= ~WALK_TREE_LOGICAL;
+ 				break;
+ 
+ 			case 't':  /* test mode */
+@@ -614,7 +614,7 @@ int main(int argc, char *argv[])
+ 				status = 0;
+ 				goto cleanup;
+ 
+-			case ':':  /* option missing */
++			case ':':  /* argument missing */
+ 			case '?':  /* unknown option */
+ 			default:
+ 				goto synopsis;
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/attr/acl/CVE-2026-54370_p3.patch b/meta/recipes-support/attr/acl/CVE-2026-54370_p3.patch
new file mode 100644
index 00000000000..3857d016ae5
--- /dev/null
+++ b/meta/recipes-support/attr/acl/CVE-2026-54370_p3.patch
@@ -0,0 +1,603 @@
+From 8949b1ccf74caeef8f8d6134bebd0e2a98117ff0 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruenba@redhat.com>
+Date: Sat, 20 Jun 2026 19:35:48 +0200
+Subject: [PATCH] harden setfacl --restore
+
+In setfacl --restore, use functions that support the AT_SYMLINK_NOFOLLOW flag
+(stat() -> fstatat(), chown() -> fchownat(), chmod() -> fchmodat()).  Allow the
+-P (--physical) option to be used together with --restore.
+
+In physical restore mode, use openat2(RESOLVE_NO_SYMLINKS) for resolving the
+pathname components leading up to the last one, and use the AT_SYMLINK_NOFOLLOW
+flag on the last pathname component.
+
+On systems where openat2() *is* available, warn when attempting a non-physical
+restore as that can be dangerous.  The purpose of this warning is to cause
+users to switch to physical restore mode over time.
+
+This warning can be disabled with the --disable-unsafe-restore-warnings
+configure option.
+
+On systems where openat2() *is not* available, do not warn when attempting a
+non-physical restore; this is to preserve the historic behavior when building
+this package on older systems.  On those systems, a physical restore will fail
+with ENOSYS ("Function not implemented").
+
+Fixes: CVE-2026-54370 ("acl < 2.4.0 TOCTOU Symlink Traversal via getfacl/setfacl")
+
+CVE: CVE-2026-54370
+Upstream-Status: Backport [https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=54e14e9bc545f505b379d0792a2748d9baf88700]
+
+Backport Changes:
+- Retain .test names used by the ACL 2.3.2 test harness.
+- Include the upstream restore test absent from ACL 2.3.2.
+- Name it restore-symlinks.test to avoid root ptest exclusions.
+- Rebase restore logic onto ACL 2.3.2's existing implementation.
+
+Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
+(cherry picked from commit 54e14e9bc545f505b379d0792a2748d9baf88700)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ configure.ac               |   9 ++
+ man/man1/setfacl.1         |  16 +--
+ test/Makemodule.am         |   9 +-
+ test/restore-symlinks.test |  26 +++++
+ test/root/restore.test     |   2 +-
+ test/sbits-restore.test    |   2 +-
+ test/utf8-filenames.test   |   2 +-
+ tools/setfacl.c            | 211 +++++++++++++++++++++++++++++++------
+ 8 files changed, 231 insertions(+), 46 deletions(-)
+ create mode 100644 test/restore-symlinks.test
+
+diff --git a/configure.ac b/configure.ac
+index c3353f6..3632345 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -48,6 +48,15 @@ AM_CONDITIONAL([HAVE_OPENAT2], [test "x$ac_cv_func_openat2" = xyes])
+ AS_IF([test "x$use_openat2" = xyes],
+       [AC_DEFINE([USE_OPENAT2], [1], [Define to use openat2 syscall])])
+ 
++AC_ARG_ENABLE([unsafe-restore-warnings],
++	[AS_HELP_STRING([--disable-unsafe-restore-warnings], [Disable warnings about unsafe restore operations])])
++if test "x$use_openat2" = xno; then
++	enable_unsafe_restore_warnings=no
++fi
++AM_CONDITIONAL([UNSAFE_RESTORE_WARNINGS], [test "x$enable_unsafe_restore_warnings" != xno])
++AS_IF([test "x$enable_unsafe_restore_warnings" != xno],
++      [AC_DEFINE([UNSAFE_RESTORE_WARNINGS], [1], [Define to enable unsafe restore warnings])])
++
+ AC_CHECK_FUNCS(getxattrat setxattrat listxattrat removexattrat)
+ AM_CONDITIONAL([NEED_XATTRAT],
+ 	       [test "x$ac_cv_func_getxattrat" = xno -o \
+diff --git a/man/man1/setfacl.1 b/man/man1/setfacl.1
+index cc826df..c04eb3a 100644
+--- a/man/man1/setfacl.1
++++ b/man/man1/setfacl.1
+@@ -30,7 +30,7 @@ setfacl \- set file access control lists
+ [\-bkndRLPvh] [{\-m|\-x} acl_spec] [{\-M|\-X} acl_file] file ...
+ 
+ .B setfacl
+-\-\-restore={file|-}
++[\-P] \-\-restore={file|-}
+ 
+ .SH DESCRIPTION
+ This utility sets Access Control Lists (ACLs) of files and directories.
+@@ -113,25 +113,27 @@ of a complete directory subtree are restored using this mechanism. If the input
+ contains owner comments or group comments, setfacl attempts to restore the
+ owner and owning group. If the input contains flags comments (which define the setuid,
+ setgid, and sticky bits), setfacl sets those three bits accordingly; otherwise,
+-it clears them. This option cannot be mixed with other options except `\-\-test'.
+-If the file specified is '\fB-\fP', then it will be read from standard input.
++it clears them. This option cannot be combined with any other options except
++`\-P' and `\-\-test'.  When combined with `\-P', setfacl will not follow
++symlinks when resolving pathnames.  If the file specified is '\fB-\fP', then it
++will be read from standard input.
+ .TP 4
+ .I \-\-test
+ Test mode. Instead of changing the ACLs of any files, the resulting ACLs are listed.
+ .TP 4
+ .I \-R, \-\-recursive
+-Apply operations to all files and directories recursively. This option cannot be mixed with `\-\-restore'.
++Apply operations to all files and directories recursively. This option cannot
++be combined with `\-\-restore'.
+ .TP 4
+ .I \-L, \-\-logical
+ Logical walk, follow symbolic links to directories. The default behavior is to follow
+ symbolic link arguments, and skip symbolic links encountered in subdirectories.
+ Only effective in combination with \-R.
+-This option cannot be mixed with `\-\-restore'.
++This option cannot be combined with `\-\-restore'.
+ .TP 4
+ .I \-P, \-\-physical
+ Physical walk, do not follow symbolic links to directories.
+-Only effective in combination with \-R.
+-This option cannot be mixed with `\-\-restore'.
++Only effective in combination with \-R or \-\-restore.
+ .TP 4
+ .I \-v, \-\-version
+ Print the version of setfacl and exit.
+diff --git a/test/Makemodule.am b/test/Makemodule.am
+index e1d715d..89497af 100644
+--- a/test/Makemodule.am
++++ b/test/Makemodule.am
+@@ -8,15 +8,20 @@ TESTS = \
+ 	test/getfacl-recursive.test \
+ 	test/malformed-restore.test \
+ 	test/misc.test \
+-	test/sbits-restore.test \
+ 	test/setfacl-X.test \
+-	test/utf8-filenames.test \
+ 	test/root/getfacl.test \
+ 	test/root/permissions.test \
+ 	test/root/restore.test \
+ 	test/root/setfacl.test \
+ 	$(XFAIL_TESTS)
+ 
++if UNSAFE_RESTORE_WARNINGS
++TESTS += \
++	test/restore-symlinks.test \
++	test/sbits-restore.test \
++	test/utf8-filenames.test
++endif
++
+ EXTRA_DIST += \
+ 	test/make-tree \
+ 	test/malformed-restore-double-owner.acl \
+diff --git a/test/restore-symlinks.test b/test/restore-symlinks.test
+new file mode 100644
+index 0000000..9eb055e
+--- /dev/null
++++ b/test/restore-symlinks.test
+@@ -0,0 +1,26 @@
++        $ mkdir d
++        $ touch d/f
++        $ ln -s f d/l
++        $ getfacl -RP d > physical
++        $ getfacl -RL d > logical
++
++Restoring a physical backup should work:
++
++        $ setfacl --restore=physical --physical
++
++Restoring a backup non-physically should produce the following warning:
++
++        $ setfacl --restore=physical
++	> Warning: option --restore=file is unsafe without option -P (--physical) as it traverses symbolic links in pathnames
++
++
++Restoring a logical backup can fail:
++
++        $ setfacl --restore=logical --physical
++        > setfacl: d/l: Too many levels of symbolic links
++
++Malformed restore file
++
++	$ echo "# owner: root" > dump
++	$ setfacl --restore=dump 2>&1
++	>setfacl: dump: No filename found in line 0, aborting
+diff --git a/test/root/restore.test b/test/root/restore.test
+index c85097c..504a525 100644
+--- a/test/root/restore.test
++++ b/test/root/restore.test
+@@ -20,7 +20,7 @@ Cry immediately if we are not running as root.
+ 	>
+ 	$ chown bin passwd
+ 	$ chmod u+s passwd
+-	$ setfacl --restore passwd.acl
++	$ setfacl --restore passwd.acl --physical
+ 	$ ls -dl passwd | awk '{print $1 " " $3 " " $4}' | sed 's/\\.//g'
+ 	> -rwsr-xr-x root root
+ 
+diff --git a/test/sbits-restore.test b/test/sbits-restore.test
+index 5899b0a..3d048ea 100644
+--- a/test/sbits-restore.test
++++ b/test/sbits-restore.test
+@@ -12,7 +12,7 @@ Ensure setting of SUID/SGID/sticky via --restore works
+ 	$ mkdir d
+ 	$ touch d/g
+ 	$ touch d/u
+-	$ setfacl --restore d.acl
++	$ setfacl --restore=d.acl --physical
+ 	$ ls -dl d | awk '{print $1}' | sed 's/\\.$//g'
+ 	> drwxr-xr-t
+ 	$ ls -dl d/u | awk '{print $1}' | sed 's/\\.$//g'
+diff --git a/test/utf8-filenames.test b/test/utf8-filenames.test
+index dae0308..ad5b9dc 100644
+--- a/test/utf8-filenames.test
++++ b/test/utf8-filenames.test
+@@ -9,6 +9,6 @@ NAME_MAX.
+        $ mkdir -p $UPATH/$UPATH/$UPATH
+        $ touch $UPATH/$UPATH/$UPATH/$UPATH
+        $ getfacl $UPATH/$UPATH/$UPATH/$UPATH > utf8-filenames.acl
+-       $ setfacl  --restore=utf8-filenames.acl
++       $ setfacl  --restore=utf8-filenames.acl --physical
+        $ rm -R $UPATH
+        $ rm utf8-filenames.acl
+diff --git a/tools/setfacl.c b/tools/setfacl.c
+index 6c504a7..070cb73 100644
+--- a/tools/setfacl.c
++++ b/tools/setfacl.c
+@@ -35,16 +35,19 @@
+ #include "parse.h"
+ #include "do_set.h"
+ #include "walk_tree.h"
++#include "openat2.h"
++#include "fchmodat_compat.h"
+ 
+ #define POSIXLY_CORRECT_STR "POSIXLY_CORRECT"
+ 
+ /* '-' stands for `process non-option arguments in loop' */
+ #if !POSIXLY_CORRECT
+ #  define CMD_LINE_OPTIONS "-:bkndvhm:M:x:X:RLP"
+-#  define CMD_LINE_SPEC "[-bkndRLP] { -m|-M|-x|-X ... } file ..."
++#  define CMD_LINE_SPEC1 "[-bkndRLP] { -m|-M|-x|-X ... } file ..."
++#  define CMD_LINE_SPEC2 "[-P] --restore=file"
+ #endif
+ #define POSIXLY_CMD_LINE_OPTIONS "-:bkndvhm:M:x:X:"
+-#define POSIXLY_CMD_LINE_SPEC "[-bknd] {-m|-M|-x|-X ... } file ..."
++#define POSIXLY_CMD_LINE_SPEC1 "[-bknd] {-m|-M|-x|-X ... } file ..."
+ 
+ static const struct option long_options[] = {
+ #if !POSIXLY_CORRECT
+@@ -117,7 +120,8 @@ has_any_of_type(
+ int
+ restore(
+ 	FILE *file,
+-	const char *filename)
++	const char *filename,
++	enum walk_flags walk_flags)
+ {
+ 	char *path_p;
+ 	struct stat st;
+@@ -128,6 +132,12 @@ restore(
+ 	int lineno = 0, backup_line;
+ 	int error, status = 0;
+ 	int chmod_required = 0;
++	int dirfd = -1;
++	char *dirname = NULL, *pathname;
++	int at_flags = (walk_flags & WALK_TREE_PHYSICAL) ? AT_SYMLINK_NOFOLLOW : 0;
++#ifdef UNSAFE_RESTORE_WARNINGS
++	static int non_physical_restore_warning;
++#endif
+ 
+ 	memset(&st, 0, sizeof(st));
+ 
+@@ -177,15 +187,75 @@ restore(
+ 			goto getout;
+ 		}
+ 
+-		error = stat(path_p, &st);
+-		if (opt_test && error != 0) {
++#ifdef UNSAFE_RESTORE_WARNINGS
++		if (!(walk_flags & WALK_TREE_PHYSICAL) &&
++		    !non_physical_restore_warning) {
++			fprintf(stderr,
++				_("Warning: option --restore=file is unsafe "
++				  "without option -P (--physical) as it "
++				  "traverses symbolic links in pathnames\n"));
++			non_physical_restore_warning = 1;
++		}
++#endif
++
++		/* find the last pathname component */
++		pathname = path_p + strlen(path_p);
++		while (pathname > path_p && pathname[-1] == '/')
++			pathname--;
++		while (pathname > path_p && pathname[-1] != '/')
++			pathname--;
++
++		if ((walk_flags & WALK_TREE_PHYSICAL) && pathname != path_p) {
++			dirname = malloc(pathname - path_p + 1);
++			if (dirname == NULL) {
++				fprintf(stderr, "%s: %s\n",
++					progname, strerror(errno));
++				status = 1;
++				goto getout;
++			}
++			memcpy(dirname, path_p, pathname - path_p);
++			dirname[pathname - path_p] = '\0';
++#ifdef USE_OPENAT2
++			struct open_how how = {
++				.flags = O_PATH | O_DIRECTORY,
++				.resolve = RESOLVE_NO_SYMLINKS,
++			};
++			dirfd = openat2(AT_FDCWD, dirname, &how, sizeof(how));
++#else
++			errno = ENOSYS;
++			dirfd = -1;
++#endif
++			if (dirfd == -1) {
++				fprintf(stderr,
++					_("%s: lookup of directory %s without "
++					  "following symlinks: %s\n"),
++					progname,
++					xquote(dirname, "\n\r"),
++					strerror(errno));
++				status = 1;
++				goto resume;
++			}
++		} else {
++			dirfd = AT_FDCWD;
++			dirname = "";
++			pathname = path_p;
++		}
++
++		error = fstatat(dirfd, pathname, &st, at_flags);
++		if (error == 0 && S_ISLNK(st.st_mode)) {
++			errno = ELOOP;
++			error = -1;
++		}
++		if (error != 0) {
+ 			fprintf(stderr, "%s: %s: %s\n", progname,
+ 				xquote(path_p, "\n\r"), strerror(errno));
+ 			status = 1;
++			goto resume;
+ 		}
+ 
+ 		args.mode = 0;
+-		error = do_set(AT_FDCWD, "", path_p, DT_UNKNOWN, WALK_TREE_PHYSICAL, &args);
++		error = do_set(dirfd, dirname, pathname, DT_UNKNOWN,
++			       walk_flags | WALK_TREE_TOPLEVEL, &args);
+ 		if (error != 0) {
+ 			status = 1;
+ 			goto resume;
+@@ -201,7 +271,8 @@ restore(
+ 			st.st_gid = -1;
+ 		if (!opt_test &&
+ 		    (st.st_uid != -1 || st.st_gid != -1)) {
+-			if (chown(path_p, st.st_uid, st.st_gid) != 0) {
++			if (fchownat(dirfd, pathname, st.st_uid, st.st_gid,
++				     at_flags) != 0) {
+ 				fprintf(stderr, _("%s: %s: Cannot change "
+ 					          "owner/group: %s\n"),
+ 					progname, xquote(path_p, "\n\r"),
+@@ -220,7 +291,8 @@ restore(
+ 			if (!args.mode)
+ 				args.mode = st.st_mode;
+ 			args.mode &= (S_IRWXU | S_IRWXG | S_IRWXO);
+-			if (chmod(path_p, flags | args.mode) != 0) {
++			if (fchmodat(dirfd, pathname, flags | args.mode,
++				     at_flags) != 0) {
+ 				fprintf(stderr, _("%s: %s: Cannot change "
+ 					          "mode: %s\n"),
+ 					progname, xquote(path_p, "\n\r"),
+@@ -229,6 +301,14 @@ restore(
+ 			}
+ 		}
+ resume:
++		if (dirfd != -1 && dirfd != AT_FDCWD) {
++			close(dirfd);
++			dirfd = -1;
++		}
++		if (dirname && *dirname) {
++			free(dirname);
++			dirname = NULL;
++		}
+ 		if (path_p) {
+ 			free(path_p);
+ 			path_p = NULL;
+@@ -267,6 +347,12 @@ void help(void)
+ 		progname, VERSION);
+ 	printf(_("Usage: %s %s\n"),
+ 		progname, cmd_line_spec);
++#if !POSIXLY_CORRECT
++	if (!posixly_correct) {
++		printf("       %s %s\n",
++		      progname, CMD_LINE_SPEC2);
++	}
++#endif
+ 	printf(_(
+ "  -m, --modify=acl        modify the current ACL(s) of file(s)\n"
+ "  -M, --modify-file=file  read ACL entries to modify from file\n"
+@@ -330,6 +416,9 @@ int next_file(const char *arg, seq_t seq)
+ 
+ int main(int argc, char *argv[])
+ {
++	enum { UNDEFINED_MODE, SET_MODE, RESTORE_MODE } mode = UNDEFINED_MODE;
++	char **restore_args = NULL;
++	int opt_restore_count = 0;
+ 	int opt;
+ 	int saw_files = 0;
+ 	int status = 0, status2;
+@@ -344,16 +433,16 @@ int main(int argc, char *argv[])
+ 
+ #if POSIXLY_CORRECT
+ 	cmd_line_options = POSIXLY_CMD_LINE_OPTIONS;
+-	cmd_line_spec = _(POSIXLY_CMD_LINE_SPEC);
++	cmd_line_spec = POSIXLY_CMD_LINE_SPEC1;
+ #else
+ 	if (getenv(POSIXLY_CORRECT_STR))
+ 		posixly_correct = 1;
+ 	if (!posixly_correct) {
+ 		cmd_line_options = CMD_LINE_OPTIONS;
+-		cmd_line_spec = _(CMD_LINE_SPEC);
++		cmd_line_spec = CMD_LINE_SPEC1;
+ 	} else {
+ 		cmd_line_options = POSIXLY_CMD_LINE_OPTIONS;
+-		cmd_line_spec = _(POSIXLY_CMD_LINE_SPEC);
++		cmd_line_spec = POSIXLY_CMD_LINE_SPEC1;
+ 	}
+ #endif
+ 
+@@ -383,6 +472,9 @@ int main(int argc, char *argv[])
+ 
+ 		switch (opt) {
+ 			case 'b':  /* remove all extended entries */
++				if (mode == RESTORE_MODE)
++					goto synopsis;
++				mode = SET_MODE;
+ 				if (seq_append_cmd(seq, CMD_REMOVE_EXTENDED_ACL,
+ 				                        ACL_TYPE_ACCESS) ||
+ 				    seq_append_cmd(seq, CMD_REMOVE_ACL,
+@@ -391,20 +483,32 @@ int main(int argc, char *argv[])
+ 				break;
+ 
+ 			case 'k':  /* remove default ACL */
++				if (mode == RESTORE_MODE)
++					goto synopsis;
++				mode = SET_MODE;
+ 				if (seq_append_cmd(seq, CMD_REMOVE_ACL,
+ 				                        ACL_TYPE_DEFAULT))
+ 					ERRNO_ERROR(1);
+ 				break;
+ 
+ 			case 'n':  /* do not recalculate mask */
++				if (mode == RESTORE_MODE)
++					goto synopsis;
++				mode = SET_MODE;
+ 				opt_recalculate = -1;
+ 				break;
+ 
+ 			case 'r':  /* force recalculate mask */
++				if (mode == RESTORE_MODE)
++					goto synopsis;
++				mode = SET_MODE;
+ 				opt_recalculate = 1;
+ 				break;
+ 
+ 			case 'd':  /*  operations apply to default ACL */
++				if (mode == RESTORE_MODE)
++					goto synopsis;
++				mode = SET_MODE;
+ 				opt_promote = 1;
+ 				break;
+ 
+@@ -440,6 +544,9 @@ int main(int argc, char *argv[])
+ 				goto set_modify_delete;
+ 
+ 			set_modify_delete:
++				if (mode == RESTORE_MODE)
++					goto synopsis;
++				mode = SET_MODE;
+ 				if (!posixly_correct)
+ 					parse_mode |= SEQ_PARSE_DEFAULT;
+ 				if (opt_promote)
+@@ -498,6 +605,9 @@ int main(int argc, char *argv[])
+ 				goto set_modify_delete_from_file;
+ 
+ 			set_modify_delete_from_file:
++				if (mode == RESTORE_MODE)
++					goto synopsis;
++				mode = SET_MODE;
+ 				if (!posixly_correct)
+ 					parse_mode |= SEQ_PARSE_DEFAULT;
+ 				if (opt_promote)
+@@ -551,6 +661,9 @@ int main(int argc, char *argv[])
+ 
+ 
+ 			case '\1':  /* file argument */
++				if (mode == RESTORE_MODE)
++					goto synopsis;
++				mode = SET_MODE;
+ 				if (seq_empty(seq))
+ 					goto synopsis;
+ 				saw_files = 1;
+@@ -561,36 +674,31 @@ int main(int argc, char *argv[])
+ 				break;
+ 
+ 			case 'B':  /* restore ACL backup */
+-				saw_files = 1;
+-
+-				if (strcmp(optarg, "-") == 0)
+-					file = stdin;
+-				else {
+-					file = fopen(optarg, "r");
+-					if (file == NULL) {
+-						fprintf(stderr, "%s: %s: %s\n",
+-							progname,
+-							xquote(optarg, "\n\r"),
+-							strerror(errno));
+-						status = 2;
+-						goto cleanup;
+-					}
+-				}
+-
+-				status = restore(file,
+-				               (file == stdin) ? NULL : optarg);
+-
+-				if (file != stdin)
+-					fclose(file);
+-				if (status != 0)
++				if (mode == SET_MODE)
++					goto synopsis;
++				mode = RESTORE_MODE;
++				opt_restore_count++;
++				restore_args = realloc(restore_args,
++					opt_restore_count * sizeof(*restore_args));
++				if (!restore_args) {
++					fprintf(stderr, "%s: %s\n", progname, strerror(errno));
++					status = 1;
+ 					goto cleanup;
++				}
++				restore_args[opt_restore_count - 1] = optarg;
+ 				break;
+ 
+ 			case 'R':  /* recursive */
++				if (mode == RESTORE_MODE)
++					goto synopsis;
++				mode = SET_MODE;
+ 				walk_flags |= WALK_TREE_RECURSIVE;
+ 				break;
+ 
+ 			case 'L':  /* follow symlinks */
++				if (mode == RESTORE_MODE)
++					goto synopsis;
++				mode = SET_MODE;
+ 				walk_flags |= WALK_TREE_LOGICAL;
+ 				walk_flags &= ~WALK_TREE_PHYSICAL;
+ 				break;
+@@ -636,7 +744,42 @@ int main(int argc, char *argv[])
+ 				seq_delete_cmd(seq, seq_remove_default_acl_cmd);
+ 		}
+ 	}
++
++	if (mode == RESTORE_MODE) {
++		if (walk_flags & WALK_TREE_LOGICAL)
++			goto synopsis;
++
++		for (opt = 0; opt < opt_restore_count; opt++) {
++			if (strcmp(restore_args[opt], "-") == 0)
++				file = stdin;
++			else {
++				file = fopen(restore_args[opt], "r");
++				if (file == NULL) {
++					fprintf(stderr, "%s: %s: %s\n",
++						progname,
++						xquote(restore_args[opt], "\n\r"),
++						strerror(errno));
++					status = 2;
++					goto cleanup;
++				}
++			}
++
++			status2 = restore(file,
++			               (file == stdin) ? NULL : restore_args[opt],
++			               walk_flags);
++
++			if (file != stdin)
++				fclose(file);
++			if (status == 0)
++				status = status2;
++		}
++		free(restore_args);
++	}
++
+ 	while (optind < argc) {
++		if (mode == RESTORE_MODE)
++			goto synopsis;
++		mode = SET_MODE;
+ 		if(!seq)
+ 			goto synopsis;
+ 		if (seq_empty(seq))
+@@ -647,7 +790,7 @@ int main(int argc, char *argv[])
+ 		if (status == 0)
+ 			status = status2;
+ 	}
+-	if (!saw_files)
++	if (mode == SET_MODE && !saw_files)
+ 		goto synopsis;
+ 
+ 	goto cleanup;
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/attr/acl/CVE-2026-54370_p4.patch b/meta/recipes-support/attr/acl/CVE-2026-54370_p4.patch
new file mode 100644
index 00000000000..8e7ce671d1e
--- /dev/null
+++ b/meta/recipes-support/attr/acl/CVE-2026-54370_p4.patch
@@ -0,0 +1,213 @@
+From b1a2f75859542ccef4afe60647af42fd9572bd31 Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruenba@redhat.com>
+Date: Mon, 8 Jun 2026 13:47:24 +0200
+Subject: [PATCH] harden chacl
+
+Harden chacl by making sure it doesn't follow any symbolic links other than
+the ones specified on the command line.  This is done by resolving pathnames
+relative to directory file descriptors and switching to symlink-safe functions
+(acl_get_file() -> acl_get_file_at(), acl_set_file() -> acl_set_file_at(),
+opendir() -> openat() + fdopendir()).
+
+Fixes: CVE-2026-54370 ("acl < 2.4.0 TOCTOU Symlink Traversal via getfacl/setfacl")
+
+CVE: CVE-2026-54370
+Upstream-Status: Backport [https://cgit.git.savannah.nongnu.org/cgit/acl.git/commit/?id=601cc884a548ae9e9d246ae749e54b3272e4b1d7]
+
+Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>
+(cherry picked from commit 601cc884a548ae9e9d246ae749e54b3272e4b1d7)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ tools/chacl.c | 108 +++++++++++++++++++++++++++++++++++---------------
+ 1 file changed, 77 insertions(+), 31 deletions(-)
+
+diff --git a/tools/chacl.c b/tools/chacl.c
+index 8fff875..3d57413 100644
+--- a/tools/chacl.c
++++ b/tools/chacl.c
+@@ -21,6 +21,7 @@
+ #include <stdlib.h>
+ #include <string.h>
+ #include <unistd.h>
++#include <fcntl.h>
+ #include <getopt.h>
+ #include <libgen.h>
+ #include <stdio.h>
+@@ -34,8 +35,10 @@
+ 
+ static int acl_delete_file (const char * path, acl_type_t type);
+ static int list_acl(char *file);
+-static int set_acl(acl_t acl, acl_t dacl, const char *fname);
+-static int walk_dir(acl_t acl, acl_t dacl, const char *fname);
++static int set_acl(acl_t acl, acl_t dacl, int dirfd, const char *dname,
++		   const char *fname, unsigned int depth);
++static int walk_dir(acl_t acl, acl_t dacl, int dirfd, const char *dname,
++		    const char *fname, unsigned int depth);
+ 
+ static char *program;
+ static int rflag;
+@@ -197,7 +200,7 @@ main(int argc, char *argv[])
+ 
+ 	/* place acls on files */
+ 	for (; optind < argc; optind++)
+-		failed += set_acl(acl, dacl, argv[optind]);
++		failed += set_acl(acl, dacl, AT_FDCWD, "", argv[optind], 0);
+ 
+ 	if (acl)
+ 		acl_free(acl);
+@@ -221,7 +224,8 @@ acl_delete_file(const char *path, acl_type_t type)
+ 		acl_entry_t entry;
+ 		acl_tag_t tag;
+ 
+-		acl = acl_get_file(path, ACL_TYPE_ACCESS);
++		acl = acl_get_file_at(AT_FDCWD, path, AT_SYMLINK_NOFOLLOW,
++				      ACL_TYPE_ACCESS);
+ 		if (!acl)
+ 			return -1;
+ 		error = acl_get_entry(acl, ACL_FIRST_ENTRY, &entry);
+@@ -237,9 +241,12 @@ acl_delete_file(const char *path, acl_type_t type)
+ 			error = acl_get_entry(acl, ACL_NEXT_ENTRY, &entry);
+ 		}
+ 		if (!error)
+-			error = acl_set_file(path, ACL_TYPE_ACCESS, acl);
++			error = acl_set_file_at(AT_FDCWD, path,
++						AT_SYMLINK_NOFOLLOW,
++						ACL_TYPE_ACCESS, acl);
+ 	} else
+-		error = acl_delete_def_file(path);
++		error = acl_delete_def_file_at(AT_FDCWD, path,
++					       AT_SYMLINK_NOFOLLOW);
+ 	return(error);
+ }
+ 
+@@ -292,63 +299,102 @@ list_acl(char *file)
+ }
+ 
+ static int
+-set_acl(acl_t acl, acl_t dacl, const char *fname)
++set_acl(acl_t acl, acl_t dacl, int dirfd, const char *dname, const char *fname,
++	unsigned int depth)
+ {
++	static char *aname;
+ 	int failed = 0;
+ 
++	if (aname) {
++		free(aname);
++		aname = NULL;
++	}
++	if (asprintf(&aname, "%s%s", dname, fname) == -1) {
++		fprintf(stderr, _("%s: malloc failed: %s\n"),
++			program, strerror(errno));
++		exit(1);
++	}
++
+ 	if (rflag)
+-		failed += walk_dir(acl, dacl, fname);
++		failed += walk_dir(acl, dacl, dirfd, dname, fname, depth);
+ 
+ 	/* set regular acl */
+-	if (acl && acl_set_file(fname, ACL_TYPE_ACCESS, acl) == -1) {
+-		fprintf(stderr, _("%s: cannot set access acl on \"%s\": %s\n"),
+-			program, fname, strerror(errno));
+-		failed++;
++	if (acl && acl_set_file_at(dirfd, fname, AT_SYMLINK_NOFOLLOW,
++				   ACL_TYPE_ACCESS, acl) == -1) {
++		int saved_errno = errno;
++		struct stat st;
++
++		if (!depth || errno != ENOTSUP ||
++		    fstatat(dirfd, fname, &st, AT_SYMLINK_NOFOLLOW) == -1 ||
++		    !S_ISLNK(st.st_mode)) {
++			fprintf(stderr, _("%s: cannot set access acl on \"%s\": %s\n"),
++				program, aname, strerror(saved_errno));
++			failed++;
++		}
+ 	}
+ 	/* set default acl */
+-	if (dacl && acl_set_file(fname, ACL_TYPE_DEFAULT, dacl) == -1) {
+-		fprintf(stderr, _("%s: cannot set default acl on \"%s\": %s\n"),
+-			program, fname, strerror(errno));
+-		failed++;
++	if (dacl && acl_set_file_at(dirfd, fname, AT_SYMLINK_NOFOLLOW,
++				    ACL_TYPE_DEFAULT, dacl) == -1) {
++		int saved_errno = errno;
++		struct stat st;
++
++		if (!depth || errno != ENOTSUP ||
++		    fstatat(dirfd, fname, &st, AT_SYMLINK_NOFOLLOW) == -1 ||
++		    !S_ISLNK(st.st_mode)) {
++			fprintf(stderr, _("%s: cannot set default acl on \"%s\": %s\n"),
++				program, aname, strerror(saved_errno));
++			failed++;
++		}
+ 	}
+ 
+ 	return(failed);
+ }
+ 
+ static int
+-walk_dir(acl_t acl, acl_t dacl, const char *fname)
++walk_dir(acl_t acl, acl_t dacl, int dirfd, const char *dname, const char *fname,
++	 unsigned int depth)
+ {
+ 	int failed = 0;
+ 	DIR *dir;
+ 	struct dirent *d;
+-	char *name;
++	char *dname2;
++	int fd;
++
++	depth++;
+ 
+-	if ((dir = opendir(fname)) == NULL) {
+-		if (errno != ENOTDIR) {
+-			fprintf(stderr, _("%s: opendir failed: %s\n"),
++	fd = openat(dirfd, fname, O_DIRECTORY | O_NOFOLLOW);
++	if (fd == -1) {
++		if (errno != ENOTDIR && errno != ELOOP) {
++			fprintf(stderr, _("%s: openat failed: %s\n"),
+ 				program, strerror(errno));
+ 			return(1);
+ 		}
+ 		return(0);	/* got a file, not an error */
+ 	}
++	if ((dir = fdopendir(fd)) == NULL) {
++		fprintf(stderr, _("%s: opendir failed: %s\n"),
++			program, strerror(errno));
++		return(1);
++	}
++
++	dname2 = malloc(strlen(dname) + strlen(fname) + 2);
++	if (dname2 == NULL) {
++		fprintf(stderr, _("%s: malloc failed: %s\n"),
++			program, strerror(errno));
++		exit(1);
++	}
++	sprintf(dname2, "%s%s/", dname, fname);
+ 
+ 	while ((d = readdir(dir)) != NULL) {
+ 		/* skip "." and ".." entries */
+ 		if (strcmp(d->d_name, ".") == 0 || strcmp(d->d_name, "..") == 0)
+ 			continue;
+ 		
+-		name = malloc(strlen(fname) + strlen(d->d_name) + 2);
+-		if (name == NULL) {
+-			fprintf(stderr, _("%s: malloc failed: %s\n"),
+-				program, strerror(errno));
+-			exit(1);
+-		}
+-		sprintf(name, "%s/%s", fname, d->d_name);
+-
+-		failed += set_acl(acl, dacl, name);
+-		free(name);
++		failed += set_acl(acl, dacl, fd, dname2, d->d_name, depth);
+ 	}
+ 	closedir(dir);
+ 
++	free(dname2);
++
+ 	return(failed);
+ }
+-- 
+2.35.6
+
diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-support/attr/acl_2.3.2.bb
index 28c587a0e08..3e48e82c191 100644
--- a/meta/recipes-support/attr/acl_2.3.2.bb
+++ b/meta/recipes-support/attr/acl_2.3.2.bb
@@ -24,6 +24,14 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/acl/${BP}.tar.gz \
            file://CVE-2026-54369_p1.patch \
            file://CVE-2026-54369_p2.patch \
            file://CVE-2026-54369_p3.patch \
+           file://CVE-2026-54370-dependent_p1.patch \
+           file://CVE-2026-54370-dependent_p2.patch \
+           file://CVE-2026-54370-dependent_p3.patch \
+           file://CVE-2026-54370-dependent_p4.patch \
+           file://CVE-2026-54370_p1.patch \
+           file://CVE-2026-54370_p2.patch \
+           file://CVE-2026-54370_p3.patch \
+           file://CVE-2026-54370_p4.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] = "5f2bdbad629707aa7d85c623f994aa8a1d2dec55a73de5205bac0bf6058a2f7c"
-- 
2.35.6
