Received: from mx3.leapfrog.com ([63.114.26.253])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dlazzari@leapfrog.com>) id 1R69cp-0006Eh-Q0
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 01:21:16 +0200
Received: from mx3.leapfrog.com (localhost [127.0.0.1])
	by localhost.leapfrog.com (Postfix) with ESMTP id 669675ED7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 16:15:44 -0700 (PDT)
Received: from NAEXCHHT01.na.leapfrog.com (unknown [10.15.6.13])
	by mx3.leapfrog.com (Postfix) with ESMTP id 3C3455EC0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 16:15:44 -0700 (PDT)
Received: from NAEMCASHT02.na.leapfrog.com (10.12.2.36) by
	NAEXCHHT01.na.leapfrog.com (10.15.6.13) with Microsoft SMTP Server
	(TLS) id 8.2.254.0; Tue, 20 Sep 2011 16:15:44 -0700
Received: from NAEMMAIL01.na.leapfrog.com ([fe80::252e:28a6:3d8f:6991]) by
	NAEMCASHT02.na.leapfrog.com ([::1]) with mapi id 14.01.0289.001;
	Tue, 20 Sep 2011 16:15:43 -0700
From: Daniel Lazzari <dlazzari@leapfrog.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 1/1] Fix alsa-utils package dependencies
Thread-Index: Acx36zeQbC8m8vgmQgCIhMpoXo7weA==
Date: Tue, 20 Sep 2011 23:15:42 +0000
Message-ID: <E7A9054A5ACABE48B0E540E46E862B0F012064@NAEMMAIL01.na.leapfrog.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.2.5]
MIME-Version: 1.0
Subject: [PATCH 1/1] Fix alsa-utils package dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Sep 2011 23:21:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Make alsa-utils main package depend on all of the more specific alsa-utils =
packages (such as alsa-utils-alsamixer).

Signed-off-by: Daniel Lazzari Jr <dlazzari@leapfrog.com>
---
 .../recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb b/meta/rec=
ipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
index 52a7871..307f293 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.24.2.bb
@@ -28,7 +28,7 @@ inherit autotools gettext
 # This are all packages that we need to make. Also, the now empty alsa-uti=
ls
 # ipk depends on them.
=20
-PACKAGES +=3D "\
+ALSA_UTILS_PKGS =3D "\
              alsa-utils-alsamixer \
              alsa-utils-midi \
              alsa-utils-aplay \
@@ -44,6 +44,9 @@ PACKAGES +=3D "\
              alsa-utils-alsaucm \
             "
=20
+PACKAGES +=3D "${ALSA_UTILS_PKGS}"
+RDEPENDS_${PN} +=3D "${ALSA_UTILS_PKGS}"
+
 # We omit alsaconf, because
 # a) this is a bash script
 # b) it creates config files not suitable for OE-based distros
--=20
1.7.0.4

Dan Lazzari Jr.
Firmware Engineer
dlazzari@leapfrog.com




