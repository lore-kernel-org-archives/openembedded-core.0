Return-Path: <tanuk@iki.fi>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 074ED7F894
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 08:31:07 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id EF7EC21F34
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 03:24:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Mon, 06 Jan 2020 03:24:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=1qoimo+qhZgqqLZVc
	XlnT81XHiOZX60WEfmRBV3oMCQ=; b=oPFZ37SZimji6Kk6yQPXbCJt2txPwpEap
	h1Ii7EFGQb1l7yg3JYo/yS2L30TXTvw4JpXO7wM+v/G4bXZiq+G73vdKd1emFaOC
	FZjt5I52PRIi+q/squRS1RImcF5rjpgrd/saQqir0sr62vux46IWdPgAIjfq2L7E
	7xxl84uxEF0K6wPepeR3q3oX3y9RuCf3XD/wUgZnZVxrj9mRUneRQzleD1bWW+pH
	p1V3c/qTrUmV8QxlAq6A3+xSdyXNob04HJTaUGwkSAaCD3x8rdPew9Ockb2NJ5I7
	cSRPjOJnPdCORgC9ftBntjSUs5nTYMHmWpKZdzLo1GAM7UVjHsfuw==
X-ME-Sender: <xms:rO4SXrEONgjBmDrwWqugcIvOX_C1iKnflYFm3YgYEbUZiIh5mFPEYQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdegledguddukecutefuodetggdotefrod
	ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
	necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
	ertddtnecuhfhrohhmpefvrghnuhcumfgrshhkihhnvghnuceothgrnhhukhesihhkihdr
	fhhiqeenucfkphepudeliedrvdeggedrudeluddrjeegnecurfgrrhgrmhepmhgrihhlfh
	hrohhmpehtrghnuhhksehikhhirdhfihenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:rO4SXkdg0nzAgUtU64NRYJPGAncYLRhCd64X37-u8SJDA0CWyQ6MXA>
	<xmx:rO4SXimnmkyYhXDhNT0lQsSjo62sQ-ZXxPj22DHmjxlMsO_nNZ2Dug>
	<xmx:rO4SXoXvvXfmg_3W_w1E9A61IIXzKjeW3KzjY-s22uAJsUXqT1z65Q>
	<xmx:rO4SXowsBMtp2BsS-DglTNnMRyDbHOFmwqCb_7FeSyl2o70M_1ddIw>
Received: from localhost.localdomain (unknown [196.244.191.74])
	by mail.messagingengine.com (Postfix) with ESMTPA id 217578005A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 03:24:12 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2020 10:24:03 +0200
Message-Id: <20200106082408.47678-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 0/5] alsa recipe updates
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
X-List-Received-Date: Mon, 06 Jan 2020 08:31:07 -0000
Content-Transfer-Encoding: 8bit

Tanu Kaskinen (5):
  alsa-lib: 1.1.9 -> 1.2.1.2
  alsa-ucm-conf: new recipe, version 1.2.1.2
  alsa-topology-conf: new recipe, version 1.2.1
  alsa-utils: 1.1.9 -> 1.2.1
  alsa-plugins: 1.1.9 -> 1.2.1

 meta/conf/distro/include/maintainers.inc      |    2 +
 ...-alsa-sound-.h-for-external-programs.patch | 7104 +++++++++++++++++
 ...ac-remove-an-unnecessary-libtool-fix.patch |   50 +
 ...api-Move-typedefs-from-uapi-to-sound.patch |  137 +
 ...ncmp-to-avoid-access-out-of-boundary.patch |   41 +
 ...s-at-least-NULL-if-no-list-is-availa.patch |   45 +
 ...0003-namehint-correct-the-args-check.patch |   34 +
 ...-the-previous-patch-check-the-return.patch |   31 +
 ...to-parse-configs-on-cards-with-an-em.patch |   86 +
 ...{alsa-lib_1.1.9.bb => alsa-lib_1.2.1.2.bb} |   21 +-
 ...plugins_1.1.9.bb => alsa-plugins_1.2.1.bb} |    4 +-
 .../alsa/alsa-topology-conf_1.2.1.bb          |   22 +
 .../alsa/alsa-ucm-conf_1.2.1.2.bb             |   23 +
 ...s_1.1.9.bb => alsa-utils-scripts_1.2.1.bb} |    0
 ...lsa-utils_1.1.9.bb => alsa-utils_1.2.1.bb} |    7 +-
 15 files changed, 7596 insertions(+), 11 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-Fix-alsa-sound-.h-for-external-programs.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-configure.ac-remove-an-unnecessary-libtool-fix.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-uapi-Move-typedefs-from-uapi-to-sound.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-Use-strncmp-to-avoid-access-out-of-boundary.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0002-ucm-return-always-at-least-NULL-if-no-list-is-availa.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0003-namehint-correct-the-args-check.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0004-namehint-improve-the-previous-patch-check-the-return.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0005-ucm-Do-not-fail-to-parse-configs-on-cards-with-an-em.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.9.bb => alsa-lib_1.2.1.2.bb} (51%)
 rename meta/recipes-multimedia/alsa/{alsa-plugins_1.1.9.bb => alsa-plugins_1.2.1.bb} (98%)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.1.bb
 create mode 100644 meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.9.bb => alsa-utils-scripts_1.2.1.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.9.bb => alsa-utils_1.2.1.bb} (97%)

-- 
2.20.1


