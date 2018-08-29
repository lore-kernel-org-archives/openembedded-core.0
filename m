Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3E1078E72
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 09:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A471418400;
	Wed, 29 Aug 2018 11:18:02 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Cqse0EWJ4qge; Wed, 29 Aug 2018 11:18:01 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id BC17018330;
	Wed, 29 Aug 2018 11:18:01 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A60E1E0A1;
	Wed, 29 Aug 2018 11:18:01 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E3F91E08F;
	Wed, 29 Aug 2018 11:18:01 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed, 29 Aug 2018 11:18:01 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 8F06F311C;
	Wed, 29 Aug 2018 11:18:01 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 29 Aug 2018 11:18:01 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Wed, 29 Aug 2018 11:18:01 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Hongxu Jia <hongxu.jia@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 2/2] security_flags.inc: add
	var-FSTACK_PROTECTOR	to improve variable OVERRIDES
Thread-Index: AQHUP3d51Kz3W/0GPkmeFJ0S/nICVKTWcc4g
Date: Wed, 29 Aug 2018 09:18:01 +0000
Message-ID: <dcef97cf1a06461aabe990674fd25bd9@XBOX02.axis.com>
References: <1535533498-36841-1-git-send-email-hongxu.jia@windriver.com>
	<1535533498-36841-2-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1535533498-36841-2-git-send-email-hongxu.jia@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 2/2] security_flags.inc: add var-FSTACK_PROTECTOR	to improve variable OVERRIDES
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
X-List-Received-Date: Wed, 29 Aug 2018 09:18:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Hongxu Jia
> Sent: den 29 augusti 2018 11:05
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 2/2] security_flags.inc: add var-
> FSTACK_PROTECTOR to improve variable OVERRIDES
>=20
> There are var-SECURITY_PIE_CFLAGS, var-lcl_maybe_fortify and
> var-SECURITY_STRINGFORMAT which are helpful for OVERRIDES.
>=20
> Also add var-FSTACK_PROTECTOR, and drop hardcoded `_remove'
> overrides. Such as `4ca946c security_flags: use -fstack-protector-strong'=
,
> it s/-fstack-protector-all/-fstack-protector-strong/, only tweak
> var-FSTACK_PROTECTOR is sufficient.
>=20
> The fix does not have any side affect on SECURITY_CFLAGS of glibc/
> glibc-initial/gcc-runtime, these three directly assigned with "".
> ...
> SECURITY_CFLAGS_pn-glibc =3D ""
> SECURITY_CFLAGS_pn-glibc-initial =3D ""
> SECURITY_CFLAGS_pn-gcc-runtime =3D ""
> ...
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/conf/distro/include/security_flags.inc | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/security_flags.inc
> b/meta/conf/distro/include/security_flags.inc
> index e113f99..6602ec0 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -21,11 +21,13 @@ SECURITY_PIE_CFLAGS ?=3D "${@'' if '${GCCPIE}' else '=
-pie -fPIE'}"
>=20
>  SECURITY_NOPIE_CFLAGS ?=3D "-no-pie -fno-PIE"
>=20
> -SECURITY_CFLAGS ?=3D "-fstack-protector-strong ${SECURITY_PIE_CFLAGS} ${=
lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
> -SECURITY_NO_PIE_CFLAGS ?=3D "-fstack-protector-strong ${lcl_maybe_fortif=
y} ${SECURITY_STRINGFORMAT}"
> +FSTACK_PROTECTOR ?=3D "-fstack-protector-strong"

May I suggest to call it SECURITY_STACK_PROTECTOR instead? That aligns=20
it better with the other variables.

> -SECURITY_LDFLAGS ?=3D "-fstack-protector-strong -Wl,-z,relro,-z,now"
> -SECURITY_X_LDFLAGS ?=3D "-fstack-protector-strong -Wl,-z,relro"
> +SECURITY_CFLAGS ?=3D "${FSTACK_PROTECTOR} ${SECURITY_PIE_CFLAGS} ${lcl_m=
aybe_fortify} ${SECURITY_STRINGFORMAT}"
> +SECURITY_NO_PIE_CFLAGS ?=3D "${FSTACK_PROTECTOR} ${lcl_maybe_fortify} ${=
SECURITY_STRINGFORMAT}"
> +
> +SECURITY_LDFLAGS ?=3D "${FSTACK_PROTECTOR} -Wl,-z,relro,-z,now"
> +SECURITY_X_LDFLAGS ?=3D "${FSTACK_PROTECTOR} -Wl,-z,relro"
>=20
>  # powerpc does not get on with pie for reasons not looked into as yet
>  GCCPIE_powerpc =3D ""
> @@ -56,9 +58,9 @@ SECURITY_STRINGFORMAT_pn-gcc =3D ""
>  TARGET_CC_ARCH_append_class-target =3D " ${SECURITY_CFLAGS}"
>  TARGET_LDFLAGS_append_class-target =3D " ${SECURITY_LDFLAGS}"
>=20
> -SECURITY_LDFLAGS_remove_pn-gcc-runtime =3D "-fstack-protector-strong"
> -SECURITY_LDFLAGS_remove_pn-glibc =3D "-fstack-protector-strong"
> -SECURITY_LDFLAGS_remove_pn-glibc-initial =3D "-fstack-protector-strong"
> +FSTACK_PROTECTOR_pn-gcc-runtime =3D ""
> +FSTACK_PROTECTOR_pn-glibc =3D ""
> +FSTACK_PROTECTOR_pn-glibc-initial =3D ""
>  # All xorg module drivers need to be linked this way as well and are
>  # handled in recipes-graphics/xorg-driver/xorg-driver-common.inc
>  SECURITY_LDFLAGS_pn-xserver-xorg =3D "${SECURITY_X_LDFLAGS}"
> --
> 2.7.4

//Peter


