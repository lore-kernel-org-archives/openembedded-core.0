Received: from mout.gmx.net ([212.227.17.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cheepeero@gmx.net>) id 1TxmCi-0007KZ-0V
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 23:20:50 +0100
Received: from mailout-de.gmx.net ([10.1.76.4]) by mrigmx.server.lan
	(mrigmx001) with ESMTP (Nemesis) id 0M7FY8-1T19Go35SI-00x4Vd for
	<openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 23:04:56 +0100
Received: (qmail invoked by alias); 22 Jan 2013 22:04:56 -0000
Received: from unknown (EHLO pink.localnet) [78.96.83.205]
	by mail.gmx.net (mp004) with SMTP; 22 Jan 2013 23:04:56 +0100
X-Authenticated: #14774724
X-Provags-ID: V01U2FsdGVkX1/SfRVshz7SlQdv1BLkkK4N0bY2rJXOBMf+2XWdHm
	OprmLAb2eK+kth
From: Ciprian Ciubotariu <cheepeero@gmx.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jan 2013 00:04:55 +0200
Message-ID: <2738897.RqdcWyXQgT@pink>
User-Agent: KMail/4.9.3 (Linux/3.6.11-gentoo; KDE/4.9.3; x86_64; ; )
In-Reply-To: <CAJTo0LarPUYHTJBWqi3ze3=aN5+HvizyVvw3V-V+YmxtS4786g@mail.gmail.com>
References: <cover.1358635193.git.ross.burton@intel.com>
	<1358739008.2945.29.camel@jethro.cheepee.homedns.org>
	<CAJTo0LarPUYHTJBWqi3ze3=aN5+HvizyVvw3V-V+YmxtS4786g@mail.gmail.com>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH 00/10] Initial systemd integration
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
X-List-Received-Date: Tue, 22 Jan 2013 22:20:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 21 January 2013 12:12:14 Burton, Ross wrote:
> On 21 January 2013 03:30, Ciprian Ciubotariu <cheepeero@gmx.net> wrote:
> > However, with oe-core/meta providing a default embedded policy, higher
> > layers need to remove sysvinit or systemd stuff from base recipes, which
> > is
> > against bitbake's additive language design (only append/prepend functions,
> > no -= operator) and against separating concerns.
> 
> If you don't do a systemd build, you won't get any of the systemd
> files.  Ditto, sysvinit (well, that's the goal - as it was an
> assumption until now that needs work still).
> 

Does that mean that I can disable the default init manager somehow, and 
provide my own?

> An oe-core without *any* init system will be very cumbersome - every
> service will need a bbappend to actually work, with the subsequent
> maintenance costs.
> 

I fail to see the overhead of maintaining a feature in one file, and the init-
manager part of the same feature in another file. The actual complexity is the 
same as when adding an use-flag like configuration variable in a single-file 
recipe; perhaps one avoids hitting "Open..." on the editor.

However, if I understand correctly, one can disable the default OE policy for 
an init manager, though not by choice of different layers, but via having 
systemd or not in DISTRO_FEATURES. 

Does this means that 

- having DISTRO_FEATURES += "systemd" we get a system with systemd;
- DISTRO_FEATURES += "sysvinit" makes a system with sysvinit, and 
- leaving DISTRO_FEATURES blank leaves us with a system with no init manager, 
to which we can add our own?

I guess the most important aspect I am trying to communicate is: please do not 
provide any by default.

Cipi

> Ross


