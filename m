Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.7163.1631269255315674864
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 03:20:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F3CD1FB
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 03:20:54 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF2D73F5A1
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 03:20:53 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] testimage: pass the base image name to the target class
Date: Fri, 10 Sep 2021 11:20:45 +0100
Message-Id: <20210910102050.1266413-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910102050.1266413-1-ross.burton@arm.com>
References: <20210910102050.1266413-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Also pass the the base image name to the target class. This is the full
path to the deploy directory and the image name without any extensions,
so makes it easier to find ancillary files.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/testimage.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbcl=
ass
index 8bf6b17af8a..d139df9925f 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -309,6 +309,7 @@ def testimage_main(d):
                       'serial_ports': len(d.getVar("SERIAL_CONSOLES").sp=
lit()),
                       'ovmf'        : ovmf,
                       'tmpfsdir'    : d.getVar("RUNQEMU_TMPFS_DIR"),
+                      'image_name'  : image_name
                     }
=20
     if d.getVar("TESTIMAGE_BOOT_PATTERNS"):
--=20
2.25.1

