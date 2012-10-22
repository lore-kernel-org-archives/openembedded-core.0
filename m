Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>)
	id 1TQNsc-0006z7-HV; Mon, 22 Oct 2012 21:41:43 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TQNfc-00013K-TI; Mon, 22 Oct 2012 21:28:16 +0200
Message-ID: <1350933937.6763.10.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 22 Oct 2012 20:25:37 +0100
In-Reply-To: <CAP9ODKrMoEJMXWNa0rx0KyQjx3hJhFzPOJCH+eDYqiDm3saMxg@mail.gmail.com>
References: <CAJTo0LboPRF7Oxnwh8QS6b6ReS-1-P+=r04L54QRptPnHfV5oQ@mail.gmail.com>
	<CAP9ODKrMoEJMXWNa0rx0KyQjx3hJhFzPOJCH+eDYqiDm3saMxg@mail.gmail.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [RFC] OpenGL packaging/staging policy
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 22 Oct 2012 19:41:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-10-22 at 15:33 -0200, Otavio Salvador wrote:
> On Mon, Oct 22, 2012 at 2:35 PM, Burton, Ross <ross.burton@intel.com> wrote:
> ...
> > Rule 1.  Unambiguous package naming
> >
> > Debian-style renaming and multiple providers of the same API doesn't
> > work as you'll end up with multiple packages in the same feed called
> > libgl1, so all GL packages should be named in the style of libgl-foo,
> > where foo is the source of the package.  I've got a branch where this
> > is implemented for Mesa as a proof of concept[1], and the Python
> > fragment could easily be moved into a class and re-used easily.
> 
> It would be nice to also have a common SoC arch so the binaries are
> clear not allarch but not rebuild for every board.
> 
> For example in iMX53 and iMX51 case they share same GL package set and
> we could have a armv7-imx5 or so common to all them so we'd not
> rebuild it for every board.

Surely in the case Ross describes, the "imx5" bit would be encoded into
the package name (i.e. they'd be libgl-imx5) and then PACKAGE_ARCH can
just be used as normal to represent the ISA and/or ABI.  I can't think
of any situation where encoding the GPU type into PACKAGE_ARCH would be
especially useful.

p.




