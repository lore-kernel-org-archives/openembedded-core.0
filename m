Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1U3qEh-0001RK-G2
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 16:51:35 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1; Fri, 8 Feb 2013
	16:35:40 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 09017291D4B;
	Fri,  8 Feb 2013 16:35:41 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 8 Feb 2013 16:35:31 +0100
Message-ID: <1360337733-51730-1-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 0/2] uclibc ptest changes
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
X-List-Received-Date: Fri, 08 Feb 2013 15:51:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

glib-2.0 would not build with ptest, due to bad dependencies.

When looking into that, I found that libiconv did not pass the QA RPATH
check so I fixed that too.
(https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2669)

Bj=C3=B6rn Stenberg (2):
  glib-2.0: Fix ptest to build with uclibc.
  libiconv: Remove RPATH from binaries

 .../glib-2.0/glib-2.0/fix-conflicting-rand.patch   |   35 ++++++++++++++++=
++++
 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb      |   18 ++++++----
 meta/recipes-support/libiconv/libiconv_1.14.bb     |    6 +++
 3 files changed, 52 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/fix-conflicting-ran=
d.patch

--=20
1.7.5.4



