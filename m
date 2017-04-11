Return-Path: <jussi.kukkonen@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3BFFD77C04
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 14:35:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 11 Apr 2017 07:35:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,185,1488873600"; d="scan'208";a="72575837"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 11 Apr 2017 07:35:36 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id C04B56A4006;
	Tue, 11 Apr 2017 07:35:26 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Apr 2017 17:35:29 +0300
Message-Id: <cover.1491920909.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCHv3 0/1] Use fixed DISTRO_FEATURES for native
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
X-List-Received-Date: Tue, 11 Apr 2017 14:35:43 -0000

Avoid signifant native task churn when DISTRO_FEATURES is changed
by defining (almost) fixed DISTRO_FEATURES for native recipes.

Add DISTRO_FEATURES_FILTER_NATIVE and DISTRO_FEATURES_NATIVE to
limit the changes to DISTRO_FEATURES when building native recipes.


Changes since V3:
* Use both DISTRO_FEATURES_FILTER_NATIVE (from v2) and
  DISTRO_FEATURES_NATIVE (from v1): see commit message for details
* Do the same thing for nativesdk
* Remove the x11 patches and solve the problem by always adding
  x11 to DISTRO_FEATURES_NATIVE and DISTRO_FEATURES_NATIVESDK
  (so it's used even when target DISTRO_FEATURES does not have it)


Thanks,
  Jussi

The following changes since commit 0793c758b15e5007b4dd4b146987a0e74d6f6cba:

  Revert "staging: Fix sysroot problem with populate_sysroot dependencies on do_fetch" (2017-04-11 00:57:03 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/native-distro-features
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/native-distro-features

Jussi Kukkonen (1):
  native/nativesdk: Use fixed DISTRO_FEATURES

 meta/classes/native.bbclass    | 14 ++++++++++----
 meta/classes/nativesdk.bbclass |  6 ++++++
 meta/conf/bitbake.conf         |  9 +++++++++
 3 files changed, 25 insertions(+), 4 deletions(-)

-- 
2.1.4


