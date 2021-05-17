Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.18501.1621255451417518700
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 05:44:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 068FD113E
	for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 05:44:10 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1B563F73B
	for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 05:44:09 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: update status on upstreamed patch
Date: Mon, 17 May 2021 13:44:07 +0100
Message-Id: <20210517124407.1612643-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...1-Makefile-fix-Issue36464-parallel-build-race-problem.patch | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue=
36464-parallel-build-race-problem.patch b/meta/recipes-devtools/python/py=
thon3/0001-Makefile-fix-Issue36464-parallel-build-race-problem.patch
index 237645bc605..9ed03858d42 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-p=
arallel-build-race-problem.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile-fix-Issue36464-p=
arallel-build-race-problem.patch
@@ -9,8 +9,7 @@ installs python-config there) to race, resulting in a fai=
lure due to
 attempting to install python-config into a nonexistent BINDIR. Ensure it=
 also
 exists in the libainstall target.
=20
-Upstream-Status: Submitted [https://github.com/python/cpython/pull/13186=
]
-
+Upstream-Status: Backport [https://github.com/python/cpython/commit/a25c=
46bd7dd47a2f95b32d17ee2f66de214892c6]
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  Makefile.pre.in | 2 +-
--=20
2.25.1

