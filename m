Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E69C978A70
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Mar 2018 03:25:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Mar 2018 19:25:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,425,1515484800"; d="scan'208";a="179872331"
Received: from chiron.jf.intel.com ([10.7.159.61])
	by orsmga004.jf.intel.com with ESMTP; 04 Mar 2018 19:25:30 -0800
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Mar 2018 19:25:12 -0800
Message-Id: <cover.1520219828.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH 0/6] Enable ptest in additonal perl module recipes
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
X-List-Received-Date: Mon, 05 Mar 2018 03:25:30 -0000

In the prior round, the recipes in recipes-extended/perl were
inadvertantly overlooked. This series adds those additional recipes
and self-assigns maintainership for them.

The libxml-namespacesupport-perl recipe was not ptest enabled, but a
bug was filed for the issue [1].

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=12581

The following changes since commit 3a75f4372ce23b7834a3509ba4fca60b6ddad734:

  libxml-simple-perl: inherit ptest-perl (2018-03-04 04:24:19 -0800)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib timo/ptest-perl-2
  http://cgit.openembedded.org//log/?h=timo/ptest-perl-2

Tim Orling (6):
  libtest-needs-perl (and others): self-assign maintainership
  libconvert-asn1-perl: inherit ptest-perl
  libtimedate-perl: inherit ptest-perl
  libxml-sax-base-perl: inherit ptest-perl
  libxml-sax-perl: inherit ptest-perl
  maintainers.inc: self-assign recipes from recipes-extended/perl

 meta/conf/distro/include/maintainers.inc            | 21 +++++++++++----------
 .../perl/libconvert-asn1-perl_0.27.bb               |  2 +-
 meta/recipes-extended/perl/libtimedate-perl_2.30.bb |  2 +-
 .../perl/libxml-sax-base-perl_1.09.bb               |  2 +-
 meta/recipes-extended/perl/libxml-sax-perl_0.99.bb  |  7 ++++++-
 5 files changed, 20 insertions(+), 14 deletions(-)

-- 
2.14.3


