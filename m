Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 011A760616
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 02:41:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 01 Dec 2015 18:41:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,371,1444719600"; d="scan'208";a="611016823"
Received: from psverdru-mobl1.amr.corp.intel.com (HELO
	swold-mobl.jf.intel.com) ([10.252.197.212])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Dec 2015 18:41:51 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, liezhi.yang@windriver.com
Date: Tue,  1 Dec 2015 18:41:46 -0800
Message-Id: <1449024109-3476-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/3][jethro] Backport some patches to help meta-intel
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
X-List-Received-Date: Wed, 02 Dec 2015 02:41:52 -0000

Robert / Richard:

Please take these changes recently merged into master into Jethro as 
they affect many platforms.

Thanks
   Sau!


Jussi Kukkonen (1):
  pulseaudio: Fix HDMI profile selection

Ng, Mei Yeen (2):
  init-install-efi: fix script for eMMC installation
  init-install-efi: fix script for gummiboot loader

 .../initrdscripts/files/init-install-efi.sh        |   9 +-
 .../0001-card-add-pa_card_profile.ports.patch      | 245 ++++++++++++++
 ...oth-fail-if-user-requested-profile-doesn-.patch |  60 ++++
 ...-move-profile-selection-after-pa_card_new.patch | 363 +++++++++++++++++++++
 ...vailability-for-some-unavailable-profiles.patch |  75 +++++
 .../pulseaudio/pulseaudio_6.0.bb                   |   4 +
 6 files changed, 752 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-card-add-pa_card_profile.ports.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0002-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0003-card-move-profile-selection-after-pa_card_new.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0004-alsa-set-availability-for-some-unavailable-profiles.patch

-- 
2.5.0


