Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 70FBD72819
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Dec 2014 14:51:36 +0000 (UTC)
Received: from localhost.localdomain (unknown [78.10.193.111])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 00F0D103587;
	Thu, 18 Dec 2014 15:51:34 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: openembedded-core@lists.openembedded.org,
	Magnus Olsson <magnus@minimum.se>, Matt Fleming <matt.fleming@intel.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 18 Dec 2014 15:51:20 +0100
Message-Id: <1418914282-18186-1-git-send-email-maciej.borzecki@open-rnd.pl>
X-Mailer: git-send-email 1.9.3
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: [PATCH 0/2] python: use stdlib argparse
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
X-List-Received-Date: Thu, 18 Dec 2014 14:51:42 -0000

Since Python 2.7 release, argparse is distributed in Python Standard
Library. Since Python < 2.7 is not available in Yocto, the external
argparse module is not needed anymore.

The first patch removes the external python-argparse recipe.

The second patch adds a module under the same name as before, but
built from Python stdlib. The version of new module matches that of
the Python release. Hence, there should be a clean upgrade path from
the old module.

Maciej Borzecki (2):
  python-argparse: remove external argparse module
  python-2.7-manifest.inc: add stdlib argparse module

 meta/recipes-devtools/python/python-2.7-manifest.inc  | 12 ++++++++----
 meta/recipes-devtools/python/python-argparse_1.2.1.bb | 17 -----------------
 scripts/contrib/python/generate-manifest-2.7.py       |  5 ++++-
 3 files changed, 12 insertions(+), 22 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-argparse_1.2.1.bb

-- 
1.9.3


