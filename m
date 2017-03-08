Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 956D572F28
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 17:14:46 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id v190so4392254pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Mar 2017 09:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=qoP/e/fOqwKgdZ7Pf6kCmpfsnm6qUkcoFkX5kBJXi+s=;
	b=Yuzmk1J+kN8QcdNN8iNDbhKTniFK5Nu9fGUnpnQFqnoFk5U08+oXhNktPQKzmWWGYz
	cKZ6uOmkfF5lpt1IhZi57M3K2SgJl/57SsDvRr7J4a1TheJRj9z0sBARlQv18vT+bVod
	RF/XnGHzrjpfmXhecMlewhnDK+JgCWghXHcGlHEjicg2B7EOo7uF9paakuGYdNykmibL
	TvBVT5qqEZn0x2El+Hzk6WKo002trz9+XARPUIH5eIy0cP3qrC58nfHTchu1MpnC0UOT
	w1tb3q1/bOM622ahhzpkxFsOcYfND5lqyp1Y8wTMNnisK87ncdPhwcaSBg1aRkw2xqv1
	g5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qoP/e/fOqwKgdZ7Pf6kCmpfsnm6qUkcoFkX5kBJXi+s=;
	b=NuxnbwureHGD3rVsO8Gjheg1rnTlePRETvEVIZA2waBhjIJfrI85ThYBiWExRye4YU
	i+YftJe+eUMREfk5WPGrnOMFOYmkig1C1X+xO335lZtTCU8l1t/E7mWQNvbgB/O41UkE
	btgygGv7xJgUBMgkQoPg8ENWt1e4w10AfSb3Odh845wU+GUszcnWyjWExCe4fLAW0dC9
	5WfPnCzoasgwutzeEf5rWVY5PCoNsbKQ3yvMKCAmaP5sGpKyOnPBfPbzx0QpIgIurLiP
	d/Z4BZRhXwj/KCnlIh3l2VaLVS1dO1oyZ5H+mc7GIApoWnCsoYeim4N1+6VgI8KD8Mpu
	YF+A==
X-Gm-Message-State: AMke39nIhs5hJV4AKMheooxc17jfCvqP+jxVsdqmMhGaUxvtwzpet2gXB1/lc6CxSgcupA==
X-Received: by 10.99.206.5 with SMTP id y5mr8230401pgf.212.1488993287605;
	Wed, 08 Mar 2017 09:14:47 -0800 (PST)
Received: from haswell (c-76-102-32-192.hsd1.ca.comcast.net. [76.102.32.192])
	by smtp.gmail.com with ESMTPSA id
	197sm7387102pfv.19.2017.03.08.09.14.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Mar 2017 09:14:47 -0800 (PST)
Date: Wed, 8 Mar 2017 09:14:45 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Message-ID: <20170308171444.GB2586@haswell>
References: <cover.1488539819.git.pkj@axis.com>
	<CAEHkU3XyKbGzTCX9XaG7jYXjde+ZRtA9z_MSecxpgOcu6wLMiQ@mail.gmail.com>
	<aca83849e80a444595764b812d5e3394@XBOX02.axis.com>
	<af3c0da4bce549a5b303d828c9728524@XBOX02.axis.com>
MIME-Version: 1.0
In-Reply-To: <af3c0da4bce549a5b303d828c9728524@XBOX02.axis.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 0/5] Add dummy tools to help identify needed dependencies
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
X-List-Received-Date: Wed, 08 Mar 2017 17:14:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 17-03-08 09:43:58, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org
> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> > Peter Kjellerstedt
> > Sent: den 3 mars 2017 20:53
> > To: Max Krummenacher
> > Cc: OE-core
> > Subject: Re: [OE-core] [PATCHv3 0/5] Add dummy tools to help identify
> > needed dependencies
> > 
> > > -----Original Message-----
> > > From: Max Krummenacher [mailto:max.oss.09@gmail.com]
> > > Sent: den 3 mars 2017 17:24
> > > To: Peter Kjellerstedt
> > > Cc: OE-core
> > > Subject: Re: [OE-core] [PATCHv3 0/5] Add dummy tools to help identify
> > > needed dependencies
> > >
> > > Hi
> > >
> > > 2017-03-03 12:17 GMT+01:00 Peter Kjellerstedt
> > > <peter.kjellerstedt@axis.com>:
> > >
> > > > To circumvent this, I created dummy versions of the tools that
> > always
> > > > fail and placed them in the scripts directory. Thus, if the real
> > tool
> > > > has not been installed in the RSS, the dummy version is used and
> > the
> > > > build fails. For good measures I even output a message that says
> > what
> > > > needs to be corrected in the recipe.
> > > >
> > > > Included is also an update to linux-libc-headers as it apparently
> > > > needs to inherit pkgconfig, which the introduction of the dummy
> > > > version of pkg-config showed.
> > > >
> > >
> > > I tried the whole series, i.e. applied on top of openembedded-core,
> > > 20c6e87 and bitbake 6fe07ed.
> > >
> > > The resulting build failed in linux-libc-headers because it picked up
> > > the dummy script instead of the real pkg-config binary which actually
> > > is installed in the RSS.
> > >
> > > run.do_configure has a PATH setting with first ...meta/scripts and
> > > only then the paths to the different RSS directories.
> > >
> > > Changing that order in meta/conf/bitbake.conf line 450 fixed this for
> > > me, however I'm unsure of posible sideeffects of that reordering.
> > >
> > > Max
> > 
> > Bah, you are correct. That is what I get for not testing exactly
> > what I sent for integration. Shame on me.
> > 
> > Anyway, I see a couple of possible solutions:
> > 
> > * Put the scripts in bitbake/bin instead. This should work as it
> >   is only added to $PATH by oe-buildenv-internal (contrary to
> >   ${COREBASE}/scripts which is added to $PATH both by
> >   oe-buildenv-internal and bitbake.conf). However, I do not like
> >   this idea as it feels wrong to put them there.
> > * Put the scripts in a subdirectory of ${COREBASE}/scripts, e.g.,
> >   ${COREBASE}/scripts/blacklisted, and add that path to $PATH in
> >   bitbake.conf, but at the other end of it so that the RSS paths
> >   appear before it. This sounds a lot more appealing to me.
> > * Implement the whitelist solution Patrick Ohly mentioned instead.
> >   Although this is probably the best solution, prioritizing it
> >   for 2.3 does not sound likely to happen.
> > 
> > I have implemented solution two above (properly tested this time),
> > and will send that along in a little while.
> > 
> > //Peter
> 
> Richard,
> 
> since I see that you have integrated/staged the two patches that add 
> inherits of pkgconfig, but not the patches that add the dummy commands, 
> I assume you have some reservations to these patches. What are your 
> take on the subject of blacklisting vs whitelisting the commands from 
> the build host? I know that having these dummy commands in place helped 
> me a great deal when updating our recipes to build correctly with RSS.

perhaps if we have a way to containerize the binaries/scripts used from
buildhost would be comprehensive but hard to tool in may be blacklisting
is contained in that we can weed out the known problems but if we can
sanitize and create a comprehensive list of needed stuff from buildhost
would be cool, it will probably help the reproducability cause as well.
> 
> //Peter
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

