Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1UAR2u-0000Xg-69
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 21:23:07 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1UAQn7-0002NG-7e; Tue, 26 Feb 2013 21:06:21 +0100
Message-ID: <1361909151.4339.1.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 26 Feb 2013 20:05:51 +0000
In-Reply-To: <CAP9ODKoHroEZbnjyg5LT_1EzVXKDz2JtRmhX-qMuMUmpzGYUKA@mail.gmail.com>
References: <1361901233-23197-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKqbNMMA1o0hjRiKn3Sen4F6uAU4kK8VhFK5RvdZixvCxA@mail.gmail.com>
	<CAP9ODKoHroEZbnjyg5LT_1EzVXKDz2JtRmhX-qMuMUmpzGYUKA@mail.gmail.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: oe-core layer <openembedded-core@lists.openembedded.org>, Patches
Subject: Re: [PATCH V2] systemd: set the location of the kill binary
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
X-List-Received-Date: Tue, 26 Feb 2013 20:23:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-02-26 at 16:53 -0300, Otavio Salvador wrote:
> On Tue, Feb 26, 2013 at 4:52 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
> > On Tue, Feb 26, 2013 at 2:53 PM, Ross Burton <ross.burton@intel.com> wrote:
> >> Otherwise systemd uses AC_PROG_PATH and finds it in the sysroot, which won't
> >> work on the target.
> >>
> >> Signed-off-by: Ross Burton <ross.burton@intel.com>
> >
> > Acked-by: Otavio Salvador <otavio@ossystems.com.br>
> 
> Now I saw the Khem suggestion to use /usr/bin/env kill; seems good.

If it wants a target path then "/usr/bin/env kill" would fail for
targets that either don't have /usr or don't have "env" installed.  That
might not be so good.

/usr/bin/env would be fine if we were talking about a build host path
but that doesn't appear to be the case here.

p.





