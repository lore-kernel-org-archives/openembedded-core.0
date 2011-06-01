Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QRsSw-00007y-T8 for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 22:56:34 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QRsPu-00020z-AQ
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 22:53:26 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTinyA0PAq3bQRTi2zCrWKKOVypytqg@mail.gmail.com>
References: <cover.1306958862.git.otavio@ossystems.com.br>
	<ddcfd950f58f85e00b0ea094534f27ccf1315152.1306958862.git.otavio@ossystems.com.br>
	<1306960406.3119.6.camel@lenovo.internal.reciva.com>
	<BANLkTinyA0PAq3bQRTi2zCrWKKOVypytqg@mail.gmail.com>
Date: Wed, 01 Jun 2011 21:53:20 +0100
Message-ID: <1306961600.3119.15.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 3/3] gnutls: link against 'dl' library
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
X-List-Received-Date: Wed, 01 Jun 2011 20:56:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-01 at 20:39 +0000, Otavio Salvador wrote:
> On Wed, Jun 1, 2011 at 20:33, Phil Blundell <pb@pbcl.net> wrote:
> > On Wed, 2011-06-01 at 20:09 +0000, Otavio Salvador wrote:
> >> +export LDFLAGS += "-ldl"
> >
> > The configure script ought to be figuring this out for itself.  Do you
> > know why that isn't working?
> 
> No I don't.
> 
> Are you able to reproduce it?

No, it works fine for me.  I get:

checking how to link with libpthread... -lpthread
checking for libdl... yes
checking how to link with libdl... -ldl
checking whether we are using the GNU C++ compiler... yes

This is with the current head of oe-core on qemuarm.

p.




