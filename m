Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 6279F71BA6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Aug 2017 06:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 8710D2E12A;
	Thu, 31 Aug 2017 08:32:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id FVQ2F8CevUp4; Thu, 31 Aug 2017 08:32:43 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 34F642E13A;
	Thu, 31 Aug 2017 08:32:43 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 254F01A070;
	Thu, 31 Aug 2017 08:32:43 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A28C1A066;
	Thu, 31 Aug 2017 08:32:43 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 31 Aug 2017 08:32:43 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id 0E619224F;
	Thu, 31 Aug 2017 08:32:43 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Thu, 31 Aug 2017 08:32:43 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Thu, 31 Aug 2017 08:32:42 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Thu, 31 Aug 2017 08:32:42 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Andre McCurdy <armccurdy@gmail.com>, Tobias Hagelborn <tobiasha@axis.com>
Thread-Topic: [OE-core] [PATCH v2 0/2] Make source code browsable locally -
	devtool srctree
Thread-Index: AQHTIW7p5GTx9+70vUOVuEZKaHrbLaKdZ8IAgACZTvA=
Date: Thu, 31 Aug 2017 06:32:42 +0000
Message-ID: <0fa15a09e9554731a800e4e771e25ab9@XBOX02.axis.com>
References: <1499405543-3127-1-git-send-email-tobiasha@axis.com>
	<2d1bb10c-e13c-79d0-4e0e-bd5aa5d99a42@axis.com>
	<CAJ86T=Vfoe5e86OokE3j9dY8Lc0s4A1OAZPwo318mYdFiKTYdA@mail.gmail.com>
In-Reply-To: <CAJ86T=Vfoe5e86OokE3j9dY8Lc0s4A1OAZPwo318mYdFiKTYdA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/2] Make source code browsable locally - devtool srctree
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
X-List-Received-Date: Thu, 31 Aug 2017 06:32:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Andre McCurdy
> Sent: den 31 augusti 2017 01:17
> To: Tobias Hagelborn <Tobias.Hagelborn@axis.com>
> Cc: Tobias Hagelborn <Tobias.Hagelborn@axis.com>; OE Core mailing list
> <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH v2 0/2] Make source code browsable
> locally - devtool srctree
>=20
> On Wed, Aug 30, 2017 at 2:03 AM, Tobias Hagelborn
> <tobias.hagelborn@axis.com> wrote:
> > On 07/07/2017 07:32 AM, Tobias Hagelborn wrote:
> >>
> >> UPDATE v2:
> >> - Rebased on latest Poky
> >> - Fixed issue with bad paths
> >> - Dirname based on $PN
> >>
> >> In our organization, there is a demand to be able download source
> code for
> >> searching.
> >> With the use of sstate-cache this has been challenge. Also, the
> source is
> >> not gathered
> >> but rather spread in a larger directory structure together with
> build
> >> output.
> >> There are probably others that also want to be able to do the same.
> >>
> >> This addition does:
> >> * Force download of all source via the srctree_all task
> >> * Symlink the source together in a separate directory structure for
> easier
> >> search without
> >>    the risk of matching with build output.
> >>
> >> This is achived with a new class srctree.bbclass that implements the
> >> needed tasks and
> >> a devtool command srctree which offers a convenience command to set
> up
> >> source for
> >> a recipe and it's dependencies.
> >>
> >> There is also a way of organising the package source code in your
> own way.
> >> This is done by implementing a custom dir generation function and
> assign
> >> to SRCTREE_PN_PATH
> >> in a custom class and set SRCTREE_EXTENSION in a configuration file.
> >>
> >>
> >> Tobias Hagelborn (2):
> >>    srctree.bbclass: Download sourcecode and make it searchable
> >>    devtool: srctree: New command for setting up browsable source-
> code
> >>
> >>   meta/classes/srctree.bbclass   | 90
> >> ++++++++++++++++++++++++++++++++++++++++++
> >>   scripts/lib/devtool/srctree.py | 87
> >> ++++++++++++++++++++++++++++++++++++++++
> >>   2 files changed, 177 insertions(+)
> >>   create mode 100644 meta/classes/srctree.bbclass
> >>   create mode 100644 scripts/lib/devtool/srctree.py
> >>
> >
> > Hi
> >
> > I did not receive any feedback on this one.
> >
> > We do make good use of this feature and we can't be the only ones who
> want
> > to browse the source of the distro at times?
>=20
> Just for reference, I think you could achieve something quite similar
> with:
>=20
>   bitbake <your-image> --runall clean  ( or rm -rf tmp )
>   bitbake <your-image> --runall patch

Yes, but the drawback with this is that to find the source code for the=20
individual packages, you have to dive down into tmp/work/... which can=20
be quite discouraging for someone who is not an expert in bitbake. What=20
our developers requested was a way to get easy access to all the source=20
code being used, typically to be able to search through it all looking=20
for some specific feature.

> > Cheers
> > Tobias

//Peter


