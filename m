Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E79777459B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 10:25:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Aug 2018 03:25:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,273,1531810800"; d="scan'208";a="67209823"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga008.jf.intel.com with ESMTP; 22 Aug 2018 03:25:29 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 0A0645802C8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 03:25:28 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 13:27:19 +0300
Message-Id: <1534933645-30369-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 0/6] package upgrades
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
X-List-Received-Date: Wed, 22 Aug 2018 10:25:29 -0000

Upgrades provided by Automated Upgrade Helper

Maxin B. John (6):
  harfbuzz: upgrade 1.8.4 -> 1.8.8
  pkgconf: upgrade 1.4.2 -> 1.5.3
  libatomic-ops: upgrade 7.6.4 -> 7.6.6
  libpng: upgrade 1.6.34 -> 1.6.35
  acpid: upgrade 2.0.29 -> 2.0.30
  libinput: upgrade 1.11.2 -> 1.11.3

 meta/recipes-bsp/acpid/{acpid_2.0.29.bb => acpid_2.0.30.bb}      | 4 ++--
 .../pkgconf/{pkgconf_1.4.2.bb => pkgconf_1.5.3.bb}               | 4 ++--
 .../harfbuzz/{harfbuzz_1.8.4.bb => harfbuzz_1.8.8.bb}            | 4 ++--
 .../wayland/{libinput_1.11.2.bb => libinput_1.11.3.bb}           | 4 ++--
 .../libpng/{libpng_1.6.34.bb => libpng_1.6.35.bb}                | 9 +++++----
 .../{libatomic-ops_7.6.4.bb => libatomic-ops_7.6.6.bb}           | 6 +++---
 6 files changed, 16 insertions(+), 15 deletions(-)
 rename meta/recipes-bsp/acpid/{acpid_2.0.29.bb => acpid_2.0.30.bb} (55%)
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.4.2.bb => pkgconf_1.5.3.bb} (95%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_1.8.4.bb => harfbuzz_1.8.8.bb} (88%)
 rename meta/recipes-graphics/wayland/{libinput_1.11.2.bb => libinput_1.11.3.bb} (86%)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.34.bb => libpng_1.6.35.bb} (72%)
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.6.4.bb => libatomic-ops_7.6.6.bb} (76%)

-- 
2.4.0


