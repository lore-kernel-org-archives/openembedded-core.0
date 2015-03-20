Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id D65816013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2015 17:08:01 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 20 Mar 2015 18:08:01 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 596EE2800CB;
	Fri, 20 Mar 2015 18:08:01 +0100 (CET)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Mar 2015 18:07:55 +0100
Message-ID: <1426871278-51418-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH 0/3] rt-tests version upgrade and ptest support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Mar 2015 17:08:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

1. Add ptest support to rt-tests package [YOCTO #1569]
2. Add stress package as a dependency for rt-tests ptest
3. Upgrade the rt-tests and hwlatdetect package to version 0.91

Maxin B. John (3):
  rt-tests: bump version and enable ptest support
  hwlatdetect: upgrade to version 0.91
  stress: add new package

 meta/recipes-extended/stress/files/texinfo.patch   |  79 ++++
 meta/recipes-extended/stress/stress_1.0.4.bb       |  14 +
 meta/recipes-rt/rt-tests/files/rt_bmark.py         | 412 +++++++++++++++++=
++++
 meta/recipes-rt/rt-tests/files/run-ptest           |   3 +
 .../{hwlatdetect_0.89.bb =3D> hwlatdetect_0.91.bb}   |   0
 meta/recipes-rt/rt-tests/rt-tests.inc              |   6 +-
 .../{rt-tests_0.89.bb =3D> rt-tests_0.91.bb}         |  10 +
 7 files changed, 521 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-extended/stress/files/texinfo.patch
 create mode 100644 meta/recipes-extended/stress/stress_1.0.4.bb
 create mode 100755 meta/recipes-rt/rt-tests/files/rt_bmark.py
 create mode 100644 meta/recipes-rt/rt-tests/files/run-ptest
 rename meta/recipes-rt/rt-tests/{hwlatdetect_0.89.bb =3D> hwlatdetect_0.91=
.bb} (100%)
 rename meta/recipes-rt/rt-tests/{rt-tests_0.89.bb =3D> rt-tests_0.91.bb} (=
72%)

--=20
1.9.1


