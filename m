Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id C059C71C42
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Oct 2018 11:48:56 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id e18-v6so5211146oti.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2018 04:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RPMsXG51WhgRLFMCahhHEA9xsgg8iuLg7AbFt+BXvXc=;
	b=AoZR4llx3dc3QAoYeM/FKZjcQLfz+Y2HQh8FwYfYrADG8LoBA4JB7e/yougYjoTMjz
	UYciBW94BgPhovPp8FtTZApc2rJyUsb6WsWgoMWjSi9/PxIOsuPCgT9KYyCy9lspfIHf
	ErHAwXGUBSl4+yQnyklFMs420MJc5N/PtaF7DYUnig/AaQSXjBVQcW62t6h0WBoPK1dF
	mh7MZPDouFZDyP9hS4J+kEdAyGr6rlkrcK3VuUUGI1R/QZR/XEXAgQl3Iq50ow32x1au
	N4/wCqfbRO/a8HwM/TdeFs7th2hpbuBq/G801MzK6ZczoBUqi+94KwvR9tbRLlOpgery
	n1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RPMsXG51WhgRLFMCahhHEA9xsgg8iuLg7AbFt+BXvXc=;
	b=pnW2vHBzL97lWSmOJJ6YtJusyN04yREK1t5gUjr8sgt6nlv5jl686hbZ6CoiQ1Vvtm
	iHkqb0EsePjqiZKpkv3ffM/d5cPyE/5VV4q831w8yXMonL6nQ8l0vwX68q5nOt8zd8AI
	OMIAthuWxfI0ZM48FdzxDs52Xxr2wsPqctYacWY9uA9SRQxsfYvEf7qTbUvhE1h9LvyU
	Zu2c8HLGklX5IoP6dOWi3fDIRj+A7xd37Y8ifE8jL6uq/EzpN9sAKtI2uJ6/PvI/1RP7
	p6S4+jHSei0Z9K8fFSzvpiap20fpQCPnm4jH5n9Ba+Vp6ohNTwH3ByH6J71Wt1XlZp7M
	z8Cw==
X-Gm-Message-State: ABuFfoiUZ7YUrlGXv91EXAk2J3UndF6wTMNQucw+pCmp4/zYzfjrEOxS
	/c/MDOqLA9m04sqEU1RjZv8nE6Lhezx/llP5T4Li6Q==
X-Google-Smtp-Source: ACcGV63h8FfBUJ23SwLWn3i4kQ53a4mPF+P2kA54bUTlNrIbc3dlhGOIb165IkOp2Mv8mtbskdnFfe3lYjFoQzSCpio=
X-Received: by 2002:a9d:41f6:: with SMTP id v51-v6mr556549oti.8.1538567337695; 
	Wed, 03 Oct 2018 04:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <1538272773-298871-1-git-send-email-changqing.li@windriver.com>
	<59e55b7b641c4a19a258fedf95712464@XBOX02.axis.com>
In-Reply-To: <59e55b7b641c4a19a258fedf95712464@XBOX02.axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Oct 2018 12:48:46 +0100
Message-ID: <CAJTo0LbUR5vkvik6z9jeFvO-AQsfNwFEW+2sAa7N9E-NfrXqbQ@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pango: fix ptest failed problem
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
X-List-Received-Date: Wed, 03 Oct 2018 11:48:56 -0000
Content-Type: text/plain; charset="UTF-8"

An even simpler fix is to just remove --disable-debug.  We don't need
a build with ptest enabled to have *all* the debuggig enabled, and
it's always nice to have cast checks enabled (which --disable-debug
turns off).

Ross
On Mon, 1 Oct 2018 at 11:34, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> > core-bounces@lists.openembedded.org> On Behalf Of
> > changqing.li@windriver.com
> > Sent: den 30 september 2018 04:00
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH] pango: fix ptest failed problem
> >
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > disable-debug will cause compiling with G_DISABLE_ASSERT, but ptest
> > need
> > it, so don't disable-debug when ptest is enabled.
> >
> > ptest fail error:
> >
> > Tests were compiled with G_DISABLE_ASSERT and are likely no-ops.
> > Aborting.
> > FAIL: pango/test-font.test (Child process exited with code 1)
> > Running test: pango/testboundaries_ucd.test
> > Tests were compiled with G_DISABLE_ASSERT and are likely no-ops.
> > Aborting.
> > FAIL: pango/testboundaries_ucd.test (Child process exited with code 1)
> > Running test: pango/testboundaries.test
> > Tests were compiled with G_DISABLE_ASSERT and are likely no-ops.
> > Aborting.
> > FAIL: pango/testboundaries.test (Child process exited with code 1)
> > Running test: pango/testattributes.test
> > Tests were compiled with G_DISABLE_ASSERT and are likely no-ops.
> > Aborting.
> >
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> >  meta/recipes-graphics/pango/pango_1.42.4.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/pango/pango_1.42.4.bb
> > b/meta/recipes-graphics/pango/pango_1.42.4.bb
> > index e73fd28..c680720 100644
> > --- a/meta/recipes-graphics/pango/pango_1.42.4.bb
> > +++ b/meta/recipes-graphics/pango/pango_1.42.4.bb
> > @@ -24,7 +24,7 @@ DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo h
> >  PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
> >  PACKAGECONFIG[x11] = "--with-xft,--without-xft,virtual/libx11 libxft"
> >
> > -EXTRA_OECONF = "--disable-debug"
> > +EXTRA_OECONF = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest',"","--disable-debug",d)}"
>
> The above can be written cleaner as:
>
> PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ptest x11', d)}"
> PACKAGECONFIG[ptest] = "--enable-debug,--disable-debug"
> PACKAGECONFIG[x11] = "--with-xft,--without-xft,virtual/libx11 libxft"
>
> (I added the --enable-debug to the ptest PACKAGECONFIG for symmetry,
> even though I assume it is the default.)
>
> >  LEAD_SONAME = "libpango-1.0*"
> >  LIBV = "1.8.0"
> > --
> > 2.7.4
>
> //Peter
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

