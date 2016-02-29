Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 09E707680A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 18:59:20 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id p65so2841000wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 10:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=k+E2wajpoakpqo5wXr0R0zjHNg1ysgq9uIBwfBde/cY=;
	b=Mf3nXOklL6LaEfTQgQkHrDqty6YblrELoYP0Gb4t7Ms8aHtmI/yslN2TA6HQV/nE8k
	XSZOchFKXEQdMofMeRJO1HrHN/2wVw+5SczR5CLIB9JNUvruwwi0TxQA90FgKyfDNW0G
	j3RZg/NRzwdIwWGeQPTsg8K6iIZj1M1j7IThnAuUuYyw3QgkpH4Jf3rMehSG+51z85uM
	mY0ZsXOcfIJI6sOrFULtY4ulRrepEVjgjVcOwxT/fVTb2kTECcXXPAWTJcyqdbWGUCLm
	7PC+6K0p9Ib40Ubl0/bZGmRyzxLEsHZ6AhqCOY7/+J7f1p/ve8ymrNcKei/kPI1wlPnM
	a+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=k+E2wajpoakpqo5wXr0R0zjHNg1ysgq9uIBwfBde/cY=;
	b=agoj+1UYd/vPiFc6EtKsEdy8gLiZeChJ2w3oOYVz3P24RNCFMXScPSrWz+Z7X+KmF/
	4+tinuUsOixNpu5gfrD5tlv3rk1PZXktJdR1ZA1Eh9POg9ACZ0I9fCKd9bV0pEwolCRD
	jCPQUB54oUz/rqJqj5rTEMuIgklvT2+DGhAYiXAnnWTlnjzyjn5elh3jH4ZgYFQlafY0
	lHGNnqsR2+cLXQO/4jimb6pfoSsIFzFeK4C/2+5zX9wKO9jiheNf87pzKAdoeKIi4UEu
	9O41xzifgyKgZqBxJ+UbfZOk2do/IB/b6nHmtyzWSpuTRwlk2+q37SHAUTpMUgGe7shl
	ofvQ==
X-Gm-Message-State: AD7BkJINeS5AmWlTFUPygD5IHK3kDg2wPP7zkO7krOogDpIMKnsF479LXb/7X4ax1HoFGg==
X-Received: by 10.194.78.37 with SMTP id y5mr16147879wjw.78.1456772360412;
	Mon, 29 Feb 2016 10:59:20 -0800 (PST)
Received: from ernie.rdm.local (rademacherexchange.de. [46.245.221.222])
	by smtp.gmail.com with ESMTPSA id
	di1sm27150186wjc.3.2016.02.29.10.59.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Feb 2016 10:59:19 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <1456768183-7248-1-git-send-email-awichmann@emacinc.com>
Date: Mon, 29 Feb 2016 19:59:18 +0100
Message-Id: <4FF44D88-AB08-4912-BCF0-B05DAE3B8DA7@gmail.com>
References: <1456768183-7248-1-git-send-email-awichmann@emacinc.com>
To: Andrew Wichmann <awichmann@emacinc.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wpa-supplicant.sh: updated to modern init script format, refactoring, and new restart functionality
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
X-List-Received-Date: Mon, 29 Feb 2016 18:59:23 -0000
X-Groupsio-MsgNum: 78918
Content-Type: multipart/signed;
	boundary="Apple-Mail=_EB55CE46-929F-46AA-BC67-7547266FF0E3";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_EB55CE46-929F-46AA-BC67-7547266FF0E3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> Am 29.02.2016 um 18:49 schrieb Andrew Wichmann =
<awichmann@emacinc.com>:
>=20
> Refactored the script by placing the logic of starting and stopping =
into separate functions,
> added a switch statement to act on $1, then refactored multiple if =
statements into one line tests.

Why don't re-use the one the Debian folks provide =
(http://lists.openembedded.org/pipermail/openembedded-core/2016-February/1=
18235.html)?
This would free resources to develop things we cannot steal from others =
;)

Cheers

