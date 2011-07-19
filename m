Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QjDym-0006F4-Aa
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 19:21:08 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QjDur-0002TF-8Q
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 19:17:05 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1311095584.7045.12.camel@lenovo.internal.reciva.com>
References: <1311091299.30326.38.camel@phil-desktop>
	<CAMKF1sqBvobw4AEDn+UCUQVYeZXSPE+Xt_1PV0W2ajFHTguAkw@mail.gmail.com>
	<1311095584.7045.12.camel@lenovo.internal.reciva.com>
Date: Tue, 19 Jul 2011 18:16:59 +0100
Message-ID: <1311095819.7045.14.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH] uclibc: improve packaging granularity
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
X-List-Received-Date: Tue, 19 Jul 2011 17:21:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-19 at 18:13 +0100, Phil Blundell wrote:
> On Tue, 2011-07-19 at 10:09 -0700, Khem Raj wrote:
> > On Tue, Jul 19, 2011 at 9:01 AM, Phil Blundell <philb@gnu.org> wrote:
> > > -FILES_uclibc-dev_append = "\
> > > +FILES_${PN}-dev_append = "\
> > 
> > same uclibc.inc is also used by uclibc-initial recipe so using ${PN}
> > may not be ok here
> 
> Does uclibc-initial generate any PACKAGES?  I rather assumed it was
> sysroot only, in which case the FILES are irrelevant.
> 
> In any case, the name of the FILES variable needs to match the value in
> PACKAGES.  Having "FILES_uclibc-dev" is no good if PACKAGES talks about
> "${PN}-dev", which appears to be the case here.

... and, maybe more to the point, it's also no good to be doing
"FILES_uclibc-dev_append" when there is a ${PN}-dev definition in
bitbake.conf.  They need to be consistent.

p.




