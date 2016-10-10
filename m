Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4DD21719E6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2016 08:34:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 10 Oct 2016 01:34:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,471,1473145200"; d="scan'208";a="770799049"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Oct 2016 01:34:20 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Oct 2016 11:34:17 +0300
Message-Id: <cover.1476087291.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/4] flex & gnutls fixes
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
X-List-Received-Date: Mon, 10 Oct 2016 08:34:21 -0000

Backported cve fixes for flex and gnutls.

Also minor improvement to error handling in depexp.

 - Jussi



The following changes since commit b9d6a7cc234f44e44e5421191924b7463e9c0a9d:

  bitbake: main: Check bitbake server-only port is a number (2016-10-09 12:33:26 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/m4-fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/m4-fixes

Jussi Kukkonen (4):
  gnutls: Backport certificate check fix
  flex: Update upstream check uri
  flex: Backport buffer overflow fix
  depexp: Close UI with error message on NoProvider event

 bitbake/lib/bb/ui/depexp.py                        | 24 +++++++++
 .../recipes-devtools/flex/flex/CVE-2016-6354.patch | 59 ++++++++++++++++++++++
 meta/recipes-devtools/flex/flex_2.6.0.bb           |  3 ++
 .../gnutls/gnutls/CVE-2016-7444.patch              | 35 +++++++++++++
 meta/recipes-support/gnutls/gnutls_3.5.3.bb        |  1 +
 5 files changed, 122 insertions(+)
 create mode 100644 meta/recipes-devtools/flex/flex/CVE-2016-6354.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2016-7444.patch

-- 
2.1.4


