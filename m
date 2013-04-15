Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1URlOe-0008S0-Th for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 17:32:46 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FFFSAS018680; Mon, 15 Apr 2013 16:15:28 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mB8mhINO8mXp; Mon, 15 Apr 2013 16:15:28 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3FFFO8l018653
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 15 Apr 2013 16:15:26 +0100
Message-ID: <1366038901.8670.53.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 15 Apr 2013 16:15:01 +0100
In-Reply-To: <155F9D05-94DF-4B6B-8CC7-E75D22696C81@dominion.thruhere.net>
References: <cover.1365697555.git.ross.burton@intel.com>
	<lyli8k12k3.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<155F9D05-94DF-4B6B-8CC7-E75D22696C81@dominion.thruhere.net>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Ross Burton <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Move systemd binaries to /sbin/systemd
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
X-List-Received-Date: Mon, 15 Apr 2013 15:32:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-04-15 at 13:21 +0200, Koen Kooi wrote:
> Op 15 apr. 2013, om 13:00 heeft Enrico Scholz <enrico.scholz@sigma-chemnitz.de> het volgende geschreven:
> 
> > Ross Burton <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> > writes:
> > 
> >> Following the example set by udev, move the binaries to /sbin/systemd
> >> and hardcode less paths in general.  Tested on atom-pc with a .hddimg
> >> so the live boot/initrd paths were tested.
> > 
> > At least the moving of udev breaks a lot of local recipes here which
> > install e.g. local rules or keymaps in /lib/udev.  This is a silent break
> > which is detected at device runtime only.  The global 'bitbake.conf' has
> > not been updated for the new paths neither.
> > 
> > 
> > There should be:
> > 
> > 1. added some QA checks which detect this broken packaging
> > 
> > 2. added some global variables (e.g. 'udev_basedir') which can be used
> >   in the rules.
> 
> These patches can get NAK'd all you want, but they will go in. I still
> say: NAK, this is a bad, bad idea. It diverges from upstream and
> introduces silent breakage as you point out due to that.

In the 1.5 timeframe I want to look at this again and see how we can
better solve it as it may be we can do something to the multilib code to
avoid the issues. We ran out of runway with this for 1.4 :(.

Cheers,

Richard



