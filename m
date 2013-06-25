Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 52710605F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 15:19:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Jun 2013 08:19:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,937,1363158000"; d="scan'208";a="335290424"
Received: from unknown (HELO helios.localnet) ([10.252.122.97])
	by orsmga001.jf.intel.com with ESMTP; 25 Jun 2013 08:19:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 25 Jun 2013 16:19:20 +0100
Message-ID: <3374023.12gJcMyuIe@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <CAP71WjygMhCMdrbrj8uUKeJZuRu1_cjmhE4cLjsuhJ5wJpxnuQ@mail.gmail.com>
References: <CAP71WjxJxpWwa5UV4PpN=f0rL00UpPJ_VKJ4LmEu=AVBRdVo2A@mail.gmail.com>
	<CAP71Wjx-uL3CjmxtJwEhZJyDD5p5HWwEEKSEh-0h5aCmCxeGxA@mail.gmail.com>
	<CAP71WjygMhCMdrbrj8uUKeJZuRu1_cjmhE4cLjsuhJ5wJpxnuQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Issues with Qt5/mesa and eglfs
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
X-List-Received-Date: Tue, 25 Jun 2013 15:19:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 25 June 2013 13:59:55 Nicolas Dechesne wrote:
> On Thu, Jun 20, 2013 at 8:15 PM, Nicolas Dechesne <
> nicolas.dechesne@linaro.org> wrote:
> > On Thu, Jun 20, 2013 at 11:46 AM, Nicolas Dechesne <
> > 
> > nicolas.dechesne@linaro.org> wrote:
> >> On Thu, Jun 20, 2013 at 11:42 AM, Paul Eggleton <
> >> 
> >> paul.eggleton@linux.intel.com> wrote:
> >>> I wasn't watching closely but my impression is there were a large number
> >>> of
> >>> changes associated with the mesa upgrade. Is the upgrade itself
> >>> necessary for
> >>> the fix?
> >> 
> >> no, i don't think so. I think we might be able to just update the patches
> >> that deal with the X11/no X11 support. but i haven't tested that yet. i
> >> just did a quick test by cherry picking the complete commit (e.g. mesa
> >> upgrade) to verify that it's actually fixing my problem. now that i know
> >> it
> >> does, i will try to just upgrade the patches without the mesa upgrade and
> >> report how it goes.
> > 
> > ok, i was able to backport the mesa patch from 9.1.3 to 9.0.2
> > (EGL-Mutate-NativeDisplayType-depending-on-config.patch) , the backport
> > was
> > more or less trivial. and then i did this in dylan branch:
> > 
> > --- a/meta/recipes-graphics/mesa/mesa-9.0.2.inc
> > +++ b/meta/recipes-graphics/mesa/mesa-9.0.2.inc
> > @@ -2,7 +2,7 @@ SRC_URI = "
> > ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
> > 
> >             file://0002-cross-compile.patch \
> >             file://cross-glsl.patch \
> >             file://dont-fail-if-libX11-isnt-installed.patch \
> > 
> > -           file://fix-egl-compilation-without-x11-headers.patch \
> > +           file://EGL-Mutate-NativeDisplayType-depending-on-config.patch
> > \
> > 
> >             "
> > 
> > and it does fix the build issue i had (mesa/qt5/non X11 distro).
> > should that be merged into dylan (since it's merged in master already) or
> > do we need to wait for the 'final' patch in upstream to be ready?
> 
> Paul, Martin, what do you think about this? i have the (trivial) dylan
> backport ready. Do you think it's the right time to get it merged?

I'd say please send the patch to the mailing list (marked with [dylan]) and 
then we can review it. By the sounds of things it should be OK.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

