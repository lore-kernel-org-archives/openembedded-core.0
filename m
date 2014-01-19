Return-Path: <andrei@gherzan.ro>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id BD9766DEDA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2014 18:08:30 +0000 (UTC)
Received: by mail-ea0-f181.google.com with SMTP id m10so2698833eaj.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jan 2014 10:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=/T8+YQrtYvNWq2ENNpA4QTUDU7jVn2xEtd7OtwgdGK8=;
	b=AbSXyZm52eMdJrNtFgQixTNuJxMEG01lnYFLzdqWSBq0eMa0kwwxcUGFw+NeUZbJnc
	qxCfHF/v2bUv8prUWE16HTxDkva7+olM5b8DOwCQJiXbkjTh8dU98R7L7mOu+R1ePcUT
	5n5HrhFZo4xuQdRE+G/SaEvrKEjwJ90nxQcCoobQyQZ7hT5147YiVPndRl/7TVwaJ2Gr
	oCt/aCri8xW63V+wWI4URQfMqi7X+v621iPWH+NI+p8GgLf+e5uRKheJT9tO1Q/Cq4st
	JzkJRqe2FFY26yNtkYrxLGnCuPJ9ANSmqL0ijHPWlvkNh2fJGiMScXbeqz4yGSCElpGz
	yp7Q==
X-Gm-Message-State: ALoCoQmQ8/tz8TgsymwW+TWF3fhr6LrZy1Kg6j2ufSHd7XpgiFcfn4RUkp9pXa0ky05nlXcTRkkh
X-Received: by 10.15.22.13 with SMTP id e13mr15040eeu.103.1390154911399;
	Sun, 19 Jan 2014 10:08:31 -0800 (PST)
Received: from gmail.com ([79.116.111.233]) by mx.google.com with ESMTPSA id
	o13sm45593721eex.19.2014.01.19.10.08.29 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 19 Jan 2014 10:08:30 -0800 (PST)
Date: Sun, 19 Jan 2014 20:08:27 +0200
From: Andrei Gherzan <andrei@gherzan.ro>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Alexandru Niculita <alexnick87@gmail.com>
Message-ID: <20140119180827.GB5660@gmail.com>
References: <1387298031-15180-1-git-send-email-andrei@gherzan.ro>
	<CAK18fxH2YHgqinv=jFqyQ_eZDNAVprv8p+-DAwWm0DNoH1GSgA@mail.gmail.com>
	<CAK18fxG9OuEF+p-frXP2SN2Ha-SpqP=c4VanXV+F8MEut9KcHw@mail.gmail.com>
	<1482714.ZdRsQTRoCZ@helios>
MIME-Version: 1.0
In-Reply-To: <1482714.ZdRsQTRoCZ@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libsdl: Add support for libsdl-native
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
X-List-Received-Date: Sun, 19 Jan 2014 18:08:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 13, 2014 at 02:09:36PM +0000, Paul Eggleton wrote:
> On Friday 03 January 2014 16:58:10 Andrei Gherzan wrote:
> > On Tue, Dec 17, 2013 at 7:01 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> > > On Tue, Dec 17, 2013 at 6:53 PM, Paul Eggleton <
> > >
> > > paul.eggleton@linux.intel.com> wrote:
> > >> On Tuesday 17 December 2013 18:51:08 Andrei Gherzan wrote:
> > >> > On Tue, Dec 17, 2013 at 6:47 PM, Paul Eggleton <
> > >> >
> > >> > paul.eggleton@linux.intel.com> wrote:
> > >> > > On Tuesday 17 December 2013 18:33:51 Andrei Gherzan wrote:
> > >> > > > From: Alexandru Niculita <alexnick87@gmail.com>
> > >> > > >
> > >> > > > Change-Id: I4fb1e623c7bbb1f35ae3001c839cd7e16ce1bd65
> > >> > > > Signed-off-by: Alexandru Niculita <alexnick87@gmail.com>
> > >> > > > ---
> > >> > > >
> > >> > > >  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 3 ++-
> > >> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >> > > >
> > >> > > > diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> > >> > > > b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb index
> > >>
> > >> 4b4ff63..84d3ad6
> > >>
> > >> > > > 100644
> > >> > > > --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> > >> > > > +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> > >> > > > @@ -17,6 +17,7 @@ DEPENDS = "${@base_contains('DISTRO_FEATURES',
> > >> > >
> > >> > > 'directfb',
> > >> > >
> > >> > > > 'directfb', '', d)} \ ${@base_contains('DISTRO_FEATURES', 'x11',
> > >> > > > 'virtual/libx11 libxext libxrandr libxrender', '', d)} \ tslib"
> > >> > > >
> > >> > > >  DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES',
> > >>
> > >> 'x11',
> > >>
> > >> > > > 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender
> > >> > > > nativesdk-libxext', '', d)}" +DEPENDS_class-native =
> > >> > > > "${@base_contains('DISTRO_FEATURES', 'x11', 'libx11-native
> > >> > >
> > >> > > libxrandr-native
> > >> > >
> > >> > > > libxrender-native libxext-native', '', d)}"
> > >> > > >
> > >> > > >  PR = "r2"
> > >> > > >
> > >> > > > @@ -63,4 +64,4 @@ do_configure_prepend() {
> > >> > > >
> > >> > > >          export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
> > >> > > >
> > >> > > >  }
> > >> > > >
> > >> > > > -BBCLASSEXTEND = "nativesdk"
> > >> > > > +BBCLASSEXTEND = "nativesdk native"
> > >> > >
> > >> > > Why do you want to do this? Usually, it's better to rely on the host
> > >> > > distro providing SDL for native because building libsdl-native can
> > >>
> > >> lead to
> > >>
> > >> > > problems linking against a specific host OpenGL implementation.
> > >> >
> > >> > xbmc needs sdl-native - this is why I made this change.
> > >>
> > >> Why does it need it though?
> > >
> > > Actually xbmc has a tool called texturepacker which uses libsdl-image -
> > > which needs libsdl. That's the chain.
> >
> > Any advice on this? Paul, do you see another option on this?
>
> To be honest I'm just not sure what the correct solution is here. The problem
> is if we just enable libsdl-native and take no other mitigating steps, it will
> almost certainly lead to problems building qemu-native because we'll be
> linking against our version of SDL and not the host's one.
>
> What does texturepacker actually do, i.e. what are its inputs and outputs? Is
> there a way of avoiding the need to build/use it?
>

As Alex was actually working on this, will let him give you (us) more details.

Alex, could you please provide Paul more info about that tool?

--
Andrei Gherzan
m: +40.744.478.414 | f: +40.31.816.28.12

