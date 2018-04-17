Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 44DA97450B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2018 00:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 5440E183E4;
	Tue, 17 Apr 2018 02:34:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 2XB9pKQo-odx; Tue, 17 Apr 2018 02:34:45 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 7E8CD18378;
	Tue, 17 Apr 2018 02:34:45 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C4401A094;
	Tue, 17 Apr 2018 02:34:45 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4EEF91A05B;
	Tue, 17 Apr 2018 02:34:45 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 17 Apr 2018 02:34:45 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id 42D2D2ECB;
	Tue, 17 Apr 2018 02:34:45 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Tue, 17 Apr 2018 02:34:44 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Tue, 17 Apr 2018 02:34:45 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "liu.ming50@gmail.com" <liu.ming50@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH V2] externalsrc.bbclass: introduce
	INHIBIT_SRCTREE_FILE_CHECKSUMES
Thread-Index: AQHT1eKS4DUmTx6ONUC2AlWIbmZl2aQEG66g
Date: Tue, 17 Apr 2018 00:34:45 +0000
Message-ID: <71cdd480b91641c0967948e7db68e82f@XBOX02.axis.com>
References: <1523924710-21480-1-git-send-email-liu.ming50@gmail.com>
In-Reply-To: <1523924710-21480-1-git-send-email-liu.ming50@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH V2] externalsrc.bbclass: introduce	INHIBIT_SRCTREE_FILE_CHECKSUMES
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
X-List-Received-Date: Tue, 17 Apr 2018 00:34:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> liu.ming50@gmail.com
> Sent: den 17 april 2018 02:25
> To: openembedded-core@lists.openembedded.org
> Cc: Ming Liu <liu.ming50@gmail.com>
> Subject: [OE-core] [PATCH V2] externalsrc.bbclass: introduce INHIBIT_SRCT=
REE_FILE_CHECKSUMES

Please correct the subject as well.

> From: Ming Liu <liu.ming50@gmail.com>
>=20
> It defaults to be '0', but it allows the developers to choose not add
> file-checksums to do_compile for the entire source tree, by setting to
> '1'.
>=20
> We need this because we have a huge project with 100G bytes source
> files, and we do not want them to be added to file-checksums variable
> flag.
>=20
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  meta/classes/externalsrc.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/externalsrc.bbclass
> b/meta/classes/externalsrc.bbclass
> index c9f5cf7..2b83193 100644
> --- a/meta/classes/externalsrc.bbclass
> +++ b/meta/classes/externalsrc.bbclass
> @@ -26,6 +26,7 @@
>=20
>  SRCTREECOVEREDTASKS ?=3D "do_patch do_unpack do_fetch"
>  EXTERNALSRC_SYMLINKS ?=3D "oe-workdir:${WORKDIR} oe-logs:${T}"
> +INHIBIT_SRCTREE_FILE_CHECKSUMS ?=3D "0"
>=20
>  python () {
>      externalsrc =3D d.getVar('EXTERNALSRC')
> @@ -212,7 +213,7 @@ def srctree_hash_files(d, srcdir=3DNone):
>          with open(oe_hash_file, 'w') as fobj:
>              fobj.write(sha1)
>          ret =3D oe_hash_file + ':True'
> -    else:
> +    elif not d.getVar('INHIBIT_SRCTREE_FILE_CHECKSUMS'):
>          ret =3D s_dir + '/*:True'
>      return ret
>=20
> --
> 2.7.4

//Peter


