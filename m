Return-Path: <paul@betafive.co.uk>
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
	[64.147.123.21])
	by mail.openembedded.org (Postfix) with ESMTP id 07A657FA16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 14:16:26 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id 7A6465BB;
	Mon, 11 Nov 2019 09:16:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Mon, 11 Nov 2019 09:16:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=fm3; bh=+wl99adPnz9qSBqe4rgvrWA+Gq
	4s0Ip9c0LvrV7KfGk=; b=DxZah5FVlBu40rqzVDszrzylaq7vQGBm1EWxG77Mm5
	9uTOCW3W/FgRkYRmCioLoXgIrPX7kpsnLL0P6n/xSK4vCkk+JsBUSd7W6Zr1pl1I
	c2nk/NMJtlNrTlnQpqkl5EkzM5JHojGwFpy2ACB3wfkD2/ZK3LbyNqEcVzwcag6J
	LE30haiL3aNIQDPtZ8qyRh+dVMee9FU6rD++dabk+WM1w1n0WqjyTksutK1qchbC
	aJtOFFc03tEdQqRHVAPbgMc7cK3rDclYqSEZD3nWMWeTRpMeM364Eg/n0OWIve86
	5pD33GeiJsJV0ndVnripEaG1lQmVM3/A0KNZ6PtYsm5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=+wl99adPnz9qSBqe4
	rgvrWA+Gq4s0Ip9c0LvrV7KfGk=; b=ouXgeQQq9yiGVAKkyvhg6YtjnxtUCQX08
	+I4wdxDj+llXqA+Klu6znVxZESNKtIAC40OXUpXC0C7kYz0ojNh02OSOvjKa6uuh
	Idu71O0XhS55s/KoOVU6w5YWTxrKKugAL50L/BjVz4wrTCOaISKmBMFyGUjB9Kcz
	gsF/IFAWJC3rq7HeUXvPaNtoF9VYZ1KMqDFQTkha3dvDhBQuVyDfBjfJ1Utgf3zt
	+cY6pUs0QzRMX1Fk9nZbP3vjflbijXbWLKbputezcu6BU9MtQiHxC84ktQQi5nhd
	4ewjmszMSe5ga8vzGPkERI8blA7ik5PcHUghy7vfNgfLEOXkMrm+g==
X-ME-Sender: <xms:OW3JXQIC3wY0wIhtevNaTt2fcY-vX9MHBZXfg1VkyZmfW4q_393QWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddvjedgieefucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgggfestdekredtre
	dttdenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhessggvthgrfhhivhgv
	rdgtohdruhhkqeenucfkphepkedvrdegrddvtdejrdeivdenucfrrghrrghmpehmrghilh
	hfrhhomhepphgruhhlsegsvghtrghfihhvvgdrtghordhukhenucevlhhushhtvghrufhi
	iigvpedt
X-ME-Proxy: <xmx:OW3JXb8Ry5uLylxETfoXXA9sc3uqYDyjts83AQdr6mnh3aDiGhSCsQ>
	<xmx:OW3JXcFhzY2pOnaPD3cf1lnIXkM3zalSWBCo_x-wo3rEziA1OHd9-A>
	<xmx:OW3JXW5C4JTsyyQ3kNg15EjRZPTiXgE5qSDcJqKsPn1OMiark_nE8A>
	<xmx:Om3JXcyPdrGeSBA5le_SIXS_F-H9sQydTudA1QoqvZsLQ5J5eDVKbw>
Received: from arch-laptop.roaming.b5net.uk
	(cpc86219-nott20-2-0-cust829.12-2.cable.virginm.net [82.4.207.62])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5FF9C3060060;
	Mon, 11 Nov 2019 09:16:25 -0500 (EST)
From: Paul Barker <paul@betafive.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 14:16:20 +0000
Message-Id: <20191111141621.319368-1-paul@betafive.co.uk>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [PATCH 0/1] Extend oeqa tests for archiver.bbclass
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
X-List-Received-Date: Mon, 11 Nov 2019 14:16:27 -0000
Content-Transfer-Encoding: 8bit

In preparation for adding the new mirror archiver mode I've added a
bunch of additional oeqa tests for the archiver bblass. I'm submitting
these separately first as this is the first time I've done anything
with oeqa and things may need a little rework.

The tests use the selftest-ed recipe from the meta-selftest recipe so I
assume they can rely on the version number and source file name not
changing.

Paul Barker (1):
  oeqa: archiver: Add basic tests for all archiver modes

 meta/lib/oeqa/selftest/cases/archiver.py | 66 ++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

-- 
2.24.0


