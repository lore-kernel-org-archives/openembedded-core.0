Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8183960110
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 13:23:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jan 2016 05:23:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,557,1444719600"; d="scan'208";a="888877460"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 12 Jan 2016 05:23:14 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jan 2016 15:20:23 +0200
Message-Id: <cover.1452604534.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH 0/5] Version updates
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
X-List-Received-Date: Tue, 12 Jan 2016 13:23:14 -0000

A few small updates for recipes where I'm the maintainer.
The following changes since commit 447634b64d0e948ba152d81372dfbe1dfd3f619b:

  nss: update to 3.21 (2016-01-12 14:55:27 +0200)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/package-version-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alexander Kanavin (5):
  libwebp: upgrade to 0.5.0
  lighttpd: upgrade to 1.4.39
  iso-codes: upgrade to 3.64
  epiphany: upgrade to 3.18.3
  ca-certificates: update to 20160104

 .../lighttpd/{lighttpd_1.4.38.bb => lighttpd_1.4.39.bb}              | 4 ++--
 .../epiphany/{epiphany_3.18.2.bb => epiphany_3.18.3.bb}              | 4 ++--
 meta/recipes-multimedia/webp/{libwebp_0.4.4.bb => libwebp_0.5.0.bb}  | 4 ++--
 .../{ca-certificates_20150426.bb => ca-certificates_20160104.bb}     | 5 ++---
 .../iso-codes/{iso-codes_3.63.bb => iso-codes_3.64.bb}               | 4 ++--
 5 files changed, 10 insertions(+), 11 deletions(-)
 rename meta/recipes-extended/lighttpd/{lighttpd_1.4.38.bb => lighttpd_1.4.39.bb} (94%)
 rename meta/recipes-gnome/epiphany/{epiphany_3.18.2.bb => epiphany_3.18.3.bb} (84%)
 rename meta/recipes-multimedia/webp/{libwebp_0.4.4.bb => libwebp_0.5.0.bb} (92%)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20150426.bb => ca-certificates_20160104.bb} (93%)
 rename meta/recipes-support/iso-codes/{iso-codes_3.63.bb => iso-codes_3.64.bb} (76%)

-- 
2.6.4


