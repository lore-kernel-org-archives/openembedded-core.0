Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QlpH9-0007HB-2t
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 23:34:51 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6QLUZNu028029
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 14:30:36 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 26 Jul 2011 14:30:35 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jul 2011 16:31:01 -0500
Message-ID: <cover.1311715727.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [v2 PATCH 0/8] Number of multilib related fixes
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
X-List-Received-Date: Tue, 26 Jul 2011 21:34:51 -0000
Content-Type: text/plain

Fix a number of multilib issues include IA32 eglibc header generation,
misc header conflicts and ncurses man page collisions.

This is v2 of the patch set, original was sent by Richard.

The following changes since commit dad2169cfb331b7af5c6d380347ea279a59bd716:

  classes/image_types: IMAGE_TYPES was missing some entries (2011-07-26 15:52:40 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/ml_fixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/ml_fixes

Mark Hatle (8):
  multilib_header.bbclass: Add oe_multilib_header wrapper
  binutils: Fix multilib header conflict - bfd.h
  apr: Fix multilib header conflict - apr.h
  beecrypt: Fix multilib header conflict - beecrypt/gnu.h
  linux-libc-headers: Fix file conflict -- ..install.cmd
  eglibc_2.13: Resolve multilib header conflicts
  ncurses: Resolve header and man page multilib conflicts
  package.bbclass: fixup_perms - change symlink processing

 meta/classes/multilib_header.bbclass               |   29 ++++++
 meta/classes/package.bbclass                       |   10 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |    4 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb            |   91 ++++++++++++++++++++
 meta/recipes-core/ncurses/ncurses.inc              |    7 +-
 meta/recipes-devtools/binutils/binutils.inc        |    4 +-
 meta/recipes-devtools/binutils/binutils_2.21.1.bb  |    2 +-
 .../linux-libc-headers-yocto_git.bb                |    5 +-
 .../linux-libc-headers_2.6.37.2.bb                 |    5 +-
 .../linux-libc-headers_2.6.39.bb                   |    5 +
 meta/recipes-support/apr/apr_1.4.2.bb              |    8 ++-
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb    |    8 ++-
 scripts/multilib_header_wrapper.h                  |   55 ++++++++++++
 13 files changed, 217 insertions(+), 16 deletions(-)
 create mode 100644 meta/classes/multilib_header.bbclass
 create mode 100644 scripts/multilib_header_wrapper.h

-- 
1.7.3.4



