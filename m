Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 984666ABDA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 06:11:53 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 08 Jun 2014 23:11:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="352278455"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.194])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Jun 2014 23:08:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Jun 2014 23:11:53 -0700
Message-Id: <cover.1402294153.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [Daisy - Update 00/15] Updates and CVEs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jun 2014 06:12:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Richard,

This is a set of patches that has been through the AB and tested locally

Please review and update the daisy branch.

Thanks
	Sau!


The following changes since commit ca2773b19db4881abe5244c373d94ff05cd2684f:

  gnutls: patch for CVE-2014-3466 backported (2014-06-06 10:26:56 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/daisy
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/daisy

Chen Qi (2):
  update-rc.d: fix to handle priority numbers correctly
  systemd: update a uclibc specific patch to avoid segment fault

Cristian Iorga (1):
  v86d: fix for SeaBIOS VGA BIOS compatibility

Dan McGregor (1):
  gzip: Avoid host contamination during build

João Henrique Ferreira de Freitas (1):
  combo-layer: fix revlist taking into account file_filter

Khem Raj (2):
  eglibc: Fix configure when re-building with gold
  x264: Update SRCREV to match commit in upstream git repo

Richard Purdie (4):
  classextend: Fix crosssdk remapping for multilib
  libfm: Ensure m4 directory exists
  sanity.bbclass: Add libsdl-native check
  image_types: Fix ubi filesystem return codes

Roy Li (1):
  openssl: add openssl-CVE-2010-5298.patch SRC_URI

Saul Wold (2):
  util-linux: add sulogin to alternatives list
  update-rc.d/useradd: Add additional dependecies

Trevor Woerner (1):
  grub_git: fix build warning->error

 meta/classes/image_types.bbclass                   |     3 +-
 meta/classes/sanity.bbclass                        |     4 +
 meta/classes/update-rc.d.bbclass                   |     2 +
 meta/classes/useradd.bbclass                       |     2 +-
 meta/lib/oe/classextend.py                         |     2 +
 .../grub/grub/asciih-fix-build-warning-error.patch |    34 +
 meta/recipes-bsp/grub/grub_git.bb                  |     1 +
 .../v86d/v86d/Update-x86emu-from-X.org.patch       | 21766 +++++++++++++++++++
 meta/recipes-bsp/v86d/v86d_0.1.10.bb               |     3 +-
 .../openssl-CVE-2010-5298.patch                    |     0
 .../recipes-connectivity/openssl/openssl_1.0.1g.bb |     1 +
 .../eglibc/eglibc-2.19/grok_gold.patch             |    34 +
 meta/recipes-core/eglibc/eglibc_2.19.bb            |     3 +-
 .../systemd/systemd-pam-fix-fallocate.patch        |    57 +-
 .../fix-to-handle-priority-numbers-correctly.patch |    28 +
 meta/recipes-core/update-rc.d/update-rc.d_0.7.bb   |     1 +
 meta/recipes-core/util-linux/util-linux.inc        |     5 +-
 meta/recipes-extended/gzip/gzip.inc                |     2 +
 meta/recipes-multimedia/x264/x264_git.bb           |     2 +-
 meta/recipes-support/libfm/libfm_1.1.2.2.bb        |     2 +
 scripts/combo-layer                                |     2 +-
 21 files changed, 21922 insertions(+), 32 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/grub/asciih-fix-build-warning-error.patch
 create mode 100644 meta/recipes-bsp/v86d/v86d/Update-x86emu-from-X.org.patch
 rename meta/recipes-connectivity/openssl/{openssl-1.0.1e => openssl}/openssl-CVE-2010-5298.patch (100%)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.19/grok_gold.patch
 create mode 100644 meta/recipes-core/update-rc.d/update-rc.d/fix-to-handle-priority-numbers-correctly.patch

-- 
1.8.3.1