> Check_socket function was extracted to increase the readability of the =
start function.
> Created restart functionality by calling stop then start
> Added a BEGIN INIT INFO comment section (should be verified for =
accuracy)
> Sourced the rcS default file to use the VERBOSE variable instead of =
VERBOSITY
> Defined WPA_COMMON_CTRL_IFACE =3D "/var/run/wpa_supplicant" that was =
previously acted upon but not defined.
>=20
> Signed-off-by: Andrew Wichmann <awichmann@emacinc.com>
> ---
> .../wpa-supplicant/wpa-supplicant.sh               | 91 =
+++++++++++++---------
> 1 file changed, 54 insertions(+), 37 deletions(-)
>=20
> diff --git =
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.s=
h =
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.s=
h
> index 5c9e5d3..3623cbe 100644
> --- =
a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.s=
h
> +++ =
b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/wpa-supplicant.s=
h
> @@ -1,72 +1,62 @@
> -#!/bin/sh
> +#!/bin/sh -e
> +### BEGIN INIT INFO
> +# Provides:			wpa_supplicant
> +# Required-Start:	$local_fs
> +# Required-Stop:	$local_fs
> +# Default-Start:	2 3 4 5
> +# Default-Stop:		0 1 6
> +# Short-Description: A script to start, stop, or restart the =
wpa_supplicant daemon.
> +### END INIT INFO
>=20
>=20
> +IFACE=3D"wlan0"
> WPA_SUP_BIN=3D"/usr/sbin/wpa_supplicant"
> WPA_SUP_PNAME=3D"wpa_supplicant"
> WPA_SUP_PIDFILE=3D"/var/run/wpa_supplicant.$IFACE.pid"
> WPA_SUP_OPTIONS=3D"-B -P $WPA_SUP_PIDFILE -i $IFACE"
> +WPA_COMMON_CTRL_IFACE=3D"/var/run/wpa_supplicant"
> +IF_WPA_CONF=3D"/etc/wpa_supplicant.conf"
>=20
> -VERBOSITY=3D0
>=20
> +[ -s "/etc/default/rcS" ] && . "/etc/default/rcS"
>=20
> -if [ -s "$IF_WPA_CONF" ]; then
> -	WPA_SUP_CONF=3D"-c $IF_WPA_CONF"
> -else
> -	exit 0
> -fi
> +[ ! -s "$IF_WPA_CONF" ] && exit 0
> +WPA_SUP_CONF=3D"-c $IF_WPA_CONF"
>=20
> if [ ! -x "$WPA_SUP_BIN" ]; then
>=20
> -	if [ "$VERBOSITY" =3D "1" ]; then
> -		echo "$WPA_SUP_PNAME: binaries not executable or missing =
from $WPA_SUP_BIN"
> -	fi
> +	[ "$VERBOSE" =3D "yes" ] && echo "$WPA_SUP_PNAME: binaries not =
executable or missing from $WPA_SUP_BIN"
>=20
> 	exit 1
> fi
>=20
> -if [ "$MODE" =3D "start" ] ; then
> +start() {
> 	# driver type of interface, defaults to wext when undefined
> 	if [ -s "/etc/wpa_supplicant/driver.$IFACE" ]; then
> 		IF_WPA_DRIVER=3D$(cat =
"/etc/wpa_supplicant/driver.$IFACE")
> 	elif [ -z "$IF_WPA_DRIVER" ]; then
>=20
> -		if [ "$VERBOSITY" =3D "1" ]; then
> -			echo "$WPA_SUP_PNAME: wpa-driver not provided, =
using \"wext\""
> -		fi
> -
> +		[ "$VERBOSE" =3D "yes" ] && echo "$WPA_SUP_PNAME: =
wpa-driver not provided, using \"wext\""
> +
> 		IF_WPA_DRIVER=3D"wext"
> 	fi
>=20
> 	# if we have passed the criteria, start wpa_supplicant
> 	if [ -n "$WPA_SUP_CONF" ]; then
>=20
> -		if [ "$VERBOSITY" =3D "1" ]; then
> -			echo "$WPA_SUP_PNAME: $WPA_SUP_BIN =
$WPA_SUP_OPTIONS $WPA_SUP_CONF -D $IF_WPA_DRIVER"
> -		fi
> -
> +		[ "$VERBOSE" =3D "yes" ] && echo "$WPA_SUP_PNAME: =
$WPA_SUP_BIN $WPA_SUP_OPTIONS $WPA_SUP_CONF -D $IF_WPA_DRIVER"
> +
> 		start-stop-daemon --start --quiet \
> 			--name $WPA_SUP_PNAME --startas $WPA_SUP_BIN =
--pidfile $WPA_SUP_PIDFILE \
> 			--  $WPA_SUP_OPTIONS $WPA_SUP_CONF -D =
$IF_WPA_DRIVER
> 	fi
> +	check_socket
> +}
>=20
> -	# if the interface socket exists, then wpa_supplicant was =
invoked successfully
> -	if [ -S "$WPA_COMMON_CTRL_IFACE/$IFACE" ]; then
> -
> -		if [ "$VERBOSITY" =3D "1" ]; then
> -			echo "$WPA_SUP_PNAME: ctrl_interface socket =
located at $WPA_COMMON_CTRL_IFACE/$IFACE"
> -		fi
> -
> -		exit 0
> -
> -	fi
> -
> -elif [ "$MODE" =3D "stop" ]; then
> -
> +stop() {
> 	if [ -f "$WPA_SUP_PIDFILE" ]; then
>=20
> -		if [ "$VERBOSITY" =3D "1" ]; then
> -			echo "$WPA_SUP_PNAME: terminating $WPA_SUP_PNAME =
daemon"
> -		fi
> +		[ "$VERBOSE" =3D "yes" ] && echo "$WPA_SUP_PNAME: =
terminating $WPA_SUP_PNAME daemon"
>=20
> 		start-stop-daemon --stop --quiet \
> 			--name $WPA_SUP_PNAME --pidfile	$WPA_SUP_PIDFILE
> @@ -79,7 +69,34 @@ elif [ "$MODE" =3D "stop" ]; then
> 			rm -f $WPA_SUP_PIDFILE
> 		fi
> 	fi
> +	exit 0
> +}
>=20
> -fi
> +check_socket(){
> +	# if the interface socket exists, then wpa_supplicant was =
invoked successfully
> +	if [ -S "$WPA_COMMON_CTRL_IFACE/$IFACE" ]
> +	then
> +		[ "$VERBOSE" =3D "yes" ] && echo "$WPA_SUP_PNAME: =
ctrl_interface socket located at$WPA_COMMON_CTRL_IFACE/$IFACE"
> +		exit 0
> +	fi
> +	exit 1
> +}
> +
> +case "$1" in
> +	start)
> +		start
> +		;;
> +	stop)
> +		stop
> +		;;
> +	restart)
> +		stop
> +		start
> +		;;
> +	*)
> +		echo "Usage: /etc/init.d/wpa_supplicant =
{start|stop|restart}"
> +		exit 1
> +
> +esac
>=20
> -exit 0
> +exit 1
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_EB55CE46-929F-46AA-BC67-7547266FF0E3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJW1JUGAAoJEESZlq7c5QqdSLoP/A2W4L5OjA8Pz9Fu0c5CgewR
HhANwE3NQyaZnNtUmJkihMIN3FnN7mGguGEu5eElDR+pSSrwmsxGznAUsNO0yOh7
qBJj9V+m9RHh622fLHXUm+S8NpsGC9t2ohRQJjMOAb5U0RW0irwzOftNz2WVprAK
cjei8cs7YjK99ImNUxoL7DjoSc9nM+cIe4D/ZFkBYvnZ+oFy60ZGBwKt1C5csDs0
twQlzMYgKuYjneZu8L2JwauYIIJS0l3vqD2Ph2KKFCDx+zW494fanANov1+voGTr
4lHbYPoxsUCxGc82I2r3Y9JNzc5CPRPhdFVhvOhgTxNMuAgiZbciKFN5sNW0s2Vv
glenooZZf/NpLJDvKV2+blDe1S8thI1+dr53OYHTdok+fZcS0C/r8a8p7EcKA4pP
7Ui41/4NY9z90t9pr4XGPag9UPs9IpqRHuqY9K3XsOBPL6tgIjxfQ23j4sJpYd0T
Ybx4iRwbJttFW4ftGCKlAH+ey3ScaHcRo0Yb69z/6EMtBbmsbeZMw9PJ5QCik17B
LuJ9e9LdTt20hKRDCXi3AtdeOk6mi7nIOQcRj+Cn/2RsXl3tCyX2tRqusNhcUxS1
FURCAf4lnUvGhrD0wJz8UMvUo+YpAfoygFProuLyv9154d9OAoYsjPLcQiIpbmiM
CN7eFFZqyjML9uEUA/a6
=zilo
-----END PGP SIGNATURE-----

--Apple-Mail=_EB55CE46-929F-46AA-BC67-7547266FF0E3--
