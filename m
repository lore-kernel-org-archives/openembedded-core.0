Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RiJSk-0008Df-Qj
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 06:32:34 +0100
Received: by iakh37 with SMTP id h37so28142502iak.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jan 2012 21:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+L5IZCExjgv6wx4ufK+5EQwF9iZUB6T6M+A9UGcCpOA=;
	b=iGIHGRUPHgyob8kqB7kf3zD7NAuoBZrH1mvl8BhPqvGDOCoBjaesad53K/wNHcFZ5T
	76JOH837Ya30sZDQkSmDaXPqGuq4seO+YYGRRGmPEIUYICG19+hYmtBuIc6nqoyT+PKr
	ogBUGMcAle9FSk57o9xMeHrRrIG9BQXhtTFFY=
Received: by 10.50.191.225 with SMTP id hb1mr65734886igc.17.1325654713035;
	Tue, 03 Jan 2012 21:25:13 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id va6sm15850823igc.6.2012.01.03.21.25.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jan 2012 21:25:12 -0800 (PST)
Date: Tue, 3 Jan 2012 21:25:34 -0800
From: Khem Raj <raj.khem@gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120104052534.GI31275@sakrah.homelinux.org>
References: <8285067.9cfZeAKmYZ@helios>
	<1325103622.3089.8.camel@lenovo.internal.reciva.com>
	<CA452391058F6D4E9715FB2C29D9312A010BD995@039-SN2MPN1-023.039d.mgd.msft.net>
	<1325591055.24417.330.camel@phil-desktop>
	<065BBB7616BCE543832A2EF096986B94018AA0@039-SN2MPN1-011.039d.mgd.msft.net>
	<CAEsOVNe0j=Kq+irY3wnP46pbDywRtM1g-8jNnfsHRZXWuU0avA@mail.gmail.com>
	<065BBB7616BCE543832A2EF096986B94018AC3@039-SN2MPN1-011.039d.mgd.msft.net>
	<CAEsOVNeQ2zrS8dviqJ0TLfkwKdiEHPs_pZ=6KXvJcJ1h9ur2qw@mail.gmail.com>
	<065BBB7616BCE543832A2EF096986B94018ADB@039-SN2MPN1-011.039d.mgd.msft.net>
	<CAEsOVNdBy7uAtJnMmOBLMobXg=XHfpsrgTvmDOz9=pszh7hHLg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEsOVNdBy7uAtJnMmOBLMobXg=XHfpsrgTvmDOz9=pszh7hHLg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Phil Blundell <philb@gnu.org>, Garg Vakul-B16394 <B16394@freescale.com>,
	Luo Zhenhua-B19537 <B19537@freescale.com>
Subject: Re: [PATCH oe-core] valgrind: add powerpc to the compatible host and add eglibc-dbg in rdepends
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
X-List-Received-Date: Wed, 04 Jan 2012 05:32:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (04/01/12 04:39), McClintock Matthew-B29882 wrote:
> On Tue, Jan 3, 2012 at 10:31 PM, Garg Vakul-B16394 <B16394@freescale.com> wrote:
> > Hi Matthew
> >
> > I am not sure if I understood your point fully.
> >
> > I am suggesting to do below mentioned as suggested on valgrind page.
> > http://valgrind.org/docs/manual/dist.readme-packagers.html
> >
> >
> > "If you don't want to leave symbols on ld.so, alternatively you can have your distro install ld.so's debuginfo package by default, or make ld.so.debuginfo be a requirement of your Valgrind RPM/DEB/whatever."
> 
> This is what I am suggest. If we include valgrind in an image and the
> arch is powerpc or powerpc64, we need to include ld.so with debug
> symbols by default. Otherwise valgrind will not work at all. This
> seems like a reasonable thing to do for these two arches.

I think we might be evading the real issue here. Which symbols are
valgrind interested in ? is this something ppc specific or general
case. Are we stripping ld.so too much ?
some of the symbols are needed to be kept for ld.so for gdb to work
and I am guessing its similar kind of issue here. If you can figure
this then we may solve this issue by just not stripping needed symbols


