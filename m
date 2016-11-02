Return-Path: <tanuk@iki.fi>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 4B07971B01
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 15:45:39 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 0E301208C6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 11:39:17 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute1.internal (MEProxy); Wed, 02 Nov 2016 11:39:17 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=x-me-sender:x-sasl-enc:from:to:subject
	:date:message-id; s=smtpout; bh=mLDae6lCXRNyT5VjQHd7bI1jbUM=; b=
	dxK3LNzIyhbg0vYBXKbBmbAD/vxjnrXM896SACgPpbf2IBdqqNw+N0MMHA6qRDoN
	E/AWuhO5ySWc72OMmE/37L7y5/CAj3THoP6RU/5YLGCNGHoNM3Wh8YSV0kMt+Qzt
	OmUDXP/hnNj3sdWkfBrva6Xnt0JeDeCfpmBQJJetctI=
X-ME-Sender: <xms:pAgaWFtBQl_C-wkugqcqI_dJ-lgkwshueaM9V6K487rHvtIlCsDykw>
X-Sasl-enc: O94/7zHTpqcbuMCSpkc0USCweBrZb6ca5NEJMVRdNN6a 1478101154
Received: from localhost.localdomain (a88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id 19F67CC0C0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 11:39:13 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Nov 2016 17:39:07 +0200
Message-Id: <cover.1478101052.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 0/2] Update libsamplerate0
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
X-List-Received-Date: Wed, 02 Nov 2016 15:45:39 -0000

The following changes since commit 98c6ebf1e05158c689e01b785d32757847cdb10c:

  oeqa/selftest/kernel.py: Add new file destined for kernel related tests (2016-11-01 10:05:40 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib tanuk/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=tanuk/updates

Tanu Kaskinen (2):
  libsamplerate0: 0.1.8 -> 0.1.9
  libsamplerate0: clean up dependencies

 .../0001-configure.ac-improve-alsa-handling.patch  | 62 ++++++++++++++++++++++
 .../libsamplerate/libsamplerate0_0.1.8.bb          | 21 --------
 .../libsamplerate/libsamplerate0_0.1.9.bb          | 26 +++++++++
 3 files changed, 88 insertions(+), 21 deletions(-)
 create mode 100644 meta/recipes-multimedia/libsamplerate/libsamplerate0/0001-configure.ac-improve-alsa-handling.patch
 delete mode 100644 meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.8.bb
 create mode 100644 meta/recipes-multimedia/libsamplerate/libsamplerate0_0.1.9.bb

-- 
2.9.3


