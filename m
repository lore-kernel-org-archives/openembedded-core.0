Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SC8C1-0001f6-0S for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 13:34:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2QBPYFc024739;
	Mon, 26 Mar 2012 12:25:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20450-07; Mon, 26 Mar 2012 12:25:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2QBPNqJ024732
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 26 Mar 2012 12:25:23 +0100
Message-ID: <1332761122.28414.109.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 26 Mar 2012 12:25:22 +0100
In-Reply-To: <20120323231116.GC4604@jama.jama.net>
References: <cover.1332507302.git.Martin.Jansa@gmail.com>
	<dc50f1d1204c1c48d8d4a5acb40edf619b306522.1332507302.git.Martin.Jansa@gmail.com>
	<4F6D0074.8020708@opendreambox.org>
	<20120323231116.GC4604@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/6] kernel.bbclass: populate /etc/modules-load.d/ with module_autoload entries too
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
X-List-Received-Date: Mon, 26 Mar 2012 11:34:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-03-24 at 00:11 +0100, Martin Jansa wrote:
> On Sat, Mar 24, 2012 at 12:00:04AM +0100, Andreas Oberritter wrote:
> > On 23.03.2012 13:56, Martin Jansa wrote:
> > > * /etc/modules-load.d/foo.conf is used by systemd like /etc/modutils/foo was with sysvinit
> > 
> > Martin,
> > 
> > the man-page[1] for modules-load.d says that packages should install
> > .conf files to /usr/lib/modules-load.d, because /etc/modules-load.d is
> > reserved for the system administrator. Did you take this into account
> > when you decided to support /etc/modules-load.d?
> 
> You're right, /usr/lib/modules-load.d could be possibly better option.
> I've used /etc mostly because I was using it since my first systemd
> image (so I was sure it works) and I don't remember seeing /usr/lib in
> man page when I was reading it back then (probably overlooked or
> forgot).
> 
> Is it worth updating update-modules (maybe teaching update-modules to
> look into all possible systemd directories too)?

I think in our case, we'd need to have /lib/modules-load.d
and /usr/lib/modules-load.d depending on whether the module was meant to
load without /usr being mounted. Using /etc for now seems to make most
sense although it probably wouldn't hurt for the script to look at the
other locations.

Cheers,

Richard



