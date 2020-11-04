Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11629.1604491375520668457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2020 04:02:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E3961474
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Nov 2020 04:02:54 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A82E53F719
	for <openembedded-core@lists.openembedded.org>; Wed,  4 Nov 2020 04:02:53 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] syslinux: add link to upstream discussion in patch
Date: Wed,  4 Nov 2020 12:02:50 +0000
Message-Id: <20201104120250.4010676-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../syslinux/0001-linux-syslinux-support-ext2-3-4-device.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/syslinux/syslinux/0001-linux-syslinux-=
support-ext2-3-4-device.patch b/meta/recipes-devtools/syslinux/syslinux/0=
001-linux-syslinux-support-ext2-3-4-device.patch
index 3ab78752746..47a8dac10ea 100644
--- a/meta/recipes-devtools/syslinux/syslinux/0001-linux-syslinux-support=
-ext2-3-4-device.patch
+++ b/meta/recipes-devtools/syslinux/syslinux/0001-linux-syslinux-support=
-ext2-3-4-device.patch
@@ -10,7 +10,7 @@ Subject: [PATCH 1/9] linux/syslinux: support ext2/3/4 d=
evice
 * The ext2/3/4 support doesn't require root privileges since it doesn't =
need
   mount (but write permission is required).
=20
-Upstream-Status: Submitted
+Upstream-Status: Submitted [https://www.syslinux.org/archives/2015-Janua=
ry/023039.html]
=20
 Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
 Tested-by: Du Dolpher <dolpher.du@intel.com>
--=20
2.25.1

