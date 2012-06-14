Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SfGnA-0007YO-Bc
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 22:37:20 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SfGcu-0007Pq-Vl
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 22:26:45 +0200
Message-ID: <1339705523.3339.121.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jun 2012 21:25:23 +0100
In-Reply-To: <4FDA4519.5090003@linux.intel.com>
References: <cover.1339701375.git.sgw@linux.intel.com>
	<5a1646b267619919186d5b12e59207d3251cf2dd.1339701375.git.sgw@linux.intel.com>
	<1339703681.3339.116.camel@x121e.pbcl.net>
	<1339703886.3339.118.camel@x121e.pbcl.net>
	<4FDA4519.5090003@linux.intel.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [Consolidated Pull 13/17] curl: enable ssl support
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
X-List-Received-Date: Thu, 14 Jun 2012 20:37:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-06-14 at 13:10 -0700, Saul Wold wrote:
> On 06/14/2012 12:58 PM, Phil Blundell wrote:
> > On Thu, 2012-06-14 at 20:54 +0100, Phil Blundell wrote:
> >> On Thu, 2012-06-14 at 12:27 -0700, Saul Wold wrote:
> >>> +DEPENDS = "zlib gnutls openssl"
> >>
> >> Do you really want both gnutls and openssl simultaneously?  That seems a
> >> bit excessive.  What exactly is openssl bringing here that gnutls
> >> doesn't do?
> >
> > Also, if you really do want this, it ought to be a DISTRO_FEATURE and/or
> > PKG_CONFIG option.  Aside from the issue of binary bloat, OpenSSL brings
> > a pile of licensing grief that a lot of folks may not want.
> >
> Ah, I tried to figure out why openssl was not in the first place, now I 
> understand better.  How's this as a comprise, go back to pure gnutls for 
> the target, but have the native only use openssl to allow secure git 
> fetches, which is what triggered this in the first place.

That sounds like a decent plan.  In the longer term I think there would
be some mileage in a generic DISTRO_FEATURES setting to allow one to
select between gnutls and openssl (or yassl, nss, ...) in a global kind
of way, and then curl should be made to respect it.

p.



