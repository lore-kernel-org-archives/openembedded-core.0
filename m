Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 127D277BD1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 May 2017 11:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 242432E3DA;
	Thu,  4 May 2017 13:30:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id AkxAhRtIUIbj; Thu,  4 May 2017 13:30:09 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 765202E3D9;
	Thu,  4 May 2017 13:30:09 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 357FC1A086;
	Thu,  4 May 2017 13:30:09 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 294E61A084;
	Thu,  4 May 2017 13:30:09 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu,  4 May 2017 13:30:09 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 1D536284D;
	Thu,  4 May 2017 13:30:09 +0200 (CEST)
Received: from xbox11.axis.com (10.0.5.25) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 4 May 2017 13:30:09 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 4 May 2017 13:30:08 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Thu, 4 May 2017 13:30:09 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Thread-Topic: Regression with RPM4 and unversioned DSOs
Thread-Index: AdLEsoPKOyEk7xv/RUaij3j/OAHacf//8hUA///GM4A=
Date: Thu, 4 May 2017 11:30:08 +0000
Message-ID: <e361d15615e24c2eb9cc5b799bcfe834@XBOX02.axis.com>
References: <c70316f009e94504b29ff2b9d177dd33@XBOX02.axis.com>
	<b5e9622b-3b01-a793-21ea-b15ea730e8bd@linux.intel.com>
In-Reply-To: <b5e9622b-3b01-a793-21ea-b15ea730e8bd@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Regression with RPM4 and unversioned DSOs
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
X-List-Received-Date: Thu, 04 May 2017 11:30:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Alexander Kanavin [mailto:alexander.kanavin@linux.intel.com]
> Sent: den 4 maj 2017 11:54
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Cc: OE Core (openembedded-core@lists.openembedded.org) <openembedded-
> core@lists.openembedded.org>
> Subject: Re: Regression with RPM4 and unversioned DSOs
>=20
> On 05/04/2017 11:46 AM, Peter Kjellerstedt wrote:
> > Since I would very much like to avoid having to add explicit runtime
> > dependencies for all those dependencies that were previously
> automatically
> > detected, which would be a nightmare, I am now looking for any help
> as to
> > where to find the code that adds the dependencies on the packages
> providing
> > DSOs and to see if it is possible to change it to also detect
> dependencies
> > on unversioned DSOs.
>=20
> I'm not sure such implicit dependency detection at rpm generation point
> is guaranteed to work in the first place. Don't we have a package_qa
> check for this that should be failing? Can you publish a minimal layer
> so I can reproduce locally?
>=20
> If you want to poke in rpm4 source, I think grepping for
> use_internal_dependency_generator is a good starting point.

I was more thinking of the code in OE-core that generates the list of=20
Requires that goes into the spec file. The matching sections from the=20
spec files for the apta-utility package that I used as example in my=20
first mail are (for Pyro):

Requires: libc6 >=3D 2.25

and (for Morty):

Requires: ld.so.1
Requires: ld.so.1(GLIBC_2.4)
Requires: libapta.so
Requires: libc.so.6
Requires: libc.so.6(GLIBC_2.0)
Requires: libc.so.6(GLIBC_2.2)
Requires: libc.so.6(GLIBC_2.3)
Requires: libc.so.6(GLIBC_2.3.4)
Requires: libc.so.6(GLIBC_2.4)
Requires: libc.so.6(GLIBC_2.7)
Requires: libc6 >=3D 2.24
Requires: libubihelper.so
Provides: elf(buildid) =3D 097a4862c4d6275838e8eb5759501630b7913485

So I think it is quite obvious that something has changed in OE-core in=20
how these lists are generated... It is also apparent that the problem=20
with lack of dependencies on packages with unversioned DSOs was already=20
present in Morty. However, since it was hidden by the direct dependencies=20
on the DSOs it was not apparent before.

Does RPM4 support dependencies on DSOs, or was that an RPM5 feature?
If RPM4 supports it, why was it removed when dnf was introduced?

> Alex

//Peter


