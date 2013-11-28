Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1A2606CC4F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2013 22:30:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 28 Nov 2013 14:30:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,793,1378882800"; d="scan'208";a="435796088"
Received: from paulonei-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.122.2])
	by fmsmga001.fm.intel.com with ESMTP; 28 Nov 2013 14:30:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chris Larson <clarson@kergoth.com>
Date: Thu, 28 Nov 2013 22:30:44 +0000
Message-ID: <1468986.biIYlcqkQR@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CABcZAN=Tym_ZkCB4ihdJrQ0sqU-Kw9GU6vER5f2viKoxBWntdg@mail.gmail.com>
References: <cover.1385571298.git.stefanx.stanacar@intel.com>
	<1438663.kjvipZjc12@helios>
	<CABcZAN=Tym_ZkCB4ihdJrQ0sqU-Kw9GU6vER5f2viKoxBWntdg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Script and layer for running tests
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
X-List-Received-Date: Thu, 28 Nov 2013 22:30:53 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Thursday 28 November 2013 13:29:32 Chris Larson wrote:
> On Thu, Nov 28, 2013 at 3:17 AM, Paul Eggleton <
> paul.eggleton@linux.intel.com> wrote:
> > On Wednesday 27 November 2013 11:42:06 Chris Larson wrote:
> > > Will this have its own repository like all the other poky integra=
ted
> > > layers? It really should, in my opinion.
> >=20
> > It really needs to stay in the same place as the tests that rely on=
 it;
> > they can't work without it. It might be suggested that the tests sh=
ould go
> > elsewhere with them; but I don't think that would make sense - we w=
ant
> > people to be able to run these tests easily if they make changes to=
 OE-
> > Core to check if they have caused any regressions.
> >=20
> > If you have a look at the layer, there's not a lot in it, and I wou=
ldn't
> > expect a lot to be added in future. One possible change would be to=
 just
> > have the layer created on the fly in some temporary directory by th=
e tests
> > themselves, rather than having it in the repository; on the other h=
and it
> > does make it a bit more difficult to look into outside of the test
> > environment.
>=20
> I understand what you=E2=80=99re saying, but if this script is suppos=
ed to be
> generally useful for OE/Yocto, not just Poky, then the poky repositor=
y
> shouldn=E2=80=99t be its definitive location.

Poky isn't its definitive location, it has been sent as a pull request =
to the=20
OE-Core mailing list to be applied on top of OE-Core.

> Further, patches against oe-core should be submitted against the oe-c=
ore
> repository, not the poky repository, and anything poky specific shoul=
d go to
> the poky list.

Point taken, but there isn't actually anything poky-specific in this se=
ries.=20
Can we please concentrate on the content of the patches?

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

