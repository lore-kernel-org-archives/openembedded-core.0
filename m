Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RQGiF-0001q2-0B for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 11:57:59 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAFApakk023981
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 10:51:36 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22799-09 for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 10:51:31 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAFApT1L023970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 10:51:30 GMT
Message-ID: <1321354293.26881.157.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 15 Nov 2011 10:51:33 +0000
In-Reply-To: <1321346828.1013.23.camel@mattotaupa>
References: <cover.1321296476.git.paul.eggleton@linux.intel.com>
	<2ffb85152b2b9356efeb008891d8ed29f1f35cef.1321296476.git.paul.eggleton@linux.intel.com>
	<E3435B57-20F8-421E-8E1B-966A1B95CC8F@dominion.thruhere.net>
	<1321303197.26881.74.camel@ted>
	<22478035-0923-402B-8617-45F140D38288@dominion.thruhere.net>
	<1321307338.26881.83.camel@ted> <1321346828.1013.23.camel@mattotaupa>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	pAFApakk023981
Subject: Re: [PATCH 3/4] distcc: make distccmon-gnome optional and default to off
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
X-List-Received-Date: Tue, 15 Nov 2011 10:57:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-11-15 at 09:47 +0100, Paul Menzel wrote:
> Am Montag, den 14.11.2011, 21:48 +0000 schrieb Richard Purdie:
> > On Mon, 2011-11-14 at 21:55 +0100, Koen Kooi wrote:
> > > Op 14 nov. 2011, om 21:39 heeft Richard Purdie het volgende geschre=
ven:
> > > > On Mon, 2011-11-14 at 20:17 +0100, Koen Kooi wrote:
> > > >> I think splitting distccmon-gnome into a seperate recipe is a be=
tter idea.
> > > >=20
> > > > I think that makes sense in some cases but I'd hate for it to bec=
ome the
> > > > default approach for issues like this as the duplication of code,
> > > > parsing and build time etc. grate on me. Do we really need separa=
te
> > > > recipes?
> > >=20
> > > I think for this case, yes. And I'll happily trade needing extra
> > > buildtime for not needing USEFLAGS.
> > >=20
> > The proposals for alternative recipes for the different combinations =
got
> > voted down and PACKAGECONFIG was the preferred solution.
>=20
> Where is this vote (and discussion) documented? I found nothing in the
> OE Wiki and searching for it with =C2=BBopenembedded packageconfig vote
> oe-core list=C2=AB brought up only some minutes [1].
>=20
> I also do not remember anything on openembedded-devel where such genera=
l
> discussion definitely belong in my opinion.
>=20
> It would be great if somebody could help me by giving me an URL.

The reference I could find was:

http://lists.linuxtogo.org/pipermail/tsc/2011-October/000302.html

which asked for objections amongst the TSC members, non were received.
I'm drawing a blank finding the previous discussion, I think there was a
different term used and I can't think what it was which makes searching
hard. There was also discussion of the actual patches on the mailing
list (which IMO is where the discussion should really happen).

Cheers,

Richard



