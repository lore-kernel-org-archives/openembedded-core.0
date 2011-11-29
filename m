Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVSyK-0000e8-5D
	for openembedded-core@openembedded.org; Tue, 29 Nov 2011 20:04:04 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 29 Nov 2011 10:56:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,592,1315206000"; d="scan'208";a="42203110"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Nov 2011 10:56:19 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Tue, 29 Nov 2011 10:56:15 -0800
Message-Id: <cover.1322592782.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [RFC PATCH 0/4] OpenSSL 1.0.0e Update
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
X-List-Received-Date: Tue, 29 Nov 2011 19:04:04 -0000

Folks,

This is an RFC for the OpenSSL 1.0 code update, this is from 
the Meta-OE Tree so nothing to suprising here. I merged the 
openssl-1.0.inc with openssl.inc. PR Bumps are for all the dependees
of openssl.

Also note I bumped PR in openssl-1.0.0 to keep in pace with meta-oe

I want to put this out for initial viewing and possible testing 
before the big bump.

Sau!



Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit 177df2c51927f44e3536856f4604364b38695bc2:

  qt-mobility: Add missing patch (2011-11-29 14:36:09 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/openssl
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/openssl

Saul Wold (4):
  ocf-linux: Add ocf-linux to support openssl 1.0
  openssl-0.9.8: move parallel-make fix to 0.9.8
  openssl: Add openssl 1.0
  PR Bump for OpenSSL 1.0

 .../recipes-sato/claws-mail/claws-mail.inc         |    2 +-
 meta/recipes-connectivity/bind/bind_9.8.1.bb       |    2 +-
 meta/recipes-connectivity/openssh/openssh_5.9p1.bb |    2 +-
 meta/recipes-connectivity/openssl/ocf-linux.inc    |   25 +
 .../openssl/ocf-linux_20100325.bb                  |    6 +
 .../openssl/openssl-1.0.0e/configure-targets.patch |   32 +
 .../openssl-1.0.0e/debian/c_rehash-compat.patch    |   45 +
 .../openssl/openssl-1.0.0e/debian/ca.patch         |   22 +
 .../openssl-1.0.0e/debian/debian-targets.patch     |   54 +
 .../openssl-1.0.0e/debian/make-targets.patch       |   15 +
 .../openssl/openssl-1.0.0e/debian/man-dir.patch    |   15 +
 .../openssl-1.0.0e/debian/man-section.patch        |   34 +
 .../openssl/openssl-1.0.0e/debian/no-rpath.patch   |   15 +
 .../openssl-1.0.0e/debian/no-symbolic.patch        |   15 +
 .../openssl/openssl-1.0.0e/debian/pic.patch        |  242 ++
 .../openssl/openssl-1.0.0e/debian/pkg-config.patch |   36 +
 .../openssl-1.0.0e/debian/version-script.patch     | 4511 ++++++++++++++++++++
 .../engines-install-in-libdir-ssl.patch            |   56 +
 .../openssl/openssl-1.0.0e/oe-ldflags.patch        |   24 +
 .../openssl/openssl-1.0.0e/openssl-fix-link.patch  |   35 +
 .../openssl/openssl-1.0.0e/shared-libs.patch       |   50 +
 meta/recipes-connectivity/openssl/openssl.inc      |   39 +-
 .../recipes-connectivity/openssl/openssl_0.9.8r.bb |    3 +-
 .../recipes-connectivity/openssl/openssl_1.0.0e.bb |   45 +
 .../telepathy/telepathy-idle_0.1.10.bb             |    2 +-
 meta/recipes-devtools/git/git_1.7.7.bb             |    2 +-
 meta/recipes-devtools/python/python_2.7.2.bb       |    2 +-
 meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb   |    2 +-
 meta/recipes-extended/iputils/iputils_s20101006.bb |    2 +-
 meta/recipes-extended/libzypp/libzypp_git.bb       |    2 +-
 meta/recipes-graphics/x11vnc/x11vnc_0.9.12.bb      |    2 +-
 31 files changed, 5323 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/ocf-linux.inc
 create mode 100644 meta/recipes-connectivity/openssl/ocf-linux_20100325.bb
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/configure-targets.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/c_rehash-compat.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/ca.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/debian-targets.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/make-targets.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/man-dir.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/man-section.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/no-rpath.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/no-symbolic.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/pic.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/pkg-config.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/debian/version-script.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/engines-install-in-libdir-ssl.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/oe-ldflags.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/openssl-fix-link.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0e/shared-libs.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl_1.0.0e.bb

-- 
1.7.6.4



