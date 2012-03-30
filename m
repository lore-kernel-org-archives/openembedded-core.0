Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1SDeJB-0007HK-P2
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 18:04:14 +0200
Received: from eb-e6520 (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 5459F4B0009
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 17:55:07 +0200 (CEST)
Date: Fri, 30 Mar 2012 17:55:05 +0200
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20120330175505.1b9c6e64@eb-e6520>
In-Reply-To: <CADkTA4PygfQymsiWhLTTDHLBhTCxx9FY-wWDQNnkaNBfOZ_GwA@mail.gmail.com>
References: <20120329225332.0e8cc2f4@eb-e6520> <1333058593.18082.40.camel@ted>
	<20120330105006.00955b5d@eb-e6520> <1333120364.18082.77.camel@ted>
	<20120330172440.54592fce@eb-e6520>
	<CADkTA4PygfQymsiWhLTTDHLBhTCxx9FY-wWDQNnkaNBfOZ_GwA@mail.gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: Fetch time optimization (svn : gcc/eglibc - git : linux-yocto)
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
X-List-Received-Date: Fri, 30 Mar 2012 16:04:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Fri, 30 Mar 2012 11:49:33 -0400,
Bruce Ashfield <bruce.ashfield@gmail.com> a =E9crit :
> On Fri, Mar 30, 2012 at 11:24 AM, Eric B=E9nard <eric@eukrea.com> wrote:
> > I think fetching from git or svn should not be the first thing to do in
> > recipes like gcc, eglibc, linux & co where we are based on a
> > stable released version : this doesn't bring real added value to the
> > user in OE context and this wastes bandwidth (a tbz2 kernel is around
>=20
> s/user/developer/ and there is value in having git history. I know we'd n=
ever do
> without it in our shop.
>=20
> I suggested shallow clones and some other options to Richard a few weeks
> ago, or some other hybrid models. They all vary in terms of nastiness and
> have some good and bad points.
>=20
> But from a kernel guy's point of view, you definitely want to work
> inside git, but

Do you mean you work in the git tree of linux-yocto *directly
inside* OE's sources / downloads ?

Eric


