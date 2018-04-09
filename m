Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 33D7471BF0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 11:54:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Apr 2018 04:54:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,427,1517904000"; d="scan'208";a="32222402"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga008.jf.intel.com with ESMTP; 09 Apr 2018 04:54:44 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 3F78A5803B6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 04:54:44 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Apr 2018 14:55:03 +0300
Message-Id: <1523274911-20401-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 0/8] package upgrades
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
X-List-Received-Date: Mon, 09 Apr 2018 11:54:44 -0000

Package upgrades

Maxin B. John (8):
  libatomic-ops: upgrade to version 7.6.4
  bluez5: upgrade to version 5.49
  libsolv: upgrade to version 0.6.34
  ruby: upgrade to version 2.5.1
  gtk+3: upgrade to version 3.22.29
  gsettings-desktop-schemas: upgrade to version 3.28.0
  puzzles: upgrade to latest commit
  gtk-icon-utils-native: upgrade to version 3.22.29

 meta/recipes-connectivity/bluez5/bluez5.inc                          | 1 +
 meta/recipes-connectivity/bluez5/{bluez5_5.48.bb => bluez5_5.49.bb}  | 5 +++--
 meta/recipes-devtools/ruby/ruby.inc                                  | 2 +-
 meta/recipes-devtools/ruby/{ruby_2.5.0.bb => ruby_2.5.1.bb}          | 4 ++--
 .../libsolv/{libsolv_0.6.33.bb => libsolv_0.6.34.bb}                 | 2 +-
 ...desktop-schemas_3.24.1.bb => gsettings-desktop-schemas_3.28.0.bb} | 4 ++--
 meta/recipes-gnome/gtk+/{gtk+3_3.22.28.bb => gtk+3_3.22.29.bb}       | 4 ++--
 ...icon-utils-native_3.22.28.bb => gtk-icon-utils-native_3.22.29.bb} | 4 ++--
 meta/recipes-sato/puzzles/puzzles_git.bb                             | 2 +-
 .../libatomic-ops/{libatomic-ops_7.6.2.bb => libatomic-ops_7.6.4.bb} | 2 +-
 10 files changed, 16 insertions(+), 14 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.48.bb => bluez5_5.49.bb} (87%)
 rename meta/recipes-devtools/ruby/{ruby_2.5.0.bb => ruby_2.5.1.bb} (90%)
 rename meta/recipes-extended/libsolv/{libsolv_0.6.33.bb => libsolv_0.6.34.bb} (94%)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_3.24.1.bb => gsettings-desktop-schemas_3.28.0.bb} (70%)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.22.28.bb => gtk+3_3.22.29.bb} (83%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.22.28.bb => gtk-icon-utils-native_3.22.29.bb} (94%)
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.6.2.bb => libatomic-ops_7.6.4.bb} (91%)

-- 
2.4.0


