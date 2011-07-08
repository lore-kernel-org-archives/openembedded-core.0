Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QfD7s-0001n1-In for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 17:37:56 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1QfD4A-0007Hb-3q
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 17:34:06 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 08 Jul 2011 16:34:05 +0100
In-Reply-To: <1310138792.20015.880.camel@rex>
References: <629561972efd884a87edc521d0430af83511ae58.1310070283.git.nitin.a.kamble@intel.com>
	<12dc19831b4766f0894ff43ae916150057a0e65e.1310070283.git.nitin.a.kamble@intel.com>
	<1310138792.20015.880.camel@rex>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310139246.6337.130.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 4/7] binutils: package unpackaged files
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
X-List-Received-Date: Fri, 08 Jul 2011 15:37:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 16:26 +0100, Richard Purdie wrote:
> > @@ -35,11 +35,13 @@ FILES_${PN}-symlinks = " \
> >  	${bindir}/c++filt \
> >  	${bindir}/gprof \
> >  	${bindir}/ld \
> > +	${bindir}/ld.bfd \
> >  	${bindir}/nm \
> >  	${bindir}/objcopy \
> >  	${bindir}/objdump \
> >  	${bindir}/ranlib \
> >  	${bindir}/readelf \
> > +	${bindir}/elfedit \
> >  	${bindir}/size \
> >  	${bindir}/strip"
> 
> Nitin, do you know if the ld.bfd above is a hardlinked copy of ld?

If you're getting ld.bfd at all (at least with our current recipes) then
it probably means that ${bindir}/ld is gold.  So in that case they
oughtn't to be symlinked.

p.



