Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1BB7D74D14
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 23:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 5ADFC185C0;
	Sat,  5 May 2018 01:23:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id fpL5IFd8eiA2; Sat,  5 May 2018 01:23:40 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 63939185B0;
	Sat,  5 May 2018 01:23:40 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 501CF1E07C;
	Sat,  5 May 2018 01:23:40 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 442791E07B;
	Sat,  5 May 2018 01:23:40 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Sat,  5 May 2018 01:23:40 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 37C262764;
	Sat,  5 May 2018 01:23:40 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Sat, 5 May 2018 01:23:40 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Sat, 5 May 2018 01:23:40 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Andre McCurdy <armccurdy@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 8/8] rpm: move ASNEEDED over-ride into the rpm
	recipe
Thread-Index: AQHT4/rQ1RHWRQShukSUlppjbVIIz6QgNPwg
Date: Fri, 4 May 2018 23:23:39 +0000
Message-ID: <8ba5b8b622744aa783b1963437fc1cce@XBOX02.axis.com>
References: <1525474370-7913-1-git-send-email-armccurdy@gmail.com>
	<1525474370-7913-8-git-send-email-armccurdy@gmail.com>
In-Reply-To: <1525474370-7913-8-git-send-email-armccurdy@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 8/8] rpm: move ASNEEDED over-ride into the rpm	recipe
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
X-List-Received-Date: Fri, 04 May 2018 23:23:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Andre McCurdy
> Sent: den 5 maj 2018 00:53
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 8/8] rpm: move ASNEEDED over-ride into the
> rpm recipe
>=20
> Move the recipe specific over-ride for ASNEEDED into the recipe to
> make it more apparent that the over-ride is being applied (and that
> it should be re-checked on version updates, etc).
>=20
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  meta/recipes-devtools/rpm/rpm_4.14.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/rpm/rpm_4.14.1.bb b/meta/recipes-devto=
ols/rpm/rpm_4.14.1.bb
> index 818d3ef..d49530e 100644
> --- a/meta/recipes-devtools/rpm/rpm_4.14.1.bb
> +++ b/meta/recipes-devtools/rpm/rpm_4.14.1.bb
> @@ -73,6 +73,8 @@ BBCLASSEXTEND =3D "native nativesdk"
>  PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[imaevm] =3D "--with-imaevm,,ima-evm-utils"
>=20
> +ASNEEDED =3D ""
> +
>  # Direct rpm-native to read configuration from our sysroot, not the one =
it was compiled in
>  # libmagic also has sysroot path contamination, so override it
>  do_install_append_class-native() {
> --
> 1.9.1

This patch does not remove ASNEEDED_pn-rpm =3D "" from the=20
meta/conf/distro/include/as-needed.inc file.

Also, shouldn't ASNEEDED_pn-openobex =3D "" in=20
meta/conf/distro/include/as-needed.inc be moved to the recipe=20
in meta-oe to complete the patch set?

//Peter


