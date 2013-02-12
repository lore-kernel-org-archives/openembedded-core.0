Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>)
	id 1U5O2R-0005xP-Q3; Tue, 12 Feb 2013 23:09:20 +0100
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id 354072D461;
	Tue, 12 Feb 2013 22:53:20 +0100 (CET)
Received: from e6520eb (unknown [90.84.144.201]) (Authenticated sender: eukrea)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id B40F44C80D0;
	Tue, 12 Feb 2013 22:53:07 +0100 (CET)
Date: Tue, 12 Feb 2013 22:53:03 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130212225303.029a2ac9@e6520eb>
In-Reply-To: <CAJTo0LZREeVX7cWLttEvzxSK_VMNPQyZuQqReEMTH-zbHObdLw@mail.gmail.com>
References: <2760168.9kFd94gL1F@helios>
	<CAJTo0LaJNDB6XjK0M4rsS9+z7AZ6K_n0TAX8+7KH2GuAADgCZw@mail.gmail.com>
	<1906630.s5um26QAQj@helios>
	<CAP9ODKrOM9bh-MnzQvU29iVwYdRvw4m7DMYZUcMV=wKYJ5Q4bg@mail.gmail.com>
	<CAJTo0LYFcT5P=p62Nn2kBak33LCfBXQ_KFL-oF2bHFKhguk1rg@mail.gmail.com>
	<20130212212255.GF3300@jama>
	<CAJTo0LZREeVX7cWLttEvzxSK_VMNPQyZuQqReEMTH-zbHObdLw@mail.gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: Patches, Salvador <otavio@ossystems.com.br>,
	oe-core layer <openembedded-core@lists.openembedded.org>, Otavio,
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [oe] RFC: meta-oe appends and overlayed recipes
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
X-List-Received-Date: Tue, 12 Feb 2013 22:09:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Ross,

Le Tue, 12 Feb 2013 21:36:16 +0000,
"Burton, Ross" <ross.burton@intel.com> a =C3=A9crit :

> On 12 February 2013 21:22, Martin Jansa <martin.jansa@gmail.com> wrote:
> > Yes, xf86-input-tslib works
> > http://git.openembedded.org/meta-openembedded/commit/?id=3D506d5f781f5e=
e93e3c9b8ca51a7fb65f40d4a8b8
>=20
> [ surprised face ]
>=20
> You totally should push those tarballs to a git repo on fd.o,
> pengutronix has clearly abandoned it.
>=20
> In a harsh mood (its 2130 and I'm working) I'm leaning towards making
> tslib a packageconfig for qte, and moving tslib into meta-oe...
>=20
if you have a how-to to get Qt/E 4.x working with evdev, please send it
before removing tslib so that we can test it on several boards which
are actually running with Qt/E+tslib.

Thanks
Eric


