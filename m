Received: from 1.mo2.mail-out.ovh.net ([46.105.63.121]
	helo=mo2.mail-out.ovh.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Rq5PY-00018c-AE
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 17:09:24 +0100
Received: from mail190.ha.ovh.net (b7.ovh.net [213.186.33.57])
	by mo2.mail-out.ovh.net (Postfix) with SMTP id 4895BDC332B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 16:28:06 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 25 Jan 2012 17:26:23 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO eb-e6520)
	(82.240.38.71) by ns0.ovh.net with SMTP; 25 Jan 2012 17:26:20 +0200
Date: Wed, 25 Jan 2012 16:26:20 +0100
From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
To: openembedded-core@lists.openembedded.org
X-Ovh-Mailout: 178.32.228.2 (mo2.mail-out.ovh.net)
Message-ID: <20120125162620.33c601f1@eb-e6520>
In-Reply-To: <A1F13823-5353-4D31-9614-C5C2317D122E@dominion.thruhere.net>
References: <1327488436-28526-1-git-send-email-eric@eukrea.com>
	<A1F13823-5353-4D31-9614-C5C2317D122E@dominion.thruhere.net>
Organization: =?ISO-8859-1?B?RXVrculh?= Electromatique
X-Mailer: Claws Mail 3.8.0 (GTK+ 2.24.8; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-Ovh-Tracer-Id: 2241666715013787074
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: 0
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeegtddrudejucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtud
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeegtddrudejucetggdotefuucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucenucfhrhhomhepgfhrihgtuceurohnrghrugcuoegvrhhitgesvghukhhrvggrrdgtohhmqeenucfjughrpeffhffvuffkjghfohfogggtgfesthhqredtredtud
Subject: Re: [PATCH] qt4-tools-nativesdk-4.8.0: fix build
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
X-List-Received-Date: Wed, 25 Jan 2012 16:09:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Koen,

Le Wed, 25 Jan 2012 13:01:26 +0100,
Koen Kooi <koen@dominion.thruhere.net> a =E9crit :

>=20
> Op 25 jan. 2012, om 11:47 heeft Eric B=E9nard het volgende geschreven:
>=20
> > the build is actually failing because host g++ and ld are used to
> > compile and link
>=20
> This is missing a PR bump in the affected recipes.
>=20
as the recipes don't actually build do you think the PR bump in
necessary ?

Eric


