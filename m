Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 2FF8B6012C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 16:56:24 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 30007216DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 11:56:24 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute3.internal (MEProxy); Wed, 17 Feb 2016 11:56:24 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:message-id:subject:to
	:x-sasl-enc:x-sasl-enc; s=smtpout; bh=7V3EsKyBfZqFjW2OVDJX4OV7R2
	0=; b=Jzbb7Uyyr3M6oTQcE0KqA2h3CftZUAYKEyIGH47oD+SFy7oo18PxqH+8xy
	2E4q6RXNGYW2+zKhrS0mGNu/kf2j/t2syfx7M4MWYK3NhIYVrysi/b2u8qyktf/V
	jfJ2Qm8YQmUi/PFvnRXdnJWnze+HQ8wclE4LRXd7UkppfLo3Q=
X-Sasl-enc: DCdoDMV5ZgdR8WHO4BjB6l4LlbouiXhG9H3vMCAzY1NJ 1455728183
Received: from laptop.tanuk.dy.fi (a88-114-110-232.elisa-laajakaista.fi
	[88.114.110.232])
	by mail.messagingengine.com (Postfix) with ESMTPA id 42ACCC0001B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 11:56:23 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2016 18:56:12 +0200
Message-Id: <cover.1455727967.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 0/4] Audio recipe updates
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
X-List-Received-Date: Wed, 17 Feb 2016 16:56:25 -0000

The following changes since commit 31af4a37c429bb1db8bfc64242b2963220f9a0e1:

  oeqa/parselogs: Whitelist dmi firmware failure message in 4.4 kernels (2016-02-16 23:53:43 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib tanuk/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=tanuk/updates

Tanu Kaskinen (4):
  alsa-tools: 1.0.29 -> 1.1.0
  alsa-utils: 1.0.29 -> 1.1.0
  alsa-plugins: 1.0.29 -> 1.1.0
  pulseaudio: 6.0 -> 8.0

 ...nclude-sys-select.h-for-fd_set-definition.patch |  31 ---
 ...nclude-speexdsp_types.h-not-speex_types.h.patch |  71 ------
 ...ph-include-config.h-from-rate_speexrate.c.patch |  35 +++
 ...lsa-plugins_1.0.29.bb => alsa-plugins_1.1.0.bb} |  16 +-
 .../alsa/alsa-tools/autotools.patch                |   2 +-
 .../alsa/alsa-tools/makefile_no_gtk.patch          |   2 +-
 .../{alsa-tools_1.0.29.bb => alsa-tools_1.1.0.bb}  |   4 +-
 ...ripts_1.0.29.bb => alsa-utils-scripts_1.1.0.bb} |   0
 ...1-alsabat-rename-to-avoid-naming-conflict.patch | 153 ++++++++++++
 ...-t-let-systemd-unit-restore-the-volume-wh.patch |  20 +-
 ...lsa-utils-aplay-interrupt-signal-handling.patch |  48 ----
 ...oring-is-success-if-not-sound-card-device.patch |  34 ---
 .../{alsa-utils_1.0.29.bb => alsa-utils_1.1.0.bb}  |  15 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |   8 +-
 ...le-switch-on-port-available-Route-to-pref.patch | 268 +++++++++++++++++++++
 .../0001-card-add-pa_card_profile.ports.patch      | 101 +++-----
 ...-client-conf-Add-allow-autospawn-for-root.patch |   7 +-
 ...onf-parser-add-support-for-.d-directories.patch | 196 ---------------
 ...oth-fail-if-user-requested-profile-doesn-.patch |   7 +-
 ...-move-profile-selection-after-pa_card_new.patch | 131 +++++-----
 ...vailability-for-some-unavailable-profiles.patch |  32 ++-
 .../pulseaudio/fix-git-version-gen.patch           |  24 --
 .../{pulseaudio_6.0.bb => pulseaudio_8.0.bb}       |   7 +-
 23 files changed, 636 insertions(+), 576 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-plugins/0001-arcam-av-Include-sys-select.h-for-fd_set-definition.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-plugins/0001-include-speexdsp_types.h-not-speex_types.h.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-plugins/0001-pph-include-config.h-from-rate_speexrate.c.patch
 rename meta/recipes-multimedia/alsa/{alsa-plugins_1.0.29.bb => alsa-plugins_1.1.0.bb} (87%)
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.0.29.bb => alsa-tools_1.1.0.bb} (91%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.0.29.bb => alsa-utils-scripts_1.1.0.bb} (100%)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0001-alsabat-rename-to-avoid-naming-conflict.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/alsa-utils-aplay-interrupt-signal-handling.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/assume-storing-is-success-if-not-sound-card-device.patch
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.0.29.bb => alsa-utils_1.1.0.bb} (85%)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-Revert-module-switch-on-port-available-Route-to-pref.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-conf-parser-add-support-for-.d-directories.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/fix-git-version-gen.patch
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_6.0.bb => pulseaudio_8.0.bb} (72%)

-- 
2.7.0


