Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
	by mail.openembedded.org (Postfix) with ESMTP id 30B167FA1A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 00:34:57 +0000 (UTC)
IronPort-SDR: emLH6ZZsT2+7FwAtmEKSZN5IAPUSOTCuQqKn93bYAH1F3IuypFqoBn2w7xOdiKmjvpCkhareBi
	I3qBNmW4VeBsX7W6qsQ+dKXoDn6ewflp882sVmqTGgjzl3cY2Dse5014NUqzbfVH8s8JvG3OR2
	1kPd1n/u7Wm7kgjMabDQzgWamGib2jcCFXtypB6IA4zcNAuUFNk6iJvWzJiZh9uUZ+hLRdo4yT
	BtuSz3Ri2EBSD4gH8tss06zrf0reyYfR2NKNr3eQ+90PUkAThmiwL2LHw4COjDdvtMRfoAFNZB
	UvU=
X-IronPort-AV: E=Sophos;i="5.69,301,1571695200"; 
   d="scan'208";a="3461754"
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, oe-core
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] connman dependency of readline
Thread-Index: AQHVrRS4iSsyKcPrK0mc3DtFanBJiKe0GP6g
Date: Wed, 11 Dec 2019 00:34:57 +0000
Message-ID: <89df20728e824340bd9f7193b01cf978@XBOX03.axis.com>
References: <8746d8e88a538d8abede3a76718fd594ca895af0.camel@gmail.com>
In-Reply-To: <8746d8e88a538d8abede3a76718fd594ca895af0.camel@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Subject: Re: connman dependency of readline
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
X-List-Received-Date: Wed, 11 Dec 2019 00:34:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of claus.stovgaard@gmail.com
> Sent: den 7 december 2019 16:41
> To: oe-core <openembedded-core@lists.openembedded.org>
> Subject: [OE-core] connman dependency of readline
>=20
> Hi
>=20
> I am starting to use Yocto / OpenEmbedded, where I was looking into
> using ConnMan as network manager.
>=20
> Though I was wondering about the readline dependency.
> Looking at the recipe
> https://github.com/openembedded/openembedded-core/blob/master/meta/recipe=
s-connectivity/connman/connman.inc
> it is set to always depend on readline in the DEPENDS variable, even
> though as far as I know it is only the connmanctl which depend on
> readline.
> In EXTRA_OECONF the --enable-client is hardcoded.
>=20
> The client is though not included in the image unless you also add
> connman-client.
>=20
> So I am thinking on creating a patch where I create a
> PACKAGECONFIG[readline] like bluez5, as I would not need the client and
> will need not to include readline because of GPLv3.

If readline is only needed to build the connman client and it is=20
packaged in a separate package, then you are only affected by=20
readline's GPL-3.0 license if you install that package. If you do=20
not install it you are ok even if readline is needed during the=20
build. So there should not be any real need to disable the building=20
of the client.

> I guess email is the prefered way for patches compared to github pull
> requests?
>=20
> Instead of my idea of creating as PACKAGECONFIG[readline], is there a
> better way so it is only included if connman-client is used, instead of
> just connman?
>=20
> Have a nice weekend.
> Claus Stovgaard

//Peter


