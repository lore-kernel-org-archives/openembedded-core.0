Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RJork-0007Jv-SQ
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 18:01:08 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1RJolw-0002eS-Lj; Fri, 28 Oct 2011 17:55:08 +0200
From: Phil Blundell <philb@gnu.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 28 Oct 2011 16:54:47 +0100
In-Reply-To: <CAEsOVNdwf8xYTp0K1JftUcMfmuuzMbMKahrP56Q1wx5yf4VPBw@mail.gmail.com>
References: <1319700362.15601.2.camel@ted>
	<1319743874-9891-1-git-send-email-msm@freescale.com>
	<1319792127.22423.1.camel@ted>
	<CAEsOVNdwf8xYTp0K1JftUcMfmuuzMbMKahrP56Q1wx5yf4VPBw@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1319817308.22985.448.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH v2 1/2] Add new strace-graph package to avoid making perl a dependecy for all of strace
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
X-List-Received-Date: Fri, 28 Oct 2011 16:01:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-10-28 at 15:34 +0000, McClintock Matthew-B29882 wrote:
> On Fri, Oct 28, 2011 at 3:55 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >> -RDEPENDS = "perl"
> >> +PACKAGES_prepend = "${PN}-graph "
> >> +FILES_${PN}-graph = "${bindir}/strace-graph"
> >> +RDEPENDS_${PN}-graph = "perl"
> >
> > I should have been clearer in my original email, pretty much every other
> > recipe uses += or =+ in this context. Whilst the _prepend override is
> > probably ok, its probably a bit heavy in this case and the standard
> > operator should work just fine.
> 
> usr/bin/strace-graph will be picked up by the default rules for ${PN}
> - by prepending I thought I was letting strace-graph get picked out
> first in ${PN}-graph then everything else could go in ${PN} without
> having the explicitly list a new rule for ${PN}.

That logic sounds reasonable, but I think Richard's point was that it's
more conventional to use "=+" rather than an override for prepending.

p.




