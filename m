Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <Bjoern.Stenberg@enea.com>) id 1TlMa6-0004uo-9u
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 17:33:18 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Wed, 19 Dec 2012 17:18:33 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id E466E290C61;
	Wed, 19 Dec 2012 17:18:32 +0100 (CET)
From: =?UTF-8?q?Bj=C3=B6rn=20Stenberg?= <bjst@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Dec 2012 17:18:26 +0100
Message-ID: <1355933911-48562-1-git-send-email-bjst@enea.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
Subject: [PATCH 0/5] ptest update
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
X-List-Received-Date: Wed, 19 Dec 2012 16:33:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Here is an update of the ptest patch set.

The variables are now moved from bitbake.conf to a new ptest.bbclass, which
packages inherit to create a ptest package.

I have added patches for bash in this set, so it now includes ptest for
glib, dbus and bash. The do_install bits are also much cleaner now.

Bj=C3=B6rn Stenberg (5):
  Add a new distro feature "ptest".
  New package: ptest-runner
  Add ptest for glib.
  Add ptest for dbus.
  Add ptest for bash.

 meta/classes/image.bbclass                         |    6 +-
 meta/classes/packagegroup.bbclass                  |    2 +-
 meta/classes/ptest.bbclass                         |   34 +++++
 meta/recipes-core/dbus/dbus-1.6.4/ptest.patch      |  144 ++++++++++++++++=
++++
 meta/recipes-core/dbus/dbus-1.6.4/run-ptest        |    3 +
 .../dbus/dbus-1.6.4/test-run-path.patch            |   26 ++++
 meta/recipes-core/dbus/dbus-ptest_1.6.4.bb         |   46 ++++++
 meta/recipes-core/dbus/dbus.inc                    |    2 +
 .../glib-2.0/glib-2.0/Makefile-ptest.patch         |   61 ++++++++
 meta/recipes-core/glib-2.0/glib-2.0/run-ptest      |    3 +
 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb      |   25 +++-
 meta/recipes-core/glib-2.0/glib.inc                |    7 +-
 .../automake/automake/buildtest.patch              |   33 +++++
 meta/recipes-devtools/automake/automake_1.12.5.bb  |    3 +-
 .../bash/bash-4.2/build-tests.patch                |   48 +++++++
 meta/recipes-extended/bash/bash-4.2/run-ptest      |    2 +
 .../bash/bash-4.2/test-output.patch                |   25 ++++
 meta/recipes-extended/bash/bash.inc                |   16 ++-
 meta/recipes-extended/bash/bash_4.2.bb             |    3 +
 .../ptest-runner/files/ptest-runner                |   16 ++
 .../ptest-runner/ptest-runner_1.0.bb               |   17 +++
 21 files changed, 512 insertions(+), 10 deletions(-)
 create mode 100644 meta/classes/ptest.bbclass
 create mode 100644 meta/recipes-core/dbus/dbus-1.6.4/ptest.patch
 create mode 100755 meta/recipes-core/dbus/dbus-1.6.4/run-ptest
 create mode 100644 meta/recipes-core/dbus/dbus-1.6.4/test-run-path.patch
 create mode 100644 meta/recipes-core/dbus/dbus-ptest_1.6.4.bb
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/Makefile-ptest.patc=
h
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/run-ptest
 create mode 100644 meta/recipes-devtools/automake/automake/buildtest.patch
 create mode 100644 meta/recipes-extended/bash/bash-4.2/build-tests.patch
 create mode 100644 meta/recipes-extended/bash/bash-4.2/run-ptest
 create mode 100644 meta/recipes-extended/bash/bash-4.2/test-output.patch
 create mode 100644 meta/recipes-support/ptest-runner/files/ptest-runner
 create mode 100644 meta/recipes-support/ptest-runner/ptest-runner_1.0.bb

--=20
1.7.5.4



