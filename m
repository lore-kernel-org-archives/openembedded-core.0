Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1T1fur-00021I-AC
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 17:53:53 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1T1fjL-0003yN-8Y
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 17:41:59 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 15 Aug 2012 16:41:58 +0100
In-Reply-To: <502BC22B.4020506@windriver.com>
References: <1344984262-31589-1-git-send-email-andy.ross@windriver.com>
	<1345038674.538.19.camel@ted> <502BC22B.4020506@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1345045319.23275.453.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] task-core-lsb: Don't pull in eglibc-pic via RDEPENDS
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
X-List-Received-Date: Wed, 15 Aug 2012 15:53:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-15 at 08:37 -0700, Andy Ross wrote:
> On 08/15/2012 06:51 AM, Richard Purdie wrote:
> > Are files in that package required in order to pass LSB tests?
> >
> > I'm fine with removing it if it isn't required but I would like that
> > confirmation before we merge this.
> 
> I can't speak to the test suites, but these files are eglibc-specific, so
> it's hard to imagine them being required by the LSB.

Agreed, libc-pic is a pretty fringe requirement and, bizarre though the
LSB demands can be at times, I would be startled if they called for
it.  

To be honest I'm not convinced we ought to be even building that package
by default -- afaik, the only thing that uses it is mklibs.

p.




