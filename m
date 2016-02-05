Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 92437772FD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 14:00:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Feb 2016 06:00:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,400,1449561600"; d="scan'208";a="906234823"
Received: from mwoodwar-mobl8.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.19.30])
	by orsmga002.jf.intel.com with ESMTP; 05 Feb 2016 06:00:26 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 16:00:21 +0200
Message-Id: <1454680824-26075-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH 0/3] signing: enhance sanity checking
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
X-List-Received-Date: Fri, 05 Feb 2016 14:00:29 -0000

This patchset contains that should make sanity checking of rpm and package feed
signing more sane.


The following changes since commit 11a6227759515da433230eb44eca1a4cb2ac3b14:

  e2fsprogs: Ensure we use the right mke2fs.conf when restoring from sstate (2016-02-05 11:16:20 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/rpmsign

for you to fetch changes up to 643834ad064be34e2ad4218b436420cd5a1bc520:

  package signing: do sanity checking in an event handler (2016-02-05 15:32:29 +0200)


Markus Lehtonen (3):
  package signing: do actual sanity checking in the signer class
  oe/gpg_sign: check for python-pexpect when using local signing
  package signing: do sanity checking in an event handler

 meta/classes/sign_package_feed.bbclass | 22 +++++++++++++++++-----
 meta/classes/sign_rpm.bbclass          | 22 +++++++++++++++++-----
 meta/lib/oe/gpg_sign.py                | 26 ++++++++++++++++++++++----
 3 files changed, 56 insertions(+), 14 deletions(-)

-- 
2.6.2


