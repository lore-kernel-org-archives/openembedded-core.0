Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id F0A0771984
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 13:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 584EE18841;
	Tue, 10 Oct 2017 15:57:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id nV3PkGC-rmn4; Tue, 10 Oct 2017 15:57:05 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id E575D18813;
	Tue, 10 Oct 2017 15:57:04 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D29AF1A072;
	Tue, 10 Oct 2017 15:57:04 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C725D1A069;
	Tue, 10 Oct 2017 15:57:04 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 10 Oct 2017 15:57:04 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id BB1A02CCF;
	Tue, 10 Oct 2017 15:57:04 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Tue, 10 Oct 2017 15:57:04 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Tue, 10 Oct 2017 15:57:04 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Tue, 10 Oct 2017 15:57:04 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Andre McCurdy
	<armccurdy@gmail.com>
Thread-Topic: [OE-core] [PATCH] cmake: Upgrade to 3.9.3 release
Thread-Index: AQHTQQiqnAKq09MSVU6AcCeblJKdAaLbbhkAgAC0+4CAAKvcAIAASQpA
Date: Tue, 10 Oct 2017 13:57:04 +0000
Message-ID: <c4183a19150d4970881e5a06d0b327a6@XBOX02.axis.com>
References: <20171009141227.21795-1-otavio@ossystems.com.br>
	<d31de312-7137-d95d-7cf6-2f15ac4ac1b6@linux.intel.com>
	<CAJ86T=UGY1LciuKpDvpDFot8fQaJHaQEGp=N0zVHo9nMP+4vJw@mail.gmail.com>
	<0eea3119-a905-9a62-6572-1cab90a43a2d@linux.intel.com>
In-Reply-To: <0eea3119-a905-9a62-6572-1cab90a43a2d@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: Upgrade to 3.9.3 release
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
X-List-Received-Date: Tue, 10 Oct 2017 13:57:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Alexander Kanavin
> Sent: den 10 oktober 2017 13:17
> To: Andre McCurdy <armccurdy@gmail.com>
> Cc: Otavio Salvador <otavio@ossystems.com.br>; OpenEmbedded Core
> Mailing List <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH] cmake: Upgrade to 3.9.3 release
>=20
> On 10/10/2017 04:01 AM, Andre McCurdy wrote:
>=20
> >>> -LIC_FILES_CHKSUM =3D "file://Copyright.txt;md5=3D8d8c7bc32f8797d23f5=
cf605d9339d2d \
> >>> +LIC_FILES_CHKSUM =3D "file://Copyright.txt;md5=3D24600643e5d1d2b8f74=
78ae5c9074949 \
> >>>                      file://Source/cmake.h;beginline=3D1;endline=3D3;=
md5=3D4494dee184212fc89c469c3acd555a14"
> >>
> >> What has changed in Copyright.txt? If it's just the copyright=20
> >> years, you can exclude the line using beginline/endline.
> >
> > The copyright statement and copyright year(s) are part of the
> > license. Slicing and dicing the license text to get a consistent=20
> > hash probably isn't the right approach.
>=20
> The purpose of LIC_FILES_CHECKSUM is to establish whether what the
> recipe claims in LICENSE matches what the upstream says in the source
> tree. For that purpose, when the code was published, who owns the code,
> or who made contributions to it are all not relevant and can be
> excluded. Also, such exclusions remove a major nuisance from recipe
> maintainers' job, and that is always a good thing.

That is not the entire story though. If you have COPY_LIC_MANIFEST and=20
COPY_LIC_DIRS set in your configuration, the relevant licenses will be=20
installed in the image, and for licenses specified with beginline and/or=20
endline this only includes the specified lines.

Then, if the license requires that you include the copyright information,=20
which is pretty common, e.g., BSD, leaving out that part just to avoid=20
having to update the recipe once a year means that you are not really=20
complying with the license... And neither will any users of the layer=20
be who believe they are covered license wise by including the license=20
information bitbake produces and installs in their images.=20

True, you should always verify all licenses yourself for any code you=20
use, but still being able to rely on all relevant parts of a license=20
being copied by the build system sounds like something one should be=20
able to expect.

> As a technicality, the years of publication and code owners are not a
> part of the license, they a part of the copyright notice (which may
> also include the license text if it's short, or a reference to it if=20
> it's long):
>=20
> https://en.wikipedia.org/wiki/Copyright_notice
> Alex

//Peter


