Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 84B6E71144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 19:36:13 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jan 2015 11:30:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="443320754"
Received: from unknown (HELO swold-mobl5.amr.corp.intel.com) ([10.252.252.118])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Jan 2015 11:17:12 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Jan 2015 11:30:22 -0800
Message-Id: <1421868625-22382-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/3] Updates and a bug fix
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
X-List-Received-Date: Wed, 21 Jan 2015 19:36:22 -0000

Richard,

This has a couple of updates and a bugfix.

Sau!

Pascal Bach (1):
  base-passwd: Don't replace $ variables in passwd and group files

Saul Wold (2):
  mkfontscale: Upgrade to 1.1.2
  build-appliance-image: Upgrade for 1.8 Master

 meta/recipes-core/base-passwd/base-passwd_3.5.29.bb                   | 4 ++--
 .../{build-appliance-image_8.0.bb => build-appliance-image_12.0.1.bb} | 4 ++--
 .../xorg-app/{mkfontscale_1.1.1.bb => mkfontscale_1.1.2.bb}           | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-core/images/{build-appliance-image_8.0.bb => build-appliance-image_12.0.1.bb} (96%)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.1.1.bb => mkfontscale_1.1.2.bb} (80%)

-- 
2.1.0


