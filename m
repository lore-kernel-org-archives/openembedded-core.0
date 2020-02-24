Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 241A26023E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 10:46:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48QzJZ0xhNzv;
	Mon, 24 Feb 2020 11:46:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582541198;
	bh=SkUW7WBOM8ujEVh4MXdsRgqhGE3tdgVO6udU07AgqLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lpvQPjV7WSXJB5Ot7fOGhiXjgK/+5Jmls1Cy1qTmbW7x2vB2Nbglab1mR0nXjWdZh
	f07sOw/w29eUyB7gLiT6aP7W8l6dKgJwqGbt6h3LhAGINkj/pDfL7olNm4eUwb4tKH
	TBkXGFcYuO5ty4F4P36mZxXBGFOYBq2mtY2i4oa3gw4j0noXiuNI67agT0CV86JGvs
	9IPimPvvD7u8GNKl4jcRsvQX3Jkhj8yvh5/KmNf/UdGta39eHJgT2oCqGAknCgJ3g0
	H+DwHlgi1ToX+VH4RE7x23d7iFfdml7hqOqsDoiTAhhWxPUr510Qum1N/f+/pIjdlS
	bK3UKg3X8APOOHfBdElVxOysCk48ZLzsS2Idccn064dfoJ8pAPnDT6daWUNLT8ZVOk
	V2RekKREaapGWhgEcBCqPQhouffoflSS3YvLlFH3yz59yq88Be6Ouwwj/k6yQzr+3u
	iSH9bWgDE/QmvIiqG0qYbyxRwmAOamt3Ll9zyb70w2Fs+iGkrrO3FPXSr0lXsqhxrz
	HxnNfm1W8HQUO33Wuc88Iu60+vk7JObMKVvjWPSLCkU44S3STqLlaQmOxb1aMg1EFi
	LWyy13FUd1k3lop3g7s5DWjetMrKi4HCJhJtF3egeh9AD1cGIYdAvBM6Vo/jlRlMCl
	/uyte0386g1zDO9e4zrZCPrg=
Date: Mon, 24 Feb 2020 12:46:35 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20200224104635.GA27036@localhost>
References: <20200223182933.6168-1-bunk@stusta.de>
	<fd59ef897ef077f4f0160e1e2d7c95466c75a3f7.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <fd59ef897ef077f4f0160e1e2d7c95466c75a3f7.camel@linuxfoundation.org>
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
X-List-Received-Date: Mon, 24 Feb 2020 10:46:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon, Feb 24, 2020 at 09:17:56AM +0000, Richard Purdie wrote:
> On Sun, 2020-02-23 at 20:29 +0200, Adrian Bunk wrote:
> > opengl is optional.
> > x11 can be replaced with wayland.
> > 
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> >  meta/recipes-sato/webkit/webkitgtk_2.26.4.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
> > index a48a976f94..51fba94964 100644
> > --- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
> > +++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
> > @@ -26,7 +26,7 @@ SRC_URI[sha256sum] = "4386900713dfadf9741177210b32623cab22562a79ffd0d446b6656993
> >  
> >  inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
> >  
> > -REQUIRED_DISTRO_FEATURES = "x11 opengl"
> > +ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
> >  
> >  CVE_PRODUCT = "webkitgtk webkitgtk\+"
> 
> The autobuilder no-x11 build seems unhappy with this patch series
> unfortunately :(
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/1616

Sorry for that, I did not test a wayland-only build of webkitgtk.

I'll take care of that this evening, until then please drop either this 
first patch or the whole series.

> Cheers,
> 
> Richard

cu
Adrian

