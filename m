Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CBF6660248
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 03:25:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4O3PhYh022189
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 20:25:43 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 23 May 2016 20:25:43 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 May 2016 20:25:36 -0700
Message-ID: <cover.1464060246.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [PATCH 0/6] remove unneeded python2 recipes
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
X-List-Received-Date: Tue, 24 May 2016 03:25:44 -0000
Content-Type: text/plain

They were required by buildtools-tarball, now replaced by python3 ones.

// Robert

The following changes since commit d6241e4c94a0a72acfc57e96a59918c0b2146d65:

  useradd: Fix infinite build loop (2016-05-23 10:33:39 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/py3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/py3

Robert Yang (6):
  packagegroup-self-hosted.bb: python-git -> python3-git
  python-pexpect: remove it
  python-async: remove it
  python-smmap: remove it
  python-gitdb: remove it
  python-git: remove it

 .../packagegroups/packagegroup-self-hosted.bb      |  2 +-
 meta/recipes-devtools/python/python-async.inc      | 15 -------------
 meta/recipes-devtools/python/python-async_0.6.2.bb |  5 -----
 meta/recipes-devtools/python/python-git.inc        | 21 ------------------
 meta/recipes-devtools/python/python-git_1.0.2.bb   |  8 -------
 meta/recipes-devtools/python/python-gitdb.inc      | 16 --------------
 meta/recipes-devtools/python/python-gitdb_0.6.4.bb |  7 ------
 .../python/python-pexpect_4.0.1.bb                 | 25 ----------------------
 meta/recipes-devtools/python/python-smmap.inc      | 19 ----------------
 meta/recipes-devtools/python/python-smmap_0.9.0.bb |  5 -----
 .../recipes-devtools/python/python3-async_0.6.2.bb | 16 +++++++++++++-
 meta/recipes-devtools/python/python3-git_1.0.2.bb  | 21 +++++++++++++++++-
 .../recipes-devtools/python/python3-gitdb_0.6.4.bb | 17 ++++++++++++++-
 .../recipes-devtools/python/python3-smmap_0.9.0.bb | 20 ++++++++++++++++-
 14 files changed, 71 insertions(+), 126 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-async.inc
 delete mode 100644 meta/recipes-devtools/python/python-async_0.6.2.bb
 delete mode 100644 meta/recipes-devtools/python/python-git.inc
 delete mode 100644 meta/recipes-devtools/python/python-git_1.0.2.bb
 delete mode 100644 meta/recipes-devtools/python/python-gitdb.inc
 delete mode 100644 meta/recipes-devtools/python/python-gitdb_0.6.4.bb
 delete mode 100644 meta/recipes-devtools/python/python-pexpect_4.0.1.bb
 delete mode 100644 meta/recipes-devtools/python/python-smmap.inc
 delete mode 100644 meta/recipes-devtools/python/python-smmap_0.9.0.bb

-- 
2.8.0


