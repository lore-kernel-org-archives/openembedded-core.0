Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id B65C87024B
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Jul 2014 10:04:35 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id s65A4UaJ008290;
	Sat, 5 Jul 2014 12:04:35 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0387.000; Sat, 5 Jul 2014 12:04:29 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: Life Life <sadlife1990@gmail.com>, "Patches and discussions about the
	oe-core layer" <openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Could not inherit	file
	classes/rootfs_${IMAGE_PKGTYPE}.bbclass
Thread-Index: AQHPmDdwe3ww6XOA3UyZyakxDGyB+JuRP6vI
Date: Sat, 5 Jul 2014 10:04:29 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C5B43AB08@post.tritech.se>
References: <CAAHuHfyssKi6tXjKFwBHXNPuCLPXwyx3CKR14=g=w5REakyjMA@mail.gmail.com>,
	<ED3E0BCACD909541BA94A34C4A164D4C5B43AAF6@post.tritech.se>
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B43AAF6@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [195.84.96.49]
MIME-Version: 1.0
Subject: Re: Could not inherit	file	classes/rootfs_${IMAGE_PKGTYPE}.bbclass
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
X-List-Received-Date: Sat, 05 Jul 2014 10:04:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi again,=0A=
=0A=
On Saturday, July 05, 2014 11:55 AM, Mats K=E4rrman wrote:=0A=
> On Saturday, July 05, 2014 10:42 AM, Life Life wrote:=0A=
>> I'm trying build simple image and I run this command bitbake console-ima=
ge After I see this error. How to solve this problem ?=0A=
>> ERROR: ParseError at /home/setup-scripts/sources/openembedded-core/meta/=
classes/image.bbclass:1: Could not inherit file classes/rootfs_${IMAGE_PKGT=
YPE}.bbclass=0A=
>=0A=
> If you run your build command with the '-e' switch, what do you get for I=
MAGE_PKGTYPE? E.g:=0A=
>=0A=
> $ bitbake console-image -e |egrep '^IMAGE_PKGTYPE'=0A=
=0A=
Or, to cut things short a bit..=0A=
Your configuration, e.g. config/local.conf should contain something like th=
is:=0A=
=0A=
PACKAGE_CLASSES =3D "package_ipk"=0A=
=0A=
or=0A=
=0A=
PACKAGE_CLASSES =3D "package_rpm"=0A=
=0A=
This class will then set a value for IMAGE_PKGTYPE.=0A=
=0A=
BR // Mats=

