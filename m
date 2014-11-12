Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id A4BAE65C91
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 10:27:05 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id l18so13624147wgh.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 02:27:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=DblHL3705ksxFNxnUB9QZ9STJevtn6yaudJzgG6ugPA=;
	b=lbovzS6Npc7QFga7CnYCI2HqGDr/FJGJEKZecGxspfd/d7Xy3q1piBWEqRYv6WFLXo
	XBOFjgeOIxEPz8Yoh9eRmn29kgtLpomY3ZOb/uoqyhzVP4buHq7LgcdznUx3Mom89nvT
	1L4h/VJjHFhuMJwmLiQjMSfo+EY1Zn61MGnkuf2YrQMyqdKmISP6RQ3D8QZqe6zl9tHC
	IxPaaGv0r7CSnJURTcgQlSJKOBcRwt14j79c/qpMIwpmjNBeK0fWxugNDqGnRoAcYe56
	Db6ngRNy8ckKaokwfL1gFfPCJTqWAqOQz6W6JJvHVW2nkoaFmkb3kmiBZ9/nKaZlI9Oz
	edfg==
X-Gm-Message-State: ALoCoQnyqUjmW4vcAHTHeHPmKRF67zPL0jscyY2l+Iqk60gXSF0aK1H9WnO4JAKrN5VBUG90gImE
X-Received: by 10.181.27.135 with SMTP id jg7mr48315384wid.56.1415788025432;
	Wed, 12 Nov 2014 02:27:05 -0800 (PST)
Received: from ?IPv6:2001:610:612::94dd:88c6:52a1:cac2?
	([2001:610:612:0:94dd:88c6:52a1:cac2])
	by mx.google.com with ESMTPSA id dx8sm17113969wib.2.2014.11.12.02.27.03
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Nov 2014 02:27:03 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <37d7153a864b4dee5748a3a30054c0c62e243f02.1415699201.git.hongxu.jia@windriver.com>
Date: Wed, 12 Nov 2014 11:27:02 +0100
Message-Id: <FB878F6E-62D1-49FB-A373-EF554D0A274D@dominion.thruhere.net>
References: <cover.1415699201.git.hongxu.jia@windriver.com>
	<37d7153a864b4dee5748a3a30054c0c62e243f02.1415699201.git.hongxu.jia@windriver.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] avahi.inc: rename package to use avahi to instead of avahi-daemon
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
X-List-Received-Date: Wed, 12 Nov 2014 10:27:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 11 nov. 2014, om 11:52 heeft Hongxu Jia <hongxu.jia@windriver.com> =
het volgende geschreven:
>=20
> The package avahi does not exist, as SUMMARY said, we should
> use avahi-daemon to instead. It avoids the do_rootfs failure
> while IMAGE_INSTALL +=3D "avahi"
>=20
> For compatibility, let avahi to provide avahi-daemon.

As stated before:

1) Fix your IMAGE_INSTALL
2) This breaks upgrade paths

Do you *really* want to break existing installs just so you can pretend =
that your recipename=3D=3Dpackage name assumption isn't wrong?


