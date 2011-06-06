Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QTfcB-0006oi-5V
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Jun 2011 21:37:31 +0200
Received: by wye20 with SMTP id 20so3514983wye.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jun 2011 12:34:14 -0700 (PDT)
Received: by 10.216.229.82 with SMTP id g60mr2828235weq.70.1307388854279;
	Mon, 06 Jun 2011 12:34:14 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id h22sm2484989wes.32.2011.06.06.12.34.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Jun 2011 12:34:13 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DED055A.8010200@linux.intel.com>
Date: Mon, 6 Jun 2011 21:34:11 +0200
Message-Id: <6030AFD1-A5A0-4DDC-B932-DF63CC886A58@dominion.thruhere.net>
References: <cover.1307342214.git.sgw@linux.intel.com>	<3eba2df4c6f2371db24ab2420d037b992725cb84.1307342214.git.sgw@linux.intel.com>	<1307343323.3131.1.camel@lenovo.internal.reciva.com>
	<1307357430.7672.7.camel@rex> <4DED055A.8010200@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [CONSOLIDATED PULL 01/20] bitbake.conf: Create staticlibs pacakge for static libraries
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Jun 2011 19:37:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 jun 2011, om 18:50 heeft Saul Wold het volgende geschreven:

> On 06/06/2011 03:50 AM, Richard Purdie wrote:
>> On Mon, 2011-06-06 at 07:55 +0100, Phil Blundell wrote:
>>> On Sun, 2011-06-05 at 23:44 -0700, Saul Wold wrote:
>>>>  SECTION_${PN}-dev =3D "devel"
>>>>  ALLOW_EMPTY_${PN}-dev =3D "1"
>>>>  RDEPENDS_${PN}-dev =3D "${PN} (=3D ${EXTENDPKGV})"
>>>>=20
>>>> +FILES_${PN}-staticlibs =3D "${libdir}/*.a ${base_libdir}/*.a"
>>>> +SECTION_${PN}-staticlibs =3D "devel"
>>>> +RDEPENDS_${PN}-staticlibs =3D "${PN}-dev (=3D ${EXTENDPV})"
>>>=20
>>> This should be ${EXTENDPKGV}, right?
>>=20
>> It should.
>>=20
>> I'm also not 100% convinced I like "-staticlibs" vs "-staticdev" as =
it
>> doesn't feel consistent.
>>=20
>> The user gets exposed to these at the package manager level and will
>> "xxx install xxx-staticX". The end result they'll get will be the
>> installation of everything they need for static development (i.e. the
>> -dev packages will get pulled in for the headers). This means they =
don't
>> just result in the static libs as there are dependencies there. =46rom =
the
>> user perspective they are therefore packages for static development, =
not
>> just the static libraries...
>>=20
> Richard,
>=20
> I agree that they are for development and that by their nature they =
have a dependency on the Development packages, but they contain libs =
only, not all the development headers or tools, I think its therefore =
mis-leading to call the package staticdev since they do not contain all =
the development bits (they might depend on all the bits).  It's a subtle =
but important distinction.
>=20
> As was pointed out earlier Fedora packages static libraries in a =
"-static" package, but this had other implications for OE due to -static =
already being in use (for busybox and mplayer), I am not sure that this =
is not a problem for OE-Core, I would need to investigate.  Meego also =
seems to use the Fedora standard with "-static".

I just brought that up as the only 2 points of conflict I remember, I =
still like the '-static' name. But I'm biased since I did this in -dev a =
while ago :)=


