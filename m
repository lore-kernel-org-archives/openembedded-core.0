Return-Path: <paul@betafive.co.uk>
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
	[64.147.123.21])
	by mail.openembedded.org (Postfix) with ESMTP id 121D77F685
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 22:10:07 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 6BB5080C;
	Tue, 12 Nov 2019 17:10:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Tue, 12 Nov 2019 17:10:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=aK0JKYXkiLJUuuy3Mkz5s+mGhk
	35LmPCMOBwt0ggjrU=; b=ixsJQum4YDRAtX2sHg0W1tw5oHcM1d2MFORlQBFfPA
	4KBAt9xxxXCSaTufVa1/6qv7FpD8JdZQx54tK8NN4gsMMinEHq3eHLkHv8mUCGVI
	InYeY7x8ke3b0FOgmCJC6lNlYVbuc3sNW0wTmo0yxYvxs23W26tmCw8RSrxf7fyB
	rX614ZGkNB1Cm9yZH+uQK5VeOWA3Y6egy5bgdpmW1hG1aA0n25CY9DzUsoyqx4MR
	3+fxcgp2oeXAzBeo02g6t6w43b9ANmAzKc/WBKmnabwShWDRZyA9ho9M2rykn8gi
	oZhNVUIR5snmvifw2f5f31TnR7UDj7XgFFKwoEVRB6ow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=aK0JKYXkiLJUuuy3M
	kz5s+mGhk35LmPCMOBwt0ggjrU=; b=AsGVosLKUwpgnqXQqKi2LJ2OKGgUwtF4C
	uQCcYBpVI8/QNQ7a6CLATvoSd9yL6XVVGAYA7w+mUQDQWKOsJOtDrqMbnh0r71xg
	23Ry8fcjSKhZ2Sfztxlv4iGXrohmjrhwobBwQDNM3ykPSFJQ99g9yTWHMAG/sTeF
	u0YkP04C0Ab+fhUfjJ62b0mr5LdoEGgm6hM2YZiIn+DRY/fDbGRdUwp9UMgVaMlF
	rXGoFMcojTp9t0rI5KeN/xydCykd2jPJwD+0lyTVMreKdopEXF/J9x32DBlp5+Js
	5CWVqAUZ7QswMQ4OyFpn1TvAdijTa/aeyO9dqsfQMqQp9F5jZ7qnw==
X-ME-Sender: <xms:vi3LXeo3QZ0K4A6Igv5Du53PuDRNTGr63iWuC1lblNiIwuIhKd8OeA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddvledgudeiudcutefuodetggdotefrod
	ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
	necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffoggfgsedtkeertd
	ertddtnecuhfhrohhmpefrrghulhcuuegrrhhkvghruceophgruhhlsegsvghtrghfihhv
	vgdrtghordhukheqnecukfhppedvudefrdegkedruddurddugeelnecurfgrrhgrmhepmh
	grihhlfhhrohhmpehprghulhessggvthgrfhhivhgvrdgtohdruhhknecuvehluhhsthgv
	rhfuihiivgeptd
X-ME-Proxy: <xmx:vi3LXYeqf7HjeY3InKOJlefMiar2aUNx81xAIvz38cIRpQC6u0oghA>
	<xmx:vi3LXZoJbKgFNjTwI2cisZPgrxcMtSh_Oqs3BRuMNZBOyEiuB-h4ag>
	<xmx:vi3LXal3w8DmpAXsWh-1l_CzoAk3FA7jo8L2w4eWmlMeVATw_yKeCA>
	<xmx:vy3LXfZ06k3v4dGHCfeyV2uAm8DsbDvkD_oezHbUjvpqZcA_YykRPA>
Received: from arch0.home.b5net.uk (unknown [213.48.11.149])
	by mail.messagingengine.com (Postfix) with ESMTPA id D02A9306005C;
	Tue, 12 Nov 2019 17:10:05 -0500 (EST)
From: Paul Barker <paul@betafive.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Nov 2019 22:10:03 +0000
Message-Id: <20191112221003.1355-1-paul@betafive.co.uk>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH] scripts/native-intercept: Add chgrp intercept
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
X-List-Received-Date: Tue, 12 Nov 2019 22:10:08 -0000
Content-Transfer-Encoding: 8bit

Some installation rules have been seen to run chgrp for native recipes
which leads to 'Operation not permitted' errors. To prevent this we
need a chgrp intercept script to go with the existing chown intercept.

Signed-off-by: Paul Barker <paul@betafive.co.uk>
---
 scripts/native-intercept/chgrp | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100755 scripts/native-intercept/chgrp

diff --git a/scripts/native-intercept/chgrp b/scripts/native-intercept/chgrp
new file mode 100755
index 0000000000..399c979f9a
--- /dev/null
+++ b/scripts/native-intercept/chgrp
@@ -0,0 +1,5 @@
+#! /bin/sh
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+echo "Intercept $0: $@ -- do nothing"
-- 
2.24.0


