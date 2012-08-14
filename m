Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T1Nyn-0003o6-HP
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 22:44:45 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1T1NnI-0003J8-Af
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 22:32:52 +0200
Message-ID: <1344976258.7750.33.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 14 Aug 2012 21:30:58 +0100
In-Reply-To: <502A6515.2050007@mlbassoc.com>
References: <502A3A26.5090008@mlbassoc.com>
	<1344944787.23275.384.camel@phil-desktop>
	<502A3C00.6010609@mlbassoc.com>
	<20120814135946.GA5597@mi.fu-berlin.de>
	<3873D957-9816-4F94-B331-C3B7CB68FF37@dominion.thruhere.net>
	<502A6515.2050007@mlbassoc.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Subject: Re: wpa-supplicant & EAP-TLS
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
X-List-Received-Date: Tue, 14 Aug 2012 20:44:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-14 at 08:47 -0600, Gary Thomas wrote:
> I don't see anything explicit on this topic.  That said, the latest version
> (1.0) is dual licensed GPL and BSD and the OpenSSL license is BSD compatible
> from what I can tell.

Yes, wpa-supplicant itself has been OK in this respect for some time.
(The dual-licensing option has actually been removed for the very latest
versions of wpa-supplicant and it's now under the BSD license only, but
this is fine for OpenSSL compatibility purposes.)  However, there are
quite a lot of other SSL-using programs which are only licensed under
GPL terms and linking these with OpenSSL is problematic for some people.
In an ideal world the oe-core license machinery would be able to detect
and warn about that conflict, but I don't think we are quite there yet.

As a general rule, we don't want to build and ship multiple SSL
implementations when one will suffice.  GnuTLS seems to be the most
compatible (in license terms) which is why it is generally the default.
However, DISTROs which don't need to worry about the OpenSSL-GPL
conflict for whatever reason might legitimately want to use OpenSSL
globally, and DISTROs which aren't too bothered about potentially
shipping both might legitimately want to use OpenSSL for specific
packages like wpa-supplicant even if they have GnuTLS elsewhere.

p.




