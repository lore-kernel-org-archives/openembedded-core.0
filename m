Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B7AD96150B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 14:08:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48R3my6Wpvz1v;
	Mon, 24 Feb 2020 15:08:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582553283;
	bh=guD33X+Tj7c4zuGTCow+FufNwAejmFnkjhur9cIA3Xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dux1xzYRC7N7p/TzZSIxBqOnKStTwLrtvwbbnyiMQaSFx5EBSfiX4j0dZRv97na1l
	as1Nebg7BKwotcQqX0nwcsDsyKirlh4kMqCVOAKj1+c9LPwDHeqn84MobqWy4Yoi20
	d2NqTO9MA6jlkmIGKbrveJJTLNN9Ht+boh3Z3D18pirgiwcKg6/IE9WHyrz4tbvyzi
	rFC0caLTwkAiEguAwd706rjhSiervaWJG9qkNjpYpjpWTSIOglSDOUhMwhLHbTCSkr
	YrbTvz1X+KjWX/E8LZ7rawYEpd06oNtgR76KyRAofQc4ufD76p7CsNqmjNP1fKJFcS
	jW7c/jYyyREd94bCcy88sEFtoimg+MkXpWsSliMgydziBpbexVuGf8QToPTZVk5p65
	3/0pvTdTpoHDYd6JcDxZ8NFSddYOrIvwNCJZDSV334kEI3hWE2DY+H0Eo7h15kX6/T
	JB/JEFF7Czjnjjtl08bK3zk5ldbFSrDEBz4lvydRLBMBxOOAkTfPu29HeO0qslz+J/
	Ohi8egaPd1sjjrpZqgGrQHOA2y2kaFzHcgsSU9BQtX3ExSaLWYnauB8e2YNAo2cTBu
	/RYRT0vR13Bwvr34+CihCDVUAN5DXoFGA+Fkd00xbBxYFb8XUtfJyniVrOcLNXXBpm
	mRL00lAS8rx336fe+89xCeFc=
Date: Mon, 24 Feb 2020 16:08:01 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20200224140801.GC27036@localhost>
References: <20200223182933.6168-1-bunk@stusta.de>
	<fd59ef897ef077f4f0160e1e2d7c95466c75a3f7.camel@linuxfoundation.org>
	<20200224104635.GA27036@localhost>
MIME-Version: 1.0
In-Reply-To: <20200224104635.GA27036@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/6] webkitgtk: Remove unnecessary REQUIRED_DISTRO_FEATURES requirements
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
X-List-Received-Date: Mon, 24 Feb 2020 14:08:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Feb 24, 2020 at 12:46:35PM +0200, Adrian Bunk wrote:
> On Mon, Feb 24, 2020 at 09:17:56AM +0000, Richard Purdie wrote:
> > On Sun, 2020-02-23 at 20:29 +0200, Adrian Bunk wrote:
> > > opengl is optional.
> > > x11 can be replaced with wayland.
> > > 
> > > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > > ---
> > >  meta/recipes-sato/webkit/webkitgtk_2.26.4.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
> > > index a48a976f94..51fba94964 100644
> > > --- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
> > > +++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
> > > @@ -26,7 +26,7 @@ SRC_URI[sha256sum] = "4386900713dfadf9741177210b32623cab22562a79ffd0d446b6656993
> > >  
> > >  inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
> > >  
> > > -REQUIRED_DISTRO_FEATURES = "x11 opengl"
> > > +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> > >  
> > >  CVE_PRODUCT = "webkitgtk webkitgtk\+"
> > 
> > The autobuilder no-x11 build seems unhappy with this patch series
> > unfortunately :(
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/1616
> 
> Sorry for that, I did not test a wayland-only build of webkitgtk.
> 
> I'll take care of that this evening, until then please drop either this 
> first patch or the whole series.

OK, the short-term solution is to drop the first patch.

The original failure is easy to fix (I'll send a patch that moves the 
X libraries from DEPENDS to the x11 config), but the next one is not:

Alexander, wayland support in webkitgtk requires mesa built with x11 
support (otherwise gl.pc is not available).

cu
Adrian

