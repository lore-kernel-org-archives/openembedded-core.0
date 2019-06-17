Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 5FCA87E7DE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 22:12:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jun 2019 15:12:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,386,1557212400"; d="scan'208";a="185891237"
Received: from chiron.jf.intel.com ([10.54.74.38])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2019 15:12:00 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jun 2019 15:11:39 -0700
Message-Id: <cover.1560809373.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 0/4] perl updates, fixes and libmodule-buil-perl
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
X-List-Received-Date: Mon, 17 Jun 2019 22:12:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Many perl dependency fixes uncovered in libmodule-build-perl ptest and
  meta-perl maintenance.
* Update libxml-sax-perl from 1.00 -> 1.02
* Import libmodule-build-perl from meta-perl for cpan_build.bbclass
  support [YOCTO #12873]
* Upgrade libmodule-build-perl from 0.4224 -> 0.4229 and enable ptest
  - Some of the tests (9) for libmodule-build-perl are failing, but the
    reason
    or solution is elusive (missing "build_params" and missing type
    definitions for XS). A handful are known failures upstream.
  - The ptest enablement was a substantial effort (pushing 40 hours) but
    I was not willing to move it without said enablement.

The following changes since commit 27d60c5a812774f0e5c43161e5b514c4aebdf301:

  gstreamer1.0-libav: disable API documentation (2019-06-15 13:46:38 +0100)

are available in the Git repository at:

  git://push.yoctoproject.org/poky-contrib timo/perl-updates-12873

Tim Orling (4):
  perl-rdepends.txt: more ptest dependencies fixes
  libxml-sax-perl: upgrade 1.00 -> 1.02
  libmodule-build-perl: move from meta-perl
  libmodule-build-perl: upgrade 0.4224 -> 0.4229; enable ptest

 meta/conf/distro/include/maintainers.inc      |   1 +
 .../perl-sanity/files/perl-rdepends.txt       |  48 ++++++++
 .../perl/libmodule-build-perl/run-ptest       |  16 +++
 .../perl/libmodule-build-perl_0.4229.bb       | 103 ++++++++++++++++++
 ...x-perl_1.00.bb => libxml-sax-perl_1.02.bb} |  13 ++-
 5 files changed, 178 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/libmodule-build-perl/run-ptest
 create mode 100644 meta/recipes-devtools/perl/libmodule-build-perl_0.4229.bb
 rename meta/recipes-extended/perl/{libxml-sax-perl_1.00.bb => libxml-sax-perl_1.02.bb} (79%)

-- 
2.20.1


