Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 8DE4871C1F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 13:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 093F32E321;
	Tue, 23 May 2017 15:38:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id RtMhjDS2sa3k; Tue, 23 May 2017 15:38:09 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id E11142E0D2;
	Tue, 23 May 2017 15:38:09 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA5E31A096;
	Tue, 23 May 2017 15:38:09 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE7041A095;
	Tue, 23 May 2017 15:38:09 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 23 May 2017 15:38:09 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id B289C19E2;
	Tue, 23 May 2017 15:38:09 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 23 May 2017 15:38:09 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Tue, 23 May 2017 15:38:09 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 0/2] Allow oe-pkgdata-util package-info to
	display more info
Thread-Index: AQHSzkZqp9gGxV6pNUqQQ7Dv3QS0/6H3ErOwgArjjaA=
Date: Tue, 23 May 2017 13:38:09 +0000
Message-ID: <d9d85ca9935b4a599378a8d877e022cf@XBOX02.axis.com>
References: <cover.1494932131.git.pkj@axis.com>
	<1494940489.27342.30.camel@linuxfoundation.org>
	<2e2982504b9f46819b0c90ad11fdde7b@XBOX02.axis.com>
In-Reply-To: <2e2982504b9f46819b0c90ad11fdde7b@XBOX02.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Allow oe-pkgdata-util package-info to display more info
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
X-List-Received-Date: Tue, 23 May 2017 13:38:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Peter Kjellerstedt
> Sent: den 16 maj 2017 18:30
> To: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 0/2] Allow oe-pkgdata-util package-info
> to display more info
>=20
> > -----Original Message-----
> > From: Richard Purdie [mailto:richard.purdie@linuxfoundation.org]
> > Sent: den 16 maj 2017 15:15
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] [PATCH 0/2] Allow oe-pkgdata-util package-info
> > to display more info
> >
> > On Tue, 2017-05-16 at 12:56 +0200, Peter Kjellerstedt wrote:
> > > After a build in our autobuilder, we use `oe-pkgdata-util package-
> > > info -f package.manifest` to store a file with information about=20
> > > each installed package. This is typically used to compare builds=20
> > > later on. Since not every difference to a package is explained by=20
> > > its version, we have found it beneficial to also include the=20
> > > SRC_URI in the generated file.
> > >
> > > This patch set adds SRC_URI to the pkgdata that is stored for each
> > > package, and adds a new option to oe-pkgdata-util package-info,
> > > -e <var>, that can be used to display extra variables from the
> > > pkgdata.
> >
> > I'm going to say no to this.
> >
> > The reason is that pkgdata is not really about collecting up all
> > build information. If you want to know how two different builds=20
> > differ, you'd use the sigdata files. If I take this patch, more=20
> > will follow where you find some new difference you want to track=20
> > and there are other mechanisms I'd suggest (buildhistory and=20
> > siginfo for starters). I don't want to turn the pkgdata files=20
> > into something they're not.
> >
> > Cheers,
> >
> > Richard
>=20
> As you may have expected, that was not the response I had hoped for.
> However, I will see if we can come to a working solution that you can
> accept.
>=20
> Since I hope that the change to oe-pkgdata-util is acceptable to you,
> I will focus on the change in package.bbclass.
>=20
> Regarding siginfo: I assume it has the information in there somewhere.
> However, I have been working with OE for five years now, and it is
> still basically a black hole to me. I have no idea how to do anything=20
> useful with it.
>=20
> Regarding buildhistory: AFAICT there is nothing in there about neither
> recipe names nor SRC_URI. I guess that can be added, though, if really
> needed.
>=20
> On the other hand, we have a tool, oe-pkgdata-util, that provides a
> simple interface to access the package information, and can produce a
> simple information file (oe-pkgdata-util package-info) with one line
> per package. This file is simple enough that I can give it to our
> maintenance team and they can look at it to see if there are any
> differences they need to know about. An additional benefit here is that
> we can run oe-pkgdata-util from within a bitbake task to generate the
> file together with the other artefacts we produce for a release.
>=20
> That said, I can understand that you do not want to add information to
> the pkgdata that is not really needed to build. However, would you
> accept a way to add to this data, e.g., by specifying a BitBake variable=
=20
> such as EXTRA_PKGDATA_VARS with the names of the extra variables that=20
> should be stored in pkgdata? That way it would not affect anyone unless=20
> they actually need this extra data, and I would not have the burden of
> carrying a backported version of package.bbclass forever in our layers=20
> with all the extra maintenance that incurs.
>=20
> //Peter

It has been a week now. Any response would be appreciated.

//Peter


