Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TG2BZ-0002fl-BC
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 08:30:29 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TG1zD-0004Eq-PY; Mon, 24 Sep 2012 08:17:43 +0200
Message-ID: <1348467326.4444.248.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Mon, 24 Sep 2012 07:15:26 +0100
In-Reply-To: <505FE422.3090809@linux.intel.com>
References: <1348435031.4444.241.camel@x121e.pbcl.net>
	<CAMKF1sp3_DKmhCw3jrxuKFNf_a6iP_+6EyytXDg1d-zc+Ei22A@mail.gmail.com>
	<505FE422.3090809@linux.intel.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] eglibc: Move perl- and bash-using scripts to separate recipes
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
X-List-Received-Date: Mon, 24 Sep 2012 06:30:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-09-23 at 21:40 -0700, Saul Wold wrote:
> On 09/23/2012 07:11 PM, Khem Raj wrote:
> > On Sun, Sep 23, 2012 at 2:17 PM, Phil Blundell <philb@gnu.org> wrote:
> >> This removes the dependency of eglibc.bb itself on perl and bash
> >> which, in turn, eliminates the need to build those two recipes if the
> >> scripts which need them are not going to be installed.
> >>
> >
> > I think this is a good patch.
> >
> This causes issues with world build and will likely also cause toolchain 
> build failures since eglibc-utils is included in a couple of 
> packagegroups (self-hosted and core-lsb), it's also listed in the 
> tclibc-eglibc.inc LIBC_DEPENDENCIES.

Ah, whoops.  eglibc-utils shouldn't have been removed from PACKAGES,
that was an error.  I'll send a new version of the patch which
reinstates it.

p.




