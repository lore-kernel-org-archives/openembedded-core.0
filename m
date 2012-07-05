Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SmjG1-0006tV-Sf
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 12:25:59 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:54601 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1Smj5K-0001AI-Md for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 06:14:54 -0400
Date: Thu, 5 Jul 2012 06:14:46 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4FF5289C.80107@gmail.com>
Message-ID: <alpine.DEB.2.02.1207050607040.3303@oneiric>
References: <alpine.DEB.2.02.1207032219210.21877@oneiric>
	<CAMKF1sqWn-S=Hc_eMw-JU3ZP6ox-vfNSidiQbF_oLPhg9tO71g@mail.gmail.com>
	<4FF4151A.7050400@opendreambox.org>
	<alpine.DEB.2.02.1207040615500.23821@oneiric>
	<1341401390.3906.12.camel@ted> <4FF5289C.80107@gmail.com>
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
Subject: Re: why would a recipe have both do_install() and do_install_append()?
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
X-List-Received-Date: Thu, 05 Jul 2012 10:25:59 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Wed, 4 Jul 2012, Khem Raj wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 7/4/2012 4:29 AM, Richard Purdie wrote:
> >>>>> AFAICT, you can't override an append. Both appends, the
> >>>>> original and the bbappended, would get executed.
> >>>
> >>> ok, now i *definitely* want to know whether this would work or
> >>> not since there are a few recipes that define both do_install()
> >>> and do_install_append().
> > Andreas is correct, you can't override a do_install_append (),
> > both would just get appended.
>
> yes thats true. I was thinking about having appends which are
> recipe-class specific but that case wont apply to a normal _append
> like above

  so, in the end. there's really no compelling rationale for a recipe
defining both a do_install() and do_install_append() back to back, is
that correct?  because there are a small number of OE recipes that do
just that:

$ grep -wl do_install $(grep -rlw do_install_append *)
meta/recipes-support/libcap/libcap.inc
meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.1.bb
meta/recipes-core/tinylogin/tinylogin_1.4.bb
meta/recipes-core/eglibc/eglibc-package.inc
meta/recipes-kernel/linux/linux-yocto.inc
meta/recipes-extended/lsb/lsb_1.4.bb
meta/recipes-extended/man/man_1.6f.bb
meta/recipes-extended/logrotate/logrotate_3.8.1.bb
$

  obviously, it doesn't hurt, it just seems unnecessary.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