>=20
> [YOCTO #6937]
>=20
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
> meta/recipes-connectivity/avahi/avahi.inc | 29 =
++++++++++++++---------------
> 1 file changed, 14 insertions(+), 15 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/avahi/avahi.inc =
b/meta/recipes-connectivity/avahi/avahi.inc
> index b060437..581d51b 100644
> --- a/meta/recipes-connectivity/avahi/avahi.inc
> +++ b/meta/recipes-connectivity/avahi/avahi.inc
> @@ -29,8 +29,8 @@ SRC_URI =3D =
"http://avahi.org/download/avahi-${PV}.tar.gz \
>           file://reuseport-check.patch \
>           "
>=20
> -USERADD_PACKAGES =3D "avahi-daemon avahi-autoipd"
> -USERADD_PARAM_avahi-daemon =3D "--system --home /var/run/avahi-daemon =
\
> +USERADD_PACKAGES =3D "avahi avahi-autoipd"
> +USERADD_PARAM_avahi =3D "--system --home /var/run/avahi-daemon \
>                               --no-create-home --shell /bin/false \
>                               --user-group avahi"
>=20
> @@ -71,11 +71,10 @@ do_configure_prepend() {
> }
>=20
>=20
> -PACKAGES =3D+ "avahi-daemon libavahi-common libavahi-core =
libavahi-client avahi-dnsconfd libavahi-glib libavahi-ui avahi-autoipd =
avahi-utils"
> +PACKAGES =3D+ "libavahi-common libavahi-core libavahi-client =
avahi-dnsconfd libavahi-glib libavahi-ui avahi-autoipd avahi-utils"
>=20
> -# As avahi doesn't put any files into PN, clear the files list to =
avoid problems
> -# if extra libraries appear.
> -FILES_avahi =3D ""
> +# For compatibility, let avahi to provide avahi-daemon
> +RPROVIDES_${PN} =3D "${PN}-daemon"
> FILES_avahi-autoipd =3D "${sbindir}/avahi-autoipd \
>                        ${sysconfdir}/avahi/avahi-autoipd.action \
>                        ${sysconfdir}/dhcp/*/avahi-autoipd \
> @@ -83,7 +82,7 @@ FILES_avahi-autoipd =3D "${sbindir}/avahi-autoipd \
>                        ${sysconfdir}/udhcpc.d/99avahi-autoipd"
> FILES_libavahi-common =3D "${libdir}/libavahi-common.so.*"
> FILES_libavahi-core =3D "${libdir}/libavahi-core.so.*"
> -FILES_avahi-daemon =3D "${sbindir}/avahi-daemon \
> +FILES_${PN} =3D "${sbindir}/avahi-daemon \
>                       ${sysconfdir}/avahi/avahi-daemon.conf \
>                       ${sysconfdir}/avahi/hosts \
>                       ${sysconfdir}/avahi/services \
> @@ -102,10 +101,10 @@ FILES_libavahi-glib =3D =
"${libdir}/libavahi-glib.so.*"
> FILES_libavahi-gobject =3D "${libdir}/libavahi-gobject.so.*"
> FILES_avahi-utils =3D "${bindir}/avahi-*"
>=20
> -RDEPENDS_${PN}-dev =3D "avahi-daemon (=3D ${EXTENDPKGV}) =
libavahi-core (=3D ${EXTENDPKGV}) libavahi-client (=3D ${EXTENDPKGV})"
> +RDEPENDS_${PN}-dev =3D "avahi (=3D ${EXTENDPKGV}) libavahi-core (=3D =
${EXTENDPKGV}) libavahi-client (=3D ${EXTENDPKGV})"
>=20
> # uclibc has no nss
> -RRECOMMENDS_avahi-daemon_append_libc-glibc =3D " libnss-mdns"
> +RRECOMMENDS_avahi_append_libc-glibc =3D " libnss-mdns"
> RRECOMMENDS_${PN}_append_libc-glibc =3D " libnss-mdns"
>=20
> RRECOMMENDS_avahi-dev =3D "expat-dev libcap-dev libdaemon-dev dbus-dev =
glib-2.0-dev update-rc.d-dev"
> @@ -113,11 +112,11 @@ RRECOMMENDS_avahi-dev_append_libc-glibc =3D " =
gettext-dev"
>=20
> RRECOMMENDS_avahi-dev[nodeprrecs] =3D "1"
>=20
> -CONFFILES_avahi-daemon =3D "${sysconfdir}/avahi/avahi-daemon.conf"
> +CONFFILES_avahi =3D "${sysconfdir}/avahi/avahi-daemon.conf"
>=20
> -INITSCRIPT_PACKAGES =3D "avahi-daemon avahi-dnsconfd"
> -INITSCRIPT_NAME_avahi-daemon =3D "avahi-daemon"
> -INITSCRIPT_PARAMS_avahi-daemon =3D "defaults 21 19"
> +INITSCRIPT_PACKAGES =3D "avahi avahi-dnsconfd"
> +INITSCRIPT_NAME_avahi =3D "avahi-daemon"
> +INITSCRIPT_PARAMS_avahi =3D "defaults 21 19"
> INITSCRIPT_NAME_avahi-dnsconfd =3D "avahi-dnsconfd"
> INITSCRIPT_PARAMS_avahi-dnsconfd =3D "defaults 22 19"
>=20
> @@ -141,13 +140,13 @@ do_install() {
> # At the time the postinst runs, dbus might not be setup so only =
restart if running=20
> # Don't exit early, because update-rc.d needs to run subsequently.
>=20
> -pkg_postinst_avahi-daemon () {
> +pkg_postinst_avahi () {
> if [ -z "$D" ]; then
> 	killall -q -HUP dbus-daemon || true
> fi
> }
>=20
> -pkg_postrm_avahi-daemon () {
> +pkg_postrm_avahi () {
> 	deluser avahi || true
> 	delgroup avahi || true
> }
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


