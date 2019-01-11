Return-Path: <paul@betafive.co.uk>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 5D2B87C172
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2019 16:54:49 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 51D6D21EED;
	Fri, 11 Jan 2019 11:44:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute1.internal (MEProxy); Fri, 11 Jan 2019 11:44:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id; s=fm3; bh=IiGnHj40jj7OvOz
	mWMAKHU1ty+IAFU/VH7tLFt0V75M=; b=odt/TvQlKjFeeFsdQ2vl5ckMbUe/zld
	dIe7ynHz1FcSwHQWaMjuKj/dgrT2UDDYvSO6Kids++VMRkhfvvuz4d3tYCcbOa/D
	OHL6PYjonkIyoQp4Ywxr9NFdBJPcF2AixyeY31wMFINcf2/65wdF7GatQELL7OGW
	ZIv14T4xFyUQgd5t+0VKmy9nOWE9WFyUVB5wDDcqlZBVG4YxDRxmPeiD8mBRWDLa
	2d+TZPz5ObqP27+D+ETUDn8U7lXu6hsx91RXBBgrFunjQyYXpzVBKoTSXxfjq+2w
	VfQAxsE4L5EA7BalICVm0cIQLXg3wLAESECbr34YtZS0NtcOgLvY0lw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=IiGnHj40jj7OvOzmWMAKHU1ty+IAFU/VH7tLFt0V75M=; b=lzIv+nph
	QB14fdSP+W7tJfHajgPsWWMCk6seeNBTKRKgflhSICcZ6i6meElNGSbX3W2uwkrO
	mosRT1JamboOO1ghsJTR6ITrGYtygSCwAGW0P9IFjhP1WP1ypRDiBHo3Cemd1R2s
	Gbt5d9leDsN9TfpfRi6fsFSEwvGCAqkRpUPaFNncfxg6xXfiRbBPnUIvxb3DLOlR
	S2VfO30B5hKhNNeDeoxxNd9p24SBQpIRJEnt9gPmn94dbFB7AHYNqfrl6OFksZ9L
	ZvyZeQQcTxbxG18LwWO9Bw6lBpDQ9J99w11pSblVbDuFARB7TArWLDor/ooQU3Bz
	c6p94uQHPjLdVA==
X-ME-Sender: <xms:A8g4XKhVd3P5Y9sNJLEJn7LAqBbE7dVMEYbKAqPK3GS4KAtUI34mHw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrfeehgdelgecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
	tdenucenucfjughrpefhvffufffkofestddtredtredttdenucfhrhhomheprfgruhhluc
	eurghrkhgvrhcuoehprghulhessggvthgrfhhivhgvrdgtohdruhhkqeenucfkphepkeek
	rdelledrvdejrdelvdenucfrrghrrghmpehmrghilhhfrhhomhepphgruhhlsegsvghtrg
	hfihhvvgdrtghordhukhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:A8g4XPRdyaj1lUAG1NuzyxmkR5DBuBwUWHV1IEyNKw_Pd1pWaqdRsg>
	<xmx:A8g4XNElwb73NZkb7XEisQiqHUiCXXRxlLQ2b78FLyttEPMmgiK38Q>
	<xmx:A8g4XHnp4elAlPQZF_zesxQ52RjR6HfBuYDzNh9335BBTj35_OEwTw>
	<xmx:BMg4XHuAgpvK99qlAA9rQjFRsQ2goH-_yUaqsB0mh76Gub66mKZQfg>
Received: from eng01.s01.b5net.uk (unknown [88.99.27.92])
	by mail.messagingengine.com (Postfix) with ESMTPA id 08AADE407B;
	Fri, 11 Jan 2019 11:44:50 -0500 (EST)
From: Paul Barker <paul@betafive.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Jan 2019 16:44:37 +0000
Message-Id: <20190111164438.19749-1-paul@betafive.co.uk>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 0/1] [RFC/RFT] Shorten file names in sstate-cache
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
X-List-Received-Date: Fri, 11 Jan 2019 16:54:49 -0000

As discussed briefly on IRC earlier in the week, here's a patch which attempts
to shorten the file name lengths seen in the sstate cache whilst retaining as
much useful human-readable info as possible.

This has been tested locally by building, wiping out tmp and then re-building to
confirm that sstate was still re-used correctly. I'm not an expert on sstate
internals though so please feed back with any comments or further testing that
should be done before this is merged to master.

I'd also like to know if there's a simpler method of limiting the length of a
variable expansion so that the python function limit_sstate_frag() can be
dropped.

Paul Barker (1):
  sstate: Shorten file names in sstate-cache

 meta/classes/sstate.bbclass | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.17.1


