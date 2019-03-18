Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id C546360272
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 09:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id DFCD01836F;
	Mon, 18 Mar 2019 10:37:15 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id RFnYYdvuuZN5; Mon, 18 Mar 2019 10:37:15 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 2B54518242;
	Mon, 18 Mar 2019 10:37:14 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDC521E077;
	Mon, 18 Mar 2019 10:37:14 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D01421E07D;
	Mon, 18 Mar 2019 10:37:14 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon, 18 Mar 2019 10:37:14 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id C36ED303B;
	Mon, 18 Mar 2019 10:37:14 +0100 (CET)
Received: from xbox11.axis.com (10.0.5.25) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 18 Mar 2019 10:37:14 +0100
Received: from XBOX04.axis.com (10.0.5.18) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 18 Mar 2019 10:37:14 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Mon, 18 Mar 2019 10:37:14 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Thread-Topic: Where are the mails from patchwork (was: RE: [OE-core] [PATCH]
	[PATCH] openssl:upgrade to 1.1.1b)
Thread-Index: AdTdbinqx4Vm9KjWRnavTaRdpz6Dbg==
Date: Mon, 18 Mar 2019 09:37:14 +0000
Message-ID: <ec5b47cb57324ee89e4f18785264d97e@XBOX04.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Where are the mails from patchwork (was: RE: [PATCH] [PATCH] openssl:upgrade to 1.1.1b)
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
X-List-Received-Date: Mon, 18 Mar 2019 09:37:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Alexander Kanavin
> Sent: den 18 mars 2019 09:52
> To: Hong Liu <hongl.fnst@cn.fujitsu.com>
> Cc: OE-core <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH] [PATCH] openssl:upgrade to 1.1.1b
>=20
> On Mon, 18 Mar 2019 at 02:20, Hong Liu <hongl.fnst@cn.fujitsu.com>
> wrote:
> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd57d511030c9d66ef5f5966bee5=
a7eff"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd343e62fc9c833710bbbed25f27=
364c8"
>=20
> You need to explain what changed (in the commit message).
> Try 'devtool upgrade openssl', it will make a diff of the two licenses
> for you.
>=20
> Also, openssl10 needs a similar upgrade.
>=20
> Alex

Whatever happened to the mails from patchwork that used to=20
automatically complain about things like this with:

* Issue             LIC_FILES_CHKSUM changed on target openssl but there is=
 no "License-Update" tag in commit message [test_lic_files_chksum_modified_=
not_mentioned]=20
  Suggested fix    Include "License-Update: <description>" into the commit =
message with a brief description
  Current checksum file://LICENCE;md5=3Dd57d511030c9d66ef5f5966bee5a7eff
  New checksum     file://LICENCE;md5=3Dd343e62fc9c833710bbbed25f27364c8


