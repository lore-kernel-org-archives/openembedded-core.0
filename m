Return-Path: <amarnath.valluri@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 100B372F24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 11:32:20 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jun 2017 04:32:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,340,1493708400"; d="scan'208";a="980709641"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga003.jf.intel.com with ESMTP; 14 Jun 2017 04:32:20 -0700
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 14:30:41 +0300
Message-Id: <1497439848-29967-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v4 0/7] Fix for #7040 - Support for /usr merge
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
X-List-Received-Date: Wed, 14 Jun 2017 11:32:21 -0000

Changes in v4:
    - root symlinks creation for nativesdk images.
    - added PACKAGECONFIG option for 'usrmerge' in systemd

Amarnath Valluri (7):
  bitbake.conf: support for merged usr with DISTRO_FEATURE usrmerge
  cross.bbclass: merged /usr support
  systemd: changes to support merged /usr
  image: create symlinks needed for merged /usr
  insane.bbclass: Add package QA check for merged /usr.
  meta/lib/oe/sdk.py: support added for executing pre-target commands
  image.bbclass: create root symlinks in nativesdk target sysroot

 meta/classes/cross.bbclass               |  2 +-
 meta/classes/image.bbclass               | 32 ++++++++++++++++++++++++++++++++
 meta/classes/insane.bbclass              | 16 ++++++++++++++++
 meta/classes/populate_sdk_base.bbclass   |  3 +--
 meta/conf/bitbake.conf                   | 10 ++++++----
 meta/lib/oe/sdk.py                       |  6 ++++++
 meta/recipes-core/systemd/systemd_232.bb |  8 ++++----
 7 files changed, 66 insertions(+), 11 deletions(-)

-- 
2.7.4


