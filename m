Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id E813F780AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 14:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 41A882E315
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 16:53:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id Ps7_BQawVeb2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 16:53:07 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id DCB872E272
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 16:53:07 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 911211E081
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 16:53:07 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85E681E080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 16:53:07 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 16:53:07 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 7A480118A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 16:53:07 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Mon, 19 Jun 2017 16:53:07 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Mon, 19 Jun 2017 16:53:07 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Peter Kjellerstedt <pkj@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCHv2 1/1] base-files: profile: Avoid using
	"command"	to determine if programs exist
Thread-Index: AQHStFG25407gFtAtEW2zNryFv62gaIsrsuA
Date: Mon, 19 Jun 2017 14:53:07 +0000
Message-ID: <106084978a804bf8a2b3aa10195bfa9f@XBOX02.axis.com>
References: <cover.1492086566.git.pkj@axis.com>
	<0991deba9e90e3c32f8566fdfc758cb88790bde4.1492086566.git.pkj@axis.com>
In-Reply-To: <0991deba9e90e3c32f8566fdfc758cb88790bde4.1492086566.git.pkj@axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCHv2 1/1] base-files: profile: Avoid using "command"	to determine if programs exist
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
X-List-Received-Date: Mon, 19 Jun 2017 14:53:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

*ping*

//Peter

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Peter Kjellerstedt
> Sent: den 13 april 2017 14:30
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCHv2 1/1] base-files: profile: Avoid using
> "command" to determine if programs exist
>=20
> Since the existence of "command" in itself is not guaranteed, using it
> to determine if other executables exist is moot. Instead just run the
> executables and let the shell determine if they exist. By piping stderr
> to /dev/null we avoid unnecessary warnings in case they do not exist.
>=20
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-core/base-files/base-files/profile | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/recipes-core/base-files/base-files/profile
> b/meta/recipes-core/base-files/base-files/profile
> index ceaf15f799..e05c8840db 100644
> --- a/meta/recipes-core/base-files/base-files/profile
> +++ b/meta/recipes-core/base-files/base-files/profile
> @@ -22,14 +22,12 @@ if [ -d /etc/profile.d ]; then
>  	unset i
>  fi
>=20
> -if command -v resize >/dev/null && command -v tty >/dev/null; then
> -	# Make sure we are on a serial console (i.e. the device used
> starts with
> -	# /dev/tty[A-z]), otherwise we confuse e.g. the eclipse
> launcher which
> -	# tries do use ssh
> -	case $(tty) in
> -		/dev/tty[A-z]*) resize >/dev/null;;
> -	esac
> -fi
> +# Make sure we are on a serial console (i.e. the device used starts
> with
> +# /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher which
> tries do
> +# use ssh
> +case $(tty 2>/dev/null) in
> +	/dev/tty[A-z]*) resize >/dev/null 2>&1;;
> +esac
>=20
>  export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
>=20
> --
> 2.12.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

