Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RrVUk-0001zX-Ce
	for openembedded-core@lists.openembedded.org;
	Sun, 29 Jan 2012 15:12:38 +0100
Received: by wgbdt11 with SMTP id dt11so3205243wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2012 06:04:47 -0800 (PST)
Received: by 10.180.107.34 with SMTP id gz2mr18549847wib.21.1327845886978;
	Sun, 29 Jan 2012 06:04:46 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id j16sm42773645wie.4.2012.01.29.06.04.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jan 2012 06:04:46 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F25501F.9000606@emagii.com>
Date: Sun, 29 Jan 2012 15:04:43 +0100
Message-Id: <F45F79CC-7B1A-4256-B81E-4F31B3F59187@dominion.thruhere.net>
References: <4F25501F.9000606@emagii.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: bitbake -c clean <package> fails
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
X-List-Received-Date: Sun, 29 Jan 2012 14:12:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 jan. 2012, om 14:56 heeft Ulf Samuelsson het volgende geschreven:

> Tried to test downloading "module-init-tools" from a new =
KERNELORG_MIRROR
>=20
> First I attempted to just remove the source tarball from the downloads =
directory.
> No download, but build completed.
>=20
> The I tried to clean out the "module-init-tools" directory:
>=20
> $ bitbake -c clean module-init-tools
>=20
> and run bitbake console-image.
> The build completed with no source tarball, after the clean.
>=20
> Only when I cleaned out the build/sstate-cache directory,
> was the file downloaded and built from a new tarball
>=20
> Should not "bitbake -c clean" remove files in the cache?
>=20
> If not, Is there another bitbake command which cleans out the cache?

-c cleansstate=


