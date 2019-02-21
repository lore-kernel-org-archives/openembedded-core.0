Return-Path: <tanuk@iki.fi>
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
	[64.147.123.25])
	by mail.openembedded.org (Postfix) with ESMTP id 069027C75F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 20:13:13 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 2438232BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 15:13:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Thu, 21 Feb 2019 15:13:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=rWiaxXMsp+61qU/UJ
	fCrPCDIDi9OC3L+21zBusRH7JA=; b=KT3qFIyG1nMqXIVDSXg247k7Y4bpbmZtg
	RInZrLWUl+mAY281yAmAYcMyxnLKs/G2cmp2n10dZzoEE9bSE6lY7VTp/e5Xczk/
	AT+jINUhagoZVbJKalmvTDHqfNRVquLqrFLRdlhNBwwLt0m+z750Thhcht/Adusv
	1qpWjbO4yeRYXGQnaIe1d/FFmVIHkYRqAY4lPHGi8wKIiVvZTXIuh2GtnYS2++vG
	/Mu4CFZNpPZHyIfhINhADiEARZ+vCuK/beZVLmoYD66yQkOUGIzXiQByvidzxNlU
	55kQnJClKG/RkvNbYE2JWk1IfXmvXHc12Ei3kbjYL4tyOKpZD34CQ==
X-ME-Sender: <xms:WgZvXKd6omihlA5HSXIMIByc3WqGCey2WfcqcBeXZuYk0z6tFtMjDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrtdekgddufeejucdltddurdegtdelrddttd
	dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhht
	necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
	ertddtnecuhfhrohhmpefvrghnuhcumfgrshhkihhnvghnuceothgrnhhukhesihhkihdr
	fhhiqeenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgnecukfhppeekke
	druddufedrvdduuddrjedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhksehi
	khhirdhfihenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:WgZvXEhxMabBSKZcNb6qZJHGEC7G5nPBLwdlJ8MY_Ikan1HJilEVQA>
	<xmx:WgZvXDLPvgr7a0cSYdKPxySFrBw7Sx4sagawI_UmLsW3m5W0jdNgoA>
	<xmx:WgZvXCnWrikz3JasRECN4D69gUF9x7lQQwWwjHG77E1y_QeHLxz_Ew>
	<xmx:WgZvXHhODzU9CZaBJi0u-29uSbnMq3Zd8yrHk7CzxhS11HUoAsMYOQ>
Received: from localhost.localdomain (88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id CE041E412B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 15:13:13 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 22:13:02 +0200
Message-Id: <cover.1550779769.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH v2 0/3] alsa recipe updates
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
X-List-Received-Date: Thu, 21 Feb 2019 20:13:14 -0000
Content-Transfer-Encoding: 8bit

The following changes since commit ff2c029b568f70aa9960dde04ddd207829812ea0:

  resulttool: Improvements to allow integration to the autobuilder (2019-02-21 12:31:50 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib tanuk/updates
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=tanuk/updates


The alsa-tools update is missing, because the recipe upgrade deadline is
near and the changes in alsa-tools look like a potential rabbit hole.
I'll send the alsa-tools update separately when it's ready. The main
change in alsa-tools is that the hwmixvolume program got ported from
PyGTK to gobject-introspection, and from GTK2 to GTK3. I doubt anyone
actually is using that program, it's not even built by default.

Changes in v2:
 - More reliable SRC_URIs.


Tanu Kaskinen (3):
  alsa-lib: 1.1.6 -> 1.1.8
  alsa-plugins: 1.1.6 -> 1.1.8
  alsa-utils: 1.1.6 -> 1.1.8

 .../{alsa-lib_1.1.6.bb => alsa-lib_1.1.8.bb}  |  6 +-
 ...plugins_1.1.6.bb => alsa-plugins_1.1.8.bb} | 86 +++++++++++++++++--
 ...s_1.1.6.bb => alsa-utils-scripts_1.1.8.bb} |  0
 ...lsa-utils_1.1.6.bb => alsa-utils_1.1.8.bb} | 14 ++-
 .../recipes-multimedia/ffmpeg/ffmpeg_4.1.1.bb |  2 +-
 5 files changed, 88 insertions(+), 20 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.6.bb => alsa-lib_1.1.8.bb} (83%)
 rename meta/recipes-multimedia/alsa/{alsa-plugins_1.1.6.bb => alsa-plugins_1.1.8.bb} (50%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.6.bb => alsa-utils-scripts_1.1.8.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.6.bb => alsa-utils_1.1.8.bb} (90%)

-- 
2.20.1


