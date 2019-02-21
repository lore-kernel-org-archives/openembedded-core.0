Return-Path: <tanuk@iki.fi>
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
	[64.147.123.25])
	by mail.openembedded.org (Postfix) with ESMTP id CF9147CB4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 13:34:23 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id C287C31E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 08:26:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Thu, 21 Feb 2019 08:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=8cx6CEad5midMhX6S
	PFog6H6H2XOGI5kN/M54vqwLaw=; b=o6ZcS22CqQFKg+pN7KxkaWDbZssUYHAI3
	rqmDUqAam30+xpYJWrOPjDkYQXMDDx1QuOGusDDaz6sBdfmVk8lyD4JGWs/EIhHv
	9FHX9p3xQ/0QmTmalNC8xdHiHVSC/VhxF3rLIsisiDvxHUrAXysQJggHq19rGO0v
	/yOnMcDp023dNVFjOj2abWMNAyUAyj1+LjvOUWEoZHOde3X5H+lEveg9c3TD8mIF
	oTIWewlDJGWZe54+v9u+kQJ9CBaFE9cQx+07lAjVyZ+AoLqU9WztTfWGtJ8aKyEd
	5gJXQd3PsNN2pPi3IQte6kWqgns6tLgMHomCECr1ZiW5X2e/k6z0A==
X-ME-Sender: <xms:AqduXLLy8qNjhAj9N7JBb-wrEnaVIAuAoWa2DPJ64wDsGftY7MJnrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrtdekgdehfeculddtuddrgedtledrtddtmd
	cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
	uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
	dttdenucfhrhhomhepvfgrnhhuucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhf
	iheqnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghenucfkphepkeekrd
	duudefrddvuddurdejvdenucfrrghrrghmpehmrghilhhfrhhomhepthgrnhhukhesihhk
	ihdrfhhinecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:AqduXMWYzUIvW3XTDHbBM0jusvzzBH_CtyDdYarZf4I9LogFxLHMPg>
	<xmx:AqduXIOCHszr6IgTrrN8Roqr-QWebIKNDqvReKe3hsV24GYFwmDzzg>
	<xmx:AqduXAlLzFL6LEwH86fiAJqQQ7w4k-5Z3g6Jn_GCoR0Q5Ukss5jDsQ>
	<xmx:AqduXPaVk7hZwDWX2yjV_habsJTxB2mKmYMrcznzNyMzi0RfKdZqgA>
Received: from localhost.localdomain (88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id A4261E4559
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 08:26:25 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Feb 2019 15:26:18 +0200
Message-Id: <cover.1550755109.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 0/3] alsa recipe updates
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
X-List-Received-Date: Thu, 21 Feb 2019 13:34:24 -0000
Content-Transfer-Encoding: 8bit

The following changes since commit f15ceac287c094abdeda64b03628455d92e0ce74:

  libdrm: Upgrade 2.4.96 -> 2.4.97 (2019-02-20 21:22:28 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib tanuk/updates
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=tanuk/updates


The alsa-tools update is missing, because the recipe upgrade deadline is
near and the changes in alsa-tools look like a potential rabbit hole.
I'll send the alsa-tools update separately when it's ready. The main
change in alsa-tools is that the hwmixvolume program got ported from
PyGTK to gobject-introspection, and from GTK2 to GTK3. I doubt anyone
actually is using that program, it's not even built by default.


Tanu Kaskinen (3):
  alsa-lib: 1.1.6 -> 1.1.8
  alsa-plugins: 1.1.6 -> 1.1.8
  alsa-utils: 1.1.6 -> 1.1.8

 .../{alsa-lib_1.1.6.bb => alsa-lib_1.1.8.bb}  |  4 +-
 ...plugins_1.1.6.bb => alsa-plugins_1.1.8.bb} | 84 +++++++++++++++++--
 ...s_1.1.6.bb => alsa-utils-scripts_1.1.8.bb} |  0
 ...lsa-utils_1.1.6.bb => alsa-utils_1.1.8.bb} | 10 +--
 .../recipes-multimedia/ffmpeg/ffmpeg_4.1.1.bb |  2 +-
 5 files changed, 85 insertions(+), 15 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.6.bb => alsa-lib_1.1.8.bb} (88%)
 rename meta/recipes-multimedia/alsa/{alsa-plugins_1.1.6.bb => alsa-plugins_1.1.8.bb} (51%)
 rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.6.bb => alsa-utils-scripts_1.1.8.bb} (100%)
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.6.bb => alsa-utils_1.1.8.bb} (92%)

-- 
2.20.1


