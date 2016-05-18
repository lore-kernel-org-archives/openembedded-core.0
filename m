Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0DE4177047
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 07:43:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4I7hkPm013803
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 00:43:46 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 18 May 2016 00:43:45 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 May 2016 00:43:38 -0700
Message-ID: <cover.1463557068.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [PATCH 0/7][python3] buildtools-tarball: replace python with python3
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
X-List-Received-Date: Wed, 18 May 2016 07:43:46 -0000
Content-Type: text/plain

The following changes since commit 84b11bce72296d04a0e6bc9f18669284017c3704:

  pkgconfig: Update AM_GLIB_GNU_GETTEXT macro (2016-05-17 17:26:05 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/btpy3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/btpy3

Robert Yang (7):
  python3-smmap: add it for python3-gitdb
  python3-async: add it for python3-gitdb
  python3-gitdb: add it for python3-git
  python3-git: add it for buildtools-tarball
  buildtools-tarball: remove nativesdk-python-pexpect
  buildtools-tarball: replace nativesdk-python with nativesdk-python3
  buildtools-tarball: add nativesdk-locale-base-en-us

 meta/recipes-core/meta/buildtools-tarball.bb       | 12 ++++++------
 meta/recipes-devtools/python/python-async.inc      | 15 +++++++++++++++
 meta/recipes-devtools/python/python-async_0.6.2.bb | 16 +---------------
 meta/recipes-devtools/python/python-git.inc        | 21 +++++++++++++++++++++
 meta/recipes-devtools/python/python-git_1.0.2.bb   | 22 ++--------------------
 meta/recipes-devtools/python/python-gitdb.inc      | 16 ++++++++++++++++
 meta/recipes-devtools/python/python-gitdb_0.6.4.bb | 18 ++----------------
 meta/recipes-devtools/python/python-smmap.inc      | 19 +++++++++++++++++++
 meta/recipes-devtools/python/python-smmap_0.9.0.bb | 20 +-------------------
 .../recipes-devtools/python/python3-async_0.6.2.bb |  6 ++++++
 meta/recipes-devtools/python/python3-git_1.0.2.bb  |  7 +++++++
 .../recipes-devtools/python/python3-gitdb_0.6.4.bb |  7 +++++++
 .../recipes-devtools/python/python3-smmap_0.9.0.bb |  5 +++++
 13 files changed, 108 insertions(+), 76 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-async.inc
 create mode 100644 meta/recipes-devtools/python/python-git.inc
 create mode 100644 meta/recipes-devtools/python/python-gitdb.inc
 create mode 100644 meta/recipes-devtools/python/python-smmap.inc
 create mode 100644 meta/recipes-devtools/python/python3-async_0.6.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-git_1.0.2.bb
 create mode 100644 meta/recipes-devtools/python/python3-gitdb_0.6.4.bb
 create mode 100644 meta/recipes-devtools/python/python3-smmap_0.9.0.bb

-- 
2.8.0


