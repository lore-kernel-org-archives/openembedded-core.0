Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1UDB6d-0002QG-H9
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Mar 2013 10:58:03 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.2.318.1; Wed, 6 Mar 2013
	10:41:20 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 81902289657;
	Wed,  6 Mar 2013 10:41:20 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Mar 2013 10:41:10 +0100
Message-ID: <1362562871-16878-4-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1362562871-16878-1-git-send-email-bjst@enea.com>
References: <1362562871-16878-1-git-send-email-bjst@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 3/4] glib: Use new _ptest functions
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
X-List-Received-Date: Wed, 06 Mar 2013 09:58:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Bj=C3=B6rn Stenberg <bjst@enea.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb b/meta/recipes-c=
ore/glib-2.0/glib-2.0_2.34.3.bb
index d58d489..7795524 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
@@ -60,6 +60,4 @@ do_install_append() {
   if [ -f ${D}${bindir}/glib-mkenums ]; then
     sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/glib-=
mkenums
   fi
-
-  ptest_do_install
 }
--=20
1.7.5.4



