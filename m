Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RzxaA-0001XJ-MI
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 22:49:10 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RzxS9-0005st-Hy
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 22:40:53 +0100
Message-ID: <1329860429.2591.187.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 21 Feb 2012 21:40:29 +0000
In-Reply-To: <CAMKF1so0r+8CUMCAQ0Jz1wbP=jSjqnZGuSjPawn5FtJGOQjBjA@mail.gmail.com>
References: <cover.1329456260.git.yi.zhao@windriver.com>
	<ea7342b8cdd7a0f9c49253f9e063ab7577f04038.1329456260.git.yi.zhao@windriver.com>
	<4F43F9EE.5080608@linux.intel.com>
	<CAMKF1so0r+8CUMCAQ0Jz1wbP=jSjqnZGuSjPawn5FtJGOQjBjA@mail.gmail.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/3] lsbtest: Add recipe for LSB tests and automate test
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
X-List-Received-Date: Tue, 21 Feb 2012 21:49:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-02-21 at 13:02 -0800, Khem Raj wrote:
> On Tue, Feb 21, 2012 at 12:09 PM, Saul Wold <sgw@linux.intel.com> wrote:
> > I think you need to have a RDEPENDS on at a minimum for this lsbtest recipe
> > since it relies on RPM to install the packages.
> >
> > RDEPENDS = "rpm"
> >
> >
> 
> that wont fly if someone is using opkg or dpkg

LSB requires that you be able to install RPMs, irrespective of what your
native package format is.  So, if you are using opkg and care about LSB
compliance then you will probably need to engineer some sort of wrapper,
and I guess that could legitimately PROVIDE rpm.  To that end it might
be nicer if that dependency was some sort of "virtual/rpm-for-crazy-lsb"
sort of thing, but the general idea isn't an unreasonable one.

p.




