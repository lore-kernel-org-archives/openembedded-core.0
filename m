Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RyTZM-0006pM-DS
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Feb 2012 20:34:12 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RyTRQ-0000K4-5C
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Feb 2012 20:26:00 +0100
Message-ID: <1329506739.2591.114.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 17 Feb 2012 19:25:39 +0000
In-Reply-To: <CAP9ODKqd=j7wye-W2ZGtS5eC+ALf_i9X7F0BWiN-VaY+SkRB2A@mail.gmail.com>
References: <cover.1329500798.git.otavio@ossystems.com.br>
	<a186127453b155d8f35a32fac48a56dad98aad7f.1329500798.git.otavio@ossystems.com.br>
	<1329501107.14363.205.camel@phil-desktop>
	<CAP9ODKqd=j7wye-W2ZGtS5eC+ALf_i9X7F0BWiN-VaY+SkRB2A@mail.gmail.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH 3/3] rootfs_ipk.bbclass: fix unpacked postinst support if no package management
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
X-List-Received-Date: Fri, 17 Feb 2012 19:34:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-02-17 at 17:06 -0200, Otavio Salvador wrote:
> On Fri, Feb 17, 2012 at 15:51, Phil Blundell <philb@gnu.org> wrote:
>         On Fri, 2012-02-17 at 17:47 +0000, Otavio Salvador wrote:
>         > When building without package management we can end with a
>         system
>         > without opkg and thus without support for running unfinished
>         postinsts
>         > on first boot, we fix this providing a S98configure script
>         for this
>         > use case.
>         
>         
>         Isn't this what run-postinsts is meant to be doing?
> 
> 
> Except it calls opkg-cl configure; that's why I check if opkg-cl is
> not available.

Er, does it?  My copy doesn't seem to.

pb@x121e:~/oe/oe-core$ grep opkg-cl meta/recipes-devtools/dpkg/run-postinsts/*
pb@x121e:~/oe/oe-core$

Where are you seeing the call to opkg-cl?

p.




