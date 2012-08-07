Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Syol4-0002dZ-4n
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 20:43:58 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SyoZi-0005fR-8T
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 20:32:14 +0200
Message-ID: <1344364223.4874.16.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 07 Aug 2012 19:30:23 +0100
In-Reply-To: <50215ED9.3070505@windriver.com>
References: <1344360704-23172-1-git-send-email-yao.zhao@windriver.com>
	<502152B8.6070100@gmail.com> <50215ED9.3070505@windriver.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH] cracklib, zlib: install to /lib instead of /usr/libxx
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
X-List-Received-Date: Tue, 07 Aug 2012 18:43:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-07 at 14:30 -0400, Yao Zhao wrote:
> On 12-08-07 01:39 PM, Derek Buitenhuis wrote:
> > On 07/08/2012 1:31 PM, Yao Zhao wrote:
> >> In order to fix the QA Issue for libpam which installed to /lib but
> >> reference /usr/libxx/libz and libcrack, install libz and libcrack
> >> to /lib.
> > OpenBSD puts libpam.so in /lib, so it seems kosher...
> >
> >>   do_install() {
> >> -	oe_runmake DESTDIR=${D} install
> >> +	#libz.a installs to libdir, overwrite the env libdir
> >> +	#install pkgconfig to env libdir/pkgconfig
> >> +	oe_runmake DESTDIR=${D} pkgconfigdir="${libdir}/pkgconfig" \
> >> +		   libdir="${base_libdir}" install
> >>   }
> > If you're specifying --libdir when configuring, why do you need
> > libdir during make, as well?
> zlib is not using autotools although it has configure.
> when install, oe_runmake will be make -e so Makefile will always use 
> env's libdir which is the usr/libxx, we have to overwrite it when install.

Where do libz.a and libz.so end up after your patch?

p.



