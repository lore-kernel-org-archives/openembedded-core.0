Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SoWGb-0005sl-DV for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 10:57:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6A8kkAH015147
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 09:46:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15028-01 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 09:46:40 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6A8kb2e015141
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 09:46:39 +0100
Message-ID: <1341909998.23941.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2012 09:46:38 +0100
In-Reply-To: <CAMKF1spG4BHD6aHQ1WeSFt5hS0tWgoF2HHT6BFg3tbC_aFEpbA@mail.gmail.com>
References: <CAJTo0LZ1W6mD2mdadeqdvyVubgGSozcF_Nw8xbvr4fAsRgJK8A@mail.gmail.com>
	<CAMKF1spG4BHD6aHQ1WeSFt5hS0tWgoF2HHT6BFg3tbC_aFEpbA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: The Mythical Sato Replacement
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
X-List-Received-Date: Tue, 10 Jul 2012 08:57:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-09 at 15:36 -0700, Khem Raj wrote:
> On Mon, Jul 9, 2012 at 2:06 PM, Burton, Ross <ross.burton@intel.com> wrote:
> >
> > Shuku will be a descendent of Sato, that is continue to use the
> > Matchbox Window Manager, Desktop, and Panel; although the latter two
> > will be updated for GTK+ 3.  All applications will be removed and
> > fully reconsidered when adding back, so the text editor might well
> > change from leafpad to something that had a release in two years,
> > Midori is looking like a good web browser choice instead of Web, the
> > PIM suite removed, and so on.
> 
> Did you consider QT instead of GTK+ ? I think having wayland would be cool.

Ross didn't cover the question "Why do we need anything in OE-Core at
all?". The answer is that we do need *something* to actually test the
components we build. Its all well and good having toolchains, libraries,
architecture support, graphics, X11 etc. but if we can't tell whether it
works or not we're in a bad way. I've said this before but I want to
make it really clear that I believe in testing what we ship, otherwise
its worthless.

As I see it, there are some significant advantages of matchbox:

a) It doesn't put us in any one UI camp. I don't want OE-Core to be seen
as Qt only, or GNOME only, or enlightenment only. I know matchbox uses
GNOME components but its sufficiently different that it illustrates a
key value of what the OE architecture offers, the ability to customise
and innovate. As such I think it makes a compelling reference UI.

b) Its simple. There is no large complex stack to build and include.

c) Ownership wise, we can choose which direction to take some of the
matchbox/sato components in, not least as Ross authored matchbox-desktop
and matchbox-panel version 2.

We also need to be mindful of resources and expertise which is something
people perhaps don't immediately realise. Whist I've been able to find
the Yocto Project resources to cover the work on the core and much of
the feature development work we want to undertake, I've struggled to
convince people to put development resources into replacing Sato as its
hard to make a business case for or give a specific target for the UI.
As such, any plan which involves significant development effort is not
going to be resource feasible. A nice feature of Ross' plan is that it
can be done incrementally to a degree, it doesn't involve large amounts
of development effort and we have expertise directly on the team for
most of the work needed.

Cheers,

Richard



