Return-Path: <tanuk@iki.fi>
X-Greylist: delayed 537 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Jul 2016 00:29:25 UTC
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id C3F7C6FFAB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 00:29:25 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id D88E120547
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 20:20:28 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute4.internal (MEProxy); Tue, 19 Jul 2016 20:20:28 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:message-id:subject:to
	:x-sasl-enc:x-sasl-enc; s=smtpout; bh=08qYAbG51jbdCjblDX0GXK1jsU
	A=; b=SDMA4ixgsgvDqWp4dQyuO939ZhQz6D/XNdUmJ5Aj3rHkILRf4CmdgLI8bP
	C0zdBYXBhExrrpr2VnbIW3TADFCJwOQFPYsJbAwZw98ssi0um2S92COejZpV5GTc
	xfWenx35UwDtiBe3RwL+8UpN3LqNDNqef+eBQ/7NakgHuWVK4=
X-Sasl-enc: Ff/Wruq/GwKK6lVHr0dfg/rAT1CQKniua8foj0ND8sGN 1468974028
Received: from laptop.tanuk.dy.fi (a88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4A168CCD81
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 20:20:28 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2016 03:20:20 +0300
Message-Id: <cover.1468973641.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 0/3] Audio recipe updates
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
X-List-Received-Date: Wed, 20 Jul 2016 00:29:28 -0000

The following changes since commit 8b369cdd73ab17cdf834a591b97b25840caeb740:

  toaster.bbclass: only scan files-in-image.txt if it exists (2016-07-19 09:03:28 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib tanuk/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=tanuk/updates

Tanu Kaskinen (3):
  libsndfile1: 1.0.26 -> 1.0.27
  pulseaudio: 8.0 -> 9.0
  pulseaudio: disable WebRTC code

 ...libsndfile1_1.0.26.bb => libsndfile1_1.0.27.bb} |   4 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |   4 +
 ...le-switch-on-port-available-Route-to-pref.patch | 268 ---------------
 ...th-fail-if-user-requested-profile-doesn-.patch} |  30 +-
 .../0001-card-add-pa_card_profile.ports.patch      | 218 ------------
 ...-client-conf-Add-allow-autospawn-for-root.patch |  18 +-
 ...ard-don-t-allow-the-CARD_NEW-hook-to-fail.patch |  37 ++
 ...-move-profile-selection-after-pa_card_new.patch | 373 ++++++++++++---------
 ...rd-remove-pa_card_new_data.active_profile.patch |  72 ++++
 ...ailability-for-some-unavailable-profiles.patch} |  38 +--
 .../{pulseaudio_8.0.bb => pulseaudio_9.0.bb}       |  14 +-
 11 files changed, 379 insertions(+), 697 deletions(-)
 rename meta/recipes-multimedia/libsndfile/{libsndfile1_1.0.26.bb => libsndfile1_1.0.27.bb} (83%)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-Revert-module-switch-on-port-available-Route-to-pref.patch
 rename meta/recipes-multimedia/pulseaudio/pulseaudio/{0002-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch => 0001-alsa-bluetooth-fail-if-user-requested-profile-doesn-.patch} (69%)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-card-add-pa_card_profile.ports.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0002-card-don-t-allow-the-CARD_NEW-hook-to-fail.patch
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0004-card-remove-pa_card_new_data.active_profile.patch
 rename meta/recipes-multimedia/pulseaudio/pulseaudio/{0004-alsa-set-availability-for-some-unavailable-profiles.patch => 0005-alsa-set-availability-for-some-unavailable-profiles.patch} (74%)
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_8.0.bb => pulseaudio_9.0.bb} (54%)

-- 
2.8.1


