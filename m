Received: from 16.mo5.mail-out.ovh.net ([87.98.174.144]
	helo=mo5.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1TlR1b-0005or-2Q
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Dec 2012 22:17:59 +0100
Received: from mail419.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo5.mail-out.ovh.net (Postfix) with SMTP id 50C841010166
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Dec 2012 22:06:34 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 19 Dec 2012 22:57:51 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO eb-e6520)
	(eric%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 19 Dec 2012 22:57:50 +0200
Date: Wed, 19 Dec 2012 21:57:49 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Ovh-Mailout: 178.32.228.5 (mo5.mail-out.ovh.net)
Message-ID: <20121219215749.1c511d83@eb-e6520>
In-Reply-To: <50D1F76D.4070000@intel.com>
References: <50D1F76D.4070000@intel.com>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 3048373997857778955
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrtdduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeehledrtdduucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgnecujfgurhepfffhvffukfgjfhhoofggtgfgsehtqhertdertddu
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 19 Dec 2012 21:17:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Le Wed, 19 Dec 2012 19:20:45 +0200,
Radu Moisan <radu.moisan@intel.com> a =E9crit :
>      I have prepared a branch on poky-contrib (rmoisan/systemd) where I=20
> pulled systemd from meta-openembedded. The goal is to merge this into=20
> oe-core, so please take a look and give me your feedback on stuff that=20
> needs work or things that I might have done wrong, so that I can prepare=
=20
> it for merge.

a nitpick :
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Drmoisan/=
systemd&id=3D02f4027f7ccddaff3b0316962e7a86a04d31abbc
here you add that to lighttpd recipe :
+ file://lighttpd_fix_for_automake-1.12.patch \
+ file://lighttpd.service
but you don't add the patch

then here (several patches later)
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Drmoisan/=
systemd&id=3D0b6a5d3f998d2f1bb346c403d512c33ee93052fb
you fix that :
- file://lighttpd_fix_for_automake-1.12.patch \


>      At this point core-image-minimal and core-image-sato both boot fine=
=20
> with systemd. There still are a few warnings but not critical(at=20
> runtime), at least in my opinion, you may want to take a look at those to=
o.
>      You can activate systemd by *DISTRO_FEATURES_INITMAN =3D "systemd"*
>=20
thanks, will try this.

Eric


