Return-Path: <tanu.kaskinen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EF083601DF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 14:15:48 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 22 May 2015 07:15:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,475,1427785200"; d="scan'208";a="575450701"
Received: from tkkaskin-mobl3.ger.corp.intel.com (HELO
	tkkaskin-mobl3.ger.corp.intel.com.ger.corp.intel.com) ([10.252.3.49])
	by orsmga003.jf.intel.com with ESMTP; 22 May 2015 07:15:48 -0700
From: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 May 2015 17:15:39 +0300
Message-Id: <cover.1432303757.git.tanu.kaskinen@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Cc: Tanu Kaskinen <tanu.kaskinen@linux.intel.com>
Subject: [PATCH v2 0/5] Enable PulseAudio in Sato images
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
X-List-Received-Date: Fri, 22 May 2015 14:15:49 -0000

Changes in v2:
  - Mention meta-guacamayo and meta-webos as sources in the
    alsa-plugins patch commit message.
  - Fixed a typo ("REDPENDS") in the pulseaudio recipe.
  - Dropped file://${COREBASE}/LICENSE from LIC_FILES_CHKSUM in the
    pulseaudio-client-conf-sato recipe.
  - Inherit allarch in pulseaudio-client-conf-sato.
  - Dropped the alsa-plugins-dev package.
  - Added a pulseaudio patch for loading configuration fragments from
    /etc/pulse/client.conf.d.
  - Changed client.conf packaging so that the default version is
    shipped in the libpulse package as before, and
    pulseaudio-client-conf-sato installs the Sato specific
    configuration in /etc/pulse/client.conf.d/50-sato.conf.

The following changes since commit c78eb923c20533a1b9fbab462c809b2652fac425:

  xvinfo: upgrade to 1.1.3 (2015-05-21 10:48:48 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib tanuk/sato-pulseaudio-v2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sato-pulseaudio-v2

Tanu Kaskinen (5):
  alsa-plugins: initial recipe
  pulseaudio: client-conf: Add allow-autospawn-for-root
  pulseaudio: conf-parser: add support for .d directories
  pulseaudio-client-conf-sato: initial recipe
  packagegroup-core-x11-sato: add PulseAudio

 .../recipes-multimedia/alsa/alsa-plugins_1.0.29.bb | 100 +++++++++++
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |   5 +
 ...-client-conf-Add-allow-autospawn-for-root.patch |  92 ++++++++++
 ...onf-parser-add-support-for-.d-directories.patch | 196 +++++++++++++++++++++
 .../pulseaudio/pulseaudio_6.0.bb                   |   2 +
 .../packagegroups/packagegroup-core-x11-sato.bb    |   2 +
 .../pulseaudio-client-conf-sato/50-sato.conf       |   7 +
 .../pulseaudio-client-conf-sato_1.bb               |  17 ++
 8 files changed, 421 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-plugins_1.0.29.bb
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-client-conf-Add-allow-autospawn-for-root.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-conf-parser-add-support-for-.d-directories.patch
 create mode 100644 meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato/50-sato.conf
 create mode 100644 meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb

-- 
1.9.3


