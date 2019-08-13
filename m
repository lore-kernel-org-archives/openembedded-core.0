Return-Path: <tanuk@iki.fi>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 6CB617E8B7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 13:28:51 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 4F4362207F;
	Tue, 13 Aug 2019 09:28:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute5.internal (MEProxy); Tue, 13 Aug 2019 09:28:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=CanyYBAdUlV0qhQDn7Ip3IuMnuTJwMp8IZGnD9GmP
	FU=; b=RwhF4IJJy7ePrmejS1fXzuXrDQo1BMcraHNbsO9Zw5yuMdTL0UUw/uJn9
	E+YtlJFBPpZ2dtNr7NUnZoijwXxz5Pd/uTuEHL5LgQz7PdQQGeX0/CB5hYsnfStm
	xAVLfvR5zSebPtv3ydqcdjZUybuaRvvliBW7sYl9fBJM/1Jhk/Y3Pli3hH27ClqP
	VzKXvXRpEVVDk5MNzWXOA3C+6d4tc8fspb3tPZfPRARMq/ymnHup3Fwb4cXz8G8N
	rah21kJFCrUUYZQp/CmFgCaKRkxxP9a7fI9OgkdMKxOPSMBlHoLveaE1MlQ0Cy5l
	GB+6w9b8f5V8WRjN5ehHiLUB3Z8dw==
X-ME-Sender: <xms:E7tSXUAdZkZIjC1ywF1AFN2XyBo4WNn0RFg9HbBwxAosqzVdX9RS-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddviedgieduucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepvfgrnhhu
	ucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuffhomhgrihhnpehfrh
	gvvgguvghskhhtohhprdhorhhgpdhlihgsvghrrghprgihrdgtohhmpdhgihhthhhusgdr
	tghomhdpphgrthhrvghonhdrtghomhenucfkphepudeliedrvdeggedrudeluddrledtne
	curfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhksehikhhirdhfihenucevlhhushht
	vghrufhiiigvpedt
X-ME-Proxy: <xmx:E7tSXcmDfHObo4ebxjS8d_iOhW8QYz_NLAyduuggXvRzgamX1CNl4Q>
	<xmx:E7tSXa0TQFa9xgUTxsjoupv_NGgTDvSo9mdNNNtiAI2f_nD7-Cr6Mg>
	<xmx:E7tSXS5mGKQO5dYS0_wdx4wQCV_iQnzCEjHGfdfpbaDHGxU-VzluEg>
	<xmx:FLtSXTLwA2mH0f2oR9anWPHREXiScun90c6DLIFotIM-MykWDCkSXg>
Received: from laptop (unknown [196.244.191.90])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2E573380075;
	Tue, 13 Aug 2019 09:28:51 -0400 (EDT)
Message-ID: <fd9ecc1dff290bfb888cad083d1d20871ac1206d.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Anuj Mittal <anuj.mittal@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 16:28:47 +0300
In-Reply-To: <24571c4be57eb53607ddcf620abd282f6c88009c.camel@iki.fi>
References: <1564153395-3984-1-git-send-email-anuj.mittal@intel.com>
	<24571c4be57eb53607ddcf620abd282f6c88009c.camel@iki.fi>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [PATCH] pulseaudio: don't include consolekit when systemd is enabled
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
X-List-Received-Date: Tue, 13 Aug 2019 13:28:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-08-13 at 16:11 +0300, Tanu Kaskinen wrote:
> On Fri, 2019-07-26 at 23:03 +0800, Anuj Mittal wrote:
> > When using systemd, make sure that pulseaudio-server RDEPENDS on
> > module-systemd-login instead of module-console-kit both of which provide
> > the same functionality but for different init systems [1][2].
> > 
> > Even though both modules can co-exist, this helps avoid including
> > consolekit (which has been deprecated) in the images using systemd.
> > 
> > [1] https://www.freedesktop.org/wiki/Software/PulseAudio/Documentation/User/Modules/#index51h3
> > [2] https://github.com/pulseaudio/pulseaudio/commit/860d1cf3a76701ade38784822abb24285176227c
> > 
> > Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> 
> Acked-by: Tanu Kaskinen <tanuk@iki.fi>

Never mind, this is already in master (I didn't find it initially,
which is why I sent that mail as a ping).

-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk


