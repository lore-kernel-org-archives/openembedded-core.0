Return-Path: <tanuk@iki.fi>
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
	[64.147.123.25])
	by mail.openembedded.org (Postfix) with ESMTP id 672597CBA7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 19:42:51 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 80AA332FA;
	Thu, 21 Feb 2019 14:42:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Thu, 21 Feb 2019 14:42:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=bbHpYJpf73Q+stFTF+bCKIEystf2Mj9eyqovwq770
	FY=; b=6QOJI/E9y6W8eV9sNP9qyRmOEENwazKBLDuVzV1V2LkXiH9y9LCbJJTcG
	06HTeHrKLl9DVRl2OQ2wDcasjODdxZXX6vCpZn/pr6CnECyMSWtC/S3sgEH/2m09
	8PJR+rr8xk9UTm5DqWZw/6VDr2F0aTk026EUuzqdIXJ8w941iDo5gt256C0cLwIj
	qdzUsoktyWzXBGY4TA/qn7Vuj04jPjFeDqtvbjMn/P7cH5HsNk7kFnR6ZVQ1wMyL
	SLhp2iYLtdhf+off1EoEksjp1tUdPdq7enMlrCoOOCU9b21ZaOrDek6JAGT9stOH
	Swpi7KVtoaL8iazQNeCiGUtst/cBg==
X-ME-Sender: <xms:O_9uXItxtDBzUJHtILFDJDnShbsUKMet0EpRsN7LvjBH4VOIMHIFGA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrtdekgddufeduucdltddurdegtdelrddttd
	dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhht
	necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
	enucfjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefvrghn
	uhcumfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhiqeenucffohhmrghinheplh
	hisggvrhgrphgrhidrtghomhdpghhithhhuhgsrdgtohhmpdgrlhhsrgdqphhrohhjvggt
	thdrohhrghdpphgrthhrvghonhdrtghomhenucfkphepkeekrdduudefrddvuddurdejvd
	enucfrrghrrghmpehmrghilhhfrhhomhepthgrnhhukhesihhkihdrfhhinecuvehluhhs
	thgvrhfuihiivgeptd
X-ME-Proxy: <xmx:O_9uXA7sLNstGoYlOsxi4pSg0yrwEI078OkBfDMd-MGflC4UGy6T8Q>
	<xmx:O_9uXHWrtT9piqOeKhsIQSSEfaVIthuML9J6LjK9M-txvjT2Gf-sSA>
	<xmx:O_9uXEM-SLGlWFDlmNRWo-6b6Aoi4-nLrhmts7MyyD2sjks7iLthEA>
	<xmx:PP9uXO12itwBFlLNUpcjLxonNm4C9Tq2Ie9Dtva18eg1PfRf9lLLyQ>
Received: from laptop (88-113-211-72.elisa-laajakaista.fi [88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3AB9DE454E;
	Thu, 21 Feb 2019 14:42:51 -0500 (EST)
Message-ID: <b258ae4f0687c75f3dc35edd9c1545d029c22420.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Feb 2019 21:42:47 +0200
In-Reply-To: <d69c68b7bd8d492a5551194eb82192de28a4a662.camel@iki.fi>
References: <cover.1550755109.git.tanuk@iki.fi>
	<4adb54612485c88c98ae65860adc8d820f5b51c3.1550755110.git.tanuk@iki.fi>
	<CAMKF1srNi9+LnpUdg5qoXse6EZ6kKN5i2AJjLBYU4B1eBJ0oGQ@mail.gmail.com>
	<d69c68b7bd8d492a5551194eb82192de28a4a662.camel@iki.fi>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] alsa-lib: 1.1.6 -> 1.1.8
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
X-List-Received-Date: Thu, 21 Feb 2019 19:42:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-02-21 at 21:38 +0200, Tanu Kaskinen wrote:
> On Thu, 2019-02-21 at 10:43 -0800, Khem Raj wrote:
> > WARNING: alsa-lib-native-1.1.8-r0 do_fetch: Failed to fetch URL
> > ftp://ftp.alsa-project.org/pub/lib/alsa-lib-1.1.8.tar.bz2, attempting
> > MIRRORS if available
> > 
> > we might need a better source
> 
> I don't know what's going on with the alsa infrastructure, it has had
> various problems since last weekend. Sometimes the ftp server works,
> sometimes it doesn't. The ftp server is certainly the official source,
> since that's what was advertised in the release announcement.
> 
> In my testing I used Debian's archives, but I suppose it's not cool to
> cause server load on Debian.
> 
> Is github a good source? If I recall correctly, github has had some
> kind of problems in the past regarding checksum stability, has that
> improved? I see there are many recipes using github, so I suppose it's
> ok.
> 
> This link seems to work:
> https://github.com/alsa-project/alsa-lib/archive/v1.1.8.tar.gz
> ...but most github SRC_URIs have structure where the the tarball is
> under archive/download/<version>/ and I wasn't able to figure out a
> working url for alsa-lib that would have that structure.

Never mind, I didn't notice that Alex already provided a good source.

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk


