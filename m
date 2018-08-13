Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B7D9C78DEA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 12:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 25F761834B;
	Mon, 13 Aug 2018 14:14:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id BMgvFWmlZGG2; Mon, 13 Aug 2018 14:14:11 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 68CC518349;
	Mon, 13 Aug 2018 14:14:11 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 55A7A1A075;
	Mon, 13 Aug 2018 14:14:11 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4987C1A073;
	Mon, 13 Aug 2018 14:14:11 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Mon, 13 Aug 2018 14:14:11 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 3D4EA2E9B;
	Mon, 13 Aug 2018 14:14:11 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 13 Aug 2018 14:14:10 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 13 Aug 2018 14:14:10 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Mon, 13 Aug 2018 14:14:11 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: akuster808 <akuster808@gmail.com>
Thread-Topic: [OE-core] Cherry-pick to Sumo (was: [PATCHv2 1/2]
	oe-pkgdata-util: Make parse_pkgdatafile() support package suffixed
	vars)
Thread-Index: AQHT+01Roqt+tPRN2kqPaTpZgec7haRU2QWwgGkuiUA=
Date: Mon, 13 Aug 2018 12:14:10 +0000
Message-ID: <372f31a2e1d34d3390be9d5841bc2a6e@XBOX02.axis.com>
References: <058532a438814db98ab5389758a226fd@XBOX02.axis.com>
	<11df0453-3c35-b868-6d96-b23bd675ae9a@gmail.com>
	<8406638238c34c4799a21e8e39a4dd49@XBOX02.axis.com>
In-Reply-To: <8406638238c34c4799a21e8e39a4dd49@XBOX02.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Cherry-pick to Sumo (was: [PATCHv2 1/2] oe-pkgdata-util: Make parse_pkgdatafile() support package suffixed vars)
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
X-List-Received-Date: Mon, 13 Aug 2018 12:14:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

*ping*

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Peter Kjellerstedt
> Sent: den 7 juni 2018 16:05
> To: akuster808 <akuster808@gmail.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] Cherry-pick to Sumo (was: [PATCHv2 1/2] oe-
> pkgdata-util: Make parse_pkgdatafile() support package suffixed vars)
>=20
> > -----Original Message-----
> > From: akuster808 [mailto:akuster808@gmail.com]
> > Sent: den 3 juni 2018 17:13
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
> > core@lists.openembedded.org
> > Subject: Re: [OE-core] Cherry-pick to Sumo (was: [PATCHv2 1/2] oe-
> > pkgdata-util: Make parse_pkgdatafile() support package suffixed vars)
> >
> > On 06/02/2018 12:48 PM, Peter Kjellerstedt wrote:
> > > These two patches, in addition to "oe-pkgdata-util: lookup-recipe,
> > > package-info: Don't finish prematurely" (commit 32c2a2dd) that is
> > > already on master, need to be cherry-picked to the sumo branch as
> > > well. Without them, `oe-pkgdata-util package-info ...` is more or
> > > less broken.
> > >
> > > //Peter
> >
> > Thanks peter. I hope to remember to back port them once they hit
> > master.
> >
> > -armin
>=20
> They have hit master now. The commits I want cherry-picked to Sumo
> from master are:
>=20
> 32c2a2dd oe-pkgdata-util: lookup-recipe, package-info: Don't finish
> prematurely
> 38f82842 oe-pkgdata-util: Make parse_pkgdatafile() support package
> suffixed vars
> cd195bdf oe-pkgdata-util: package-info: Re-add support for the --extra
> option
>=20
> //Peter
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

