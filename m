Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id 510C761566
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 17:16:40 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id rBAHGVmF014804;
	Tue, 10 Dec 2013 18:16:36 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0347.000; Tue, 10 Dec 2013 18:16:31 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] Can OE build it's own make?
Thread-Index: Ac71xM5yR72EFBjlQrOfvK5m9rtDxf//8wgAgAAY138=
Date: Tue, 10 Dec 2013 17:16:29 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FD9BBEE@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4FD9BB97@post.tritech.se>,
	<CAJTo0LZ7jfC7UJtYvVCywVGnSkfvHsUcc+1Z7ZW1NNyKYHHXUg@mail.gmail.com>
In-Reply-To: <CAJTo0LZ7jfC7UJtYvVCywVGnSkfvHsUcc+1Z7ZW1NNyKYHHXUg@mail.gmail.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.82]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Can OE build it's own make?
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
X-List-Received-Date: Tue, 10 Dec 2013 17:16:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On: Tuesday, December 10, 2013 5:41 PM, Burton, Ross wrote:=0A=
> "bitbake make-native" should be sufficient instructions to build a=0A=
> replacement make.=0A=
=0A=
Ouch, that was simple.=0A=
Unfortunately the consistently failing build doesn't feel like failing=0A=
right now so I can't verify that it works.=0A=
=0A=
Assuming that it works, I could of course add make-native to the=0A=
depends of the troublesome recipe but what if I'd like to use the=0A=
new make for all recipes? Is there somewhere else I could put the=0A=
dependency to force bitbake to build make "first of all"?=0A=
=0A=
BR // Mats=

