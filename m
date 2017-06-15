Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A73D17839F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 14:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 977EB18501;
	Thu, 15 Jun 2017 16:22:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id dNS_nLpy3afT; Thu, 15 Jun 2017 16:22:16 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id BCB97180D3;
	Thu, 15 Jun 2017 16:22:16 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C22B1A080;
	Thu, 15 Jun 2017 16:22:16 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90EFD1A07E;
	Thu, 15 Jun 2017 16:22:16 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 15 Jun 2017 16:22:16 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 84D55EBD;
	Thu, 15 Jun 2017 16:22:16 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 15 Jun 2017 16:22:16 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Thu, 15 Jun 2017 16:22:16 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH 01/11] gtk+3: Update the patches to work
	without PATCHTOOL = "git"
Thread-Index: AQHS5d9kOhG4vKZAUEeSdO8XWjJMgKIl83VQ///gMwCAACGcYP//4geAgAAhxPA=
Date: Thu, 15 Jun 2017 14:22:16 +0000
Message-ID: <e5fb0af1b0b3455b93562ef4ecc15f12@XBOX02.axis.com>
References: <cover.1497534748.git.pkj@axis.com>
	<4b8a955e4779a8fc3a113947622d09f47e71b00e.1497534748.git.pkj@axis.com>
	<CAJTo0LZ3utZx6+rbKxs2RbjhEVHG1eGMGrX7qSf-s=TB6PwPmA@mail.gmail.com>
	<c1d410c6cb3d4e66bef8b80a78a07267@XBOX02.axis.com>
	<febb07f5-af96-82ba-69c1-46f9c7294b00@linux.intel.com>
	<8b3d9920b9bb447bb6c7574a7ae42b6e@XBOX02.axis.com>
	<55a5ee84-9b57-8f96-5a0f-fd66b495e42b@linux.intel.com>
In-Reply-To: <55a5ee84-9b57-8f96-5a0f-fd66b495e42b@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] gtk+3: Update the patches to work without PATCHTOOL = "git"
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
X-List-Received-Date: Thu, 15 Jun 2017 14:22:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Alexander Kanavin [mailto:alexander.kanavin@linux.intel.com]
> Sent: den 15 juni 2017 16:19
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Burton, Ross
> <ross.burton@intel.com>
> Cc: OE-core <openembedded-core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH 01/11] gtk+3: Update the patches to work
> without PATCHTOOL =3D "git"
>=20
> On 06/15/2017 05:11 PM, Peter Kjellerstedt wrote:
>=20
> >> My apologies, but I do not think this is a satisfactory answer: it
> >> may mean you are fixing the wrong problem, or a problem that does=20
> >> not exist.
> >>
> >> Alex
> >
> > Well, I am pretty sure Git patches that rename files are not supposed
> > to be used, since quilt does not support this AFAIK. So the change in
> > this patch should be correct.
> >
> > However, I would be more than happy if anyone can explain why others
> > are not seeing this (or does everyone have PATCHTOOL =3D "git" in their
> > configurations somehow?)
>=20
> This is unlikely; I certainly don't. Perhaps if you provide the exact
> command that is being executed, and what is the error it prints, I
> could try to do the same?

Well, I was running "bitbake core-image-sato", but "bitbake gtk+3" should=20
do...

> Alex

//Peter


