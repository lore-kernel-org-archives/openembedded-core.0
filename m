Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id 777346D145
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2013 13:28:39 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id rAIDSZx4026197;
	Mon, 18 Nov 2013 14:28:40 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0347.000; Mon, 18 Nov 2013 14:28:36 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: Phil Blundell <pb@pbcl.net>
Thread-Topic: [OE-core] RPROVIDES not package specific with native and added
	package
Thread-Index: Ac7kW/uiPKrHrTmoRhqqcp3NSngBhv//9ZWAgAARVBj///D2AIAAE45p
Date: Mon, 18 Nov 2013 13:28:36 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FD505D5@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4FD50595@post.tritech.se>
	,<1384780059.23724.26.camel@phil-desktop.brightsign>
	<ED3E0BCACD909541BA94A34C4A164D4C4FD505BB@post.tritech.se>,
	<1384780550.23724.29.camel@phil-desktop.brightsign>
In-Reply-To: <1384780550.23724.29.camel@phil-desktop.brightsign>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.82]
MIME-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RPROVIDES not package specific with native and added package
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
X-List-Received-Date: Mon, 18 Nov 2013 13:28:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Monday, November 18, 2013 2:15 PM, Phil Blundell wrote:=0A=
>> Subject: Re: [OE-core] RPROVIDES not package specific with native and ad=
ded package=0A=
>> =0A=
>> Oh, right, I see.  Does it help if you use "PACKAGES =3D+ .." rather tha=
n=0A=
>> "PACKAGES_prepend =3D "?=0A=
=0A=
Yes it does!!=0A=
=0A=
Could you tell me why?=0A=
Er... better could you tell me where's the best place to read so I don't ha=
ve to make these mistakes again?=0A=
=0A=
BR // Mats=0A=

