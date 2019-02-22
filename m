Return-Path: <tanuk@iki.fi>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 13A357C679
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 08:06:57 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id B1764220B3;
	Fri, 22 Feb 2019 02:57:41 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
	by compute5.internal (MEProxy); Fri, 22 Feb 2019 02:57:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=0oF4NOgKRgt81CeScWUjOAY3+2N3sq19ZuzdF1gW9
	o4=; b=PEIPjG1iaHXdL8qYG2oZkXeR3b1VCbL/fp8mqUHjXkjOtMlIRr+LrFO+0
	DXJeoW8X4Y7+8o+qZ8u9oQVeRO7uWl0IMDdX0P+3X63j+pOFs/3hAo2zI0eol0pk
	feJ2NEMHLQg+SY2O1FHKGEaVEq6h+GVisWblNbG3XDvgoZZtkxbqHjkWDR/3oiAQ
	cih6tayRCoQgoAgMb9znb+J/yfycYFTZKuMs1tr8jNZaQbojTAzWD43HagRPGr8d
	0UK7u6c8mzsZtCO6TB4G5h1kVneu8x2PdNKCItaNjSuySqww5zO5GGCgclsuHUA/
	Tipzb+e/HnAy1NV9j4J7MphkAbzUg==
X-ME-Sender: <xms:datvXLiBSgSfwNk_PHb-tJcvnU66xi9Teh_HC83yvZeuvaO8MnXI0g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrtdelgdduudefucdltddurdegtdelrddttd
	dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhht
	necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
	enucfjughrpefkuffhvfffjghftggfggfgsehtjeertddtreejnecuhfhrohhmpefvrghn
	uhcumfgrshhkihhnvghnuceothgrnhhukhesihhkihdrfhhiqeenucffohhmrghinheplh
	hisggvrhgrphgrhidrtghomhdpphgrthhrvghonhdrtghomhenucfkphepkeekrdduudef
	rddvuddurdejvdenucfrrghrrghmpehmrghilhhfrhhomhepthgrnhhukhesihhkihdrfh
	hinecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:datvXMSACYs4gY_mOY7TJbBr4qeNEOoBRiYt3hscdB3P4oLR5-GcmA>
	<xmx:datvXGHYFitZiPhjNZlDGCMnfHadasFzZtGwgdvfaxahvAB_aMinYg>
	<xmx:datvXMlQjIVlJzJZFdKrcUciI0497Q7qAZ7B_BOuzzxCQezipgRleg>
	<xmx:datvXNZkHkfQZWoa2OHIrlnHDcCpXqttoDrkacbUhNiBnzRW_Y4ITg>
Received: from laptop (88-113-211-72.elisa-laajakaista.fi [88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id C2D06E412B;
	Fri, 22 Feb 2019 02:57:40 -0500 (EST)
Message-ID: <8d6f73b49161cbbd2cffe2f756ec652ca11bafaa.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 22 Feb 2019 09:57:37 +0200
In-Reply-To: <CANNYZj90S9_U-_6Qh0_vCG4cQEc5StRcdb1AdRNmr1BwCjRYqA@mail.gmail.com>
References: <cover.1550779769.git.tanuk@iki.fi>
	<CANNYZj90S9_U-_6Qh0_vCG4cQEc5StRcdb1AdRNmr1BwCjRYqA@mail.gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/3] alsa recipe updates
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
X-List-Received-Date: Fri, 22 Feb 2019 08:06:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-02-21 at 21:28 +0100, Alexander Kanavin wrote:
> On Thu, 21 Feb 2019 at 21:13, Tanu Kaskinen <tanuk@iki.fi> wrote:
> > Changes in v2:
> >  - More reliable SRC_URIs.
> > 
> > 
> > Tanu Kaskinen (3):
> >   alsa-lib: 1.1.6 -> 1.1.8
> >   alsa-plugins: 1.1.6 -> 1.1.8
> >   alsa-utils: 1.1.6 -> 1.1.8
> > 
> >  .../{alsa-lib_1.1.6.bb => alsa-lib_1.1.8.bb}  |  6 +-
> >  ...plugins_1.1.6.bb => alsa-plugins_1.1.8.bb} | 86 +++++++++++++++++--
> >  ...s_1.1.6.bb => alsa-utils-scripts_1.1.8.bb} |  0
> >  ...lsa-utils_1.1.6.bb => alsa-utils_1.1.8.bb} | 14 ++-
> >  .../recipes-multimedia/ffmpeg/ffmpeg_4.1.1.bb |  2 +-
> 
> I guess alsa-tools should also get an updated SRC_URI, even without a
> version upgrade for now?

Yes, you're right. I didn't get your point the first time you requested
this, sorry...

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk


