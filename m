Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QLjrF-0000EU-Vd
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 00:32:19 +0200
Received: by pvc30 with SMTP id 30so1911896pvc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 May 2011 15:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Q45mDEZRPT9mCylQnZKD6kImlcv+oZx7b2bKSKD801g=;
	b=H3vrsDlgn+BGWV50NcziKz3rJ0TffRuig3rdrfF8Tl6NJJjRFw7sGnbmRVVLbCES3T
	pfnThaJHiOfeUAALaX82tNVgop3jwFECWqSnOzfnKv3PpJOxudyQX46kzMARzfQ8pOf8
	gvD876o7dO6S9UZj7yYSvh7rfPrnYyf0wIsbs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=IdLIFoTc4MXNsq9hDDLO6qc4btfjy87tZeG8iig1OMGgW5XEWfSzTPb3LVB7VsxsBy
	pQ069bNkr0HXCAITcuIJKl6KCBgaUV5N8Arsg5/L8J9KxKvms8Agx0uhBDxrXiN1NN9I
	0c8C5aKpcf/z5yLAgZCz2Ae3gcWNUDP7D9nuo=
Received: by 10.68.7.167 with SMTP id k7mr5978102pba.238.1305498557142;
	Sun, 15 May 2011 15:29:17 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id r5sm2866130pbe.101.2011.05.15.15.29.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 15 May 2011 15:29:14 -0700 (PDT)
