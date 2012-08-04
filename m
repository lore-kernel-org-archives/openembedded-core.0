Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1SxeMk-0002gT-Iw
	for openembedded-core@lists.openembedded.org;
	Sat, 04 Aug 2012 15:26:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q74DEJXr010163
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 4 Aug 2012 06:14:19 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Sat, 4 Aug 2012 06:14:18 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 4 Aug 2012 21:14:07 +0800
Message-ID: <cover.1344085668.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] python: Fix to support the python module _bsddb built with db 5.3
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
X-List-Received-Date: Sat, 04 Aug 2012 13:26:03 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

_bsddb module in python 2.7 could be built only with db version
between 4.1 and 4.7. A patch was added to avoid build warning
about this for [YOCTO #1937] but not actually fixed it.

This patch enable _bsddb module be built with db 5.3, and remove
--disable-statistics from the DB5_CONFIG to fix segmentation fault
when using _bsddb module in python.

[YOCTO #2749]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
The following changes since commit a9d0cbe1d84bb26fc1a1f48764fe514cf9f9c548:

  gcc: Bump PR since there have been several gcc changes and various problems reported and this should flush anything stale out (2012-08-03 10:32:24 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/bug2749_bsddb_0804
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/bug2749_bsddb_0804

Jackie Huang (1):
  python: Fix to support the python module _bsddb built with db 5.3

 .../python/python/avoid_warning_about_bsddb.patch  |   23 -
 .../python/python-2.7.3-berkeley-db-5.3.patch      | 1570 ++++++++++++++++++++
 .../python/python-2.7.3-remove-bsdb-rpath.patch    |   22 +
 meta/recipes-devtools/python/python_2.7.3.bb       |    5 +-
 meta/recipes-support/db/db_5.3.15.bb               |    4 +-
 5 files changed, 1597 insertions(+), 27 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python/avoid_warning_about_bsddb.patch
 create mode 100644 meta/recipes-devtools/python/python/python-2.7.3-berkeley-db-5.3.patch
 create mode 100644 meta/recipes-devtools/python/python/python-2.7.3-remove-bsdb-rpath.patch

-- 
1.7.4



