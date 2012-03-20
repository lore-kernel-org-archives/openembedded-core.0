Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SA3f7-00018W-Jp
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 19:20:01 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 533F32FD9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 14:11:04 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Mar 2012 11:10:59 -0700
Message-Id: <cover.1332266918.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 533F32FD9D.C799A
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] openssl security upgrade
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
X-List-Received-Date: Tue, 20 Mar 2012 18:20:01 -0000

Hello,

This upgrade to the openssl recipe addresses a security vulnerability,
CVE-2012-0884. I would like to ensure it gets included in our upcoming
1.2 release.

This upgrade has been build-tested on all 5 of our qemu architectures,
and I have inspected the image and package output to ensure there were
no significant differences between the output of this recipe upgrade
and the last version of openssl we were using.

Scott

The following changes since commit 5d404fdb36b0535ce758d98408b02134cdbce4ee:

  xserver-kdrive: compile xserver without dtrace support (2012-03-20 15:21:18 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/openssl-upgrade-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/openssl-upgrade-oe

Scott Garman (1):
  openssl: upgrade to 1.0.0.h

 .../openssl/openssl-1.0.0g/debian/pkg-config.patch |   36 --------------------
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
 .../{openssl_1.0.0g.bb => openssl_1.0.0h.bb}       |    5 +--
 18 files changed, 2 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.0g/debian/pkg-config.patch
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/configure-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/debian/c_rehash-compat.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/debian/ca.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/debian/debian-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/debian/make-targets.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/debian/man-dir.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/debian/man-section.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/debian/no-rpath.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/debian/no-symbolic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/debian/pic.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/debian/version-script.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/engines-install-in-libdir-ssl.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/oe-ldflags.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/openssl-fix-link.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/openssl_fix_for_x32.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl-1.0.0g => openssl-1.0.0h}/shared-libs.patch (100%)
 rename meta/recipes-connectivity/openssl/{openssl_1.0.0g.bb => openssl_1.0.0h.bb} (87%)

-- 
1.7.5.4



