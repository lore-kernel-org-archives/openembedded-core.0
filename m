Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TK83m-0000Lx-0A for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 15:35:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q95DMHdR017003;
	Fri, 5 Oct 2012 14:22:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16305-05; Fri,  5 Oct 2012 14:22:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q95DM7JN016997
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 5 Oct 2012 14:22:08 +0100
Message-ID: <1349443330.15658.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Fri, 05 Oct 2012 14:22:10 +0100
In-Reply-To: <1349438088.18625.3.camel@phil-desktop>
References: <1349437649.15658.20.camel@ted>
	<1349438088.18625.3.camel@phil-desktop>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libdrm: Explicitly disable the cairo dependency
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
X-List-Received-Date: Fri, 05 Oct 2012 13:35:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-10-05 at 12:54 +0100, Phil Blundell wrote:
> On Fri, 2012-10-05 at 12:47 +0100, Richard Purdie wrote:
> > diff --git a/meta/recipes-graphics/drm/libdrm/nocairo.patch b/meta/recipes-graphics/drm/libdrm/nocairo.patch
> > new file mode 100644
> > index 0000000..f9b7f3a
> > --- a/dev/null
> > +++ b/meta/recipes-graphics/drm/libdrm/nocairo.patch
> > @@ -0,0 +1,39 @@
> > +We don't want the cairo dependency. Unfortunately simply checking whether its present 
> > +isn't good enough. If its not in DEPENDS, it can disappear half way through building.
> > +We therefore need to explictly disable it.
> > +
> > +RP
> > +2012/10/5
> > +
> > +Index: libdrm-2.4.39/configure.ac
> 
> This new patch seems to be missing Upstream-Status and Signed-off-by.

The rule is that it has author information which I did include.
Admittedly "RP" is a little cryptic but I think people can figure it out
by now and its an established convention for me by now. I've questioned
the rational of Signed-off-by in this context before but it seems people
find it easier and it doesn't particularly bother me...

As for the Upstream-Status, I should have included that and will add it,
thanks.

Richard




