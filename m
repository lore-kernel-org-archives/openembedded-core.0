Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B556B60118
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Dec 2015 14:57:12 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 30 Dec 2015 06:57:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,501,1444719600"; d="scan'208";a="625743356"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Dec 2015 06:57:13 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Dec 2015 06:52:53 +0000
Message-Id: <cover.1451458093.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH 0/1] Rebuild when WICVARS change
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
X-List-Received-Date: Wed, 30 Dec 2015 14:57:13 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This patch adds these WICVARS to vardeps of do_rootfs when
a wic image is build. This will trigger a rebuild when
a variable needed by WIC changes.

The following changes since commit 2cd061a29a94fdcdfec86732e6bcbb71c12c4afc:

  bluez5: include the patch only for 5.36 (2015-12-28 13:02:11 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/bug8693
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/bug8693

Mariano Lopez (1):
  image_types.bbclass: Rebuild when WICVARS change

 meta/classes/image_types.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
1.8.4.5


