Return-Path: <tanuk@iki.fi>
X-Greylist: delayed 577 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 13 Aug 2019 13:21:02 UTC
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id D1C577EB41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2019 13:21:02 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 745DD21CFD;
	Tue, 13 Aug 2019 09:11:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute5.internal (MEProxy); Tue, 13 Aug 2019 09:11:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=t7A31EDptwnyDYHQk/mv2D/88EaSVz9W9Uphopq+G
	sA=; b=y0EclJTX/S6fW+nEn5IqVmMn5vL32BApjNNyBTtTtcnVOC2LIlsWW2mBV
	ywF0URPM+IQYikpzGtZ3X9nkuuI0oyDZ36Adgz46yc9LFISaeWN2QR0MUrGRE+wS
	S4YLD7zLjjhu1pyoOp98CTKN8ndG+wCmcqghcZx3yiQX8b0NEfJzGY6DSZXLO4rA
	vlYP8EZhgV4S9ej5qZscLrfLq83/7t9v4w7G42Pvy+05se96eAFUFTSKa2pic3Ru
	KT96cH0k/uEyC+hFkobnMj2w7j7TywI37/2QVpwCxZjaqb8KV6FOnnjECt5eyzSH
	UFpi6FzHNZuMeXGN0laiGj4QpBlNg==
X-ME-Sender: <xms:_bZSXZpuBU7PHyDI4xBy-gexK7gtQGCdosbbqz0RfatrUDedRcnJoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddviedgheejucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
	cujfgurhepkffuhffvffgjfhgtfggggfesthejredttderjeenucfhrhhomhepvfgrnhhu
	ucfmrghskhhinhgvnhcuoehtrghnuhhksehikhhirdhfiheqnecuffhomhgrihhnpehfrh
	gvvgguvghskhhtohhprdhorhhgpdhlihgsvghrrghprgihrdgtohhmpdhgihhthhhusgdr
	tghomhdpphgrthhrvghonhdrtghomhenucfkphepudeliedrvdeggedrudeluddrledtne
	curfgrrhgrmhepmhgrihhlfhhrohhmpehtrghnuhhksehikhhirdhfihenucevlhhushht
	vghrufhiiigvpedt
X-ME-Proxy: <xmx:_bZSXdjblP6Kte2owjIcdWl5t1U64V2lvnJL2hM485sN0BcgDcmiXg>
	<xmx:_bZSXa3nxSgrJddZf1E68aBZgHR6FEh8MgmkjryBUF97rOpneVN37w>
	<xmx:_bZSXTZbTle2U3Y1gTUoM03R5oIKqNCoMYwqYW9Mhooa3fTIq5NZ0Q>
	<xmx:_rZSXX60bAsrJk1GcChCqbdlonUXr_RFhAV3zrQu2a_DILFL27YBMQ>
Received: from laptop (unknown [196.244.191.90])
	by mail.messagingengine.com (Postfix) with ESMTPA id 40FAF380079;
	Tue, 13 Aug 2019 09:11:25 -0400 (EDT)
Message-ID: <24571c4be57eb53607ddcf620abd282f6c88009c.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Anuj Mittal <anuj.mittal@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2019 16:11:21 +0300
In-Reply-To: <1564153395-3984-1-git-send-email-anuj.mittal@intel.com>
References: <1564153395-3984-1-git-send-email-anuj.mittal@intel.com>
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
X-List-Received-Date: Tue, 13 Aug 2019 13:21:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-07-26 at 23:03 +0800, Anuj Mittal wrote:
> When using systemd, make sure that pulseaudio-server RDEPENDS on
> module-systemd-login instead of module-console-kit both of which provide
> the same functionality but for different init systems [1][2].
> 
> Even though both modules can co-exist, this helps avoid including
> consolekit (which has been deprecated) in the images using systemd.
> 
> [1] https://www.freedesktop.org/wiki/Software/PulseAudio/Documentation/User/Modules/#index51h3
> [2] https://github.com/pulseaudio/pulseaudio/commit/860d1cf3a76701ade38784822abb24285176227c
> 
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>

Acked-by: Tanu Kaskinen <tanuk@iki.fi>

> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> index e245be7..ec51d8b 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -259,9 +259,12 @@ FILES_${PN}-module-gsettings += "${libexecdir}/pulse/gsettings-helper ${datadir}
>  # modules must be installed when X11 is enabled.
>  RDEPENDS_pulseaudio-server += "\
>          ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '\
> -                pulseaudio-module-console-kit \
>                  pulseaudio-module-device-manager \
>                  pulseaudio-module-x11-cork-request \
>                  pulseaudio-module-x11-publish \
>                  pulseaudio-module-x11-xsmp \
>          ', '', d)}"
> +
> +RDEPENDS_pulseaudio-server += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', \
> +                                  bb.utils.contains('DISTRO_FEATURES', 'systemd', 'pulseaudio-module-systemd-login', 'pulseaudio-module-console-kit', d), \
> +                                  '', d)}"
> -- 
> 2.7.4
> 
-- 
Tanu

https://www.patreon.com/tanuk
https://liberapay.com/tanuk


