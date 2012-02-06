Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RuPCS-0001Yb-WE for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 15:05:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q16DvjVJ018226
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Feb 2012 13:57:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 17623-04 for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Feb 2012 13:57:41 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q16DvZak018219
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Feb 2012 13:57:36 GMT
Message-ID: <1328536662.24049.19.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 06 Feb 2012 13:57:42 +0000
In-Reply-To: <20120206133254.GE3872@jama.jama.net>
References: <1328533275.24049.16.camel@ted> <20120206142830.79e73ef1@eb-e6520>
	<20120206133254.GE3872@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q16DvjVJ018226
Subject: Re: Performance numbers
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
X-List-Received-Date: Mon, 06 Feb 2012 14:05:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2012-02-06 at 14:32 +0100, Martin Jansa wrote:
> On Mon, Feb 06, 2012 at 02:28:30PM +0100, Eric B=C3=A9nard wrote:
> > Hi Richard,
> >=20
> > Le Mon, 06 Feb 2012 13:01:15 +0000,
> > Richard Purdie <richard.purdie@linuxfoundation.org> a =C3=A9crit :
> >=20
> > > Its been a while since we had some performance numbers and there we=
re
> > > recently some questions about how current build time compared to
> > > previous numbers.
> > >=20
> > > On my 12 core system, build time for qemux86 from scratch is ~42
> > > minutes. This compares favourably with previous numbers from that
> > > system. Interestingly, switching to qemumips resulted in a build ti=
me of
> > > 43 minutes in the same tmpdir suggesting that the native part of th=
e
> > > bootstrap process isn't the bottleneck.
> > >=20
> > > On the quad core (the system used for many of the previous numbers =
I'd
> > > provided), build time for qemux86 was 105 minutes which again is ro=
ughly
> > > consistent with where things were for 1.1.
> > >=20
> > what are your settings (PARALLEL_MAKE & BB_NUMBER_THREADS) used in
> > both cases ?
>=20
> And what's the target in your tests?
>=20
> My quad core does core-image-minimal-mtdutils for qemux86* from scratch=
=20
> in ~ 100 minutes.

Sorry, I should have said. Both are for building core-image-sato which
is what I usually use as the benchmark. The quad core is running 8 bb
threads and 4 parallel make. The 12 core was set to 48/48 but anything
over 24 gives the build time above and this is effectively "unlimited"
as it very rarely hits 48 tasks in parallel.

Cheers,

Richard



