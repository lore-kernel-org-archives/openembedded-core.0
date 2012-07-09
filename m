Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpjday@crashcourse.ca>) id 1SoLMv-0003tE-6T
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 23:19:45 +0200
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63]:47347 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1SoLC8-0004jF-Qh for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:08:36 -0400
Date: Mon, 9 Jul 2012 17:08:24 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAK18fxEAmV=s8=S93ESD+jV1pocXMXfYXc=ukocU0cnpPT970Q@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1207091707220.24533@oneiric>
References: <alpine.DEB.2.02.1207070649530.18262@oneiric>
	<CAK18fxGjWFXQ4C40QgmCnk5G3PucaN4JzDAsDhMb4m6+pxNxzg@mail.gmail.com>
	<1341853247.8066.36.camel@ted>
	<CAMKF1sq+DNviuMJ+ovOPTEO1Qzpg3HhE93UdKKbeq8W_JnadAA@mail.gmail.com>
	<CAK18fxEAmV=s8=S93ESD+jV1pocXMXfYXc=ukocU0cnpPT970Q@mail.gmail.com>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: tcf-agent, matchbox-wm-2: Correct "proto=git" to "protocol=git".
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
X-List-Received-Date: Mon, 09 Jul 2012 21:19:45 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="8323329-1648350239-1341868107=:24533"

--8323329-1648350239-1341868107=:24533
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 9 Jul 2012, Andrei Gherzan wrote:

> On Mon, Jul 9, 2012 at 8:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
>       On Mon, Jul 9, 2012 at 10:00 AM, Richard Purdie
>       <richard.purdie@linuxfoundation.org> wrote:
>       > On Mon, 2012-07-09 at 12:27 +0300, Andrei Gherzan wrote:
>       >> On Sat, Jul 7, 2012 at 1:54 PM, Robert P. J. Day
>       >> <rpjday@crashcourse.ca> wrote:
>       >>
>       >> =A0 =A0 =A0 =A0 "proto=3Dgit" is not a valid parameter for the g=
it fetcher.
>       >>
>       >> NOTE: package matchbox-wm-2-0.1+git1
>       >> +01fa5465743c9ee43d040350f4405d35293e4869-r1: task do_fetch:
>       >> Succeeded
>       >>
>       >> Anyway, in the git.py, code is searching for "protocol" paramete=
r:
>       >> ud.proto =3D ud.parm['protocol']
>       >>
>       >> ... so your change seems legit.
>       >>
>       >> On another hand, svn.py is using:
>       >> =A0proto =3D ud.parm.get('proto', 'svn')
>       >>
>       >> A good think would be to use the same parameter names for all
>       >> protocols.
>       >>
>       > I agree but how do we do this without breaking the world? We prob=
ably
>       > should try and standardise it, probably to "protocol".
>
> so may be change the keyword to protocol and have both for this
> release additionally give a deprecation warning on proto and then
> after 1.3 remove proto
>
> Healthy approach. I can submit patches on this topic if=A0nobody=A0did
> it already locally.=A0

 i can see my work here is done.  i will go find something else to
complain about.  :-)

rday

--=20

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--8323329-1648350239-1341868107=:24533--
