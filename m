Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RNhLm-0008LO-8G
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 09:48:10 +0100
Received: from e6520eb.lan (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 69EB64B0130
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2011 09:41:54 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 09:41:48 +0100
Message-Id: <1320741708-15019-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1320741708-15019-1-git-send-email-eric@eukrea.com>
References: <4EB86E07.5020907@intel.com>
	<1320741708-15019-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] dbus: fix install for virtclass-nativesdk
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
X-List-Received-Date: Tue, 08 Nov 2011 08:48:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

* 46e6c3fa8034b12d178d605f3f5d7efe69671a13 changed do_install
which now fails for nativesdk (chown messagebus leads to no
such user)
* tested by building meta-toolchain-qte and running the generated
sdk

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
Acked-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-core/dbus/dbus.inc |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbu=
s.inc
index caa781c..99b2fc7 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -105,4 +105,8 @@ do_install_virtclass-native() {
 	# dbus-glib-native and dbus-glib need this xml file
 	./bus/dbus-daemon --introspect > ${STAGING_DATADIR_NATIVE}/dbus/dbus-bu=
s-introspect.xml
 }
+
+do_install_virtclass-nativesdk() {
+	autotools_do_install
+}
 BBCLASSEXTEND =3D "native nativesdk"
--=20
1.7.6.4



