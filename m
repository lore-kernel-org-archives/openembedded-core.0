Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8818676B7C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 11:18:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2015 04:18:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,415,1437462000"; d="scan'208";a="791218508"
Received: from unknown (HELO marquiz.fi.intel.com) ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 26 Aug 2015 04:18:34 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2015 14:18:31 +0300
Message-Id: <1440587914-1280-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/3] Sign packages in RPM feeds
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
X-List-Received-Date: Wed, 26 Aug 2015 11:18:36 -0000

Implement simple scheme of signing RPM packages and RPM package feeds locally
in the builder host. RPM package signing is implemented in a new bbclass. This
could be extended/replaced to enable more sophisticated schemes like using a
signing server.

[YOCTO #8134]

Markus Lehtonen (3):
  package_rpm: support signing of rpm packages
  os-release: add the public package-signing key
  package_manager: support for signed RPM package feeds

 meta/classes/package_rpm.bbclass           |  5 +++
 meta/classes/sign_rpm.bbclass              | 58 ++++++++++++++++++++++++++++++
 meta/lib/oe/package_manager.py             | 48 +++++++++++++++++++++++++
 meta/recipes-core/os-release/os-release.bb |  9 +++++
 4 files changed, 120 insertions(+)
 create mode 100644 meta/classes/sign_rpm.bbclass

-- 
2.1.4


