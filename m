Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RTVDf-0007gT-7d
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 10:03:47 +0100
Received: by ghy10 with SMTP id 10so2311010ghy.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2011 00:57:13 -0800 (PST)
Received: by 10.152.104.6 with SMTP id ga6mr16733294lab.45.1322125033086;
	Thu, 24 Nov 2011 00:57:13 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id jb5sm18594722lab.15.2011.11.24.00.57.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Nov 2011 00:57:12 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 24 Nov 2011 09:57:07 +0100
In-Reply-To: <4ECDF204.7000105@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322102636.git.xiaofeng.yan@windriver.com>	<20d46c74e1c1de68ca86b5b7eded5ae66a142e85.1322102636.git.xiaofeng.yan@windriver.com>
	<2C6A2DBB-2756-4475-9BBF-16A2496EB4A3@dominion.thruhere.net>
	<4ECDF204.7000105@windriver.com>
Message-Id: <F5319183-E0F5-441F-8F19-6F8EC45D3335@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 3/9] gtk.inc: add directfb DISTRO_FEATURE
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
X-List-Received-Date: Thu, 24 Nov 2011 09:03:47 -0000
X-Groupsio-MsgNum: 12879
Content-Type: multipart/signed;
	boundary="Apple-Mail=_783030BA-33CB-45A5-A335-A155107D2D72";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_783030BA-33CB-45A5-A335-A155107D2D72
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


Op 24 nov. 2011, om 08:28 heeft Xiaofeng Yan het volgende geschreven:

> On 2011=E5=B9=B411=E6=9C=8824=E6=97=A5 14:38, Koen Kooi wrote:
>> Op 24 nov. 2011, om 04:06 heeft Xiaofeng Yan het volgende geschreven:
>>=20
>>=20
>>> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>>>=20
>>>=20
>>> gtk run over x11 at current OE-core. If gtk want to run over =
directfb, then \
>>> the configuration related to x11 should be disabled and directfb =
should be enabled.
>>>=20
>> Apart from this patch is messing with PACKAGES as well, I still don't =
believe it's true that x11 must be disabled for directfb to work
>>=20
>>=20
>>=20
> As what I explained yesterday, One main goal of this image is to =
remove the stuff related to x11 because I want to build an image only =
based on directfb and run gtk over directfb. =20

And you can do that perfectly well without disabling x11.

> you know, directfb as a graphic library is enough in many embedded =
development. It has many advantages in embedded field like digital =
television, set-top box, ...  Of course, it has its defect in other =
aspect. So x11 is not needed in this image.  I just don't want to let =
user to take too much time for building an image including directfb with =
no x11 during developing product.=20

I still don't see a decent reason for disabling x11 for directfb



--Apple-Mail=_783030BA-33CB-45A5-A335-A155107D2D72
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7OBuYACgkQMkyGM64RGpF4swCbBoyqHjt9tWgPAwogTb28G2wx
FMwAniE/64b90fsV9bhKRqRU243yfnwv
=g1YY
-----END PGP SIGNATURE-----

--Apple-Mail=_783030BA-33CB-45A5-A335-A155107D2D72--
