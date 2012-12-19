Received: from 11.mo5.mail-out.ovh.net ([46.105.47.167]
	helo=mo5.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TlTD3-00088X-P2
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 00:37:58 +0100
Received: from mail419.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with SMTP id BC4C51010165
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2012 22:04:08 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 19 Dec 2012 22:55:25 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO eb-e6520)
	(eric%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 19 Dec 2012 22:55:24 +0200
Date: Wed, 19 Dec 2012 21:55:23 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Ovh-Mailout: 178.32.228.5 (mo5.mail-out.ovh.net)
Message-ID: <20121219215523.3f50cb4a@eb-e6520>
In-Reply-To: <CAP9ODKoJMX6m6094W0f=o0OG6-kdrByLBAhNq_XU-Y7SSVqzyg@mail.gmail.com>
References: <50D1F76D.4070000@intel.com>
	<CAP9ODKoJMX6m6094W0f=o0OG6-kdrByLBAhNq_XU-Y7SSVqzyg@mail.gmail.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 3007278653225741692
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrtdduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrtdduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
Cc: Patches, oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: systemd integration
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
X-List-Received-Date: Wed, 19 Dec 2012 23:37:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Le Wed, 19 Dec 2012 15:21:14 -0200,
Otavio Salvador <otavio@ossystems.com.br> a =E9crit :

> On Wed, Dec 19, 2012 at 3:20 PM, Radu Moisan <radu.moisan@intel.com> wrot=
e:
> > Hi guys,
> >     I have prepared a branch on poky-contrib (rmoisan/systemd) where I
> > pulled systemd from meta-openembedded. The goal is to merge this into
> > oe-core, so please take a look and give me your feedback on stuff that =
needs
> > work or things that I might have done wrong, so that I can prepare it f=
or
> > merge.
> >     At this point core-image-minimal and core-image-sato both boot fine=
 with
> > systemd. There still are a few warnings but not critical(at runtime), at
> > least in my opinion, you may want to take a look at those too.
> >     You can activate systemd by  DISTRO_FEATURES_INITMAN =3D "systemd"
>=20
> In this case, systemd is made *available* or used? Is it possible to
> have sysvinit image and another systemd?
>=20
there is a DISTRO_FEATURE in this patch which seems to give this
choice :
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Drmoisan/=
systemd&id=3D1dd15bf46003d0563e7f3441a6c73cbc1e90a79b
DISTRO_FEATURES_INITMAN ?=3D "sysvinit"

Eric


