Return-Path: <tanuk@iki.fi>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 05B9B73191
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 11:20:40 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 546D9207DF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 07:20:40 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute1.internal (MEProxy); Wed, 17 Aug 2016 07:20:40 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:message-id:subject:to
	:x-sasl-enc:x-sasl-enc; s=smtpout; bh=GWRcn5ut0jzEPYr0s3pn4NAI7b
	g=; b=MVeULJCY7UExw5paRVxkhRVS9602FFoS3Hz1LyQQ5t23tMSngQy5kl2/hV
	z3YSYta6GEZEjoPfvGm94TWRSCVPPyo/jhVuivakE8zWlGA5bGW/ns4cOjYlkus6
	/g9B6yHzmr0+p1QAG8Sfrl09PNZgl6e0gjDhX5R4PkUMiPmp8=
X-Sasl-enc: p41HUEGbvjVXNvnvX+3d6aboriovCqae93KZjY4+gMZN 1471432839
Received: from laptop.tanuk.dy.fi (a88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id C4F0CF285F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 07:20:39 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2016 14:20:28 +0300
Message-Id: <cover.1471432658.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 0/2] Update alsa recipes
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
X-List-Received-Date: Wed, 17 Aug 2016 11:20:41 -0000

The following changes since commit c86bf80abd87acb0da5860806822c64ec9dee089:

  oeqa.buildperf: use oe.path.remove() (2016-08-17 10:35:27 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib tanuk/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=tanuk/updates

Tanu Kaskinen (2):
  alsa-lib: 1.1.1 -> 1.1.2
  alsa-utils: 1.1.1 -> 1.1.2

 ...fix-appl-pointer-not-correct-when-mmap_co.patch | 137 ---------------------
 .../avoid-including-sys-poll.h-directly.patch      |  20 +--
 .../alsa/{alsa-lib_1.1.1.bb => alsa-lib_1.1.2.bb}  |   5 +-
 ...cripts_1.1.1.bb => alsa-utils-scripts_1.1.2.bb} |   0
 .../{alsa-utils_1.1.1.bb => alsa-utils_1.1.2.bb}   |   6 +-
 5 files changed, 15 insertions(+), 153 deletions(-)
 delete mode 100755 meta/recipes-multimedia/alsa/alsa-lib/0001-pcm_plugin-fix-appl-pointer-not-correct-when-mmap_co.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.1.bb => alsa-lib_1.1.2.bb} (88%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.1.bb => alsa-utils-scripts_1.1.2.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.1.bb => alsa-utils_1.1.2.bb} (96%)

-- 
2.8.1


