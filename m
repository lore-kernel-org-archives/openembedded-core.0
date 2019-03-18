Return-Path: <paul@betafive.co.uk>
X-Greylist: delayed 525 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 18 Mar 2019 17:00:27 UTC
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 4DE527C68F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 17:00:27 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 0207F22008;
	Mon, 18 Mar 2019 12:51:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute1.internal (MEProxy); Mon, 18 Mar 2019 12:51:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id; s=fm1; bh=K35n+T7hO1lJSH7
	NZ0AN56Ptygr4SqRHoYaybpjVJfY=; b=aEYXTt1zbXDT1ww9MuJHsHOjXTO8TBO
	HRRQt/fTe2ZabmfV0qCdLLb9zsZt0Ewem3fIZAUtLbDgkM9u53GgAEaMuypYJeYg
	cM4SYymEFzHA65a9r5oi7gmwBkPpkPz9EKyAvXV7Xd5i02jZG+7gRytH0l/u/uWJ
	wIVHYr5JuX8lVD9mz9LmOPczkINI+IridNvF30RFrJOl1pVUKfim8F/gNdfdgLvD
	AP+Vebd7eARn/0Dhg0EBUL819GLSmeWX/xyfZqBNCQvUylaDYdq+UuM02kQg79rl
	pDkANRFJEclsT4whl6WIh9s17lxd3uCcLuE7JglrBMsbBXN6rnL9PJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; bh=K35n+T7hO1lJSH7NZ0AN56Ptygr4SqRHoYaybpjVJfY=; b=dwb8GGn3
	czqbUqik9joKc1Pytq2nfeFCIhcSB7MRMd4SY+CzADKjl4SJRNQTtbtz+xnvaplF
	iVwPsGF6iktJU3uCHqUwGq5PA7vC2erXZ98ev9kZ+xj6sgYQlA4Szla8UBu+M4GA
	9UJt+FuUQTuiJqIN+vJZsAa1a7zVVYv4dhrq4AXk7ZuuLuaPqWRf9uLM9glFcrii
	a6iCSZw54x9+XKxmBqTOZnAqBiaZsY5B3c0ubA8pdX+ZQklsQi234V4l5mG1bLkx
	3oi0WDoUqPKBoR8AsdgZoJfit9Qub8hHWD6xM5ka+21C3dHEcyxH9+71N4YLHckk
	SgUSK7/O0Y+LJQ==
X-ME-Sender: <xms:n8yPXAIFisQH1FvFkooIYy3cYo3HlKxolALGmhpxBDTcjtk4otie5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddriedugdelgecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
	uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
	fjughrpefhvffufffkofestddtredtredttdenucfhrhhomheprfgruhhluceurghrkhgv
	rhcuoehprghulhessggvthgrfhhivhgvrdgtohdruhhkqeenucfkphepkedurddukeejrd
	efvddrudefkeenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsegsvghtrghfihhv
	vgdrtghordhukhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:n8yPXGiEPsfzOTc21boKyKi7lrGZIgncIYxWtaMimkRFur3IDMTSWQ>
	<xmx:n8yPXFbQGYl0DDxvTw7SmCSJYiZh0dEkEfrGKOo8iW6G4JBsfqH-cQ>
	<xmx:n8yPXAgfFQe0rLYjoBrWmvg_ehSBzyPKgzWNiv4o50Sk0IC2uUMcoQ>
	<xmx:n8yPXBlo2r402JQePC_yIj5EEgVLtGd4RuKTHT5HUbMwhcV_lnaPmg>
Received: from lap0.Hitronhub.home (138.32.187.81.in-addr.arpa [81.187.32.138])
	by mail.messagingengine.com (Postfix) with ESMTPA id 53207E4549;
	Mon, 18 Mar 2019 12:51:42 -0400 (EDT)
From: Paul Barker <paul@betafive.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Mar 2019 16:51:38 +0000
Message-Id: <20190318165138.30402-1-paul@betafive.co.uk>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] tzdata: Add tzdata-all package
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
X-List-Received-Date: Mon, 18 Mar 2019 17:00:27 -0000

The tzdata-all package provides a simple way of ensuring all timezones
are supported in an image.

Signed-off-by: Paul Barker <paul@betafive.co.uk>
---
 meta/recipes-extended/timezone/tzdata.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
index 7542ce52d2..e419296530 100644
--- a/meta/recipes-extended/timezone/tzdata.bb
+++ b/meta/recipes-extended/timezone/tzdata.bb
@@ -82,7 +82,14 @@ pkg_postinst_${PN} () {
 
 PACKAGES = "tzdata tzdata-misc tzdata-posix tzdata-right tzdata-africa \
     tzdata-americas tzdata-antarctica tzdata-arctic tzdata-asia \
-    tzdata-atlantic tzdata-australia tzdata-europe tzdata-pacific"
+    tzdata-atlantic tzdata-australia tzdata-europe tzdata-pacific tzdata-all"
+
+ALLOW_EMPTY_tzdata-all = "1"
+RDEPENDS_tzdata-all = " \
+    tzdata tzdata-misc tzdata-posix tzdata-right tzdata-africa \
+    tzdata-americas tzdata-antarctica tzdata-arctic tzdata-asia \
+    tzdata-atlantic tzdata-australia tzdata-europe tzdata-pacific \
+    "
 
 FILES_tzdata-africa += "${datadir}/zoneinfo/Africa/*"
 RPROVIDES_tzdata-africa = "tzdata-africa"
-- 
2.17.1


