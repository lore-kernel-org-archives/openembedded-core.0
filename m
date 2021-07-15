Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.6022.1626345996947400723
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 03:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B7BA31B
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 03:46:26 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1522E3F694
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 03:46:25 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] busybox: support mounting swap via labels
Date: Thu, 15 Jul 2021 11:46:21 +0100
Message-Id: <20210715104621.3947223-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Enable support for swap partitions in the mount-via-label fragment.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/busybox/busybox/mount-via-label.cfg | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/busybox/busybox/mount-via-label.cfg b/meta=
/recipes-core/busybox/busybox/mount-via-label.cfg
index 2fe7ab2e5f..5a285de7cd 100644
--- a/meta/recipes-core/busybox/busybox/mount-via-label.cfg
+++ b/meta/recipes-core/busybox/busybox/mount-via-label.cfg
@@ -1,9 +1,11 @@
 CONFIG_BLKID=3Dy
 CONFIG_FEATURE_BLKID_TYPE=3Dy
 CONFIG_FEATURE_MOUNT_LABEL=3Dy
+CONFIG_FEATURE_SWAPONOFF_LABEL=3Dy
 CONFIG_VOLUMEID=3Dy
 CONFIG_FEATURE_VOLUMEID_BTRFS=3Dy
 CONFIG_FEATURE_VOLUMEID_EXT=3Dy
 CONFIG_FEATURE_VOLUMEID_F2FS=3Dy
 CONFIG_FEATURE_VOLUMEID_FAT=3Dy
 CONFIG_FEATURE_VOLUMEID_SQUASHFS=3Dy
+CONFIG_FEATURE_VOLUMEID_LINUXSWAP=3Dy
--=20
2.25.1

