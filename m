Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SujPy-000449-Dj
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 14:13:18 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:48130 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SujEq-0001Zc-71 for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 08:01:48 -0400
Date: Fri, 27 Jul 2012 08:01:36 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1343388304.9574.118.camel@ted>
Message-ID: <alpine.DEB.2.02.1207270801210.14507@oneiric>
References: <alpine.DEB.2.02.1207261904590.18831@oneiric>
	<1343388304.9574.118.camel@ted>
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
Subject: Re: image.bbclass: Update outdated reference to "export IMAGE_BASENAME"
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
X-List-Received-Date: Fri, 27 Jul 2012 12:13:18 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 27 Jul 2012, Richard Purdie wrote:

> On Thu, 2012-07-26 at 19:06 -0400, Robert P. J. Day wrote:
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> >
> > ---
> >
> >   does this look about right?
> >
> > diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> > index 1799bf1..b0b476f 100644
> > --- a/meta/classes/image.bbclass
> > +++ b/meta/classes/image.bbclass
> > @@ -58,10 +58,9 @@ PACKAGE_GROUP_dev-pkgs[optional] = "1"
> >  PACKAGE_GROUP_doc-pkgs = "${@' '.join('%s-doc' % pkg for pkg in normal_pkgs_to_install(d))}"
> >  PACKAGE_GROUP_doc-pkgs[optional] = "1"
> >
> > -# "export IMAGE_BASENAME" not supported at this time
> >  IMAGE_INSTALL ?= ""
> >  IMAGE_INSTALL[type] = "list"
> > -IMAGE_BASENAME[export] = "1"
> > +export IMAGE_BASENAME
> >  export PACKAGE_INSTALL ?= "${IMAGE_INSTALL} ${ROOTFS_BOOTSTRAP_INSTALL} ${FEATURE_INSTALL}"
> >  PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
> >
> > diff --git a/meta/recipes-core/images/core-image-minimal-initramfs.bb b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> > index 7f6826c..ddc2142 100644
> > --- a/meta/recipes-core/images/core-image-minimal-initramfs.bb
> > +++ b/meta/recipes-core/images/core-image-minimal-initramfs.bb
> > @@ -8,7 +8,6 @@ IMAGE_INSTALL = "initramfs-live-boot initramfs-live-install initramfs-live-insta
> >  # Do not pollute the initrd image with rootfs features
> >  IMAGE_FEATURES = ""
> >
> > -export IMAGE_BASENAME = "core-image-minimal-initramfs"
> >  IMAGE_LINGUAS = ""
>
> I meant just to remove the export flag here, so:
>
> -export IMAGE_BASENAME = "core-image-minimal-initramfs"
> +IMAGE_BASENAME = "core-image-minimal-initramfs"

  ah, all right, then.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


