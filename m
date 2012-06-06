Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1ScHgI-0002GA-WE
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 16:57:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q56ElPov018010
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jun 2012 07:47:25 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 6 Jun 2012 07:47:25 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jun 2012 09:53:11 -0500
Message-ID: <cover.1338994308.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/6] Misc package fixes
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
X-List-Received-Date: Wed, 06 Jun 2012 14:57:58 -0000
Content-Type: text/plain

A small collection of misc package fixes...

The following changes since commit f8a054aca9962ebfd4c74fc1d34cd684de6b3568:

  perl: Allow perl to cross build and native build in a directory named "t" (2012-06-05 23:02:20 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/misc
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/misc

Jesse Zhang (1):
  beecrypt: disable java

Joe Slater (2):
  shared-mime-info: fix build race condition
  gettext: install libgettextlib.a before removing it

Mark Hatle (2):
  shadow-native: Disable nscd support
  insane.bbclass: Make ldd exec_prefix error reporting easier to read

Song.Li (1):
  groff: Fix build on Fedora 17

 meta/classes/insane.bbclass                        |    9 +++++-
 .../gettext/gettext-0.18.1.1/parallel.patch        |   34 ++++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |    3 +-
 meta/recipes-extended/groff/groff_1.20.1.bb        |   24 +++++++++++++-
 .../shadow/shadow-native_4.1.4.3.bb                |    5 ++-
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |    4 +-
 .../shared-mime-info/install-data-hook.patch       |   21 ++++++++++++
 .../shared-mime-info/shared-mime-info_0.91.bb      |    5 ++-
 8 files changed, 96 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-core/gettext/gettext-0.18.1.1/parallel.patch
 create mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info/install-data-hook.patch

-- 
1.7.3.4



