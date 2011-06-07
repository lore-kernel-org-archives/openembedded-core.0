Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QU2uU-0001xs-8y for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 22:29:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p57KQeJ7023192
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Jun 2011 21:26:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23045-04 for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2011 21:26:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p57KQXI5023186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 Jun 2011 21:26:34 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTimAp1ZNVfBJKkLbmm5ZB+=Usz16Hw@mail.gmail.com>
References: <201106071712.50973.paul.eggleton@linux.intel.com>
	<BANLkTimAp1ZNVfBJKkLbmm5ZB+=Usz16Hw@mail.gmail.com>
Date: Tue, 07 Jun 2011 21:26:29 +0100
Message-ID: <1307478389.15712.57.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	p57KQeJ7023192
Subject: Re: Layer index wiki page
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
X-List-Received-Date: Tue, 07 Jun 2011 20:29:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2011-06-07 at 14:58 -0400, Cliff Brake wrote:
> On Tue, Jun 7, 2011 at 12:12 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > Hi all,
> >
> > I've created a wiki page to provide a central index of all layers tha=
t can be
> > used with oe-core:
> >
> >  http://www.openembedded.org/index.php/LayerIndex
> >
> > This is by no means complete - I started with the list from Cliff's c=
hangelog
> > and added a few on from there. I was also looking around for a page w=
ith the
> > =C3=85ngstr=C3=B6m setup instructions that specifically mentions bein=
g oe-core based but
> > I couldn't find it (Koen?) I'm still thinking about how to best repre=
sent layer
> > repos that contain multiple layers too (e.g. meta-oe, meta-smartphone=
, etc.).
> >
> > Comments / updates / additions welcome.
>=20
> Looks good.  I've added meta-yocto to the weekly changelog report:
>=20
> http://cgit.openembedded.org/cgit.cgi/openembedded-admin/commit/?id=3Dd=
017dc35791f100799213cf20de58cd0423b348f

Please be careful with this one as "poky" is currently a fusion of
bitbake, oe-core and the meta-yocto pieces and those meta-yocto pieces
don't yet have their own repository. There will therefore be duplicate
commit information until meta-yocto splits into its own repository.

Yocto is working on layer tools and I've been holding doing anything
with meta-yocto until they're ready. If there is pressure to split this
out now though, we can speed up that process at some extra admin cost
for me to maintain them...

Cheers,

Richard




