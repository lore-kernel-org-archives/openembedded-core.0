Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Tsajv-0001TM-Rc
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 16:05:46 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 08 Jan 2013 06:50:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,430,1355126400"; d="scan'208";a="188868651"
Received: from unknown (HELO [10.255.14.51]) ([10.255.14.51])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Jan 2013 06:50:07 -0800
Message-ID: <1357656606.16583.22.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 08 Jan 2013 08:50:06 -0600
In-Reply-To: <20130108144301.GA3722@jama.palm1.palmone.com>
References: <cover.1357655073.git.tom.zanussi@intel.com>
	<8c55fe2c86ce12ea6a9fa491ed8a16971997285e.1357655073.git.tom.zanussi@intel.com>
	<20130108144301.GA3722@jama.palm1.palmone.com>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/5] lttng2-ust: rename to lttng-ust
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2013 15:05:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-01-08 at 15:43 +0100, Martin Jansa wrote:
> On Tue, Jan 08, 2013 at 08:31:19AM -0600, tom.zanussi@intel.com wrote:
> > From: Tom Zanussi <tom.zanussi@intel.com>
> > 
> > recipes-kernel/lttng/lttng-ust was removed by a previous patch, which
> > also removed the naming conflict that caused the lttng-2.0 version of
> > lttng-ust to be named lttng2-ust.  lttng2-ust was the only lttng-2.0
> > recipe to be named in this way and since that was entirely due to the
> > conflict, we can go back to the consistent naming for it.
> > 
> > Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> 
> what about upgrade path on target?
> 

Yeah, forgot about that, will add to a v2.  Thanks for pointing that
out...

tom

> Cheers,
> 
> > ---
> >  meta-yocto/conf/distro/include/distro_alias.inc                         | 1 -
> >  meta-yocto/conf/distro/include/maintainers.inc                          | 1 -
> >  meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb      | 2 +-
> >  meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb                      | 2 +-
> >  .../lttng-2.0/{lttng2-ust_2.0.5.bb => lttng-ust_2.0.5.bb}               | 0
> >  5 files changed, 2 insertions(+), 4 deletions(-)
> >  rename meta/recipes-kernel/lttng-2.0/{lttng2-ust_2.0.5.bb => lttng-ust_2.0.5.bb} (100%)
> > 
> > diff --git a/meta-yocto/conf/distro/include/distro_alias.inc b/meta-yocto/conf/distro/include/distro_alias.inc
> > index 0699c5f..1994e27 100644
> > --- a/meta-yocto/conf/distro/include/distro_alias.inc
> > +++ b/meta-yocto/conf/distro/include/distro_alias.inc
> > @@ -226,7 +226,6 @@ DISTRO_PN_ALIAS_pn-lttng-modules = "OSPDT upstream=http://lttng.org/"
> >  DISTRO_PN_ALIAS_pn-lttng-tools = "OSPDT upstream=http://lttng.org/"
> >  DISTRO_PN_ALIAS_pn-lttng-ust = "OSPDT upstream=http://lttng.org/"
> >  DISTRO_PN_ALIAS_pn-lttng-viewer = "OSPDT upstream=http://lttng.org/"
> > -DISTRO_PN_ALIAS_pn-lttng2-ust = "OSPDT upstream=http://lttng.org/"
> >  DISTRO_PN_ALIAS_pn-makedepend = "Mandriva=makedepend Ubuntu=xutils-dev"
> >  DISTRO_PN_ALIAS_pn-makedevs = "OE-Core"
> >  DISTRO_PN_ALIAS_pn-matchbox-config-gtk = "OpenedHand"
> > diff --git a/meta-yocto/conf/distro/include/maintainers.inc b/meta-yocto/conf/distro/include/maintainers.inc
> > index 5efb7d0..6de57dc 100644
> > --- a/meta-yocto/conf/distro/include/maintainers.inc
> > +++ b/meta-yocto/conf/distro/include/maintainers.inc
> > @@ -490,7 +490,6 @@ RECIPE_MAINTAINER_pn-lsbtest = "Yi Zhao <yi.zhao@windriver.com>"
> >  RECIPE_MAINTAINER_pn-lsb = "Yi Zhao <yi.zhao@windriver.com>"
> >  RECIPE_MAINTAINER_pn-lsof = "Bogdan Marinescu <bogdan.a.marinescu@intel.com>"
> >  RECIPE_MAINTAINER_pn-ltp = "Mihai Lindner <mihaix.lindner@linux.intel.com>"
> > -RECIPE_MAINTAINER_pn-lttng2-ust = "Bogdan Marinescu <bogdan.a.marinescu@intel.com>"
> >  RECIPE_MAINTAINER_pn-lttng-control = "Bogdan Marinescu <bogdan.a.marinescu@intel.com>"
> >  RECIPE_MAINTAINER_pn-lttng-modules = "Bogdan Marinescu <bogdan.a.marinescu@intel.com>"
> >  RECIPE_MAINTAINER_pn-lttng-tools = "Bogdan Marinescu <bogdan.a.marinescu@intel.com>"
> > diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> > index 591f33f..8f40c4e 100644
> > --- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> > +++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> > @@ -46,7 +46,7 @@ SYSTEMTAP_aarch64 = ""
> >  # which means we can not use syscall() to call it. So we ignore
> >  # it for x86_64/uclibc
> >  
> > -LTTNGUST = "lttng2-ust"
> > +LTTNGUST = "lttng-ust"
> >  LTTNGUST_libc-uclibc = ""
> >  LTTNGUST_mips = ""
> >  LTTNGUST_aarch64 = ""
> > diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
> > index 2a5dd58..34d4484 100644
> > --- a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
> > +++ b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
> > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=61273c2e3f60dd38a74b01beb5f51fbd \
> >                      file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> >                      file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
> >  
> > -DEPENDS = "liburcu popt lttng2-ust"
> > +DEPENDS = "liburcu popt lttng-ust"
> >  
> >  SRCREV = "98c8c95b0e1afb2dac686338efdf036f6446d790"
> >  PV = "v2.0.4"
> > diff --git a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb b/meta/recipes-kernel/lttng-2.0/lttng-ust_2.0.5.bb
> > similarity index 100%
> > rename from meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
> > rename to meta/recipes-kernel/lttng-2.0/lttng-ust_2.0.5.bb
> > -- 
> > 1.7.11.4
> > 
> > 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 




