Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 61F0D77D1A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 13:19:33 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 48A7A201A8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 09:19:34 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Thu, 08 Jun 2017 09:19:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=8ax+5j
	4cBvaXpyvX5klKMkO8EqY5NvHmmLXAGIuL5X4=; b=aclvTKUrhd7oRgVyAkZk4z
	0pQjU7xjjweAyBFn0B93yelKQ7sab3TkCy1B74rogPEv23Gf+Tddb3AkovZc00Td
	C2C6VgGEi4bCDGdomx10chtn2ja4IfjTpLFFWtx/aOENVXa4NdM4KJP8y3IfwMfS
	0HN57vCuGtn0XWgXwMnPT7mmvrfk5B2mfQA5mjKVCSyv2ZrWNoPzeVLNhPvKz6a3
	F4rVk4y+vPHVhBTiHvGK4bpTCRiVaENwceFTV2sPkoDb/D2baFEvBrYUbUGlM3xQ
	vaaRvNCpKnEJxmUFYOllMGjbFSJDU4ZumcpDP21INV8SpmHGI4TU4Rtzc4upzGGA
	==
X-ME-Sender: <xms:5k45WaGktEXIi9Ze-fl9G8pCSZR9eRLBKtc7KvmIfhmaQBG4t-SDmA>
X-Sasl-enc: NROLs8ptut5FP33FpYzA+c0g5EXZ5esC00D1rP0Se8oI 1496927973
Received: from localhost.localdomain (unknown [192.40.95.39])
	by mail.messagingengine.com (Postfix) with ESMTPA id AB41A7E7B1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 09:19:33 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 16:19:26 +0300
Message-Id: <cover.1496927857.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 0/3] Update the alsa recipes
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
X-List-Received-Date: Thu, 08 Jun 2017 13:19:33 -0000

The following changes since commit 186882ca62bf683b93cd7a250963921b89ba071f:

  buildhistory: skip tests if GitPython module is missing (2017-06-07 16:00:43 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib tanuk/updates
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=tanuk/updates

Tanu Kaskinen (3):
  alsa-lib: 1.1.3 -> 1.1.4.1
  alsa-utils: 1.1.3 -> 1.1.4
  alsa-plugins: 1.1.1 -> 1.1.4

 .../alsa-lib/0001-ucm-parser-needs-limits.h.patch  | 33 ----------------------
 .../{alsa-lib_1.1.3.bb => alsa-lib_1.1.4.1.bb}     |  5 ++--
 ...alsa-plugins_1.1.1.bb => alsa-plugins_1.1.4.bb} |  4 +--
 ...cripts_1.1.3.bb => alsa-utils-scripts_1.1.4.bb} |  0
 .../{alsa-utils_1.1.3.bb => alsa-utils_1.1.4.bb}   |  4 +--
 5 files changed, 6 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser-needs-limits.h.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.3.bb => alsa-lib_1.1.4.1.bb} (87%)
 rename meta/recipes-multimedia/alsa/{alsa-plugins_1.1.1.bb => alsa-plugins_1.1.4.bb} (96%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.3.bb => alsa-utils-scripts_1.1.4.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.3.bb => alsa-utils_1.1.4.bb} (97%)

-- 
2.11.0


