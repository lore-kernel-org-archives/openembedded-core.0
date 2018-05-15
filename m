Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 03F8A7505A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 10:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 3F982183A4;
	Tue, 15 May 2018 12:07:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id iZjlJO6cONvK; Tue, 15 May 2018 12:07:11 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 557B818055;
	Tue, 15 May 2018 12:07:11 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34C241E07A;
	Tue, 15 May 2018 12:07:11 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2806A1E079;
	Tue, 15 May 2018 12:07:11 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 15 May 2018 12:07:11 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 1AFD1F98;
	Tue, 15 May 2018 12:07:11 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Tue, 15 May 2018 12:07:10 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Tue, 15 May 2018 12:07:10 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Tue, 15 May 2018 12:07:10 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Joe Rutledge
	<joe.rutledge@phabrix.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] python-3.5: Include _posixsubprocess in package
Thread-Index: AQHT7DHAff4LoVaRLUa3uxUA8ORUU6QwkCHw
Date: Tue, 15 May 2018 10:07:10 +0000
Message-ID: <f9e8f05eb45141ca9a2890b581fae2d3@XBOX02.axis.com>
References: <1526377501-7367-1-git-send-email-joe.rutledge@phabrix.com>
	<7fa347cd-dfcc-fe71-8807-08e3a7d45710@linux.intel.com>
In-Reply-To: <7fa347cd-dfcc-fe71-8807-08e3a7d45710@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] python-3.5: Include _posixsubprocess in	package
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
X-List-Received-Date: Tue, 15 May 2018 10:07:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Alexander Kanavin
> Sent: den 15 maj 2018 11:40
> To: Joe Rutledge <joe.rutledge@phabrix.com>; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] python-3.5: Include _posixsubprocess in
> package
>=20
> On 05/15/2018 12:45 PM, Joe Rutledge wrote:
> > Change the python-3.5-manifest.inc file to also include:
> > lib-dynload/_posixsubprocess.*.so
> >
> > This is needed for Python subprocess support but was not included.
>=20
> You need to include [krogoth] in the subject to indicate which release
> this is for.
>=20
> > -    "lib-dynload/xreadlines.*.so types.* platform.* ${bindir}/python* =
"  +
> > +    "lib-dynload/xreadlines.*.so types.* platform.* ${bindir}/python* =
"  +
>=20
> What has changed here?

A trailing space has been removed (not seen above, but it can be seen=20
in the original mail).

> Alex

//Peter


