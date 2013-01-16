Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TvVIr-0005VV-Je
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 16:53:36 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Jan 2013 07:38:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,479,1355126400"; d="scan'208";a="191820873"
Received: from unknown (HELO [10.255.14.217]) ([10.255.14.217])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Jan 2013 07:38:02 -0800
Message-ID: <1358350681.1665.31.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 16 Jan 2013 09:38:01 -0600
In-Reply-To: <20130116140919.GD3002@jama>
References: <20130116115800.A69171034D@opal> <20130116140919.GD3002@jama>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Tom Zanussi : lttng2-ust: rename to lttng-ust
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
X-List-Received-Date: Wed, 16 Jan 2013 15:53:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-01-16 at 15:09 +0100, Martin Jansa wrote:
> On Wed, Jan 16, 2013 at 11:58:00AM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 3c927c39502061bdf3ef9fba1f0f6e7080f6c3cd
> > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=3c927c39502061bdf3ef9fba1f0f6e7080f6c3cd
> > 
> > Author: Tom Zanussi <tom.zanussi@intel.com>
> > Date:   Fri Jan 11 17:28:47 2013 -0600
> > 
> > lttng2-ust: rename to lttng-ust
> > 
> > recipes-kernel/lttng/lttng-ust was removed by a previous patch, which
> > also removed the naming conflict that caused the lttng-2.0 version of
> > lttng-ust to be named lttng2-ust.  lttng2-ust was the only lttng-2.0
> > recipe to be named in this way and since that was entirely due to the
> > conflict, we can go back to the consistent naming for it.
> > 
> > Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> 
> lttng-ust had PE="1", bump PE to fix upgrade path:
> 
> ERROR: Package version for package lttng-ust-dbg went backwards which would break package feeds from (1:0.16-r1 to 0:2.1.0-r0)
> ERROR: Package version for package lttng-ust-staticdev went backwards which would break package feeds from (1:0.16-r1 to 0:2.1.0-r0)
> ERROR: Package version for package lttng-ust-dev went backwards which would break package feeds from (1:0.16-r1 to 0:2.1.0-r0)
> ERROR: Package version for package lttng-ust-doc went backwards which would break package feeds from (1:0.16-r1 to 0:2.1.0-r0)
> ERROR: Package version for package lttng-ust-locale went backwards which would break package feeds from (1:0.16-r1 to 0:2.1.0-r0)
> ERROR: Package version for package lttng-ust went backwards which would break package feeds from (1:0.16-r1 to 0:2.1.0-r0)
> 

Thanks for the report - I just sent a patch to fix this.

Tom

> > 
> > ---
> > 
> >  .../packagegroup-core-tools-profile.bb             |    2 +-
> >  meta/recipes-kernel/lttng-2.0/lttng-tools_2.1.0.bb |    2 +-
> >  .../{lttng2-ust_2.1.0.bb => lttng-ust_2.1.0.bb}    |    5 +++++
> >  3 files changed, 7 insertions(+), 2 deletions(-)
> > 
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
> > diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.1.0.bb b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.1.0.bb
> > index 482b9a6..16e1ccc 100644
> > --- a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.1.0.bb
> > +++ b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.1.0.bb
> > @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=01d7fc4496aacf37d90df90b90b0cac1 \
> >                      file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
> >                      file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
> >  
> > -DEPENDS = "liburcu popt lttng2-ust"
> > +DEPENDS = "liburcu popt lttng-ust"
> >  
> >  SRCREV = "917f768512b5d336d553b801f6c5308d90252a89"
> >  PV = "v2.1.0"
> > diff --git a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.1.0.bb b/meta/recipes-kernel/lttng-2.0/lttng-ust_2.1.0.bb
> > similarity index 87%
> > rename from meta/recipes-kernel/lttng-2.0/lttng2-ust_2.1.0.bb
> > rename to meta/recipes-kernel/lttng-2.0/lttng-ust_2.1.0.bb
> > index 439e006..1076bde 100644
> > --- a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.1.0.bb
> > +++ b/meta/recipes-kernel/lttng-2.0/lttng-ust_2.1.0.bb
> > @@ -12,6 +12,11 @@ inherit autotools
> >  
> >  DEPENDS = "liburcu util-linux"
> >  
> > +# For backwards compatibility after rename
> > +RPROVIDES_${PN} = "lttng2-ust"
> > +RREPLACES_${PN} = "lttng2-ust"
> > +RCONFLICTS_${PN} = "lttng2-ust"
> > +
> >  SRCREV = "0c9ad44b7604040dfcd1e67b18afc3dc5d025b19"
> >  PV = "2.1.0"
> >  PR = "r0"
> > 
> > 
> > _______________________________________________
> > Openembedded-commits mailing list
> > Openembedded-commits@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
> 




