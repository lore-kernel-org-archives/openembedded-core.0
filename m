Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RErY6-0007NU-6H for openembedded-core@lists.openembedded.org;
	Sat, 15 Oct 2011 01:52:22 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9ENrHvR006301 for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Oct 2011 00:53:17 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 06qWxDAmVABC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Oct 2011 00:53:17 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p9ENrEVX006294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Oct 2011 00:53:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 15 Oct 2011 00:46:30 +0100
In-Reply-To: <CAP9ODKrN91FXYfxKXrLj-yJyS2ef+DqmA0n0xC0qwTuxSzApWw@mail.gmail.com>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
	<c30a13301850b76b1e7362b99322ffad72598612.1318505196.git.Martin.Jansa@gmail.com>
	<1318512243.23801.217.camel@ted> <20111013133221.GC28525@jama.jama.net>
	<1318514192.23801.229.camel@ted>
	<CAP9ODKp-CRpH0U7=k3inmg3gKqLFuHSUOA2JTc9+Jev+Op5p_Q@mail.gmail.com>
	<1318591756.23801.259.camel@ted>
	<CAP9ODKrN91FXYfxKXrLj-yJyS2ef+DqmA0n0xC0qwTuxSzApWw@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1318635999.2342.73.camel@ted>
Mime-Version: 1.0
Subject: Re: [oe-core 14/20] mesa-dri: introduce MACHINE_DRI_MODULES
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
X-List-Received-Date: Fri, 14 Oct 2011 23:52:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-10-14 at 10:19 -0300, Otavio Salvador wrote:
> On Fri, Oct 14, 2011 at 08:29, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> ...
> >> At least here it hadn't built i915 or i965 drivers.
> >
> > I think there is a slight change in behaviour as the architectures it
> > would have built certain modules on used to get applied, now it doesn't
> > as we're passing a fixed list. We need to fix this but it shouldn't be
> > hard.
> 
> I am sorry but I didn't get what you meant.

The old recipe just said "enable dri" and left it to the makefile to
decide what to build which it did based upon the target architecture.

I then changed the recipe to say i915 and i965 since the recipe was
marked x86 only. Now I've merged changes to default to swrast apart from
x86 (23 and 64 bit) where the intel modules are enabled. As and when any
other dependencies are fixed and people need other modules we'll enable
those on a per arch basis too.

This should hopefully resolve most of the issues people were seeing.

Cheers,

Richard





