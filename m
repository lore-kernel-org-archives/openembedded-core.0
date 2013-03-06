Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1UDB6r-0002QG-GE
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 10:58:12 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1; Wed, 6 Mar 2013
	10:41:20 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 794E4289655;
	Wed,  6 Mar 2013 10:41:20 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Mar 2013 10:41:09 +0100
Message-ID: <1362562871-16878-3-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1362562871-16878-1-git-send-email-bjst@enea.com>
References: <1362562871-16878-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 2/4] dbus: Use new _ptest functions
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
X-List-Received-Date: Wed, 06 Mar 2013 09:58:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 meta/recipes-core/dbus/dbus-ptest_1.6.8.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus-ptest_1.6.8.bb b/meta/recipes-core=
/dbus/dbus-ptest_1.6.8.bb
index 1382206..d00819a 100644
--- a/meta/recipes-core/dbus/dbus-ptest_1.6.8.bb
+++ b/meta/recipes-core/dbus/dbus-ptest_1.6.8.bb
@@ -41,6 +41,8 @@ EXTRA_OECONF =3D "--enable-tests \
                 ${EXTRA_OECONF_X}"
=20
 do_install() {
-    ptest_do_install
+}
+
+do_install_ptest() {
     find ${D}${PTEST_PATH} -name Makefile | xargs sed -i 's/^Makefile:/_Ma=
kefile:/'
 }
--=20
1.7.5.4



