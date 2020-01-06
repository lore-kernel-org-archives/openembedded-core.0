Return-Path: <tanuk@iki.fi>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
	[66.111.4.27])
	by mail.openembedded.org (Postfix) with ESMTP id F372A6C0E5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 09:18:09 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 2914C21FEB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 04:18:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute5.internal (MEProxy); Mon, 06 Jan 2020 04:18:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=9DeSer1Czj5MBpxgI
	sop1LkLVl17HHslGnzExW8eJtQ=; b=minMJxO5R16HDm4DkJz9aRJ23gKYZAEO1
	QMdGXdHLoY4D8NIxHThCzzu4Ri+SqdpMvAR6oAtDymxkwCFzbvFaD3vbGpeIynqh
	+RfFYQNyABvvgK4/aK3/yK7aH5mlUIQkYR0VdPI0W6gfFRNhdPRf93wDopL7DnzB
	hQPW2IEDXpcaOV7i/Cn5uDJDBcBo+j18jZ3DOJJlnAXDLD6kC7UMuf/z5EdLfTmO
	EyKR+HfRxu2OpPVks4vZjVaKMTiIJ/u+MAcxIL4ysyW+4eoRO2P+NAbELJIzz2Mi
	dGAMsWKqgB4tDcO3pWSxUJyYCvxFJUo9kWYBvYytt1rsz+HcC6rfQ==
X-ME-Sender: <xms:UvsSXiESY0NgiCa4ZuY3j-pCmz-DSIF4jPFHch8Z0KmZDtoo8zqVjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehtddgtdefucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
	dttdenucfhrhhomhepvfgrnhhuucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhf
	iheqnecukfhppeduleeirddvgeegrdduledurdejgeenucfrrghrrghmpehmrghilhhfrh
	homhepthgrnhhukhesihhkihdrfhhinecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:UvsSXqGmGVeDSJEw4mBFd-1p1AF3kYamh101YYuYj6By77_2lOS4ew>
	<xmx:UvsSXk-lbNyvfPYBUetoJQSXpG1lkK_DWKK6ueaf9TUFL7m4X9oa1g>
	<xmx:UvsSXgyKHMGCPjZpklvOY-wh-EIqJzn81mnEhou9dFexD8DxOuu5IQ>
	<xmx:U_sSXug_5rJTGtLyyslsL0bB-SUOSQAqdr0FEGMcZtMgeT4iyQHKgg>
Received: from localhost.localdomain (unknown [196.244.191.74])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5C77030607B4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 04:18:10 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jan 2020 11:18:01 +0200
Message-Id: <20200106091806.49129-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v2 0/5] alsa recipe updates
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
X-List-Received-Date: Mon, 06 Jan 2020 09:18:10 -0000
Content-Transfer-Encoding: 8bit

v2: rebased on current master

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


