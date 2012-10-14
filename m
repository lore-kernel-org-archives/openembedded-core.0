Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TNPtm-0002sH-V4
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Oct 2012 17:14:39 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TNPh0-0000nl-6U; Sun, 14 Oct 2012 17:01:26 +0200
Message-ID: <1350226731.4470.90.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Sun, 14 Oct 2012 15:58:51 +0100
In-Reply-To: <lyvced8jpv.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1350130322-3100-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<CABcZANkPym+NSXqx6PrZnkhVqtsHoq-D20Dc14OgQ1Cq3G-bUQ@mail.gmail.com>
	<lyvced8jpv.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: clarson@kergoth.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package.bbclass: search for dangling links in installation directory
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
X-List-Received-Date: Sun, 14 Oct 2012 15:14:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-10-14 at 11:51 +0200, Enrico Scholz wrote:
> Chris Larson <clarson-ZYzTKstmaoRBDgjK7y7TUQ@public.gmane.org> writes:
> 
> >> +                # make path absolute; do not use os.path.join() here
> >> +                # because target might start with multiple '/'
> >> +                rtarget = inst_root + target
> >
> > I think you can use the join()
> 
> no; I used it in an earlier version of the patch
> 
>   rtarget = os.path.join(inst_root, target[1:])
> 
> and this fails for links like '//sbin/systemd'.

You somehow chopped off the important part of Chris's text.  What he
actually wrote was "... the join() which is in the oe python package",
which is not the same as os.path.join.  

As the comment says, it is...

    """Like os.path.join but doesn't treat absolute RHS specially"""

p.




