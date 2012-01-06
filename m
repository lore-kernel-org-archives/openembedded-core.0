Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RjCaf-00028c-U4 for openembedded-core@lists.openembedded.org;
	Fri, 06 Jan 2012 17:24:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06GH343023130
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 16:17:03 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22840-04 for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jan 2012 16:16:59 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q06GGtff023124
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Jan 2012 16:16:56 GMT
Message-ID: <1325866615.14746.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 06 Jan 2012 16:16:55 +0000
In-Reply-To: <CABcZANk=sg=oj+KyVcBF=UoC460EV-QtiW4B=wKXPBSLrV4HOQ@mail.gmail.com>
References: <20120106100934.GA3879@jama.jama.net>
	<77ADD6E7-5632-4B1A-ABC3-6E4DAEEAE3B6@dominion.thruhere.net>
	<4F071A65.90708@windriver.com>
	<CABcZANk=sg=oj+KyVcBF=UoC460EV-QtiW4B=wKXPBSLrV4HOQ@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: libs transition /usr/lib -> /lib questions
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
X-List-Received-Date: Fri, 06 Jan 2012 16:24:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-01-06 at 09:04 -0700, Chris Larson wrote:
> On Fri, Jan 6, 2012 at 8:59 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> > On 1/6/12 4:34 AM, Koen Kooi wrote:
> >>
> >>
> >> Op 6 jan. 2012, om 11:09 heeft Martin Jansa het volgende geschreven:
> >>
> >>> FWIW today I've noticed that systemd is going other way around
> >>> http://www.freedesktop.org/wiki/Software/systemd/separate-usr-is-broken
> >>
> >>
> >> And http://fedoraproject.org/wiki/Features/UsrMove
> >>
> >> I guess it's time to publish my angstrom branch doing that after the
> >> holidays :)
> >
> >
> > I respectfully disagree with both of the above URLs.
> >
> > The root partition is still very useful as a "small" set of applications and
> > libraries required for booting.
> >
> > Most systems these days contain a combined root and usr partition, which is
> > fine.  However, there are a lot of systems that I've worked on in the past
> > and I expect in the future that, root being a small R/O system is necessary.
> >
> > initramfs can solve some problems, but introduces other issues.  Many of the
> > systems I've worked on simple don't have enough flash to be able to store
> > the bootloader, kernel and an initramfs [as well as other system items
> > required by the devices].  In this case a base rootfs makes the most sense.
> 
> In my opinion, what's proposed in the two links is a good thing even
> for embedded. Not that we'd use that structure necessarily, but
> removing the usr vs non-usr separation for binaries and libs is a good
> thing regardless. Putting /usr in the rootfs still would still work
> fine, or you could drop usr entirely and move everything to / the way
> micro does.

The nice thing is we have a system which can actually support the
different options relatively easily and without much conflict. Each has
its usecases and its relatively simple to set things up to build them as
micro has shown. I believe we can actually do better than other distros,
not just follow them.

Cheers,

Richard



