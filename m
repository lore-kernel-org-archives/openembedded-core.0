Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UW2pO-0003VS-OG
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Apr 2013 12:58:05 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3RAeFpI016436
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Apr 2013 03:40:15 -0700 (PDT)
Received: from pek-hjia-d1.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Sat, 27 Apr 2013 03:40:15 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 27 Apr 2013 18:40:04 +0800
Message-ID: <cover.1367052630.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/2]fix default dictionary should be generated for target endianness
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
X-List-Received-Date: Sat, 27 Apr 2013 10:58:06 -0000
X-List-Received-Date: Sat, 27 Apr 2013 10:58:06 -0000
Content-Type: text/plain

The following changes since commit addcfcda84ed6b43b00f569a6060e3b78196ef52:

  glib-2.0: disable tests for native builds, and respect ptest for LSB (2013-04-23 13:00:43 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-cracklib
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-cracklib

Hongxu Jia (2):
  cracklib : fix default dictionary should be generated for target
    endianness
  craklib:fix testnum and teststr failed

 ...c-support-dictionary-byte-order-dependent.patch |  322 ++++++++++++++++++++
 ...02-craklib-fix-testnum-and-teststr-failed.patch |   53 ++++
 meta/recipes-extended/cracklib/cracklib_2.8.22.bb  |    4 +-
 3 files changed, 378 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/cracklib/cracklib/0001-packlib.c-support-dictionary-byte-order-dependent.patch
 create mode 100644 meta/recipes-extended/cracklib/cracklib/0002-craklib-fix-testnum-and-teststr-failed.patch

-- 
1.7.10.4



