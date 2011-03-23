Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1Q2QJ6-0007CV-2j
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Mar 2011 16:49:12 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id BF05CA4832
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 15:40:07 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id MyDpiUp4nrTo
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 15:40:06 +0000 (GMT)
Received: from xora-desktop (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id D17F2A42E3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2011 15:40:05 +0000 (GMT)
Received: by xora-desktop (Postfix, from userid 1000)
	id 2E8CD101FCB; Wed, 23 Mar 2011 15:40:18 +0000 (GMT)
Date: Wed, 23 Mar 2011 15:40:18 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110323154018.GI2224@xora-desktop.xora.org.uk>
References: <6CA3B184-AD05-4A9B-90CE-25AE38DECA39@dominion.thruhere.net>
	<AANLkTimcd8-9jd31uJe0EGLCit0YitBRmH9tuF8G50qn@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTimcd8-9jd31uJe0EGLCit0YitBRmH9tuF8G50qn@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [RFC] recipes-efl inside meta-oe or meta-efl next to meta-oe?
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
X-List-Received-Date: Wed, 23 Mar 2011 15:49:12 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2011 at 08:19:31AM -0700, Khem Raj wrote:
> On Wed, Mar 23, 2011 at 4:49 AM, Koen Kooi <koen@dominion.thruhere.net>=
 wrote:
> > Hi,
> >
> > I'd like to import the EFL recipes Martin did from meta-shr into the =
meta-openembedded repo. Before I go bothering Martin about it, what would=
 be the best place to put them?
> >
> > Inside meta-oe:
> >
> > meta-openembedded/
> > =A0 =A0 =A0 =A0meta-oe/
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0recipes-efl
>=20
> Can efl we layered directly on top of oe-core  ? i.e. without needing m=
eta-oe
> in that case its better to be an independent layer. otherwise I would s=
ay put
> them under recipes-efl
>=20
That is certainly not how I see layers being built up. I am expecting
in future us to have things like.

meta-gnome
meta-kde
meta-efl
meta-lxde
meta-xorg

Obviosuly none of these is an independant layer of its own, and to make a
complete system you will require a stack of layers with the appropriate
recipes. This really is where the DISTROs come in as they select the laye=
r
mix they want.

Graeme



