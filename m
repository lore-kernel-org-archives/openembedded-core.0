Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id CF9367F33D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 21:46:06 +0000 (UTC)
IronPort-SDR: SKg/n8+AKjM91Wsyrtk0wc/A4OucEFKP9kJ3FZW8tcoDn7j94lxK4pXCv9+0cphE7bROr/L024
	A+HPh0bsyUnAIKpVDRb2VegCEAEvKurWI23pfrwhqtx1LPdf+WaxMH+Juq4bXeuEWc6i4LRKUY
	nFsT616jOhjI27LBXTHegky6cVTK21FktiLlMDIPtkcz9JjFrCOdEDbqDskiUe5eoLYVITujlh
	QliimlcKNaTHBM0BDkz6tPNWmUpMF25p3ePISfbC+EAfH9nAgJwBNakrRU6swy4ZyzKaKUN8I0
	Uxs=
X-IronPort-AV: E=Sophos;i="5.68,297,1569276000"; 
   d="scan'208";a="2359929"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Seebs
	<seebs@seebs.net>
Thread-Topic: [OE-core] [PATCH] pseudo: Add statx support to fix fedora30
	issues
Thread-Index: AQHVlabN78xPLmXDO0WnEn+3OvoRoaeAGXEAgAAFFYCAB/mVsA==
Date: Tue, 12 Nov 2019 21:46:05 +0000
Message-ID: <0161f8e59caa4609aa6d1e6904042359@XBOX03.axis.com>
References: <20191107200444.22913-1-richard.purdie@linuxfoundation.org>
	<20191107143430.39e16813@seebsdell>
	<17ac19c3d8e4b4b110312fe6005e83684b671034.camel@linuxfoundation.org>
In-Reply-To: <17ac19c3d8e4b4b110312fe6005e83684b671034.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: Add statx support to fix fedora30 issues
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
X-List-Received-Date: Tue, 12 Nov 2019 21:46:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Richard Purdie
> Sent: den 7 november 2019 21:53
> To: Seebs <seebs@seebs.net>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] pseudo: Add statx support to fix fedora30
> issues
>=20
> On Thu, 2019-11-07 at 14:34 -0600, Seebs wrote:
> > On Thu,  7 Nov 2019 20:04:44 +0000
> > Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> >
> > > Modern distros (e.g. fedora30) are starting to use the new statx()
> > > syscall through the newly exposed glibc wrapper function in
> > > software
> > > like coreutils (e.g. the ls command). Add support to intercept this
> > > to pseudo.
> >
> > I think this should be okay. If there's no real statx() wrapper, the
> > real_statx() call probably fails, but also things probably won't have
> > thought it existed/worked.
>=20
> That was my thinking...
>=20
> > Worth double-checking that things still run with this in place on a
> > system that doesn't have a statx wrapper, when configuring and
> > building things like coreutils that will check for it.
>=20
> coreutils looks to be using a standard configure check for the statx
> function.
>=20
> Even in OE, we'd not want to configure/compile with pseudo loaded and
> active so I think we should be ok...
>=20
> Cheers,
>=20
> Richard

As a Fedora 30 user, I expect this needs to be backported to Zeus,=20
Warrior, etc as well or I guess I will start seeing problems when=20
building them?

//Peter


