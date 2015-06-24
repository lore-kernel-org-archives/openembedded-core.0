Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4BF2560232
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 20:04:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 24 Jun 2015 13:04:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,673,1427785200"; d="scan'208";a="752621107"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 24 Jun 2015 13:04:23 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jun 2015 23:04:57 +0300
Message-Id: <cover.1435174534.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/1][fido][dizzy] dbus: Fix CVE-2015-0245
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
X-List-Received-Date: Wed, 24 Jun 2015 20:04:26 -0000

This is for fido and possibly dizzy, not master.

D-Bus 1.8.16 fixes CVE-2015-0245 "prevent forged ActivationFailure from
non-root processes". This patch does not contain the same fix but a
configuration change that upstream suggests as a easily backportable
fix.

The issue is only a local denial of service so not terribly dangerous,
but should be worth fixing since the patch is not intrusive.

I've only tested this on fido, so the [dizzy] is just a suggestion.

Cheers, Jussi



The following changes since commit eb4a134a60e3ac26a48379675ad6346a44010339:

  scripts/combo-layer: Fix exit codes and tty handling (2015-06-11 15:00:20 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/dbus-fix-for-fido
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/dbus-fix-for-fido

Jussi Kukkonen (1):
  dbus: CVE-2015-0245: prevent forged ActivationFailure

 meta/recipes-core/dbus/dbus.inc                    |  1 +
 ...015-0245-prevent-forged-ActivationFailure.patch | 48 ++++++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-core/dbus/dbus/CVE-2015-0245-prevent-forged-ActivationFailure.patch

-- 
2.1.4


