Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QWTIb-0005kU-QQ for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 15:04:53 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QWTFK-0004FC-2V
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 15:01:30 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1308056023.25285.258.camel@phil-desktop>
References: <cover.1307947593.git.sgw@linux.intel.com>
	<42c945e9af04b3e9733253b1186abe13bc80bde7.1307947593.git.sgw@linux.intel.com>
	<1308056023.25285.258.camel@phil-desktop>
Organization: Phil Blundell Consulting Ltd
Date: Tue, 14 Jun 2011 14:01:24 +0100
Message-ID: <1308056484.25285.262.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [*RFC CONSOLIDATED PULL RFC* 03/23] git: restore the dependency on perl-native
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
X-List-Received-Date: Tue, 14 Jun 2011 13:04:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-14 at 13:53 +0100, Phil Blundell wrote:
> On Sun, 2011-06-12 at 23:54 -0700, Saul Wold wrote:
> > -inherit autotools
> > +inherit autotools perlnative
> 
> This broke the tree for me.  Now I get:
> 
> NOTE: Out of date cache found, rebuilding...
> ERROR: Could not inherit file
> classes/perlnative.bbclass###########################################
> | ETA:  00:00:03
> ERROR: Command execution failed: Exited with 1

BTW, Scott, this is also a new addition to my list of unsatisfactory
bitbake error messages.  It would be more helpful if bitbake: (a)
printed the name of the recipe causing the problem, rather than leaving
me to grep the tree/guess, and (b) continued rather than immediately
bailing out.  Also, aesthetically, it'd be nice if it didn't print the
error on top of the status bar although I guess that is a minor issue in
the larger scheme of things.

However, on the positive side, at least there is no python
stacktrace :-)

p.




