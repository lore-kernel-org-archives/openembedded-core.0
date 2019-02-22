Return-Path: <tanuk@iki.fi>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 8922A7CBE5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 15:44:31 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 86C5621957;
	Fri, 22 Feb 2019 10:44:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute5.internal (MEProxy); Fri, 22 Feb 2019 10:44:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=lesv0IXwE4hedzesEvkEzHq7seCsfzzlrrt9k1xdq
	zE=; b=p2ZBGpeHIuGUSNRWONoEWXJ6Om3T1IXaIC7jho0/3UJlt8MJ1NRNTRqLG
	k7XqesBP+ohcEAYcq13L4tval443le3ryDOclaGdiOhDZBfv9l7J/dvc1GefPk49
	TewsrzEqm/BnFWomLgpwc1f/2BpQ4aKHzOzovmcBjqBCpezcmZ5ARCh3iilyto/h
	OG3+8b1CIo2gYnkH6V5Nfz/wfIlmzNc/dW7MWVUbePmigntZkY7qhiaCX7R+6XC/
	3jq4u7dgfVkcdqc3F/AIDOYQVJlypeCCRLSxvXQXLrS2RYs3pbEs6QbHI/yI67d3
	B/pKBd0izg01zIIC3z3xp62nO0nFw==
X-ME-Sender: <xms:4BhwXPK8JGxgiLrrWpnA5gd4iX9qmplomPbKeFoK3FSFJ_piyNp7qw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddruddtgdekvdculddtuddrgedtledrtddtmd
	cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepvfgrnhhu
	ucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuffhomhgrihhnpehlih
	gsvghrrghprgihrdgtohhmpdgrlhhsrgdrohhrghdphihotghtohhprhhojhgvtghtrdho
	rhhgpdgrlhhsrgdqphhrohhjvggtthdrohhrghdpohhpvghnvghmsggvugguvggurdhorh
	hgpdhprghtrhgvohhnrdgtohhmnecukfhppeekkedruddufedrvdduuddrjedvnecurfgr
	rhgrmhepmhgrihhlfhhrohhmpehtrghnuhhksehikhhirdhfihenucevlhhushhtvghruf
	hiiigvpedt
X-ME-Proxy: <xmx:4BhwXHbUorkAb07l_ReNYwe9lqfsG0gHE90kXaFGw9YMj55rLTn_YA>
	<xmx:4BhwXCtnqUcNggte0qYGZRo8TFU17Gf3zi8rMoeUQQ30LMJX22hatg>
	<xmx:4BhwXMuYdCpcuV5sZqJTdKVqAeYOZPC1xeEaL9JU77WaFE1o5gcM4w>
	<xmx:4BhwXAXHtUA3bdaJjyTuufDa3OZNfgSh5uw1sriHaHI_n2ztne3KzA>
Received: from laptop (88-113-211-72.elisa-laajakaista.fi [88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id 52F0B10338;
	Fri, 22 Feb 2019 10:44:31 -0500 (EST)
Message-ID: <27075bf6603464acccbbac21c2fe369a8a4c191b.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 22 Feb 2019 17:44:27 +0200
In-Reply-To: <CAMKF1soTbbU-ht1A7Pm6NRh8i4r7Lf4UtkVQzBsy7GfUHWd=uw@mail.gmail.com>
References: <cover.1550755109.git.tanuk@iki.fi>
	<CANNYZj8f0SMDZd3wryCZ0A2=RjLfOAR6q5=bLsV+QgWDakJ_7g@mail.gmail.com>
	<CANNYZj-8euMhvqpAwHoZfofAm=FdCtJSb9i7QOMiTGMhv=322w@mail.gmail.com>
	<236c2e06d12bde612ffa2399cedb9bbfce7dd5dc.camel@iki.fi>
	<CANNYZj-PdeoHukCN7_i8RgZDYRCS3dc3xWDhKXvuienyNzUFVA@mail.gmail.com>
	<CANNYZj85xGjdwMLRc3EzWzyZh6xBc+-GKhM5hwyxf3uXjS5epw@mail.gmail.com>
	<CAMKF1soTbbU-ht1A7Pm6NRh8i4r7Lf4UtkVQzBsy7GfUHWd=uw@mail.gmail.com>
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
X-List-Received-Date: Fri, 22 Feb 2019 15:44:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-02-22 at 07:01 -0800, Khem Raj wrote:
> On Thu, Feb 21, 2019 at 10:33 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> > ftp://ftp.alsa.org seems inaccessible or unstable:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/70/builds/317/steps/7/logs/step1b
> > (also can't open it on my local machine)
> > and generally we prefer http:// sources over ftp, if available.
> > 
> > Alsa does have one: https://www.alsa-project.org/files/
> > 
> > so can you please resend with SRC_URIs changed to use it? (also for
> > alsa-tools and everywhere where the ftp is currently used)
> > 
> > Alex
> 
> seeing this fetch issue building alsa-utils-scripts
> 
> ERROR: Fetcher failure for URL:
> 'https://www.alsa-project.org/files/pub/utils/alsa-utils-scripts-1.1.8.tar.bz2'.
> Unable to fetch URL from any source.

Fixed in master-next:
http://cgit.openembedded.org/openembedded-core/commit/?h=master-next&id=865147cdfff8dd2762aa9ccf4672aacec0a8040f

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk


