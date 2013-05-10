Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Ual7M-00074W-Um for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 13:04:06 +0200
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Uakpt-0000ZZ-DM; Fri, 10 May 2013 12:46:01 +0200
Message-ID: <1368182760.24706.3.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 10 May 2013 11:46:00 +0100
In-Reply-To: <1368181932.11129.11.camel@ted>
References: <1368180910-17476-1-git-send-email-bogdan.a.marinescu@intel.com>
	<20130510102041.GA12329@jama.dyndns-home.com>
	<1368181932.11129.11.camel@ted>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] flex: updated to 2.5.37
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
X-List-Received-Date: Fri, 10 May 2013 11:04:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, 2013-05-10 at 11:32 +0100, Richard Purdie wrote:
> On Fri, 2013-05-10 at 12:20 +0200, Martin Jansa wrote:
> > On Fri, May 10, 2013 at 01:15:10PM +0300, Bogdan Marinescu wrote:
> > > Removed the patches to flex, because they are now applied to the
> > > latest version.
> > 
> > Can you check if 2.5.37 still reports flex.real when you call
> > flex --version?
> > 
> > If yes, please integrate
> > http://lists.linuxtogo.org/pipermail/openembedded-core/2013-May/039425.html
> > I'll send v2 with added ${S} in a minute
> 
> I'm really not convinced we should be hacking flex to fix this. Can't
> whatever parsing is being done to extract the version be a little more
> relaxed about the name?

Or we could patch create_wrapper() to put the original binary in a
different directory (but keep the same leafname) rather than renaming it
to foo.real.  That would also address Martin's other concern with flex++
not knowing its own name.

p.




