Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EE542770A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 15:03:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 Oct 2015 08:03:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,681,1437462000"; d="scan'208";a="810876296"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2015 08:01:02 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Oct 2015 18:00:59 +0300
Message-Id: <1444834861-19459-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/2] Implement GPG_PATH variable
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
X-List-Received-Date: Wed, 14 Oct 2015 15:03:01 -0000

This optional setting makes it possible to specify a non-default gpg home
directory in the bitbake configuration.

[YOCTO #8134]

The following changes since commit e42d8eff9eed7d1454b4f331d96dcee6dea232df:

  bash: Disable custom memory allocator (2015-10-12 14:35:42 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/rpmsign
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/rpmsign

Markus Lehtonen (2):
  sign_rpm.bbclass: introduce GPG_PATH variable
  package_manager: support GPG_PATH variable

 meta/classes/sign_rpm.bbclass  | 4 ++++
 meta/lib/oe/package_manager.py | 7 +++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.1.4


