Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CBB565C8F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 07:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A792E18446;
	Wed,  5 Sep 2018 09:33:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 7iGfMHKW5TM1; Wed,  5 Sep 2018 09:33:55 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 3384618409;
	Wed,  5 Sep 2018 09:33:55 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C4831E066;
	Wed,  5 Sep 2018 09:33:55 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1055C1E060;
	Wed,  5 Sep 2018 09:33:55 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed,  5 Sep 2018 09:33:55 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 03A852A32;
	Wed,  5 Sep 2018 09:33:55 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 5 Sep 2018 09:33:54 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 5 Sep 2018 09:33:54 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Wed, 5 Sep 2018 09:33:54 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/2 V2] oe/utils.py: Add vartrue()
Thread-Index: AQHURObgspiXYLZLJEGvQ0W1FbCv16ThSc/Q
Date: Wed, 5 Sep 2018 07:33:54 +0000
Message-ID: <7eac4cc6501f4799bb542739f6f7e57d@XBOX02.axis.com>
References: <cover.1536130313.git.liezhi.yang@windriver.com>
	<568c7b051fd166a653c943d618027f7b59e436b5.1536130313.git.liezhi.yang@windriver.com>
In-Reply-To: <568c7b051fd166a653c943d618027f7b59e436b5.1536130313.git.liezhi.yang@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 1/2 V2] oe/utils.py: Add vartrue()
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
X-List-Received-Date: Wed, 05 Sep 2018 07:33:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Robert Yang
> Sent: den 5 september 2018 09:16
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/2 V2] oe/utils.py: Add vartrue()
>=20
> It can be used to simplify code like:
> "${@['iffalse', 'iftrue'][var]}"
>=20
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  meta/lib/oe/utils.py   | 7 +++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index faef771..dbadeb3 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -610,7 +610,7 @@ DEBUG_FLAGS ?=3D "-g -feliminate-unused-debug-types
> ${DEBUG_PREFIX_MAP}"
>  # Disabled until the option works properly -feliminate-dwarf2-dups
>  FULL_OPTIMIZATION =3D "-O2 -pipe ${DEBUG_FLAGS}"
>  DEBUG_OPTIMIZATION =3D "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
> -SELECTED_OPTIMIZATION =3D "${@d.getVar(['FULL_OPTIMIZATION',
> 'DEBUG_OPTIMIZATION'][d.getVar('DEBUG_BUILD') =3D=3D '1'])}"
> +SELECTED_OPTIMIZATION =3D "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD',
> 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
>  SELECTED_OPTIMIZATION[vardeps] +=3D "FULL_OPTIMIZATION
> DEBUG_OPTIMIZATION"
>  BUILD_OPTIMIZATION =3D "-O2 -pipe"
>=20
> diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
> index f22a6ab..914a6f2 100644
> --- a/meta/lib/oe/utils.py
> +++ b/meta/lib/oe/utils.py
> @@ -464,3 +464,10 @@ class ImageQAFailed(bb.build.FuncFailed):
>              msg =3D msg + ' (%s)' % self.description
>=20
>          return msg
> +
> +def vartrue(var, iftrue, iffalse, d):
> +    import oe.types
> +    if oe.types.boolean(d.getVar(var)):
> +        return iftrue
> +    else:
> +        return iffalse

Put it together with ifelse() and conditional() instead, where it better=20
belongs.

You can also implement it as:

def vartrue(var, iftrue, iffalse, d):
    import oe.types
    return oe.utils.ifelse(oe.types.boolean(d.getVar(var), iftrue, iffalse)=
:

> --
> 2.7.4

//Peter


