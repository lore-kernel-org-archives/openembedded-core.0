Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QM4BV-0001ko-PD for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 22:14:33 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QM3jY-0004D8-84
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 21:45:40 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTikh-we7ziQCB5ywApYhw63NOWiUfQ@mail.gmail.com>
References: <1305563748.2429.76.camel@phil-desktop>
	<BANLkTikh-we7ziQCB5ywApYhw63NOWiUfQ@mail.gmail.com>
Date: Mon, 16 May 2011 21:11:01 +0100
Message-ID: <1305576661.18415.6.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: uclibc?
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
X-List-Received-Date: Mon, 16 May 2011 20:14:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-05-16 at 10:01 -0700, Khem Raj wrote:
> On Mon, May 16, 2011 at 9:35 AM, Phil Blundell <pb@pbcl.net> wrote:
> > I've just been trying to build a uclibc-based system from the current
> > head of oe-core but this doesn't seem to be something that works
> > entirely smoothly at the moment.  Does anybody have a patchset to fix
> > the uclibc recipes, or is anybody working on such a thing?
> >
> 
> I have not fixed uclibc in oe-core yet but if you use
> meta-openembedded layer along with oe-core
> then the uclibc in that layer should work pretty well on top of
> oe-core. Eventually
> it should move into oe-core one of these days.

I just tried that and now I get a failure in gcc-intermediate due to
missing linux/limits.h.  Not quite sure what's gone wrong there.

p.




