Received: from mx4.leapfrog.com ([63.114.26.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dlazzari@leapfrog.com>) id 1R66wg-0000tg-KO
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 22:29:34 +0200
Received: from mx4.leapfrog.com (localhost [127.0.0.1])
	by localhost.leapfrog.com (Postfix) with ESMTP id 2E0525EA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 13:24:14 -0700 (PDT)
Received: from NAEXCHHT01.na.leapfrog.com (unknown [10.15.6.13])
	by mx4.leapfrog.com (Postfix) with ESMTP id F37DB5E6D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 13:24:13 -0700 (PDT)
Received: from NAEMCASHT01.na.leapfrog.com (10.16.4.161) by
	NAEXCHHT01.na.leapfrog.com (10.15.6.13) with Microsoft SMTP Server
	(TLS) id 8.2.254.0; Tue, 20 Sep 2011 13:24:13 -0700
Received: from NAEMMAIL01.na.leapfrog.com ([fe80::252e:28a6:3d8f:6991]) by
	NAEMCASHT01.na.leapfrog.com ([::1]) with mapi id 14.01.0289.001;
	Tue, 20 Sep 2011 13:24:13 -0700
From: Daniel Lazzari <dlazzari@leapfrog.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Re: [OE-core] Correct way of having the PN package depend on
Thread-Index: Acx300IrEudxd1Q2T2S6UDkqrYDaUQ==
Date: Tue, 20 Sep 2011 20:24:12 +0000
Message-ID: <E7A9054A5ACABE48B0E540E46E862B0F011F65@NAEMMAIL01.na.leapfrog.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.100.2.5]
MIME-Version: 1.0
Subject: Re: Correct way of having the PN package depend on
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
X-List-Received-Date: Tue, 20 Sep 2011 20:29:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> On 9/20/11 2:03 PM, Daniel Lazzari wrote:
> > I noticed a problem with the alsa-utils package where the alsa-utils pa=
ckage does not depend on all of the little extra packages it's supposed to =
pull in. I'm not sure what the best way to fix this is though. Can anyone g=
ive me a little guidance or point me at a recipe that does this correctly a=
lready?
>=20
> If you are using the RPM backend, I'm currently working on something that=
 may
resolve this issue for you.  Hopefully ready today.
>=20
> Otherwise, switch to ipk or deb and see if you get the same behavior.

I'm using ipk already.

> I don't see why this is a problem, personally. If someone wants a recipe'=
s main package to depend on the other packages it emits, they're free to ma=
ke the recipe do so. But the ${PN} package is not defined to include everyt=
hing from the recipe, it never has been.

I understand that. With the alsa-utils package, the recipe specifically men=
tions
# This are all packages that we need to make. Also, the now empty alsa-util=
s
# ipk depends on them.

Right above adding packages such as "alsa-utils-alsamixer" to the PACKAGES =
variable. I need all of those more specific packages and if I understand co=
rrectly, I should be able to get them by just adding the "alsa-utils" packa=
ge to my custom image.

Dan Lazzari Jr.
Firmware Engineer
dlazzari@leapfrog.com




