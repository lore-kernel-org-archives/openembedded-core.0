Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DB29C731C5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 13:04:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Jul 2016 06:03:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,429,1464678000"; d="scan'208";a="1030089824"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jul 2016 06:03:35 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 517AD6A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2016 06:03:24 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2016 16:02:48 +0300
Message-Id: <1469624577-24972-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: package upgrades
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
X-List-Received-Date: Wed, 27 Jul 2016 13:04:08 -0000

Package upgrades as suggested by the automated Recipe upgrade tool (AUH)

Maxin B. John (9):
  connman: upgrade to 1.33
  libsolv: upgrade to 0.6.23
  libtasn1: upgrade to 4.9
  wayland-protocols : upgrade to 1.5
  dropbear: upgrade to 2016.74
  glew: upgrade to 2.0.0
  libgpg-error : upgrade to 1.24
  libassuan: upgrade to 2.4.3
  cmake: upgrade to 3.6.1

 .../connman/{connman_1.32.bb => connman_1.33.bb}                   | 4 ++--
 meta/recipes-core/dropbear/dropbear_2016.73.bb                     | 7 -------
 meta/recipes-core/dropbear/dropbear_2016.74.bb                     | 7 +++++++
 .../cmake/{cmake-native_3.5.2.bb => cmake-native_3.6.1.bb}         | 0
 meta/recipes-devtools/cmake/cmake.inc                              | 4 ++--
 meta/recipes-devtools/cmake/{cmake_3.5.2.bb => cmake_3.6.1.bb}     | 0
 .../libsolv/{libsolv_0.6.22.bb => libsolv_0.6.23.bb}               | 2 +-
 meta/recipes-graphics/glew/{glew_1.13.0.bb => glew_2.0.0.bb}       | 4 ++--
 .../wayland/{wayland-protocols_1.4.bb => wayland-protocols_1.5.bb} | 4 ++--
 meta/recipes-support/gnutls/{libtasn1_4.8.bb => libtasn1_4.9.bb}   | 4 ++--
 .../libassuan/{libassuan_2.4.2.bb => libassuan_2.4.3.bb}           | 4 ++--
 .../libgpg-error/{libgpg-error_1.23.bb => libgpg-error_1.24.bb}    | 4 ++--
 12 files changed, 22 insertions(+), 22 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.32.bb => connman_1.33.bb} (76%)
 delete mode 100644 meta/recipes-core/dropbear/dropbear_2016.73.bb
 create mode 100644 meta/recipes-core/dropbear/dropbear_2016.74.bb
 rename meta/recipes-devtools/cmake/{cmake-native_3.5.2.bb => cmake-native_3.6.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.5.2.bb => cmake_3.6.1.bb} (100%)
 rename meta/recipes-extended/libsolv/{libsolv_0.6.22.bb => libsolv_0.6.23.bb} (93%)
 rename meta/recipes-graphics/glew/{glew_1.13.0.bb => glew_2.0.0.bb} (90%)
 rename meta/recipes-graphics/wayland/{wayland-protocols_1.4.bb => wayland-protocols_1.5.bb} (85%)
 rename meta/recipes-support/gnutls/{libtasn1_4.8.bb => libtasn1_4.9.bb} (81%)
 rename meta/recipes-support/libassuan/{libassuan_2.4.2.bb => libassuan_2.4.3.bb} (87%)
 rename meta/recipes-support/libgpg-error/{libgpg-error_1.23.bb => libgpg-error_1.24.bb} (92%)

-- 
2.4.0


