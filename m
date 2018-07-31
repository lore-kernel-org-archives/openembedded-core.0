Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C284278D82
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 11:01:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jul 2018 04:01:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,427,1526367600"; d="scan'208";a="79285538"
Received: from unknown (HELO localhost.localdomain) ([10.103.239.194])
	by orsmga002.jf.intel.com with ESMTP; 31 Jul 2018 04:01:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2018 12:01:09 +0100
Message-ID: <3567631.rW7LACzLfS@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <c8b63914e60f12cb57f569199f82390cbd069931.camel@linuxfoundation.org>
References: <DB5PR08MB0888CF3B2340E729DD3B946193520@DB5PR08MB0888.eurprd08.prod.outlook.com>
	<d7450c2b26f644358476ea6ec27717b6@XBOX02.axis.com>
	<c8b63914e60f12cb57f569199f82390cbd069931.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: Jeremy Johnson <Jeremy.Johnson@arm.com>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: INCOMPATIBLE_LICENSE mechanism
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
X-List-Received-Date: Tue, 31 Jul 2018 11:01:10 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

On Thursday, 26 July 2018 5:14:05 PM BST Richard Purdie wrote:
> On Thu, 2018-07-26 at 13:16 +0000, Peter Kjellerstedt wrote:
> > This is related to a similar problem we are seeing with the use of
> > =E2=80=9Cor=E2=80=9D for licenses. We use the archiver.bbclass to expor=
t all open
> > source code we use. However, for recipes that specify multiple
> > licenses using =E2=80=9Cor=E2=80=9D, we would like to specify the one u=
nder which we
> > are using the code. E.g., if the LICENSE is =E2=80=9CGPL-2.0 | Propriet=
ary=E2=80=9D,
> > we would like to treat the code as =E2=80=9CProprietary=E2=80=9D, but w=
hen it comes
> > to the archiver.bbclass, even if we have told it to ignore packages
> > with Proprietary licenses, it will include the package due to the
> > alternative GPL-2.0 license.
> > =20
> > The idea we have is to allow to specify a USED_LICENSE (e.g., in a
> > bbappend or a separate configuration file), which should take the
> > actually used license. This should be verified to be one of the
> > allowed licenses specified in LICENSE (in case LICENSE changes and no
> > longer allows the chosen license), and after that, LICENSE should be
> > treated as if this was the value it had been given. This does,
> > however,  not take into account the use of the same package in
> > multiple images with different licensing requirements (we only build
> > one image so that is not a problem for us).
>=20
> Just thinking out loud you could have something like a=20
>=20
> gplv3-license-incompatible.inc:
>=20
> LICENSE_pn-<some-recipe> =3D "MIT"
> LICENSE_pn-<some--other-recipe> =3D "GPLv2"
> INCOMPATIBLE_LICENSE =3D "GPLv3"

That was my first thought, but the issue is that you won't get any warning =
in=20
future if the LICENSE value within the recipe changes to no longer provide =
the=20
option you've selected.=20

Cheers,
Paul

=2D-=20

Paul Eggleton
Intel Open Source Technology Centre



