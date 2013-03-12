Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UFUYF-0006BH-Bc for openembedded-core@lists.openembedded.org;
	Tue, 12 Mar 2013 20:08:00 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2CIxhWo004174; Tue, 12 Mar 2013 18:59:43 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id aLjwSOpsGj8u; Tue, 12 Mar 2013 18:59:43 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2CIxTl0004144
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 12 Mar 2013 18:59:36 GMT
Message-ID: <1363114248.9859.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 12 Mar 2013 18:50:48 +0000
In-Reply-To: <980599F4-DEED-41CF-B871-750758BD6D45@dominion.thruhere.net>
References: <cover.1363031776.git.ross.burton@intel.com>
	<CAJTo0LY7vOy4_A3YJ2-jGMfLr32o7XKY-BGp9xuiB_wnVhb6Ag@mail.gmail.com>
	<CAP9ODKr_3VVmw5vGm8EnnmOKEu8z2uzp97iBjh7315DduPegoQ@mail.gmail.com>
	<ACE79805-5D74-40F1-8443-1410AC215E88@gmail.com>
	<980599F4-DEED-41CF-B871-750758BD6D45@dominion.thruhere.net>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/9] hybrid systemd/sysvinit
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
X-List-Received-Date: Tue, 12 Mar 2013 19:08:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-03-12 at 08:42 +0100, Koen Kooi wrote:
> Op 11 mrt. 2013, om 23:49 heeft Khem Raj <raj.khem@gmail.com> het volgende geschreven:
> 
> > 
> > On Mar 11, 2013, at 2:47 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> > 
> >> On Mon, Mar 11, 2013 at 6:37 PM, Burton, Ross <ross.burton@intel.com> wrote:
> >>> On 11 March 2013 13:07, Ross Burton <ross.burton@intel.com> wrote:
> >>>> This series allows you to have both sysvinit and systemd in DISTRO_FEATURES.
> >>>> Packages will be built with both init scripts, and some daemons will be linking
> >>>> to libsystemd-daemon so that will be pulled in to sysvinit images.
> >>> 
> >>> Regarding the upgrade path, Richard/Paul/myself discussed this over
> >>> lunch and proposed that oe-core could gain an include file for distro
> >>> configuration that basically injects the backward compatibility
> >>> dependencies.  So for meta-systemd, it would inject
> >>> replaces/provides/conflicts for each of the packages in meta-systemd.
> >>> This would isolate the dependencies into a single location, and be
> >>> opt-in for distros that previously shipped meta-systemd.  Hopefully
> >>> the implementation of this is obvious, and patches to implement this
> >>> are welcome.
> >> 
> >> I personally prefer to still use meta-oe systemd class and keep the
> >> possibility to product images with choosen init system. I think Martin
> >> will also prefer it.
> > 
> > using different init manager is a separate problem than what Ross tried to address here isn't it ?
> > I personally don't have a use case where I would upgrade live from 1.3 to 1.4 so
> > for me I could easily accept a different solution for 1.4
> 
> Upgrading between 1.3 and 1.4 is already impossible for non-systemd
> related reasons.

Which reasons?

Cheers,

Richard



