Return-Path: <sona.sarmadi@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 4544C65D58
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 15:44:41 +0000 (UTC)
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.03.0158.001; Thu, 9 Oct 2014 17:44:40 +0200
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [daisy][PATCH2/4] layer.conf: Mark opkg-utils as
	ABISAFE for update-alternatives usage
Thread-Index: Ac/j17NA9fkllHrSRsOAJZSwIhfqzQ==
Date: Thu, 9 Oct 2014 15:44:40 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E4825762BC8@SESTOEX04.enea.se>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.21.1.188]
MIME-Version: 1.0
Subject: Re: [daisy][PATCH2/4] layer.conf: Mark opkg-utils as ABISAFE for update-alternatives usage
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
X-List-Received-Date: Thu, 09 Oct 2014 15:44:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please ignore this email, this was sent by mistake.=20

/Sona

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Sona Sarmadi
> Sent: den 9 oktober 2014 14:25
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [daisy][PATCH2/4] layer.conf: Mark opkg-utils as ABISA=
FE
> for update-alternatives usage
>=20
> From: Steffen Sledz <sledz@dresearch-fe.de>
>=20
> Currently linux-firmware rebuilds for each machine due to its usage of
> update-alternatives which in turn means a dependency on opkg-utils.
> Marking opkg-utils as ABISAFE is the only option we have right now to avo=
id
> this.
>=20
> (From OE-Core rev: e4c4ca3101062ecc956294ac968dc488321eb33b)
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/layer.conf | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf index
> a764ee0..13814dc 100644
> --- a/meta/conf/layer.conf
> +++ b/meta/conf/layer.conf
> @@ -14,6 +14,7 @@ LAYERVERSION_core =3D "4"
>  # Set a variable to get to the top of the metadata location  COREBASE =
=3D
> '${@os.path.normpath("${LAYERDIR}/../")}'
>=20
> +# opkg-utils is for update-altnernatives :(
>  SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
>    sysvinit-inittab \
>    shadow-securetty \
> @@ -34,4 +35,5 @@ SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
>    shadow \
>    shadow-sysroot \
>    base-passwd \
> +  opkg-utils \
>  "
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

