Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QlN9I-00051y-TA
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 17:32:52 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QlN5G-0000tZ-W8
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 17:28:43 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2011 16:28:42 +0100
In-Reply-To: <lyzkk2ifpr.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <bd2e16888f6520e2d02d3ff6c43b360d217572e4.1311601422.git.richard.purdie@linuxfoundation.org>
	<b7b6ab25887f5d5fcc541f44287942e1ccd150af.1311601422.git.richard.purdie@linuxfoundation.org>
	<lyzkk2ifpr.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311607723.30326.240.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 4/5] ncurses: Uncompress man pages
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
X-List-Received-Date: Mon, 25 Jul 2011 15:32:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 16:42 +0200, Enrico Scholz wrote:
> Richard Purdie
> <richard.purdie-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> writes:
> 
> > If the man pages are compressed, then they cause file conflicts between
> > the 32-bit and 64-bit versions of the package.
> 
> Patching the buildsystem to use 'gzip --no-name' might be a better
> solution than uncompressing the man pages.
> 
> Alternatively, fixing/changing man page compression should be done in a
> central class instead per recipe.

I guess the other question that springs to mind is why the manpages are
in the same package as the binaries anyway.  Surely they ought to be in
the -doc package, which is presumably wordsize-agnostic, in which case
there oughtn't to be any conflict in the first place.

p.