Date: Sun, 15 May 2011 15:28:17 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110515222817.GE24670@sakrah.homelinux.org>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<0a007e99bacaaf9afaf3641635724fdb78974770.1305035617.git.richard.purdie@linuxfoundation.org>
	<3299F82E-BAF4-4CB9-9269-4CB36045E385@dominion.thruhere.net>
	<1305106670.30391.321.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1305106670.30391.321.camel@rex>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 3/6] distro: Add defaultsetup.conf, a set of default configuration providing sane overrridable default for commonly used options
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
X-List-Received-Date: Sun, 15 May 2011 22:32:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (11/05/11 10:37), Richard Purdie wrote:
> On Tue, 2011-05-10 at 16:31 +0200, Koen Kooi wrote:
> > Op 10 mei 2011, om 16:00 heeft Richard Purdie het volgende geschreven:
> > 
> > > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > 
> > > The intent is to allow distros to share common core config but still allow
> > > customisations. The core should work with no distro set but users
> > > can still customise in any ways needed.
> > > 
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > > meta/conf/bitbake.conf                             |    4 +-
> > > meta/conf/distro/defaultsetup.conf                 |   23 ++++++++++
> > > .../include/{poky-eglibc.inc => tclibc-eglibc.inc} |    6 ++-
> > > .../include/{poky-glibc.inc => tclibc-glibc.inc}   |    6 ++-
> > > .../include/{poky-uclibc.inc => tclibc-uclibc.inc} |    4 ++
> > > .../{poky-default.inc => tcmode-default.inc}       |   13 +++---
> > > meta/conf/distro/poky.conf                         |   46 +++++--------------
> > > 7 files changed, 54 insertions(+), 48 deletions(-)
> > > create mode 100644 meta/conf/distro/defaultsetup.conf
> > > rename meta/conf/distro/include/{poky-eglibc.inc => tclibc-eglibc.inc} (92%)
> > > rename meta/conf/distro/include/{poky-glibc.inc => tclibc-glibc.inc} (91%)
> > > rename meta/conf/distro/include/{poky-uclibc.inc => tclibc-uclibc.inc} (86%)
> > > rename meta/conf/distro/include/{poky-default.inc => tcmode-default.inc} (85%)
> > > 
> > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > index d843e70..ce74a9b 100644
> > > --- a/meta/conf/bitbake.conf
> > > +++ b/meta/conf/bitbake.conf
> > > @@ -627,9 +627,7 @@ include conf/build/${BUILD_SYS}.conf
> > > include conf/target/${TARGET_SYS}.conf
> > > include conf/machine/${MACHINE}.conf
> > > include conf/machine-sdk/${SDKMACHINE}.conf
> > > -include conf/distro/include/default-providers.inc
> > > -include conf/distro/include/default-versions.inc
> > > -include conf/distro/include/world-broken.inc
> > > +include conf/distro/defaultsetup.conf
> > > include conf/distro/${DISTRO}.conf
> > 
> > Please include it after $DISTRO, otherwise ?= in $DISTRO won't work as intended.
> 
> Fixed, thanks.
> 
> 
> > > include conf/documentation.conf
> > > require conf/sanity.conf
> > > diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
> > > new file mode 100644
> > > index 0000000..af5ef7b
> > > --- /dev/null
> > > +++ b/meta/conf/distro/defaultsetup.conf
> > > @@ -0,0 +1,23 @@
> > > +include conf/distro/include/default-providers.inc
> > > +include conf/distro/include/default-versions.inc
> > > +include conf/distro/include/world-broken.inc
> > > +
> > > +TARGET_VENDOR ?= "-oecore"
> > > +
> > > +TARGET_FPU_arm ?= "soft"
> > > +TARGET_FPU_armeb ?= "soft"
> > 
> > Something more elaborate would be better, this is what angstrom has:
> > 
> > conf/distro/include/angstrom.inc:TARGET_FPU_arm = "soft"
> > conf/distro/include/angstrom.inc:TARGET_FPU_armeb = "soft"
> > conf/distro/include/angstrom.inc:TARGET_FPU_ixp4xx = "soft"
> > conf/distro/include/angstrom.inc:TARGET_FPU_ppc405 = "soft"
> > conf/distro/include/angstrom.inc:TARGET_FPU_armv6 = "hard"
> > conf/distro/include/angstrom.inc:TARGET_FPU_armv6-novfp = "soft"
> > conf/distro/include/angstrom.inc:TARGET_FPU_armv7a = "hard"
> > conf/distro/include/angstrom.inc:TARGET_FPU_ppc603e = "hard"
> > 
> > you really want to use hard (don't confuse it with hardfp) on armv7a.
> 
> Agreed but we have a problem here as the default OVERRIDES in OECore
> don't include BASE_PACKAGE_ARCH. I'm kind of reluctant to do so too as
> the number of cases we need this are small and the strings aren't very
> unique. I'b feel happier if the override was something like
> parch-${BASE_PACKAGE_ARCH} as you could at least easily spot where it
> was being used.
> 
> I appreciate we need to do something here, its just a question of what.
> 
> > > --- a/meta/conf/distro/include/poky-eglibc.inc
> > > +++ b/meta/conf/distro/include/tclibc-eglibc.inc
> > > @@ -2,6 +2,10 @@
> > > # eglibc specific configuration
> > > #
> > > 
> > > +TARGET_OS = "linux"
> > > +TARGET_OS_arm = "linux-gnueabi"
> > > +TARGET_OS_armeb = "linux-gnueabi"
> > 
> > Maybe something like angstroms version:
> > 
> > TARGET_OS = "linux"
> > TARGET_OS .= "${@['','-gnueabi'][bb.data.getVar('TARGET_ARCH',d,1) in ['arm', 'armeb']]}"
> > TARGET_OS .= "${@['','-gnuspe'][bb.data.getVar('BASE_PACKAGE_ARCH',d,1) in ['ppce500', 'ppce500v2']]}"
> 
> I decided the _arm was more readable. Once we address the OVERRIDE
> issue, we can add the spe bits.
> 
> > or the sane-toolchain version:
> > 
> > def compute_os_portion_of_target_triplet (d):
> >     import bb
> >     arm_eabi_unsupported_arches = "armv1 armv2 armv3"
> >     ppc_spe_supporting_arches = "ppce500v2 ppce500"
> >     gnu_suffix = ""
> >     if bb.data.getVar('LIBC', d, 1) == "uclibc":
> >         libc_suffix = "uclibc"
> >     else:
> >         libc_suffix = ""
> > 
> >     if bb.data.getVar('TARGET_ARCH',d,1) in ['bfin']:
> >         if libc_suffix is not "uclibc":
> >             bb.fatal("bfin is not supported on glibc/eglibc. Please choose uclibc")
> >         else:
> >             os_suffix = "uclinux"
> >     else:
> >         os_suffix = "linux"
> >     bparch = bb.data.getVar('BASE_PACKAGE_ARCH', d,1)
> > 
> >     if bb.data.getVar('DISTRO_FEATURES',d,1) is not None and \
> >     bparch is not None:
> >         if 'eabi' in bb.data.getVar('DISTRO_FEATURES',d,1).split() and \
> >         bb.data.getVar('TARGET_ARCH', d, 1) in [ 'arm', 'armeb' ]:
> >             if bparch in arm_eabi_unsupported_arches.split():
> >                 bb.fatal("DISTRO requested EABI but selected machine does not support EABI")
> >                 abi_suffix = ""
> >             else:
> >                 if libc_suffix is not "uclibc":
> >                     gnu_suffix = "gnu"
> >                 abi_suffix = "eabi"
> >         elif bparch in ppc_spe_supporting_arches.split():
> >             if libc_suffix is not "uclibc":
> >                 gnu_suffix = "gnu"
> >             abi_suffix = "spe"
> >         else:
> >             abi_suffix = ""
> >     else:
> >         bb.note("DISTRO_FEATURES is not set abi suffix not set")
> >         abi_suffix = ""
> > 
> >     if bb.data.getVar('TOOLCHAIN_BRAND', d, 1) is not None and \
> >     "csl" in bb.data.getVar('TOOLCHAIN_BRAND', d, 1):
> >         gnu_suffix = "gnu"
> > 
> >     if libc_suffix + gnu_suffix + abi_suffix is not "":
> >         return os_suffix + "-" + libc_suffix + gnu_suffix + abi_suffix
> >     else:
> >         return os_suffix
> 
> My eyes! We must be able to something more readable than that. Do we
> even support armv1?


oe had lot of combinations to consider e.g.
oabi/eabi/spe/uclinux/uclibc/external-toolchain when it came to
compute the TARGET_OS and while not so readable may be it did address
all of the combinations and permutations well. oe-core may not *yet* worry for many of them
and some like oabi can be dropped but eventually it might need something
handy to compute TARGET_OS may be a map would be more readable.

-Khem




