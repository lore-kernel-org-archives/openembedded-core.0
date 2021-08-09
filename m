Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.24869.1628524829126153642
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 09:00:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAC701042
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Aug 2021 09:00:28 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 569743F718
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Aug 2021 09:00:28 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] parted: update patch status
Date: Mon,  9 Aug 2021 17:00:24 +0100
Message-Id: <20210809160024.3337575-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210809160024.3337575-1-ross.burton@arm.com>
References: <20210809160024.3337575-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch has now been submitted to parted-devel.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-extended/parted/files/check-vfat.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/parted/files/check-vfat.patch b/meta/r=
ecipes-extended/parted/files/check-vfat.patch
index c64130a4e2a..fad50292d93 100644
--- a/meta/recipes-extended/parted/files/check-vfat.patch
+++ b/meta/recipes-extended/parted/files/check-vfat.patch
@@ -1,7 +1,7 @@
 Add checks for both mkfs.vfat and the vfat file system in the kernel bef=
ore
 running tests.
=20
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://alioth-lists.debian.net/pipermail/pa=
rted-devel/2021-August/005653.html]
 Signed-off-by: Ross Burton <ross.burton@arm.com>
=20
 diff --git a/tests/t-lib-helpers.sh b/tests/t-lib-helpers.sh
--=20
2.25.1

