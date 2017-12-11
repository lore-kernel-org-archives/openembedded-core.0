Return-Path: <mac@mcrowe.com>
Received: from avasout06.plus.net.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id 0687671A8D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 10:00:11 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by smtp with ESMTP
	id OKsdergExFv8cOKseenhux; Mon, 11 Dec 2017 10:00:12 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.2 cv=Ful1xyjq c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=kj9zAlcOel0A:10 a=ocR9PWop10UA:10 a=pGLkceISAAAA:8 a=Q4-j1AaZAAAA:8
	a=2ErjbGDfAteE68NljtsA:9 a=CjuIK1q_8ugA:10 a=Edqs4HDxhskA:10
	a=9H3Qd4_ONW2Ztcrla5EB:22
Received: from mac by deneb with local (Exim 4.89)
	(envelope-from <mac@mcrowe.com>)
	id 1eOKsd-00076A-Mm; Mon, 11 Dec 2017 10:00:11 +0000
Date: Mon, 11 Dec 2017 10:00:11 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20171211100011.ba2ll76jcigsdprc@mcrowe.com>
References: <20171207161555.uqbdyctwj7qljnto@mcrowe.com>
	<CAMKF1soDvWpqpUaZQcPoVA_0_NFXh_UB6vJ5QTb=ZKhtX+L3XQ@mail.gmail.com>
	<CAJ86T=VzQrqQPa4OB_SgyhYGg_ySp9UgBLeRuY1XLCXYgNbtjA@mail.gmail.com>
	<CAMKF1srhviBz5_Y9Gsn=Db2y9wCJ8HN96+FjBci+XA3m1R-Pwg@mail.gmail.com>
	<CAJ86T=XLobz3tiBOf+JqAt3JBV=o4HqUVBJwkjY0VR9LCDWNyQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=XLobz3tiBOf+JqAt3JBV=o4HqUVBJwkjY0VR9LCDWNyQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CMAE-Envelope: MS4wfAjlBOurVKDljxAYMdgi/t+WmbA9B19kqG5mhrEY3QaKpjHMqCNIxp/kowev6tEwPuUjwOtgYP6gVveBfQBlzm2Y134LAv6FfZ6iLgdTEiGUiII/0K7s
	PbwF9p9/7xTrt/hTyg05Ve9EN8HO5Os1duY=
Subject: Re: kernel.bbclass do_sizecheck behaviour changes
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
X-List-Received-Date: Mon, 11 Dec 2017 10:00:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Friday 08 December 2017 at 14:24:17 -0800, Andre McCurdy wrote:
> On Fri, Dec 8, 2017 at 1:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> The size limit for an uncompressed kernel vs a compressed kernel is
> >> going to be quite different, so defining one size limit and applying
> >> it to all images doesn't seem logical.
> >
> > I was hoping that we are talking about deployed kernels here compressed
> > sizes can vary widely too
> >
> > So may be we can have a hook to define which image types should be monitored
> > and what the limits are for individual type
> 
> We could do a lot of things and add a lot of complexity. However based
> on the fact that the simplest test has been broken for some time and
> no-one noticed, the evidence is that the kernel image size check isn't
> a widely used feature (and the kernel image size check with multiple
> kernel image types even less so, if at all) and so probably shouldn't
> be the focus of our efforts.

Well, anyone who also didn't notice the change in units probably hasn't
noticed the breakage yet either. :-)

But, I mostly agree. It's clear the size check feature is used, but it's
quite possible that it isn't used in combination with multiple image type
support. So, I think something along the same lines as the patch I
submitted[1] is worth applying, even if in the longer term something better
might be desirable.

Mike.

[1] https://patchwork.openembedded.org/patch/146518/
    http://lists.openembedded.org/pipermail/openembedded-core/2017-December/145402.html

