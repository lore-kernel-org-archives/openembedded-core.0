Return-Path: <tanuk@iki.fi>
X-Greylist: delayed 531 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 06 Mar 2020 06:35:57 UTC
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
	[64.147.123.21])
	by mail.openembedded.org (Postfix) with ESMTP id E80806095A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 06:35:57 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.west.internal (Postfix) with ESMTP id A75EF6A0;
	Fri,  6 Mar 2020 01:27:05 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute2.internal (MEProxy); Fri, 06 Mar 2020 01:27:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=xO/PHCNQ3/HWnFCnQnxQ9usPiJK7EJtg9WqFAFx7b
	V4=; b=odkyg9ppA/HgtZYdlFyzZ09WkH1wCZUskMbtbRVidey5YoPc/3kIZCkZr
	b1GvTD4g44HiEl9Y5BCbYbig7425tzfjkKAQLd0qlEVo6PUG5lbDmENCvYUiXfrB
	9zewBie+xvcnMQZlOktlHacllGyHrKNLrc3Htg4Nbu2nw0ThxPXYmGrVWbiCQtnV
	d/7v7/P+ZxqImbGK8Amc8J8XfJCh2j+1lbuZRYUbkroxDcldSX/PmD2RhIt3uGJJ
	VIsAU9Mgqs5wasAQLtms8kMIZ3grGvViVlf/eprQG1MU1lV3VYzFB4LDgZfC4zUs
	//TdY4QzcxswuWji3Ud6P8WF7fphA==
X-ME-Sender: <xms:OO1hXr4X7q011hMMo5JoANGDIxr7bV0xFjqUhwy2JuKNx6w-CYCeag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudduuddgleegucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepvfgrnhhu
	ucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuffhomhgrihhnpegrlh
	hsrgdqphhrohhjvggtthdrohhrghdpphgrthhrvghonhdrtghomhdplhhisggvrhgrphgr
	hidrtghomhenucfkphepudeliedrvdeggedrudeluddrgedvnecuvehluhhsthgvrhfuih
	iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepthgrnhhukhesihhkihdrfhhi
X-ME-Proxy: <xmx:OO1hXhBhmOEwQ5V7SHvDjk1bh-ldfsCAtnIDEhsyrjO3lq7YXSTgqQ>
	<xmx:OO1hXp7ICtdcX2ciH_FNuUNwndXGvoI1lTSpfzHGoeeTPcafS-8UhQ>
	<xmx:OO1hXiv_Q-LxxXq0nUeTLm7WP5EMR_vzh6LdryOZwIM10BKdANNgmw>
	<xmx:Oe1hXq11C2qCthEbBH4rGvqdXBHTdz3_qZ-raQbppRS7aiz2vusJ7g>
Received: from laptop (unknown [196.244.191.42])
	by mail.messagingengine.com (Postfix) with ESMTPA id 282FC30612AF;
	Fri,  6 Mar 2020 01:27:04 -0500 (EST)
Message-ID: <579c97b18435e5145a0bea9f7f01a44c9d22c63a.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Praveen Muthusamy
	<praveen.lisieux2011@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 06 Mar 2020 08:26:59 +0200
In-Reply-To: <1c4e397e80d53d8ef779cf84b57dc4d051ef3238.camel@linuxfoundation.org>
References: <20200223125620.6117-1-praveen.lisieux2011@gmail.com>
	<1c4e397e80d53d8ef779cf84b57dc4d051ef3238.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [PATCH V3] alsa-utils: upgrade 1.2.1 -> 1.2.2
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
X-List-Received-Date: Fri, 06 Mar 2020 06:35:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-02-23 at 13:11 +0000, Richard Purdie wrote:
> On Sun, 2020-02-23 at 18:26 +0530, Praveen Muthusamy wrote:
> > From: Praveen Muthusamy <praveen@linumiz.com>
> > 
> > Changelog: https://alsa-project.org/wiki/Changes_v1.2.1.2_v1.2.2
> > 
> > Signed-off-by: Praveen Muthusamy <praveen@linumiz.com>
> > ---
> >  ...lsa-utils-scripts_1.2.1.bb => alsa-utils-scripts_1.2.2.bb} | 0
> >  .../alsa/{alsa-utils_1.2.1.bb => alsa-utils_1.2.2.bb}         | 4 ++--
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-multimedia/alsa/{alsa-utils-scripts_1.2.1.bb => alsa-utils-scripts_1.2.2.bb} (100%)
> >  rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.1.bb => alsa-utils_1.2.2.bb} (97%)
> 
> Thanks, does this address the previous testing failure though?

alsa-utils 1.2.2 seems to depend on alsa-lib 1.2.2 (specifically,
alsatplg uses a new function in libatopology), so alsa-utils can't be
updated before alsa-lib.

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk


