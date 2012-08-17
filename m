Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Andrei.Gherzan@windriver.com>) id 1T2MNe-0005e4-9u
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 15:14:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7HD2R3n023468
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 06:02:27 -0700 (PDT)
Received: from localhost.localdomain (128.224.171.81) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Fri, 17 Aug 2012 06:02:26 -0700
From: Andrei Gherzan <andrei.gherzan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2012 16:02:18 +0300
Message-ID: <cover.1345208249.git.andrei.gherzan@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.171.81]
Cc: Andrei Gherzan <andrei.gherzan@windriver.com>
Subject: [PATCH 0/2] Build and package dbus-tests - separate recipe
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
X-List-Received-Date: Fri, 17 Aug 2012 13:14:26 -0000
Content-Type: text/plain

While compiling dbus with tests, dbus and dbus-glib are needed. To
compile dbus-glib, dbus is needed (obviously). The only solution (to
compile dbus with tests) that i found, is to create a new recipe named
dbus-tests where to compile dbus with --enable-tests
--enable-embedded-tests, skip write to sysroot (noexec) and just
package dbus-tests.
I included a wrapper to run all tests.
As discussed on mailing list, tests location is: libdir/BPN

Tested on all qemu machines with dbus 1.4.20 and with the comming
1.6.4

The following changes since commit bddd8300325267253941e7ce656ce2cf86a8a4a4:

  apr-util: fix the rules.mk with path to sysroot instead of the workdir of apr (2012-08-17 13:10:08 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib ag/dbus-tests
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/dbus-tests

Andrei Gherzan (2):
  python-dbus: Native dbus python module needed for dbus tests
  dbus-tests: Add separate recipe for building dbus-tests

 meta/recipes-core/dbus/dbus-tests/run_test.sh     |   22 +++++++
 meta/recipes-core/dbus/dbus-tests_1.4.20.bb       |   64 +++++++++++++++++++++
 meta/recipes-devtools/python/python-dbus_1.1.1.bb |    5 +-
 3 files changed, 90 insertions(+), 1 deletions(-)
 create mode 100755 meta/recipes-core/dbus/dbus-tests/run_test.sh
 create mode 100644 meta/recipes-core/dbus/dbus-tests_1.4.20.bb

-- 
1.7.5.4



