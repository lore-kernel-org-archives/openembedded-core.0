Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TvrdS-0002MI-Fj
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 16:44:20 +0100
Received: from cpebcc81008dd2c-cmbcc81008dd29.cpe.net.cable.rogers.com
	([99.253.156.71]:41776 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TvrOa-0004rb-E2; Thu, 17 Jan 2013 10:28:48 -0500
Date: Thu, 17 Jan 2013 10:28:45 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20130117152150.GJ3067@jama>
Message-ID: <alpine.DEB.2.02.1301171027460.7200@oneiric>
References: <20130110235238.B9768103BD@opal> <20130117152150.GJ3067@jama>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Robert P. J. Day : kernel.bbclass: Define MODULE_IMAGE_BASE_NAME for layer convenience.
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
X-List-Received-Date: Thu, 17 Jan 2013 15:44:22 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 17 Jan 2013, Martin Jansa wrote:

> On Thu, Jan 10, 2013 at 11:52:38PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: 67e77cd948c69798695d5d5f34163ef89339b35a
> > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=67e77cd948c69798695d5d5f34163ef89339b35a
> >
> > Author: Robert P. J. Day <rpjday@crashcourse.ca>
> > Date:   Wed Jan  9 12:01:23 2013 -0500
> >
> > kernel.bbclass: Define MODULE_IMAGE_BASE_NAME for layer convenience.
> >
> > Define the additional variable MODULE_IMAGE_BASE_NAME since some
> > layers (like meta-ti) would find it handy for multi-kernel
> > definitions in that they wouldn't have to define their own
> > variable representing exactly the same thing.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >
> > ---
> >
> >  meta/classes/kernel.bbclass |    3 ++-
> >  1 files changed, 2 insertions(+), 1 deletions(-)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index aff8842..46ba55f 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -500,7 +500,8 @@ KERNEL_IMAGE_BASE_NAME ?= "${KERNEL_IMAGETYPE}-${PE}-${PV}-${PR}-${MACHINE}-${DA
> >  # Don't include the DATETIME variable in the sstate package signatures
> >  KERNEL_IMAGE_BASE_NAME[vardepsexclude] = "DATETIME"
> >  KERNEL_IMAGE_SYMLINK_NAME ?= "${KERNEL_IMAGETYPE}-${MACHINE}"
> > -MODULE_TARBALL_BASE_NAME ?= "modules-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}.tgz"
> > +MODULE_IMAGE_BASE_NAME ?= "modules-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
> > +MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
> >  # Don't include the DATETIME variable in the sstate package signatures
> >  MODULE_TARBALL_BASE_NAME[vardepsexclude] = "DATETIME"
> >  MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
>
> This makes sstate checksums to depend on DATETIME variable.
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3299

  yes, i see your point, my mistake in not noticing that when i
submitted that patch.  would someone else like to handle this just to
make sure it's fixed correctly?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


