Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1TixGi-0003OQ-6S
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 02:07:26 +0100
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:52593 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Tix2d-0007XF-A7; Wed, 12 Dec 2012 19:52:47 -0500
Date: Wed, 12 Dec 2012 19:52:43 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <20121213004147.GA3413@jama.jama.net>
Message-ID: <alpine.DEB.2.02.1212121950080.363@oneiric>
References: <alpine.DEB.2.02.1212121908030.31574@oneiric>
	<20121213004147.GA3413@jama.jama.net>
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
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: remaining few uses of "pnum=" for patches
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
X-List-Received-Date: Thu, 13 Dec 2012 01:07:31 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Thu, 13 Dec 2012, Martin Jansa wrote:

> On Wed, Dec 12, 2012 at 07:10:46PM -0500, Robert P. J. Day wrote:
> >
> >   just noticed that in all of the layers i have checked out (about a
> > dozen), the usage of the deprecated "pnum=" is down to:
> >
> > meta-openembedded/meta-oe/recipes-support/vim/vim_7.2.446.bb:SRC_URI += "http://ftp.vim.org/pub/vim/patches/7.2/7.2.001-100.gz;name=p001-100;apply=yes;patchdir=..;pnum=0"
> > meta-openembedded/meta-oe/recipes-support/vim/vim_7.2.446.bb:SRC_URI += "http://ftp.vim.org/pub/vim/patches/7.2/7.2.101-200.gz;name=p101-200;apply=yes;patchdir=..;pnum=0"
> > meta-openembedded/meta-oe/recipes-support/vim/vim_7.2.446.bb:SRC_URI += "http://ftp.vim.org/pub/vim/patches/7.2/7.2.201-300.gz;name=p201-300;apply=yes;patchdir=..;pnum=0"
> > meta-openembedded/meta-oe/recipes-support/vim/vim_7.2.446.bb:SRC_URI += "http://ftp.vim.org/pub/vim/patches/7.2/7.2.301-400.gz;name=p301-400;apply=yes;patchdir=..;pnum=0"
> > meta-openembedded/meta-oe/recipes-support/vim/vim_7.2.446.bb:SRC_URI += "file://401-446.diff;patchdir=..;pnum=0"
> >
> >   given that that's a single recipe, what about fixing that recipe,
>
> Good plan, please send patch.

  while i'm at it, can i just ditch the "apply=yes"?  isn't that the
default?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


