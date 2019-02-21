Return-Path: <tanuk@iki.fi>
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
	[64.147.123.25])
	by mail.openembedded.org (Postfix) with ESMTP id E11B37CB8E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 16:41:05 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id C1FD033C4;
	Thu, 21 Feb 2019 11:41:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute5.internal (MEProxy); Thu, 21 Feb 2019 11:41:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=yxoq5cEE7kaUjpnZUHLgMQIpP8nFd2gdqEFokVf+G
	h0=; b=dog0yrAMTA7nHMJw7r4+cUeJgxuW8cuFMkYRXylJaKo7Vzy5bIFB524n8
	I3ixOv/p+o68MfXJQhWFNw0+uQVjx53Ps8g5GpqAm3UJIHSsFsGf6Ymj/yYbli9g
	RR7aLyTP++0OGa06CXyN6M3X7ZyD/mdsIme6WRfB+anjTpQ6ZR0tutxyvUqiSsyv
	g9eX1qeAyNYnHajGlqY5njymqqQH3ZLkh0oXgigktpCpKmHoC8Penfdw3BbgQGYG
	f62JEZeGxvI56bU6oCLHK7uS+0lncx4McxxA8TaPNoSlkIXPNrxTHowqiDWlfWn9
	FC2IEXJdwhDEfUogunZTsszSQ04RQ==
X-ME-Sender: <xms:otRuXBsrUhB6euE-vWwUuTpHqOCmggzzD2VNPtqTMai1SswHRUzcDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrtdekgdelfeculddtuddrgedtledrtddtmd
	cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepvfgrnhhu
	ucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuffhomhgrihhnpehlih
	gsvghrrghprgihrdgtohhmpdhophgvnhgvmhgsvgguuggvugdrohhrghdpphgrthhrvgho
	nhdrtghomhenucfkphepkeekrdduudefrddvuddurdejvdenucfrrghrrghmpehmrghilh
	hfrhhomhepthgrnhhukhesihhkihdrfhhinecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:otRuXFhDj1IYcMNmtglWn0QA5GvprSK1wAIg1qa-dybAEDsztVUJzQ>
	<xmx:otRuXM1LJRxaWwC3VIG9LVT-7IsB5SeC8HhuLW4Jr9yZEbcUhqT5Iw>
	<xmx:otRuXKetX9Hoznqa3qYItSmE7J37_ExqtFyhkiyWvULQpOrsZ2dayw>
	<xmx:otRuXATOq5z2TM20fXcE-u7WrNTvMdU8Wwgev5gGoHVcHNBSzHu27w>
Received: from laptop (88-113-211-72.elisa-laajakaista.fi [88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id 6B69510319;
	Thu, 21 Feb 2019 11:41:05 -0500 (EST)
Message-ID: <236c2e06d12bde612ffa2399cedb9bbfce7dd5dc.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 21 Feb 2019 18:41:00 +0200
In-Reply-To: <CANNYZj-8euMhvqpAwHoZfofAm=FdCtJSb9i7QOMiTGMhv=322w@mail.gmail.com>
References: <cover.1550755109.git.tanuk@iki.fi>
	<CANNYZj8f0SMDZd3wryCZ0A2=RjLfOAR6q5=bLsV+QgWDakJ_7g@mail.gmail.com>
	<CANNYZj-8euMhvqpAwHoZfofAm=FdCtJSb9i7QOMiTGMhv=322w@mail.gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] alsa recipe updates
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
X-List-Received-Date: Thu, 21 Feb 2019 16:41:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Richard already sent the update for sbc, so I left it out. As for alsa-
tools, if you read the cover letter in more detail, you'll find the
answer there :) (Spoiler: I'll send it, but it's not ready yet.)

-- Tanu

On Thu, 2019-02-21 at 15:57 +0100, Alexander Kanavin wrote:
> (Also sbc needs an update, I think)
> 
> Alex
> 
> 
> On Thu, 21 Feb 2019 at 15:56, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> > Thanks! Will you be also sending an update to alsa-tools?
> > 
> > Alex
> > 
> > On Thu, 21 Feb 2019 at 14:34, Tanu Kaskinen <tanuk@iki.fi> wrote:
> > > The following changes since commit f15ceac287c094abdeda64b03628455d92e0ce74:
> > > 
> > >   libdrm: Upgrade 2.4.96 -> 2.4.97 (2019-02-20 21:22:28 +0000)
> > > 
> > > are available in the Git repository at:
> > > 
> > >   git://git.openembedded.org/openembedded-core-contrib tanuk/updates
> > >   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=tanuk/updates
> > > 
> > > 
> > > The alsa-tools update is missing, because the recipe upgrade deadline is
> > > near and the changes in alsa-tools look like a potential rabbit hole.
> > > I'll send the alsa-tools update separately when it's ready. The main
> > > change in alsa-tools is that the hwmixvolume program got ported from
> > > PyGTK to gobject-introspection, and from GTK2 to GTK3. I doubt anyone
> > > actually is using that program, it's not even built by default.
> > > 
> > > 
> > > Tanu Kaskinen (3):
> > >   alsa-lib: 1.1.6 -> 1.1.8
> > >   alsa-plugins: 1.1.6 -> 1.1.8
> > >   alsa-utils: 1.1.6 -> 1.1.8
> > > 
> > >  .../{alsa-lib_1.1.6.bb => alsa-lib_1.1.8.bb}  |  4 +-
> > >  ...plugins_1.1.6.bb => alsa-plugins_1.1.8.bb} | 84 +++++++++++++++++--
> > >  ...s_1.1.6.bb => alsa-utils-scripts_1.1.8.bb} |  0
> > >  ...lsa-utils_1.1.6.bb => alsa-utils_1.1.8.bb} | 10 +--
> > >  .../recipes-multimedia/ffmpeg/ffmpeg_4.1.1.bb |  2 +-
> > >  5 files changed, 85 insertions(+), 15 deletions(-)
> > >  rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.6.bb => alsa-lib_1.1.8.bb} (88%)
> > >  rename meta/recipes-multimedia/alsa/{alsa-plugins_1.1.6.bb => alsa-plugins_1.1.8.bb} (51%)
> > >  rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.1.6.bb => alsa-utils-scripts_1.1.8.bb} (100%)
> > >  rename meta/recipes-multimedia/alsa/{alsa-utils_1.1.6.bb => alsa-utils_1.1.8.bb} (92%)
> > > 
> > > --
> > > 2.20.1
> > > 
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk


