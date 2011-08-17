Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1QtgGj-0000Ok-8j
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 15:34:53 +0200
Received: from localhost (193.235.91.228) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.137.0; Wed, 17 Aug 2011
	15:30:12 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Aug 2011 15:30:17 +0200
Message-ID: <cover.1313587776.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 0/2] Make qemu & runqemu detect libgl on Debian
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
X-List-Received-Date: Wed, 17 Aug 2011 13:34:53 -0000
Content-Type: text/plain


Modify the patches to make qemu-native compile and run on Ubuntu 11.10, to use
a wildcard match instead of `uname -i`. The latter only returns unknown on
e.g. Debian.

These patches are similar to what we did for perl-native in the
Configure-multilib.patch (commit id 9260c1b9d04a88d15ab5376c7cd56f381fe3e53b
in oe-core).

The following changes since commit 13db5f420ca9bff98561f80d78958278734ad1f4:

  distro-tracking: Update info for gpgme, libassuan, apr... after last upgrade. (2011-08-15 15:26:04 +0100)

are available in the git repository at:
  git://github.com/darander/oe-core qemu-native
  https://github.com/darander/oe-core/tree/qemu-native

Anders Darander (2):
  qemu: modify search paths for libgl
  scripts/runqemu: modify search paths for libgl

 meta/recipes-devtools/qemu/qemu.inc |    2 +-
 scripts/runqemu                     |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.5.4



