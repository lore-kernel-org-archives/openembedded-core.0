Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SUM7e-0007TH-Sa for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 20:05:23 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4FHtOKm009690
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 18:55:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08389-10 for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 18:55:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4FHtGDS009684
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 18:55:18 +0100
Message-ID: <1337104514.2711.45.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 15 May 2012 18:55:14 +0100
In-Reply-To: <CAP9ODKqS16XxB0pSXdf7RONbRCagQL=9B=ia44vjDDFwneOY4w@mail.gmail.com>
References: <cover.1337003246.git.otavio@ossystems.com.br>
	<f1b02094a00615abfdee28e820c70e50c2ca9471.1337003246.git.otavio@ossystems.com.br>
	<FD8F6943-F6C7-4588-B5F6-BAA1BE723FF9@dominion.thruhere.net>
	<CAP9ODKqS16XxB0pSXdf7RONbRCagQL=9B=ia44vjDDFwneOY4w@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] kmod: fix installation path of pkgconfig files
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
X-List-Received-Date: Tue, 15 May 2012 18:05:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-05-14 at 12:24 -0300, Otavio Salvador wrote:
> On Mon, May 14, 2012 at 11:06 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >
> > Op 14 mei 2012, om 15:47 heeft Otavio Salvador het volgende geschreven:
> >
> >> The pkgconfig files need to be installed in ${libdir} instead of
> >> ${base_libdir}.
> >
> > Thanks for the patch, I was working on something similar :) I talked
> with the kmod and udev people and they asked why we want kmod libs
> in /lib instead of /usr/lib. I didn't have an answer to that, does
> anyone else have a decent one? If not, let's not mess with $prefix and
> remove all the do_install changes.
> 
> OE-Core try to allow the use of /usr in a separated partition so it
> seems it is a requirement for it to work in initrdless systems.

I've heard requests from people that / be bootable with /usr being
mounted later. For something like kmod, there is therefore a case for
putting the library in base_libdir, not libdir. Not doing so sounds like
a bit of a cop-out from the maintainers.

Cheers,

Richard




