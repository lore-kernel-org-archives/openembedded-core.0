Received: from hsvwanfw1-nat.mentorg.com ([139.181.24.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom_rini@mentor.com>) id 1QhmZg-0006kB-NJ
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jul 2011 19:53:18 +0200
Received: from localhost.localdomain ([134.86.97.33])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id p6FHZPMf018374
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2011 12:35:25 -0500
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jul 2011 10:35:21 -0700
Message-Id: <cover.1310751195.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2 0/1] Add unzip DEPENDS for .zip SRC_URI files
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
X-List-Received-Date: Fri, 15 Jul 2011 17:53:18 -0000

Hey all,

In doing some world builds I ran into "oops, we don't make .zip files
depend on unzip-native".  So this is a port of the commit from oe.dev
that does this.

v2: Don brown paper bag, s/do_populate_staging/do_populate_sysroot, test
The following changes since commit e66c2999afa2b3efbce8bb46c89f9db5e15f35c7:
  Saul Wold (1):
        libx11: ensure nativesdk uses correct DEPENDS and XCB flags

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib trini/add-zip-native-check
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=trini/add-zip-native-check

Ihar Hrachyshka (1):
  Fixed concurrency problem for ZIP packed recipes.

 meta/classes/base.bbclass |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)



