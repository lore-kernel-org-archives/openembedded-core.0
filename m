Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9D98A78C57
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 17:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 3277718434;
	Mon, 11 Jun 2018 19:54:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id bqCG3XWnWC3A; Mon, 11 Jun 2018 19:54:29 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 2553D18172;
	Mon, 11 Jun 2018 19:54:29 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0904D1E088;
	Mon, 11 Jun 2018 19:54:29 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F13F41E064;
	Mon, 11 Jun 2018 19:54:28 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon, 11 Jun 2018 19:54:28 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id E5523A42;
	Mon, 11 Jun 2018 19:54:28 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 11 Jun 2018 19:54:28 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Mon, 11 Jun 2018 19:54:28 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Andrej Valek
	<andrej.valek@siemens.com>
Thread-Topic: [OE-core] [PATCH v3 1/2] openssl-1.1: rework packaging
Thread-Index: AQHT/zGh4HqSyGTpRkObiXdrdW44+qRWYuGAgAQVpICAAGuxgIAAdhfw
Date: Mon, 11 Jun 2018 17:54:28 +0000
Message-ID: <99402ec2af244deca7b1dd9b6b9f799d@XBOX02.axis.com>
References: <24e47452-9ff5-778c-5146-599589458a3f@linux.intel.com>
	<20180608140403.27855-1-andrej.valek@siemens.com>
	<CANNYZj9ecWrsg61KiAirO5YnkATOtEihRgym0iD5o1c0po5KNA@mail.gmail.com>
	<78456fb6-d8a1-c681-792a-36e78d7fb790@siemens.com>
	<58fa6d36-737b-da77-d1ec-f72d50c75e5d@linux.intel.com>
In-Reply-To: <58fa6d36-737b-da77-d1ec-f72d50c75e5d@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/2] openssl-1.1: rework packaging
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
X-List-Received-Date: Mon, 11 Jun 2018 17:54:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Alexander Kanavin
> Sent: den 11 juni 2018 14:45
> To: Andrej Valek <andrej.valek@siemens.com>
> Cc: OE-core <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH v3 1/2] openssl-1.1: rework packaging
>=20
> On 06/11/2018 09:19 AM, Andrej Valek wrote:
> > Hi Alex,
> >
> > I have tested your branch and seems to be, that openssl is working
> > correctly.
> >
> > We are now using original (perl) c_rehash script, but dependency to per=
l
> > is missing. Are you ok with adding runtime dependency to bin package?
> > Just for notice, it will install perl on target.
>=20
> Yes, of course. If c_rehash needs perl interpreter to run, then it has
> to pull it in.
>=20
> Alex

Any reason the openssl-c_rehash.sh reimplementation of c_rehash=20
as a shell script is not used for target with openssl-1.1? It is=20
currently used for both native and target for openssl-1.0, and=20
native for openssl-1.1. Using it would avoid the dependency on=20
perl for target, which at least for us is not an option to have=20
(and we do need c_rehash for target).

//Peter


