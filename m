Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rr9vb-0004By-Qz
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jan 2012 16:10:56 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Jan 2012 07:03:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="101423120"
Received: from unknown (HELO helios.localnet) ([10.252.122.171])
	by orsmga001.jf.intel.com with ESMTP; 28 Jan 2012 07:03:03 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Sat, 28 Jan 2012 15:03:01 +0000
Message-ID: <7463040.mHMHaff4Os@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-15-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <CALbNGRQza2-LE2bH2Z51nC9jVsNk6Vind3JqOfk1vU7z3+x13g@mail.gmail.com>
References: <CALbNGRS-WsE45UakTV5VE2T5bAxb1C2iWgPeN+Ys+OTx-i48Rw@mail.gmail.com>
	<CALbNGRR8cJJfDcHm1hX8cRf7JOKwkoU-sySx1mYujMgXJYHBdA@mail.gmail.com>
	<CALbNGRQza2-LE2bH2Z51nC9jVsNk6Vind3JqOfk1vU7z3+x13g@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] evince: who is responsible to pack all within usr/lib/evince/3/backends to ${PN}?
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
X-List-Received-Date: Sat, 28 Jan 2012 15:10:56 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Saturday 28 January 2012 00:29:28 Andreas M=FCller wrote:
> Have modified bitbake.conf here to
>=20
> PACKAGES =3D "${PN}-dbg ${PN}-dev ${PN}-staticdev ${PN} ${PN}-doc
> ${PN}-locale"
>=20
> now I get the expected behavior.
>=20
> Will start a build from scratch for the night to see if there is some=

> fallout..

We would need to be extremely careful before changing the default value=
 of=20
PACKAGES. I would strongly suggest you enable buildhistory when you do =
this so=20
you can spot any changes easily, particularly in package content.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre


