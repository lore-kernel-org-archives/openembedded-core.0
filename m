Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TAmPX-0002V8-Cg
	for openembedded-core@lists.openembedded.org;
	Sun, 09 Sep 2012 20:39:11 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TAloA-0007rF-Vs; Sun, 09 Sep 2012 20:00:40 +0200
Message-ID: <1347213501.4396.262.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 09 Sep 2012 18:58:21 +0100
In-Reply-To: <CAMKF1soL0MPz7RPenc=SYV_7R7VRHvrHBjiFramP7xw3E4PBfQ@mail.gmail.com>
References: <1347187725.4396.259.camel@x121e.pbcl.net>
	<CAMKF1soL0MPz7RPenc=SYV_7R7VRHvrHBjiFramP7xw3E4PBfQ@mail.gmail.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] shadow-native: Ensure that ${sbindir} and ${base_sbindir} are respected
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
X-List-Received-Date: Sun, 09 Sep 2012 18:39:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-09-09 at 08:35 -0700, Khem Raj wrote:
> On Sun, Sep 9, 2012 at 3:48 AM, Phil Blundell <philb@gnu.org> wrote:
> > These values need to be passed on the command line to "make install" otherwise
> > shadow will use its own built-in idea of where those directories are located.
> >
> 
> why would we care for it in a native recipe.

Because the binaries won't get staged into the sysroot if they are in
the wrong place.

p.




