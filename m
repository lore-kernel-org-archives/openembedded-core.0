Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4CE00600B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 11:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A812318122;
	Mon, 19 Sep 2016 13:57:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 28Jsb-wYBxAq; Mon, 19 Sep 2016 13:57:10 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 3284D180F0;
	Mon, 19 Sep 2016 13:57:10 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F5F41A081;
	Mon, 19 Sep 2016 13:57:10 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 142151A073;
	Mon, 19 Sep 2016 13:57:10 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Mon, 19 Sep 2016 13:57:10 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 088A5331;
	Mon, 19 Sep 2016 13:57:10 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Mon, 19 Sep 2016 13:57:09 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1156.000;
	Mon, 19 Sep 2016 13:57:09 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "zhe.he@windriver.com" <zhe.he@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core]  [PATCH] bash2dash conversion
Thread-Index: AQHSEVfZy0/YGz+VCUW52cvxEs5KpaCAbQIA
Date: Mon, 19 Sep 2016 11:57:09 +0000
Message-ID: <7a584ad0d258491383c4ea32d530c3be@XBOX02.axis.com>
References: <1474167109-6666-1-git-send-email-zhe.he@windriver.com>
In-Reply-To: <1474167109-6666-1-git-send-email-zhe.he@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] bash2dash conversion
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
X-List-Received-Date: Mon, 19 Sep 2016 11:57:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> zhe.he@windriver.com
> Sent: den 18 september 2016 04:52
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] bash2dash conversion
                             ^^^^^^^^^
Typically this is referred to as "Remove bashisms"...

> From: "Tim K. Chan" <nirvanatk@gmail.com>
>=20
> Change bash style to dash style
>=20
> Signed-off-by: Tim K. Chan <nirvanatk@gmail.com>
> [Adjust context]
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/classes/systemd.bbclass                            |  4 ++--
>  meta/classes/update-rc.d.bbclass                        |  6 +++---
>  meta/classes/useradd_base.bbclass                       |  4 ++--
>  meta/recipes-connectivity/resolvconf/resolvconf_1.79.bb |  2 +-
>  meta/recipes-core/glibc/glibc-package.inc               |  2 +-
>  meta/recipes-devtools/guile/guile_2.0.12.bb             |  6 ++++--
>  meta/recipes-devtools/rpm/rpm_5.4.16.bb                 | 13 +++++++++++=
--
>  7 files changed, 24 insertions(+), 13 deletions(-)

[cut]

> diff --git a/meta/classes/useradd_base.bbclass
> b/meta/classes/useradd_base.bbclass
> index f4dc713..35d5f06 100644
> --- a/meta/classes/useradd_base.bbclass
> +++ b/meta/classes/useradd_base.bbclass
> @@ -59,10 +59,10 @@ perform_groupmems () {
>  		gshadow=3D"no"
>  		touch $rootdir${sysconfdir}/gshadow
>  	fi
> -	local mem_exists=3D"`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username=
\(,[^,]*\)*"$rootdir/etc/group || true`"
> +	local mem_exists=3D"`grep "^$groupname:[!:]*:[!:]*:\([!,]*,\)*$username=
\(,[!,]*\)*"$rootdir/etc/group || true`"
>  	if test "x$mem_exists" =3D "x"; then
>  		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupmems \$opts\" ||=
 true
> -		mem_exists=3D"`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^=
,]*\)*"$rootdir/etc/group || true`"
> ++		mem_exists=3D"`grep "^$groupname:[!:]*:[!:]*:\([!,]*,\)*$username\(,[=
!,]*\)*"$rootdir/etc/group || true`"
>  		if test "x$mem_exists" =3D "x"; then
>  			bbfatal "${PN}: groupmems command did not succeed."
>  		fi

The above change cannot be correct. Changing the expression "[^:]"=20
(which means "anything but :") to "[!:]" (which means "! or :") is=20
definitely not the same....

> diff --git a/meta/recipes-devtools/guile/guile_2.0.12.bb
> b/meta/recipes-devtools/guile/guile_2.0.12.bb
> index d2fe511..3ada0f1 100644
> --- a/meta/recipes-devtools/guile/guile_2.0.12.bb
> +++ b/meta/recipes-devtools/guile/guile_2.0.12.bb
> @@ -91,8 +91,10 @@ guile_cross_config() {=09
>  	then
>  	        # Create guile-config returning target values instead of native=
 values
>  	        install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
> -        	echo '#!'`which ${BUILD_SYS}-guile`$' \\\n--no-auto-compile -e =
main -s\n!#\n(define %guile-build-info '\'\( \
> -			> ${B}/guile-config.cross
> +		echo -n '#!' > ${B}/guile-config.cross
> +		echo -n `which x86_64-linux-guile` >> ${B}/guile-config.cross
> +		printf ' \\\n--no-auto-compile -e main -s\n!#\n(define %%guile-build-i=
nfo ' >> ${B}/guile-config.cross
> +		echo "'(" >> ${B}/guile-config.cross
>  	        sed -n -e 's:^[ \t]*{[ \t]*":  (:' \
>  			-e 's:",[ \t]*": . ":' \
>  			-e 's:" *}, *\\:"):' \

I suggest to replace the entire guile_cross_config() function with this:

guile_cross_config() {
	# this is only for target recipe
	[ "${PN}" =3D "${BPN}" ] || return 0

	vars=3D$(sed -n -e 's:^[ \t]*{[ \t]*":  (:' \
	              -e 's:",[ \t]*": . ":' \
	              -e 's:" *}, *\\:"):' \
	              -e 's:^.*cachedir.*$::' \
	              -e '/^  (/p' \
	       < ${B}/libguile/libpath.h)

	# Create guile-config returning target values instead of native values
	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
	cat <<EOF >${B}/guile-config.cross
#!$(which ${BUILD_SYS}-guile) \\
--no-auto-compile -e main -s
!#
(define %guile-build-info '(
$vars
))
EOF
	cat ${B}/meta/guile-config >> ${B}/guile-config.cross
	install ${B}/guile-config.cross ${SYSROOT_DESTDIR}${bindir_crossscripts}/g=
uile-config
}

That should make it a lot simpler to see what is going on.
Please note that I have corrected the installation path as well.

//Peter


