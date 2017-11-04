Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id B22FE71B48
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Nov 2017 00:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 57B8F18985;
	Sat,  4 Nov 2017 01:50:22 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 27rM0I5kKM74; Sat,  4 Nov 2017 01:50:21 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 8EBF718897;
	Sat,  4 Nov 2017 01:50:21 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A04D1A06D;
	Sat,  4 Nov 2017 01:50:21 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6ED3A1A069;
	Sat,  4 Nov 2017 01:50:21 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Sat,  4 Nov 2017 01:50:21 +0100 (CET)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id 62EEB26AF;
	Sat,  4 Nov 2017 01:50:21 +0100 (CET)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Sat, 4 Nov 2017 01:50:21 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Sat, 4 Nov 2017 01:50:21 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/3] scripts/send-pull-request: allow -C to be
	used multiple times
Thread-Index: AQHTVFJDEmQVNkn7z0m7FAJwN2c5yqMDXUvw
Date: Sat, 4 Nov 2017 00:50:21 +0000
Message-ID: <378c0f0d22f44ab8aab5131cb1e97305@XBOX02.axis.com>
References: <cover.1509678875.git.paul.eggleton@linux.intel.com>
	<11083c0d85e4443807e5bd526df47bf97e653672.1509678875.git.paul.eggleton@linux.intel.com>
In-Reply-To: <11083c0d85e4443807e5bd526df47bf97e653672.1509678875.git.paul.eggleton@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 3/3] scripts/send-pull-request: allow -C to be	used multiple times
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
X-List-Received-Date: Sat, 04 Nov 2017 00:50:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Paul Eggleton
> Sent: den 3 november 2017 04:16
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 3/3] scripts/send-pull-request: allow -C to
> be used multiple times
>=20
> Allow -C to be specified multiple times in order to CC multiple people
> instead of only taking the last specified value. (You can already use
> commas to separate multiple recipients, but it makes sense to support
> this usage as well as commas as separators may not be immediately
> obvious).
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  scripts/send-pull-request | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/send-pull-request b/scripts/send-pull-request
> index 883deac..baa907d 100755
> --- a/scripts/send-pull-request
> +++ b/scripts/send-pull-request
> @@ -82,7 +82,7 @@ while getopts "acC:hp:t:" OPT; do
>  		GITSOBCC=3D"--signed-off-by-cc"
>  		;;
>  	C)
> -		EXTRA_CC=3D"$OPTARG"
> +		EXTRA_CC=3D"$EXTRA_CC,$OPTARG"

That will introduce a leading comma in $EXTRA_CC, which in turn will=20
lead to a --cc=3D'' option being passed to git send-email. You can avoid=20
that by doing:

		EXTRA_CC=3D"${EXTRA_CC:+$EXTRA_CC,}$OPTARG"

>  		;;
>  	h)
>  		usage
> --
> 2.9.5

You can also rewrite the case statement for -t in a similar way:

	t)
		TO=3D"${TO:+$TO,}$OPTARG"
		;;

Similarly, you can rewrite the code that assigns AUTO_CC in=20
harvest_recipients() as:

				AUTO_CC=3D"${AUTO_CC:+$AUTO_CC,}$EMAIL"

And if you replace:

unset TO

near the beginning of the script with:

TO=3D$(git config sendmail.to)

you can remove everything related to AUTO_TO.

//Peter


