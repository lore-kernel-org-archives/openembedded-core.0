Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RTtfX-0002AT-UI
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 12:10:12 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RTtZC-0002pp-Dt
	for openembedded-core@lists.openembedded.org;
	Fri, 25 Nov 2011 12:03:38 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 25 Nov 2011 11:03:37 +0000
In-Reply-To: <1322179246.10928.38.camel@ted>
References: <cover.1321969615.git.otavio@ossystems.com.br>
	<65caf0c80f03e4fd3710b708541b0a7dd8f310ba.1321969615.git.otavio@ossystems.com.br>
	<1321982105.29435.302.camel@phil-desktop>
	<CAP9ODKrBxULKL=3ZHhGiOU4g7+uM=ke+43sDU=h67CvU_q7bAA@mail.gmail.com>
	<1322179246.10928.38.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1322219018.26081.70.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] xserver-xorg: do not disable-dga as VESA driver requires it
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
X-List-Received-Date: Fri, 25 Nov 2011 11:10:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-11-25 at 00:00 +0000, Richard Purdie wrote:
> Looking at vesa.c, there is quite a chunk of code in there depending on
> DGA.

I guess the question is, is this chunk of code actually doing anything
useful/important, or is it just there to support DGA on VESA?  If the
latter then people who don't need/want DGA (which is probably everybody,
nowadays) can just take it out.

All that said, I would have thought that the VESA driver itself was
pretty much a fringe interest in this day and age.  Is anybody really
using that on a shipping system?  If it's just for qemux86 test harness
purposes then maybe we could turn on the vesafb driver in the kernel and
use the straight framebuffer driver in Xorg rather than the VESA one.

> Is there any harm to building DGA apart from an extra package? Its a
> self contained module isn't it?

I don't think it's that self-contained.  Admittedly it isn't all that
big either, but still.

> If so, we should just be able to turn it on, package it separately and
> forget about it?
> 
> Of course the ideal solution would be for someone to convert the vesa
> driver to use the xrandr API...

I don't quite understand what xrandr has to do with that.  How does this
relate to DGA?

p.




