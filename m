Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QNLDw-0001OH-8X
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 10:38:20 +0200
Received: by wye20 with SMTP id 20so2831002wye.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 01:35:23 -0700 (PDT)
Received: by 10.227.58.15 with SMTP id e15mr4000375wbh.28.1305880523450;
	Fri, 20 May 2011 01:35:23 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id w25sm2119555wbd.56.2011.05.20.01.35.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 May 2011 01:35:22 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <BF0FE697-3489-4B92-AB20-36DE6B63E5C0@dominion.thruhere.net>
Date: Fri, 20 May 2011 10:35:16 +0200
Message-Id: <64B63E8F-CC96-4A36-B637-F9E12E3BCCAE@dominion.thruhere.net>
References: <BF0FE697-3489-4B92-AB20-36DE6B63E5C0@dominion.thruhere.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: New fetcher failure for local files
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
X-List-Received-Date: Fri, 20 May 2011 08:38:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 mei 2011, om 09:25 heeft Koen Kooi het volgende geschreven:

> Hi,
>=20
> Since a few days the fetcher is behaving strangely:
>=20
> NOTE: package =
linux-omap-psp-2.6.32-r99b+gitr5fc29e7b2a76a64a739f857858ef0b98294aa155: =
task do_fetch: Started
> ERROR: Function 'Fetcher failure for URL: 'file://defconfig'. Unable =
to fetch URL file://defconfig from any source.' failed
>=20
> It is present:
>=20
> koen@dominion:/OE/tentacle/sources/meta-texasinstruments$ find . -name =
"defconfig" | grep beagle
> ./recipes-bsp/linux/linux-omap-psp-2.6.32/beagleboard/defconfig
> ./recipes-bsp/linux/linux-omap/beagleboard/defconfig
>=20
> The strange thing is that it will work once (e.g. bitbake =
console-image) but it will fail after switching TCLIBC. And once it =
started failing, it doesn't work for the default TCLIBC either.
>=20
> What's the best way to debug this? -DDD isn't giving much clues, nor =
does strace :(

It seems that this was caused by a malformed OVERRIDES variable. It was =
fixed by =
http://git.angstrom-distribution.org/cgi-bin/cgit.cgi/meta-angstrom/commit=
/?id=3D7ace4c81e4f546a2a0cb1389463f227344567251

It didn't get caught since a build from scratch was always successfull.=20=


regards,

Koen=


