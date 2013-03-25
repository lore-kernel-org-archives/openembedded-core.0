Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1UK8aG-0000M3-QB
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 15:41:13 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Mon, 25 Mar 2013 15:24:13 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 1FAB0289A9F;
	Mon, 25 Mar 2013 15:24:14 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Mar 2013 15:24:04 +0100
Message-ID: <1364221444-24112-1-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1363969462.3097.15.camel@ted>
References: <1363969462.3097.15.camel@ted>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 1/2] dbus: Depend on dbus-ptest-ptest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Mar 2013 14:41:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The dbus-ptest recipe doesn't produce an output package called
dbus-ptest. What we are interested in is actually the dbus-ptest-ptest
package.

Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 meta/recipes-core/dbus/dbus.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.=
inc
index affffbc..50c102f 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -9,7 +9,7 @@ X11DEPENDS =3D "virtual/libx11 libsm"
 DEPENDS =3D "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x1=
1', '${X11DEPENDS}', '', d)}"
 DEPENDS_class-native =3D "expat-native virtual/libintl-native"
 DEPENDS_class-nativesdk =3D "nativesdk-expat virtual/nativesdk-libintl"
-RDEPENDS_dbus =3D "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptes=
t', '', d)}"
+RDEPENDS_dbus =3D "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptes=
t-ptest', '', d)}"
 RDEPENDS_class-native =3D ""
=20
 INC_PR =3D "r6"
--=20
1.7.5.4



