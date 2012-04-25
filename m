Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SMugp-0006eZ-FR
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Apr 2012 07:22:55 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 82F0B2FF61
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2012 01:13:15 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Apr 2012 22:13:11 -0700
Message-Id: <cover.1335330662.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 82F0B2FF61.9AC7B
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/2] Recipe security updates: libpng and openssl
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
X-List-Received-Date: Wed, 25 Apr 2012 05:22:55 -0000

Hello,

This upgrades libpng and openssl to adddress some recent CVEs. They
have been build tested on all 5 of our QEMU architectures. 

There is another outstanding pull request that updated distro tracking
for libpng, so I'm going to hold off on updating the distro tracking
file until that gets into master.

Scott

The following changes since commit fd989e1bceef6df36619ba8944c8141abefd282e:

  self-hosted-image: Update poky revision to point at the 1.2 release branch (2012-04-24 10:20:25 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/security-updates-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/security-updates-oe

Scott Garman (2):
  libpng: upgrade to 1.2.49
  openssl: upgrade to 1.0.0i

 .../configure-targets.patch                        |    0
 .../debian/c_rehash-compat.patch                   |    0
 .../debian/ca.patch                                |    0
 .../debian/debian-targets.patch                    |    0
 .../debian/make-targets.patch                      |    0
 .../debian/man-dir.patch                           |    0
 .../debian/man-section.patch                       |    0
 .../debian/no-rpath.patch                          |    0
 .../debian/no-symbolic.patch                       |    0
 .../debian/pic.patch                               |    0
 .../debian/version-script.patch                    |    0
 .../engines-install-in-libdir-ssl.patch            |    0
 .../oe-ldflags.patch                               |    0
 .../openssl-fix-link.patch                         |    0
 .../openssl_fix_for_x32.patch                      |    0
 .../shared-libs.patch                              |    0
 meta/recipes-connectivity/openssl/openssl.inc      |    3 +--
 .../{openssl_1.0.0h.bb => openssl_1.0.0i.bb}       |    4 ++--
 .../libpng/{libpng_1.2.46.bb => libpng_1.2.49.bb}  |   10 +++++-----
 19 files changed, 8 insertions(+), 9 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/c_rehash-compat.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/make-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/debian/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/openssl-fix-link.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0h => openssl-1.0.0i}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.0h.bb => openssl_1.0.0i.bb} (90%)
 rename meta/recipes-multimedia/libpng/{libpng_1.2.46.bb => libpng_1.2.49.bb} (60%)

-- 
1.7.5.4



