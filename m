Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f66.google.com (mail-it0-f66.google.com
	[209.85.214.66])
	by mail.openembedded.org (Postfix) with ESMTP id D3F9074AEB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Aug 2018 13:50:35 +0000 (UTC)
Received: by mail-it0-f66.google.com with SMTP id d9-v6so8437474itf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Aug 2018 06:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=89ftCUlxT0ufmBvY+4dKIS/oTBn8qIfwmI2kWss0J6Y=;
	b=EDQtQgn6bmGc9zO+coZlfhBONPHdVHNiYSUe8cRZLCZCncOjvIlXXeRHUyzjbm7Yvt
	bzYwB8yRPKnWDuKl0agxHtw+l4fvmNVc7/MR0ul2KL8Q3FDw8LGQOGN8Xt5uTYCRDIZW
	vJ7+ILB5f9Bj0R19m6JxIwB+haSVobAqiMnjhD8j3+LJus/MXXaJsUlBvPmG8PyyEOmJ
	Fo5UMLWbf1lR0G0A0vJNvL1lLni/SvMbrOYoeSe2hzoxDpCvuSCK5sQjCS/tlY1O8XDH
	YCy4LSTK9SbAKQNlhkX8hxjreBXhQw82H4lUEEYSRwFBu/SzOygHKsYAOklORKXKlwT6
	E4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=89ftCUlxT0ufmBvY+4dKIS/oTBn8qIfwmI2kWss0J6Y=;
	b=HKLha3tK+uigprkHA7cfSJAqGPO4UiUTPJ4+2RtNV/6sJ3H7rBxRjE3Si334MUhTop
	5VCgvPLY2RFXB/5NT/BHYsbrIUZ4Nh6XFvCvW9Q2H7gDY8XHCbb7F9IoMES/4hsBultO
	6z21ZkLawLxIe2UqmTCtX6NLnY+tnubFf8FfJZc0ubANYRRZ2WHUS/05KYbRtZm6drJr
	PW5DtTeAVKUppr6ADyAZDxr+Mf5NpPkRzvy2ctlNPgsUTvLxTby0+tKMZjbCDlM0dRMj
	zi4o7e5kdAwom09GJnoK/L07kBjZh+agKyPmsGwOJT883Fnvn9QotK0bWDw0KATFQVCY
	384A==
X-Gm-Message-State: AOUpUlFeNC3p075docTSaFoHlY1igzn9Pup2GB2mDaNCo6PeYeEtiLHU
	G510oVYPcAZZxAjSvv45v8GXb9Hd
X-Google-Smtp-Source: AAOMgpd+VxKz3b1S0Jsxmxo8zgTN18pP9zrsk7VV2htFhNPkXRu87Kdgs8GVnUj9gz+iQ20ANA4LiA==
X-Received: by 2002:a24:ed0c:: with SMTP id
	r12-v6mr6391811ith.37.1533304236753; 
	Fri, 03 Aug 2018 06:50:36 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	v5-v6sm1688066ioe.61.2018.08.03.06.50.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 03 Aug 2018 06:50:36 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <3a741351124271af1d9496d3146ab8afa68cb9fb.camel@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>, Tanu Kaskinen <tanuk@iki.fi>
Date: Fri, 03 Aug 2018 08:50:35 -0500
In-Reply-To: <CAJTo0LaJaypPCA3v_tQoL0ccuffgm+i2WXvsM8QA8XtK99Ddcg@mail.gmail.com>
References: <20180802212200.1522-1-JPEWhacker@gmail.com>
	<cf87613f225edd16345d2575996e3c923b3b3b5d.camel@iki.fi>
	<CAJTo0LaJaypPCA3v_tQoL0ccuffgm+i2WXvsM8QA8XtK99Ddcg@mail.gmail.com>
X-Mailer: Evolution 3.28.3 (3.28.3-1.fc28) 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-lib: Allow empty alsa-lib package for SDK
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
X-List-Received-Date: Fri, 03 Aug 2018 13:50:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-08-03 at 14:21 +0100, Burton, Ross wrote:
> I agree with Tanu, the packaging in this recipe is non-standard and
> instead of making it more non-standard, let's just fix it.
> 
> Remove the libasound recipe, the contents of that can go into $PN.
> Either way with Debian renaming it gets renamed to libasound2, and
> without renaming it's still a sensible name.  The dependency hacks
> can
> then all be removed.

Done. Sorry I, forgot the "in-reply-to" when I sent the update. See: 
http://lists.openembedded.org/pipermail/openembedded-core/2018-August/1
53684.html

> 
> Ross
> 
> On 3 August 2018 at 11:39, Tanu Kaskinen <tanuk@iki.fi> wrote:
> > On Thu, 2018-08-02 at 16:22 -0500, Joshua Watt wrote:
> > > Without ALLOW_EMPTY, the empty alsa-lib package (which gets
> > > culled)
> > > makes it fairly difficult to create an image that has libasound,
> > > then
> > > create an SDK from that image that has the proper development
> > > files.
> > > 
> > > If there is no alsa-lib package, the only way to get libasound on
> > > a
> > > target image is to do:
> > > 
> > >  IMAGE_INSTALL += "libasound"
> > > 
> > > This however causes a problem because all of the development
> > > files that
> > > would be desired in the SDK are located in alsa-lib-dev, which
> > > won't be
> > > included (because alsa-lib wasn't included). Without
> > > ALLOW_EMPTY_${PN},
> > > it is not possible to do:
> > > 
> > >  IMAGE_INSTALL += "alsa-lib"
> > > 
> > > because the package is empty and gets culled. Adding the
> > > ALLOW_EMPTY and
> > > then making alsa-lib RDEPEND on libasound solves this problem and
> > > allows
> > > alsa-lib to be installed on the target and have the correct
> > > development
> > > files in the SDK
> > > 
> > > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > > ---
> > >  meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
> > > b/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
> > > index 6364e9eafaa..581655c5349 100644
> > > --- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
> > > +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.6.bb
> > > @@ -24,6 +24,13 @@ FILES_libasound = "${libdir}/libasound.so.*"
> > >  FILES_alsa-server = "${bindir}/*"
> > >  FILES_alsa-conf = "${datadir}/alsa/"
> > > 
> > > +# Create an alsa-lib package even though it is empty and make it
> > > RDEPEND on
> > > +# libasound for target builds. This makes it possible to sanely
> > > create a image
> > > +# that has libasound and then generate an SDK from that image
> > > that has
> > > +# alsa-lib-dev
> > > +ALLOW_EMPTY_${PN} = "1"
> > > +RDEPENDS_${PN}_class-target = "libasound"
> > > +
> > >  RDEPENDS_libasound = "alsa-conf"
> > > 
> > >  # alsa-lib gets automatically added to alsa-lib-dev
> > > dependencies, but the
> > 
> > Looks fine to me, although renaming alsa-lib-dev to libasound-dev
> > would
> > seem like a sensible option too.
> > 
> > --
> > Tanu
> > 
> > https://www.patreon.com/tanuk
> > https://liberapay.com/tanuk
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
-- 
Joshua Watt <JPEWhacker@gmail.com>

