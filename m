Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8F7F665CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 11:15:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Apr 2015 04:15:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,676,1422950400"; d="scan'208";a="703233102"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga001.fm.intel.com with ESMTP; 30 Apr 2015 04:15:18 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Apr 2015 14:14:55 +0300
Message-Id: <cover.1430379963.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] gnutls upgrades
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
X-List-Received-Date: Thu, 30 Apr 2015 11:15:21 -0000

The following changes since commit db409697db2ea0931cdcd2015d089b6b0ea39bbb:

  bitbake: bitbake: reset build mtime cache before the build (2015-04-29 10:59:54 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/gnutls
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/gnutls

Jussi Kukkonen (2):
  gnutls: Upgrade 3.3.12 -> 3.3.14
  libtasn1: Upgrade 4.0 -> 4.5

 .../gnutls/{gnutls_3.3.12.bb => gnutls_3.3.14.bb}  |  4 ++--
 .../libtasn1/libtasn1_fix_for_automake_1.12.patch  | 28 ----------------------
 .../gnutls/{libtasn1_4.0.bb => libtasn1_4.5.bb}    |  5 ++--
 3 files changed, 4 insertions(+), 33 deletions(-)
 rename meta/recipes-support/gnutls/{gnutls_3.3.12.bb => gnutls_3.3.14.bb} (51%)
 delete mode 100644 meta/recipes-support/gnutls/libtasn1/libtasn1_fix_for_automake_1.12.patch
 rename meta/recipes-support/gnutls/{libtasn1_4.0.bb => libtasn1_4.5.bb} (75%)

-- 
2.1.4


