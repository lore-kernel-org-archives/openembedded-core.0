Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@rpsys.net>) id 1U0YdE-0002FG-E6
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 15:27:24 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE5x6I007190; Wed, 30 Jan 2013 14:05:59 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sAsFj9hcy-to; Wed, 30 Jan 2013 14:05:58 +0000 (GMT)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r0UE5tEV007168
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 30 Jan 2013 14:05:56 GMT
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1U0YDr-00081v-Ca; Wed, 30 Jan 2013 14:01:07 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2013 14:01:03 +0000
Message-Id: <cover.1359554291.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 00/17] Packaging performance improvements
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
X-List-Received-Date: Wed, 30 Jan 2013 14:44:10 -0000

The following patch series contains a number of packaging improvements along 
with a couple of bugfixes (one multilib, one directfb).

The following changes since commit cf05c4578c99c0cb885cf2706f7f2b39b100aeb8:

  module.bbclass: Don't add pkg_postinst/pkg_prerm to all packages in recipe (2013-01-29 23:51:59 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core master-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core/log/?h=master-next

Richard Purdie (16):
  multilib.conf: Use BASELIB to set baselib, not hardcode the value
  sstate: Move debug comment to more logical place
  insane.bbclass: Fix incorrect getVar call
  package: Rename splitfile functions to something more descriptive
  package.bbclass: Improve kernel module handling
  package.bbclass: Add a shortcut exit from the mkdir function
  package.bbclass: Check FILES once, not once per loop iteration
  package.bbclass: Avoid copying the datastore for FILES handling
  package.bbclass: Move PKG handling code to emit_pkgdata
  package.bbclass: Split out package_fixsymlinks function
  package.bbclass: Tweak PACKAGEFUNCS
  package.bbclass: Improve package_fixsymlinks
  package: Create global package file list and use throughout
    PACKAGEFUNCS
  package.bbclass: Use expanded RDEPENDS in read_shlibdeps
  package_ipk/deb/rpm: Ensure deploy staging directory is empty before
    rerunning task
  directfb: Explictly disable mesa

 meta/classes/buildhistory.bbclass                  |   11 +-
 meta/classes/debian.bbclass                        |   28 ++-
 meta/classes/insane.bbclass                        |    6 +-
 meta/classes/package.bbclass                       |  202 ++++++++++----------
 meta/classes/package_deb.bbclass                   |    1 +
 meta/classes/package_ipk.bbclass                   |    1 +
 meta/classes/package_rpm.bbclass                   |    1 +
 meta/classes/sstate.bbclass                        |    2 +-
 meta/conf/multilib.conf                            |    2 +-
 meta/recipes-graphics/directfb/directfb.inc        |    1 +
 12 files changed, 141 insertions(+), 138 deletions(-)


