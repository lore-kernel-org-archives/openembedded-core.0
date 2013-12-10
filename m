Return-Path: <Mats.Karrman@tritech.se>
Received: from tritech.se (tritech.se [46.59.120.190])
	by mail.openembedded.org (Postfix) with ESMTP id E7BC560B9B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 16:36:47 +0000 (UTC)
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id rBAGaetW014707
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 17:36:45 +0100
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%10]) with mapi id
	14.02.0347.000; Tue, 10 Dec 2013 17:36:40 +0100
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Can OE build it's own make?
Thread-Index: Ac71xM5yR72EFBjlQrOfvK5m9rtDxQ==
Date: Tue, 10 Dec 2013 16:36:38 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4FD9BB97@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.82]
MIME-Version: 1.0
Subject: Can OE build it's own make?
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
X-List-Received-Date: Tue, 10 Dec 2013 16:36:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,=0A=
=0A=
I have run into problems with make.=0A=
=0A=
Most things works fine with make v3.81 but when building a kernel recipe (m=
eta-fsl-arm linux-imx-3.10.9)=0A=
I consistently get:=0A=
=0A=
make: INTERNAL: Exiting with 5 jobserver tokens available; should be 4!=0A=
=0A=
To solve this I "manually" upgraded make on my machine to v3.82 which soon =
brought new problems.=0A=
I then realized that OE-core got a recipe for make v3.82 with a number of p=
atches. After rebuilding=0A=
make using those patches, everything now seems to work fine :-D.=0A=
=0A=
It would be nice, however, if I didn't have to write detailed instructions =
for everyone on how to patch=0A=
their machines in order to get their builds to work. Is it possible that OE=
 could build it's own make=0A=
to use the same way it compiles a new compiler using the existing one? (bui=
lding make v3.82 using=0A=
make v3.81 works fine;)=0A=
=0A=
BR // Mats=0A=

