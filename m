Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RzyW1-0003da-4B
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 23:48:57 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RzyNz-0005wA-Ru
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 23:40:39 +0100
Message-ID: <1329864016.2591.195.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 21 Feb 2012 22:40:16 +0000
In-Reply-To: <4F441987.2010800@linux.intel.com>
References: <1328889675-9864-1-git-send-email-andrei@gherzan.ro>
	<4F441987.2010800@linux.intel.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH] openssl: Move libcrypto to base_libdir
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
X-List-Received-Date: Tue, 21 Feb 2012 22:48:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-02-21 at 14:24 -0800, Saul Wold wrote:
> On 02/10/2012 08:01 AM, Andrei Gherzan wrote:
> > This fix is for dhclient. It needs libcrypto at runtime and if
> > libcrypto is in libdir, it's path can be inaccessible on systems
> > where /usr is on nfs for example or dhclient is needed before
> > /usr is mounted.
> >
> > Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
> > ---
> >   ...001-openssl-Move-libcrypto-to-base_libdir.patch |   61 ++++++++++++++++++++
> >   meta/recipes-connectivity/openssl/openssl.inc      |   10 +++-
> >   .../recipes-connectivity/openssl/openssl_1.0.0g.bb |    2 +-
> >   3 files changed, 71 insertions(+), 2 deletions(-)
> >   create mode 100644 meta/recipes-connectivity/openssl/0001-openssl-Move-libcrypto-to-base_libdir.patch
> >
> > diff --git a/meta/recipes-connectivity/openssl/0001-openssl-Move-libcrypto-to-base_libdir.patch b/meta/recipes-connectivity/openssl/0001-openssl-Move-libcrypto-to-base_libdir.patch
> > new file mode 100644
> > index 0000000..b101d8c
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/openssl/0001-openssl-Move-libcrypto-to-base_libdir.patch
> > @@ -0,0 +1,61 @@
> > +From ac1fe1490e997fb8fd91ec13b675d38efcc65775 Mon Sep 17 00:00:00 2001
> > +From: Andrei Gherzan<andrei@gherzan.ro>
> > +Date: Thu, 9 Feb 2012 00:03:38 +0200
> > +Subject: [PATCH] openssl: Move libcrypto to base_libdir
> > +
> > +This fix is for dhclient. It needs libcrypto at runtime and if
> > +libcrypto is in libdir, it's path can be inaccessible on systems
> > +where /usr is on nfs for example or dhclient is needed before
> > +/usr is mounted.
> > +
> Seems to be missing Upstream-Status

Really?  There doesn't seem to be any genuine patch here.  As far as I
can tell, that 0001-openssl-Move-libcrypto-to-base_libdir.patch file is
some old version of the changeset which has somehow gotten checked in as
a git format-patch'd diff.  I think it should be deleted, not given an
upstream-status.

p.




