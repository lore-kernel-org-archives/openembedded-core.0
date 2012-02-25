Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S1Qh9-0004t2-Cx for openembedded-core@lists.openembedded.org;
	Sun, 26 Feb 2012 00:06:27 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1PMw48M006919
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 22:58:04 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06726-01 for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 22:58:00 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1PMvnSq006913
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 22:57:56 GMT
Message-ID: <1330210670.13788.56.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 25 Feb 2012 22:57:50 +0000
In-Reply-To: <20120225191607.GQ3769@jama.jama.net>
References: <1330185446.13788.40.camel@ted>
	<20120225191607.GQ3769@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] glib: Drop dbus dependency, it isn't useful
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
X-List-Received-Date: Sat, 25 Feb 2012 23:06:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-02-25 at 20:16 +0100, Martin Jansa wrote:
> On Sat, Feb 25, 2012 at 03:57:26PM +0000, Richard Purdie wrote:
> > dbus is only needed for some of the glib tests which we don't use. We can
> > therefore drop the dependency and gain some small parallelism gains.
> > 
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta-yocto/conf/distro/poky-tiny.conf b/meta-yocto/conf/distro/poky-tiny.conf
> > index 411347a..5d1d67a 100644
> > --- a/meta-yocto/conf/distro/poky-tiny.conf
> > +++ b/meta-yocto/conf/distro/poky-tiny.conf
> > @@ -108,3 +108,5 @@ IMAGE_FSTYPES = "ext2 cpio.gz"
> >  #        variants of all compatible machines, but that leads to a lot
> >  #        more machine configs to maintain long term.
> >  MACHINE_ESSENTIAL_EXTRA_RDEPENDS = ""
> > +
> > +ASSUME_PROVIDED += "pkgconfig$"
> 
> ^^ this doesn't seem related to this patch and what's meaning of trailing $, or just typo?

Right, sorry about that, its a piece of a different patch.
ASSUME_PROVIDED takes regexps and without that it would match
pkgconfig-native too so its not a typo.

Cheers,

Richard



