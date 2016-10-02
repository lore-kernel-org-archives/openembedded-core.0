Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id D3A7A600BC
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Oct 2016 19:37:30 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 02 Oct 2016 12:37:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,434,1473145200"; d="scan'208";a="15548376"
Received: from thiyagax-mobl2.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.185.151])
	by orsmga005.jf.intel.com with ESMTP; 02 Oct 2016 12:37:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ulf Magnusson <ulfalizer@gmail.com>
Date: Mon, 03 Oct 2016 08:37:26 +1300
Message-ID: <1780562.gdzQvQrqZ4@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.5-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CAFkk2KSmxkEXxboJADHonFExX7F+vsc1o3Dga53bm3hdt7H2nA@mail.gmail.com>
References: <CABcZAN=WpicbLyg-sc=GDiMS81iwsGe1m+NE-fUfw2tniWpWXA@mail.gmail.com>
	<CAFkk2KR5AB_gjq5XKFBJjOaaRHJ3DzJdCqS5H1Kq=m35xZ3jTQ@mail.gmail.com>
	<CAFkk2KSmxkEXxboJADHonFExX7F+vsc1o3Dga53bm3hdt7H2nA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] scripts: add new script 'native'
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 02 Oct 2016 19:37:31 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Sun, 02 Oct 2016 16:44:01 Ulf Magnusson wrote:
> On Sun, Oct 2, 2016 at 4:30 PM, Ulf Magnusson <ulfalizer@gmail.com> w=
rote:
> > On Sun, Oct 2, 2016 at 4:15 PM, J=E9r=E9my Rosen <jeremy.rosen@smil=
e.fr>=20
wrote:
> >> "native" might be a bit too generic...
> >>=20
> >> could I suggest oe_native-run or bitbake-native ?
> >>=20
> >> something that says it's yocto-galaxy specific and can be autocomp=
leted
> >> with a reasonable prefix...
> >=20
> > I think overly namespacing things that aren't likely to clash in
> > practice gets annoying. I would've gone for "run-native" (more
> > descriptive and English-like, less generic), but how about somethin=
g
> > simple and easy to type like "oe-native" or "oe-run-native" if a
> > prefix is added? That's consistent with the naming scheme used for
> > many other scripts in scripts/ too.
>=20
> I just noticed that the script's already in though, so not much point=

> arguing. ;)

There is - just because it got merged doesn't mean it can't be renamed,=
 in=20
fact if we are going to rename it then now is the time to do that, rath=
er than=20
waiting until people are used to the current name.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

