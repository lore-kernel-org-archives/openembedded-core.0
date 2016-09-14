Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 87B3477028
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2016 08:46:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 14 Sep 2016 01:46:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,333,1470726000"; d="scan'208";a="760546922"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Sep 2016 01:46:07 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2016 11:46:05 +0300
Message-Id: <1473842766-27585-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH v2] python-smartpm: use md5 as the digest for rpm_sys channel
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
X-List-Received-Date: Wed, 14 Sep 2016 08:46:07 -0000

When reading smartpm sources more closely I found out that it has an internal
utility function for doing file hashes. It does hashing in a more memory
efficient way, processing the file in chunks. Thus, it is better to use it
instead of blindly reading the whole file into memory as v1 of this patch did.

Markus Lehtonen (1):
  python-smartpm: use md5 as the digest for rpm_sys channel

 ...m_sys-use-md5sum-instead-of-mtime-as-the-.patch | 38 ++++++++++++++++++++++
 meta/recipes-devtools/python/python-smartpm_git.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/channels-rpm_sys-use-md5sum-instead-of-mtime-as-the-.patch

-- 
2.6.6


