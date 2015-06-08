Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CAA2F734D2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jun 2015 20:57:14 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Jun 2015 13:57:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,575,1427785200"; d="scan'208";a="723384652"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jun 2015 13:57:15 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Jun 2015 13:56:05 +0000
Message-Id: <cover.1433771147.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/2][dizzy] python-nose and python-contextlib backports to dizzy
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
X-List-Received-Date: Mon, 08 Jun 2015 20:57:16 -0000

I would like to backport both python-nose and python-contextlib to dizzy, they were
added to master in the following commits respectively:


http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=7282635343e0ccf7a82ffdb35905bdc2db6093d3
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=7f58a85337a0712802bdb604a58985a8800b6477

I would like to include python-scipy, and these are build dependencies for it, 
more specifically for iot builds which currently use the dizzy branch

The following changes since commit 9c4ff467f66428488b1cd9798066a8cb5d6b4c3b:

  split_and_strip_files: regroup hardlinks to make build deterministic (2015-05-15 18:13:40 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib hsalejandro/iot_backports
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=hsalejandro/iot_backports

Alejandro Hernandez (2):
  python-contextlib: backport to dizzy
  python-nose: backport it to dizzy

 meta/recipes-devtools/python/python-2.7-manifest.inc | 10 +++++++---
 meta/recipes-devtools/python/python-nose_1.3.6.bb    | 16 ++++++++++++++++
 scripts/contrib/python/generate-manifest-2.7.py      |  3 +++
 3 files changed, 26 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-nose_1.3.6.bb

-- 
1.8.4.5


