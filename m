Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.10995.1600167937118003593
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2020 04:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 002F21396
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 04:05:36 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 976C73F718
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 04:05:35 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] sato-screenshot: improve .la removal
Date: Tue, 15 Sep 2020 12:05:32 +0100
Message-Id: <20200915110532.501629-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915110532.501629-1-ross.burton@arm.com>
References: <20200915110532.501629-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Don't assume that the .la files are installed, because some libtool
alternatives don't install these.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb b/m=
eta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
index f6dac2cf88..2b1f513f1c 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_0.3.bb
@@ -21,7 +21,7 @@ inherit autotools pkgconfig features_check
 FILES_${PN} +=3D "${libdir}/matchbox-panel/*.so"
=20
 do_install_append () {
-	rm ${D}${libdir}/matchbox-panel/*.la
+	rm -f ${D}${libdir}/matchbox-panel/*.la
 }
=20
 # The matchbox-panel-2 requires x11 in DISTRO_FEATURES
--=20
2.28.0

