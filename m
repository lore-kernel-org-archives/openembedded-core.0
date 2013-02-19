Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1U7nH9-0000Kc-M2
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 14:31:32 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Tue, 19 Feb 2013 14:14:17 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id C26C3291D4B;
	Tue, 19 Feb 2013 14:14:17 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Feb 2013 14:13:56 +0100
Message-ID: <1361279644-17675-1-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 0/8] Ptest additions
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
X-List-Received-Date: Tue, 19 Feb 2013 13:31:35 -0000
X-List-Received-Date: Tue, 19 Feb 2013 13:31:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Here is a handful ptest additions for various packages.
Also included is a minor tweak for ptest.bbclass.

Anders Roxell (1):
  zlib: Add ptest

Bj=C3=B6rn Stenberg (4):
  bzip2: Add ptest
  openssh: Add ptest
  openssl: Add ptest
  ptest: Add missed .debug path

Daniel Dai (1):
  busybox: Add ptest

Rick Yang (1):
  acl: Add ptest

Jack Zhang (1):
  udev: Add ptest

 meta/classes/ptest.bbclass                         |    3 +-
 .../add-test-support-for-busybox.patch             |   61 ++++++++++++++++
 .../openssh/openssh-6.1p1/run-ptest                |    7 ++
 meta/recipes-connectivity/openssh/openssh_6.1p1.bb |   11 +++-
 .../openssl/openssl-1.0.0j/Makefiles-ptest.patch   |   74 ++++++++++++++++=
++++
 .../openssl/openssl-1.0.0j/run-ptest               |    2 +
 meta/recipes-connectivity/openssl/openssl.inc      |   19 +++++-
 .../recipes-connectivity/openssl/openssl_1.0.0j.bb |    2 +
 meta/recipes-core/busybox/busybox.inc              |    2 +-
 meta/recipes-core/busybox/busybox_1.20.2.bb        |   10 +++
 meta/recipes-core/busybox/files/run-ptest          |   11 +++
 meta/recipes-core/udev/udev.inc                    |   19 +++++-
 .../recipes-core/udev/udev/add-install-ptest.patch |   60 ++++++++++++++++
 meta/recipes-core/udev/udev/run-ptest              |    3 +
 .../zlib/zlib-1.2.7/Makefile-runtests.patch        |   38 ++++++++++
 meta/recipes-core/zlib/zlib-1.2.7/run-ptest        |    7 ++
 meta/recipes-core/zlib/zlib_1.2.7.bb               |   22 ++++++
 .../recipes-extended/bzip2/bzip2-1.0.6/Makefile.am |   32 +++++++++
 meta/recipes-extended/bzip2/bzip2-1.0.6/run-ptest  |    2 +
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |   10 +++-
 meta/recipes-support/attr/acl_2.2.51.bb            |   21 ++++++
 .../attr/files/add-runtest-target.patch            |   26 +++++++
 meta/recipes-support/attr/files/run-ptest          |    8 ++
 23 files changed, 443 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh-6.1p1/add-tes=
t-support-for-busybox.patch
 create mode 100755 meta/recipes-connectivity/openssh/openssh-6.1p1/run-pte=
st
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0j/Makefi=
les-ptest.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0j/run-pt=
est
 create mode 100644 meta/recipes-core/busybox/files/run-ptest
 create mode 100644 meta/recipes-core/udev/udev/add-install-ptest.patch
 create mode 100755 meta/recipes-core/udev/udev/run-ptest
 create mode 100644 meta/recipes-core/zlib/zlib-1.2.7/Makefile-runtests.pat=
ch
 create mode 100644 meta/recipes-core/zlib/zlib-1.2.7/run-ptest
 create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/run-ptest
 create mode 100644 meta/recipes-support/attr/files/add-runtest-target.patc=
h
 create mode 100644 meta/recipes-support/attr/files/run-ptest

--=20
1.7.5.4



