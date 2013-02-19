Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1U7nIQ-0000Kc-QY
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 14:31:49 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Tue, 19 Feb 2013 14:14:48 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id F1C0F291D53;
	Tue, 19 Feb 2013 14:14:17 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Feb 2013 14:14:04 +0100
Message-ID: <1361279644-17675-9-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1361279644-17675-1-git-send-email-bjst@enea.com>
References: <1361279644-17675-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 8/8] ptest: Add missed .debug path
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
X-List-Received-Date: Tue, 19 Feb 2013 13:31:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 meta/classes/ptest.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
index 361de78..131af7b 100644
--- a/meta/classes/ptest.bbclass
+++ b/meta/classes/ptest.bbclass
@@ -16,7 +16,8 @@ RDEPENDS_${PN}-ptest_virtclass-nativesdk =3D ""
=20
 PACKAGES +=3D "${@base_contains('DISTRO_FEATURES', 'ptest', '${PN}-ptest',=
 '', d)}"
=20
-FILES_${PN}-dbg +=3D "${PTEST_PATH}/*/.debug \
+FILES_${PN}-dbg +=3D "${PTEST_PATH}/.debug \
+                    ${PTEST_PATH}/*/.debug \
                     ${PTEST_PATH}/*/*/.debug \
                     ${PTEST_PATH}/*/*/*/.debug \
                     ${PTEST_PATH}/*/*/*/*/.debug \
--=20
1.7.5.4



