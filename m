Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5DBD26B5D8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 14:09:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Jan 2014 06:09:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,653,1384329600"; d="scan'208";a="438032061"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.149])
	by orsmga001.jf.intel.com with ESMTP; 13 Jan 2014 06:09:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrei Gherzan <andrei@gherzan.ro>
Date: Mon, 13 Jan 2014 14:09:36 +0000
Message-ID: <1482714.ZdRsQTRoCZ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-35-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAK18fxG9OuEF+p-frXP2SN2Ha-SpqP=c4VanXV+F8MEut9KcHw@mail.gmail.com>
References: <1387298031-15180-1-git-send-email-andrei@gherzan.ro>
	<CAK18fxH2YHgqinv=jFqyQ_eZDNAVprv8p+-DAwWm0DNoH1GSgA@mail.gmail.com>
	<CAK18fxG9OuEF+p-frXP2SN2Ha-SpqP=c4VanXV+F8MEut9KcHw@mail.gmail.com>
MIME-Version: 1.0
Cc: Alexandru Niculita <alexnick87@gmail.com>,
	openembedded <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 13 Jan 2014 14:09:41 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 03 January 2014 16:58:10 Andrei Gherzan wrote:
> On Tue, Dec 17, 2013 at 7:01 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> > On Tue, Dec 17, 2013 at 6:53 PM, Paul Eggleton <
> > 
> > paul.eggleton@linux.intel.com> wrote:
> >> On Tuesday 17 December 2013 18:51:08 Andrei Gherzan wrote:
> >> > On Tue, Dec 17, 2013 at 6:47 PM, Paul Eggleton <
> >> > 
> >> > paul.eggleton@linux.intel.com> wrote:
> >> > > On Tuesday 17 December 2013 18:33:51 Andrei Gherzan wrote:
> >> > > > From: Alexandru Niculita <alexnick87@gmail.com>
> >> > > > 
> >> > > > Change-Id: I4fb1e623c7bbb1f35ae3001c839cd7e16ce1bd65
> >> > > > Signed-off-by: Alexandru Niculita <alexnick87@gmail.com>
> >> > > > ---
> >> > > > 
> >> > > >  meta/recipes-graphics/libsdl/libsdl_1.2.15.bb | 3 ++-
> >> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> >> > > > 
> >> > > > diff --git a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> >> > > > b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb index
> >> 
> >> 4b4ff63..84d3ad6
> >> 
> >> > > > 100644
> >> > > > --- a/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> >> > > > +++ b/meta/recipes-graphics/libsdl/libsdl_1.2.15.bb
> >> > > > @@ -17,6 +17,7 @@ DEPENDS = "${@base_contains('DISTRO_FEATURES',
> >> > > 
> >> > > 'directfb',
> >> > > 
> >> > > > 'directfb', '', d)} \ ${@base_contains('DISTRO_FEATURES', 'x11',
> >> > > > 'virtual/libx11 libxext libxrandr libxrender', '', d)} \ tslib"
> >> > > > 
> >> > > >  DEPENDS_class-nativesdk = "${@base_contains('DISTRO_FEATURES',
> >> 
> >> 'x11',
> >> 
> >> > > > 'virtual/nativesdk-libx11 nativesdk-libxrandr nativesdk-libxrender
> >> > > > nativesdk-libxext', '', d)}" +DEPENDS_class-native =
> >> > > > "${@base_contains('DISTRO_FEATURES', 'x11', 'libx11-native
> >> > > 
> >> > > libxrandr-native
> >> > > 
> >> > > > libxrender-native libxext-native', '', d)}"
> >> > > > 
> >> > > >  PR = "r2"
> >> > > > 
> >> > > > @@ -63,4 +64,4 @@ do_configure_prepend() {
> >> > > > 
> >> > > >          export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
> >> > > >  
> >> > > >  }
> >> > > > 
> >> > > > -BBCLASSEXTEND = "nativesdk"
> >> > > > +BBCLASSEXTEND = "nativesdk native"
> >> > > 
> >> > > Why do you want to do this? Usually, it's better to rely on the host
> >> > > distro providing SDL for native because building libsdl-native can
> >> 
> >> lead to
> >> 
> >> > > problems linking against a specific host OpenGL implementation.
> >> > 
> >> > xbmc needs sdl-native - this is why I made this change.
> >> 
> >> Why does it need it though?
> > 
> > Actually xbmc has a tool called texturepacker which uses libsdl-image -
> > which needs libsdl. That's the chain.
> 
> Any advice on this? Paul, do you see another option on this?

To be honest I'm just not sure what the correct solution is here. The problem 
is if we just enable libsdl-native and take no other mitigating steps, it will 
almost certainly lead to problems building qemu-native because we'll be 
linking against our version of SDL and not the host's one.

What does texturepacker actually do, i.e. what are its inputs and outputs? Is 
there a way of avoiding the need to build/use it?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

