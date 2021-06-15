Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7151.1623751326067009599
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 03:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A16B3D6E
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 03:02:04 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4A5B03F694
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 03:02:04 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] systemd-conf: Prevent systemd-network from managing veth interfaces
Date: Tue, 15 Jun 2021 11:02:00 +0100
Message-Id: <20210615100200.3325303-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Matt Spencer <matt.spencer@arm.com>

We need to prevent systemd-network from managing veth interface when
using platforms like k3s as they control creation and management of the
interfaces.

Signed-off-by: Matt Spencer <matt.spencer@arm.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/systemd/systemd-conf/wired.network | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/systemd/systemd-conf/wired.network b/meta/=
recipes-core/systemd/systemd-conf/wired.network
index e7b69970d6..7406287248 100644
--- a/meta/recipes-core/systemd/systemd-conf/wired.network
+++ b/meta/recipes-core/systemd/systemd-conf/wired.network
@@ -1,5 +1,6 @@
 [Match]
 Type=3Dether
+Name=3D!veth*
 KernelCommandLine=3D!nfsroot
 KernelCommandLine=3D!ip
=20
--=20
2.25.1

