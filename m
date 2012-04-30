Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SOrx5-0007xB-VN for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 16:51:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3UEg6L5004418
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 15:42:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02742-08 for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 15:42:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3UEfvrY004412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 15:41:58 +0100
Message-ID: <1335796919.7415.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 30 Apr 2012 15:41:59 +0100
In-Reply-To: <CAMKF1so6gABH-H9uZ2R4ppr6F-zT9GtPg7j5fThzQQjWXKkG4g@mail.gmail.com>
References: <CAMKF1sq94g5aaYPQZ=UZtBT6iBxCMJ7ZrKer=gaCVoEjV=eWKA@mail.gmail.com>
	<1335451639.20130.18.camel@ted> <1335468645.20130.27.camel@ted>
	<1335474399.20130.35.camel@ted>
	<CAMKF1so6gABH-H9uZ2R4ppr6F-zT9GtPg7j5fThzQQjWXKkG4g@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: gcc 4.7 + mips64 architecture support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Apr 2012 14:51:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-04-29 at 10:23 -0700, Khem Raj wrote:
> On Thu, Apr 26, 2012 at 2:06 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2012-04-26 at 20:30 +0100, Richard Purdie wrote:
> >> On Thu, 2012-04-26 at 15:47 +0100, Richard Purdie wrote:
> >> > On Wed, 2012-04-25 at 16:31 -0700, Khem Raj wrote:
> >> > > Hello
> >> > >
> >> > > Now that release is almost out of door. I would like some eyes on the
> >> > > gcc-4.7 work
> >> > > and mips64 architecture support that I have done meanwhile
> >> > >
> >> > > I have made sure that gcc-4.6 still keeps working and I have patches
> >> > > for gcc-4.5 too
> >> > > for meta-oe too. I have repeatedly built core-image-sato and
> >> > > core-image-minimal for uclibc/eglibc
> >> > > but more coverage would be nicer.
> >> > >
> >> > > The patches are posted here
> >> > >
> >> > > http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/misc
> >> > >
> >> > > I would appreciate any feedback or testing on this
> >> >
> >> > I had a look through the patch series. I've posted an altered version of
> >> > the class override patch. I've pulled the gcc 4.7 part into master-next,
> >> > have get gcc 4.7 as the default and am running it though the
> >> > autobuilder. That should see how we stand with our usual regression
> >> > tests.
> >>
> >> The builds shows the following failures (I've kept duplication so you
> >> can see the patterns). Not too bad considering:
> >>
> >> MACHINE=qemux86, failure in:
> >> gst-ffmpeg:do_configure
> >> http://autobuilder.yoctoproject.org:8010/builders/nightly-world/builds/66/steps/shell_24/logs/stdio
> >>
> >> MACHINE=qemuarm, failures in:
> >> clutter-1.8:do_configure
> >> glew:do_compile
> >> qt4-x11-free:do_compile
> >> http://autobuilder.yoctoproject.org:8010/builders/nightly-arm/builds/402/steps/shell_19/logs/stdio
> >>
> >> MACHINE=qemuppc, failures in:
> >> clutter-1.8:do_configure
> >> glew:do_compile
> >> qt4-x11-free:do_compile
> >> http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/359/steps/shell_19/logs/stdio
> >>
> >> MACHINE=mpc8315e-rdb, failure in:
> >> mesa-dri:do_compile
> >> http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/359/steps/shell_35/logs/stdio
> >>
> >> MACHINE=qemumips, failures in:
> >> clutter-1.8:do_configure
> >> glew:do_compile
> >> http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/371/steps/shell_19/logs/stdio
> >>
> >> MACHINE=beagleboard, failure in:
> >> mesa-dri:do_compile
> >> http://autobuilder.yoctoproject.org:8010/builders/nightly-arm/builds/402/steps/shell_35/logs/stdio
> >>
> >> MACHINE=routerstationpro, failure in:
> >> mesa-dri:do_compile
> >> http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/371/steps/shell_35/logs/stdio
> >>
> >>
> >> Also, adding meta-qt3 and building lsb targets with DISTRO=poky-lsb adds
> >> the failure:
> >> qt-x11-free:do_compile
> >> <plus repeats of the above>
> >> http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/359/steps/shell_76/logs/stdio
> >
> > FWIW I've posted a mesa fix which should help many of these issue. It
> > looks like gcc 4.7 has stricter option parsing.
> >
> > Why mesa didn't always fail to build is something that needs looking
> > into as a separate issue, the logs are full of errors.
> 
> Do you some layer slapped on top of OE-Core which might be screwing
> things up since I built using OE-Core standalone I do not remember
> seeing these issues.

These mostly turned out to be due to issues with the mesa x32 patch in
OE-Core and would only show up on an x86_64 host. I added a fix for
this.

FWIW, gcc 4.7 and eglibc 2.15 are now the default in master. Test builds
were looking good until the autobuilder ran out of disk space on the
shared drive for sstate :(.

Only known unresolved failure so far is "DISTRO=poky-tiny bitbake
eglibc" which fails due to its cut down eglibc options.

Cheers,

Richard



