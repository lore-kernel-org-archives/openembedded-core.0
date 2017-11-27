Return-Path: <tanuk@iki.fi>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id 74A067833B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 16:49:10 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id AAC7120BDE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 11:39:43 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Mon, 27 Nov 2017 11:39:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=4N7+mycGl3Rf5/2QL
	UvKVv5Uk2Bwnjx3bA0X76/FsOE=; b=XtAJVSsB3OYXzvGHyxiQnRw8oke3Qicfq
	6KFQi9Ifp6u0PMpHxcMIROewCMTN95KbcndNHNsufdAkQzKiwJ5HyRN5DQpKapOo
	L+N+CbuvgvTg+xIa68+S51+zAN8Odsp5tJZevVv9qdgr2aFByqvPbWnpRtDkj798
	TFLHfkzHpgXS++l1Ou1mT+dqML2Em2amwzcKOfCaPL3FzmUGT4JodxoPfweHyXnv
	GttvR0sb2uGkzjzenQhHJGAZW5qFqj8np0AnJ5Clza4C1DfpUPkAuA/BE9HnOYTw
	HVqFWUq9gdI3TREYZ05HsIHRitKPNvgfCHzSr6mZqJX1+G5yexhdg==
X-ME-Sender: <xms:zz8cWjZwE_6uUNABYKWvh-u6r73DDHxaFk8gHsRl42rhFKMaAfrITw>
Received: from localhost.localdomain (unknown [192.40.95.17])
	by mail.messagingengine.com (Postfix) with ESMTPA id 259267E56E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 11:39:43 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2017 18:39:28 +0200
Message-Id: <20171127163934.31597-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.14.2
Subject: [PATCH 0/6] Audio recipe updates
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
X-List-Received-Date: Mon, 27 Nov 2017 16:49:10 -0000

Tanu Kaskinen (6):
  pulseaudio: 10.0 -> 11.1
  lame: 3.99.5 -> 3.100
  alsa-lib: 1.1.4.1 -> 1.1.5
  alsa-plugins: 1.1.4 -> 1.1.5
  alsa-tools: 1.1.3 -> 1.1.5
  alsa-utils: 1.1.4 -> 1.1.5

 .../Check-if-wordexp-function-is-supported.patch   |  51 ----
 .../avoid-including-sys-poll.h-directly.patch      | 183 ------------
 .../{alsa-lib_1.1.4.1.bb => alsa-lib_1.1.5.bb}     |   9 +-
 ...alsa-plugins_1.1.4.bb => alsa-plugins_1.1.5.bb} |   4 +-
 ...s10k1-Make-output_tram_line-static-inline.patch |  31 ---
 .../alsa/alsa-tools/autotools.patch                |   2 +-
 .../alsa/alsa-tools/makefile_no_gtk.patch          |   2 +-
 .../{alsa-tools_1.1.3.bb => alsa-tools_1.1.5.bb}   |   5 +-
 ...cripts_1.1.4.bb => alsa-utils-scripts_1.1.5.bb} |   0
 ...-t-let-systemd-unit-restore-the-volume-wh.patch |  12 +-
 .../{alsa-utils_1.1.4.bb => alsa-utils_1.1.5.bb}   |   4 +-
 .../lame/lame/CVE-2017-13712.patch                 | 309 ---------------------
 .../lame/lame-3.99.5_fix_for_automake-1.12.x.patch |  59 ----
 .../lame/{lame_3.99.5.bb => lame_3.100.bb}         |   9 +-
 ...-don-t-use-variable-length-array-in-union.patch |  59 ----
 .../{pulseaudio_10.0.bb => pulseaudio_11.1.bb}     |   5 +-
 16 files changed, 21 insertions(+), 723 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/Check-if-wordexp-function-is-supported.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/avoid-including-sys-poll.h-directly.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.4.1.bb => alsa-lib_1.1.5.bb} (77%)
 rename meta/recipes-multimedia/alsa/{alsa-plugins_1.1.4.bb => alsa-plugins_1.1.5.bb} (96%)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-tools/0001-as10k1-Make-output_tram_line-static-inline.patch
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.1.3.bb => alsa-tools_1.1.5.bb} (87%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.4.bb => alsa-utils-scripts_1.1.5.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.4.bb => alsa-utils_1.1.5.bb} (97%)
 delete mode 100644 meta/recipes-multimedia/lame/lame/CVE-2017-13712.patch
 delete mode 100644 meta/recipes-multimedia/lame/lame/lame-3.99.5_fix_for_automake-1.12.x.patch
 rename meta/recipes-multimedia/lame/{lame_3.99.5.bb => lame_3.100.bb} (69%)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudio-discuss-iochannel-don-t-use-variable-length-array-in-union.patch
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_10.0.bb => pulseaudio_11.1.bb} (61%)

-- 
2.14.2


