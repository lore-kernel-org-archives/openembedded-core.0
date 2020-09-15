Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.10994.1600167936718894937
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2020 04:05:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FBEE101E
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 04:05:35 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 044343F718
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 04:05:34 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] alsa-plugins: improve .la removal
Date: Tue, 15 Sep 2020 12:05:31 +0100
Message-Id: <20200915110532.501629-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Don't assume that the .la files are installed, because some libtool
alternatives don't install these.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb b/meta/re=
cipes-multimedia/alsa/alsa-plugins_1.2.2.bb
index 52dee30126..e8402a6fcb 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.2.bb
@@ -51,7 +51,7 @@ FILES_${PN} =3D ""
 ALLOW_EMPTY_${PN} =3D "1"
=20
 do_install_append() {
-	rm ${D}${libdir}/alsa-lib/*.la
+	rm -f ${D}${libdir}/alsa-lib/*.la
=20
 	if [ "${@bb.utils.contains('PACKAGECONFIG', 'pulseaudio', 'yes', 'no', =
d)}" =3D "yes" ]; then
 		# We use the example as is. Upstream installs the file under
--=20
2.28.0

