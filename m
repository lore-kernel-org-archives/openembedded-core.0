Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 08A0160EE1;
	Thu,  7 Nov 2013 23:20:30 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA7NKPNi031638; Thu, 7 Nov 2013 23:20:26 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dqHvF_1MGCqm; Thu,  7 Nov 2013 23:20:25 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA7NKMEk031631
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 7 Nov 2013 23:20:23 GMT
Message-ID: <1383866418.6271.288.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Thu, 07 Nov 2013 23:20:18 +0000
In-Reply-To: <CAAQYJAttXLv8jQczSLU=8C9iw6z9JS6xbOrOiB7ahaowzLWx8g@mail.gmail.com>
References: <1381358545.29912.50.camel@ted> <20131028151004.34b2af21@e6520eb>
	<CAMKF1so3GUQZMvLADSCr=Exavo5OVgh==do7aHhe_wUQk9mFHQ@mail.gmail.com>
	<20131029082852.4399ee5e@e6520eb> <1383146112.25877.34.camel@ted>
	<20131102094725.14fb6902@e6520eb>
	<CAAQYJAvvqEByKQRPKRZviqPJmSrDqYt1PvnYPxeJuOSuKO-HaA@mail.gmail.com>
	<1383520239.6271.96.camel@ted>
	<CAAQYJAsRd=4bXxG8h42EbJgnspo_3ge=__GYpqShQom9-n11RA@mail.gmail.com>
	<CAAQYJAttXLv8jQczSLU=8C9iw6z9JS6xbOrOiB7ahaowzLWx8g@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <Openembedded-core@lists.openembedded.org>
Subject: Re: SRC_URI computing order
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
X-List-Received-Date: Thu, 07 Nov 2013 23:20:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-11-06 at 09:45 +0100, Andrea Adami wrote:
> On Mon, Nov 4, 2013 at 11:13 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> > On Mon, Nov 4, 2013 at 12:10 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >> On Sun, 2013-11-03 at 23:16 +0100, Andrea Adami wrote:
> >>> I have to report an undesiderate behavior:
> >>>
> >>> the formfactor files in our .bbappend are not considered :/
> >>> DEBUG: Searching for machconfig in paths:....
> >>>   /oe/oe-core/meta/recipes-bsp/formfactor/formfactor-0.0/
> >>>   /oe/oe-core/meta/recipes-bsp/formfactor/formfactor/
> >>>   /oe/oe-core/meta/recipes-bsp/formfactor/files/
> >>>   /oe/meta-handheld/recipes-bsp/formfactor/files/poodle
> >>>
> >>> so we end up with the empty machconfig of
> >>> /oe/oe-core/meta/recipes-bsp/formfactor/files/
> >>>
> >>> Surely this didn't happen when we tested the recipe.
> >>
> >> With which revision of OE-Core? Was this with the dora release tag,
> >> current dora head or master?
> >>
> >> Cheers,
> >>
> >> Richard
> >>
> >>
> >
> > This was with fresh master:
> >
> > Build Configuration:
> > BB_VERSION        = "1.21.0"
> > BUILD_SYS         = "i686-linux"
> > NATIVELSBSTRING   = "Gentoo"
> > TARGET_SYS        = "arm-oe-linux-gnueabi"
> > MACHINE           = "poodle"
> > DISTRO_VERSION    = "oe-core.0"
> > TUNE_FEATURES     = "armv5 thumb dsp"
> > TARGET_FPU        = "soft"
> > meta              = "master:511b4194165ed7a5645169e09c27db280d5a5316"
> > meta-initramfs    = "master:4d62e7f575e2a87197c74ab4639561b45eec0e60"
> > meta-handheld     = "master:55a310666b543e6beca47fa3c197492d5a6cf8ff"
> >
> > Cheers
> FYI
> In the hurry for a solution for fixing formfactor and ipaq-boot-params
> my quick hack was to revert
> 
> http://cgit.openembedded.org/openembedded-core/commit/meta?id=92cbf7eeea553bfa24c7081473fa8bc4ebc1f552
> 
> That appears to fix the specific issue...

Its a hacky workaround. The real issue is that you don't set DISTRO and
this puts a :: into FILESOVERRIDES (and OVERRIDES). I've sent a patch
out which sets a default for DISTRO since its the nicer way I could find
to fix this. The behaviour in the above patch is correct.

Cheers,

Richard


