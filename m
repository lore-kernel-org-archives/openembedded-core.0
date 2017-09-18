Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4FC0178282
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 15:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 8ECF6189A3;
	Mon, 18 Sep 2017 17:07:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id u-8noVubGX6H; Mon, 18 Sep 2017 17:07:53 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 0AF691874C;
	Mon, 18 Sep 2017 17:07:53 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBC7F1E07F;
	Mon, 18 Sep 2017 17:07:52 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFC641E07E;
	Mon, 18 Sep 2017 17:07:52 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon, 18 Sep 2017 17:07:52 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id D3DB616FA;
	Mon, 18 Sep 2017 17:07:52 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Mon, 18 Sep 2017 17:07:52 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Mon, 18 Sep 2017 17:07:52 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mike Looijmans <mike.looijmans@topic.nl>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] base-files: profile: Get rid of "resize"
Thread-Index: AQHTMId4XgfWyAaX6kSl3kZY5nmg16K6tXoQ
Date: Mon, 18 Sep 2017 15:07:52 +0000
Message-ID: <a6389819751745fb864af89806f86b5d@XBOX02.axis.com>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
	<660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
	<CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
	<1505743634-13500-1-git-send-email-mike.looijmans@topic.nl>
In-Reply-To: <1505743634-13500-1-git-send-email-mike.looijmans@topic.nl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] base-files: profile: Get rid of "resize"
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
X-List-Received-Date: Mon, 18 Sep 2017 15:07:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Mike Looijmans
> Sent: den 18 september 2017 16:07
> To: openembedded-core@lists.openembedded.org
> Cc: Mike Looijmans <mike.looijmans@topic.nl>; Peter Kjellerstedt
> <peter.kjellerstedt@axis.com>
> Subject: [OE-core] [PATCH] base-files: profile: Get rid of "resize"
>=20
> The "resize" command actually outputs shell commands to be executed, for
> example:
>=20
> $ resize
> COLUMNS=3D102;
> LINES=3D27;
> export COLUMNS LINES;
>=20
> The output of "resize" is being discarded to /dev/null so the call has no
> effect whatsoever, and does not change the environment (it cannot change =
the
> environment of its parent). Remove the call and hence solve the messages
> about shells missing "command" or "tty" or "resize".
>=20
> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
>  meta/recipes-core/base-files/base-files/profile | 9 ---------
>  1 file changed, 9 deletions(-)
>=20
> diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recip=
es-core/base-files/base-files/profile
> index a062028..cfd0d69 100644
> --- a/meta/recipes-core/base-files/base-files/profile
> +++ b/meta/recipes-core/base-files/base-files/profile
> @@ -20,15 +20,6 @@ if [ -d /etc/profile.d ]; then
>  	unset i
>  fi
>=20
> -if command -v resize >/dev/null && command -v tty >/dev/null; then
> -	# Make sure we are on a serial console (i.e. the device used starts wit=
h
> -	# /dev/tty[A-z]), otherwise we confuse e.g. the eclipse launcher which
> -	# tries do use ssh
> -	case $(tty) in
> -		/dev/tty[A-z]*) resize >/dev/null;;
> -	esac
> -fi
> -
>  export PATH PS1 OPIEDIR QPEDIR QTDIR EDITOR TERM
>=20
>  umask 022
> --
> 1.9.1

Hold on. Looking at busybox' source code for resize, it seems that=20
it actually does something besides outputting the shell code to=20
set the variables (which is actually enabled by a separate feature=20
called ENABLE_FEATURE_RESIZE_PRINT). It also calls=20
ioctl(STDERR_FILENO, TIOCSWINSZ, &w) where w contains the=20
calculated sizes.=20

However, I also just learnt that the busybox implementation of=20
resize uses stderr to send control codes to move the cursor to=20
find the tty sizes, which means that if one uses resize 2>/dev/null=20
as my patch suggested, it does not work at all and just times out=20
after three seconds.

What a mess...

//Peter


