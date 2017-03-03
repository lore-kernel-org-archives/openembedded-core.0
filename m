Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id CE932776A6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Mar 2017 12:37:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 03 Mar 2017 04:37:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,237,1484035200"; d="scan'208";a="1117999706"
Received: from manuelal-mobl1.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.4.231])
	by fmsmga001.fm.intel.com with ESMTP; 03 Mar 2017 04:37:27 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Mar 2017 14:37:23 +0200
Message-Id: <1488544647-31325-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [morty][PATCH 0/4] rpm signing fixes
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
X-List-Received-Date: Fri, 03 Mar 2017 12:37:27 -0000

This patchset backports two fixes to gpg signing of rpm packages. The first
patch fixes signing of packages with a large amount of subpackages (e.g.
glibc-locale). The last three patches makes rpm package signing possible with
gpg version > 2.1.


The following changes since commit 55c835c73cc41b6fc809c941c295d62a612e49e0:

  build-appliance-image: Update to morty head revision (2017-02-08 12:00:29 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/morty
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/morty


Markus Lehtonen (4):
  lib/oe/gpg_sign: sign rpm packages in chunks of 100
  rpm: support customizing gpg command line
  lib/oe/gpg_sign: make gpg version a property of the signer
  lib/oe/gpg_sign: fix rpm signing with gpg > 2.1

 meta/lib/oe/gpg_sign.py                            | 21 ++++++-----
 .../0001-macros-add-_gpg_sign_cmd_extra_args.patch | 43 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |  1 +
 3 files changed, 56 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/0001-macros-add-_gpg_sign_cmd_extra_args.patch

-- 
2.6.6


