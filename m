Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TGFpC-0000oO-9d for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 23:04:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8OKpSTM000389;
	Mon, 24 Sep 2012 21:51:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32284-04; Mon, 24 Sep 2012 21:51:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8OKpIDb000381
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 24 Sep 2012 21:51:20 +0100
Message-ID: <1348519878.8662.14.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Mon, 24 Sep 2012 21:51:18 +0100
In-Reply-To: <1348518219.4444.262.camel@x121e.pbcl.net>
References: <1348487376.31293.31.camel@phil-desktop>
	<CAMKF1soJZLBPDBH-1rOs3Jk7Su9m76gue1aOWuKKN-598KP0CA@mail.gmail.com>
	<1348518219.4444.262.camel@x121e.pbcl.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kexec-tools: admit mips as a COMPATIBLE_HOST
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
X-List-Received-Date: Mon, 24 Sep 2012 21:04:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-24 at 21:23 +0100, Phil Blundell wrote:
> On Mon, 2012-09-24 at 11:28 -0700, Khem Raj wrote:
> > On Mon, Sep 24, 2012 at 4:49 AM, Phil Blundell <philb@gnu.org> wrote:
> > >
> > > -COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*)-(linux|freebsd.*)'
> > > +COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|powerpc.*|mips.*)-(linux|freebsd.*)'
> > 
> > I wonder if this expression should be removed completely now that mips is added
> > we dont have any supported arch left.
> 
> There are at least a few Linux architectures not in that list: alpha and
> sparc are the obvious two, but there are a few more obscure ones as
> well.  I don't think alpha has ever really been supported in oe-core,
> but there are at least some sparc bits in there and, of course, it is
> possible for an external layer to add support for new architectures.
> Plus, of course, there is the OS side: if you were targetting mingw32
> for example then kexec-tools would clearly not work.
> 
> However, all that said, I tend to agree that the COMPATIBLE_HOST check
> isn't buying much in this recipe.  The original intent of
> COMPATIBLE_MACHINE (and later COMPATIBLE_HOST) was to prevent bitbake
> from selecting inappropriate providers to satisfy a virtual dependency:
> in particular, the idea was that it would stop you picking up a kernel
> recipe for some completely unrelated hardware.  In the case of
> kexec-tools there are no alternative providers available and it isn't
> totally obvious that having the recipe skip itself on a host that it
> thinks is "unsupported" is really any better than letting it try and
> fail to build.  So I would be happy to see that check removed.

Going back in time, kexec only worked on a handful of platforms so the
check made sense. Now mips support is there, it can probably be removed.

Part of the reasoning this is here is to make world builds useful as a
test that everything builds.

Cheers,

Richard



