Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QelMV-00006h-Gy for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 12:00:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p679rNdb026601
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jul 2011 10:53:23 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 26283-05 for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2011 10:53:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p679rHWR026595
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jul 2011 10:53:17 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAMKF1srnb34qBnFOxBoVFep=xSAOhjKbAHFGOsq-OHhBaZdAow@mail.gmail.com>
References: <cover.1309899985.git.raj.khem@gmail.com>
	<CAMKF1souQCFTzy4D9i1kWrS_y0fFZJb=00eDxtP5OtQE2tf73Q@mail.gmail.com>
	<1309939595.20015.766.camel@rex>
	<CAMKF1spy7d0yJu=EnbG-sKwxxgwB1Jz8S0k6D3Fr+KCUpRerjw@mail.gmail.com>
	<1309975844.20015.798.camel@rex>
	<CAMKF1srnb34qBnFOxBoVFep=xSAOhjKbAHFGOsq-OHhBaZdAow@mail.gmail.com>
Date: Thu, 07 Jul 2011 10:52:41 +0100
Message-ID: <1310032362.20015.808.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/5] Add recipes for 0.9.32 release
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
X-List-Received-Date: Thu, 07 Jul 2011 10:00:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-06 at 11:34 -0700, Khem Raj wrote:
> On Wed, Jul 6, 2011 at 11:10 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Wed, 2011-07-06 at 11:06 -0700, Khem Raj wrote:
> >> On Wed, Jul 6, 2011 at 1:06 AM, Richard Purdie
> >> <richard.purdie@linuxfoundation.org> wrote:
> >> > On Tue, 2011-07-05 at 23:48 -0700, Khem Raj wrote:
> >> >> On Tue, Jul 5, 2011 at 2:09 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >> >> > With this changeset we add new recipes for 0.9.32 and make that default
> >> >> > preference. Then the git recipe are moved to track the latest master.
> >> >> > systemd related fixes are separately applied to both git recipe and 0.9.32
> >> >> > recipes
> >> >> >
> >> >> > Both sets work for arm,mips,ppc,x86,x86-64
> >> >> >
> >> >> > Thanks
> >> >> > -Khem
> >> >> >
> >> >> >
> >> >> > The following changes since commit 4eb3abaa5f4b5df0314dc0d503298d65cd203259:
> >> >> >
> >> >> >  uclibc-0.9.32: Implement execvpe and refresh scheduler functions (2011-07-05 13:53:05 -0700)
> >> >> >
> >> >> > are available in the git repository at:
> >> >> >  git://git.openembedded.org/openembedded-core-contrib kraj/uclibc-0.9.32
> >> >> >  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/uclibc-0.9.32
> >> >> >
> >> >> > Khem Raj (5):
> >> >> >  uclibc: Add recipes for 0.9.32 release
> >> >> >  tcmode-default: Define UCLIBCVERSION and set it to 0.9.32
> >> >> >  uclibc_git: Move SRCREV past 0.9.32 release
> >> >>
> >> >> I have update PV in above commit to 0.9.32+0.9.33-rc0 instead of
> >> >> 0.9.32+gitr${SRCPV} which is troublesome to use with git
> >> >
> >> > Can you expand a little more about what was troublesome with it?
> >> >
> >> > Is there a revision being specified for the uclibc git recipe?
> >>
> >> since its master git I have to change SRCREV frquently and if I do not bump
> >> PR it ends up with dependency problems while generating image since
> >> the SHAs are random
> >> and they are getting into PV sometimes opkg thinks the version is
> >> smaller than the previous
> >> one and opkg does not like it. that  aside 0.9.32+0.9.33-rc0 explains
> >> the recipes PV better IMO
> >
> > Could you at least add the SRCREV you're using the recipe please? I
> > didn't look really hard but I couldn't seem to find it when I last
> > looked...
> 
> huh. They are in recipes see toward the end here
> 
> http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/commit/?h=kraj/uclibc-0.9.32&id=ce07260090bbc11801e96657f1596ec23f793cce
> 
> and for 0.9.32 here
> 
> http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/commit/?h=kraj/uclibc-0.9.32&id=49aea570ecc45bb7a655d9ca955272c3734c8696
> 
> or do u mean in some other form ?

No, I just missed somehow when reading the patch originally, I was
surprised it wasn't there...

Cheers,

Richard




