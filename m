Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A2D0474813
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 11:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 019F91836F;
	Wed,  9 Jan 2019 12:34:11 +0100 (CET)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id dE3r2dPhsoTe; Wed,  9 Jan 2019 12:34:10 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id B842A18136;
	Wed,  9 Jan 2019 12:34:09 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C8011A07B;
	Wed,  9 Jan 2019 12:34:09 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 914D91A075;
	Wed,  9 Jan 2019 12:34:09 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed,  9 Jan 2019 12:34:09 +0100 (CET)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id 85F6D251B;
	Wed,  9 Jan 2019 12:34:09 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Wed, 9 Jan 2019 12:34:09 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Wed, 9 Jan 2019 12:34:09 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Chen Qi <Qi.Chen@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 1/1] netbase/base-files: move /etc/hosts from
	netbase to base-files
Thread-Index: AQHUpzFXz4LPiZnYukqJBqyTPJQk6qWmzmwQ
Date: Wed, 9 Jan 2019 11:34:09 +0000
Message-ID: <40b8b58c38b84647a68b9b846f8498b8@XBOX04.axis.com>
References: <cover.1546938633.git.Qi.Chen@windriver.com>
	<11e2fba7bd1e165047915f5a77cb85ba96410da4.1546938633.git.Qi.Chen@windriver.com>
In-Reply-To: <11e2fba7bd1e165047915f5a77cb85ba96410da4.1546938633.git.Qi.Chen@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 1/1] netbase/base-files: move /etc/hosts from	netbase to base-files
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
X-List-Received-Date: Wed, 09 Jan 2019 11:34:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Chen Qi
> Sent: den 8 januari 2019 10:13
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/1] netbase/base-files: move /etc/hosts from
> netbase to base-files
>=20
> Move /etc/hosts to base-files, and also add entry to it according
> to hostname setting. This fixes the problem of commands like
> `hostname -f' failing due to lack of such entry.
>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/{netbase/netbase =3D> base-files/base-files}/hosts | 0
>  meta/recipes-core/base-files/base-files_3.0.14.bb                  | 5 +=
+++-
>  meta/recipes-core/netbase/netbase_5.5.bb                           | 6 +=
-----
>  3 files changed, 5 insertions(+), 6 deletions(-)
>  rename meta/recipes-core/{netbase/netbase =3D> base-files/base-files}/ho=
sts (100%)
>=20
> diff --git a/meta/recipes-core/netbase/netbase/hosts b/meta/recipes-core/=
base-files/base-files/hosts
> similarity index 100%
> rename from meta/recipes-core/netbase/netbase/hosts
> rename to meta/recipes-core/base-files/base-files/hosts
> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/rec=
ipes-core/base-files/base-files_3.0.14.bb
> index 6e75652..6e30c14 100644
> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
> @@ -13,6 +13,7 @@ LIC_FILES_CHKSUM =3D "file://licenses/GPL-
> 2;md5=3D94d55d512a9ba36caa9b7df079bae19f"
>  SRC_URI =3D "file://rotation \
>             file://nsswitch.conf \
>             file://motd \
> +           file://hosts \
>             file://host.conf \
>             file://profile \
>             file://shells \
> @@ -113,6 +114,7 @@ do_install () {
>  	ln -snf ../run ${D}${localstatedir}/run
>  	ln -snf ../run/lock ${D}${localstatedir}/lock
>=20
> +	install -m 0644 ${WORKDIR}/hosts ${D}${sysconfdir}/hosts
>  	${BASEFILESISSUEINSTALL}
>=20
>  	rotation=3D`cat ${WORKDIR}/rotation`
> @@ -140,6 +142,7 @@ DISTRO_VERSION[vardepsexclude] +=3D "DATE"
>  do_install_basefilesissue () {
>  	if [ "${hostname}" ]; then
>  		echo ${hostname} > ${D}${sysconfdir}/hostname
> +		echo "127.0.1.1 ${hostname}" >> ${D}${sysconfdir}/hosts

Should this check the ipv4 DISTRO_FEATURE?
What about IPv6?

>  	fi
>=20
>  	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}
> @@ -177,5 +180,5 @@ FILES_${PN}-doc =3D "${docdir} ${datadir}/common-lice=
nses"
>=20
>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>=20
> -CONFFILES_${PN} =3D "${sysconfdir}/fstab ${@['', '${sysconfdir}/hostname=
'][(d.getVar('hostname') !=3D '')]} ${sysconfdir}/shells"
> +CONFFILES_${PN} =3D "${sysconfdir}/fstab ${@['', '${sysconfdir}/hostname=
 ${sysconfdir}/hosts'][(d.getVar('hostname') !=3D '')]} ${sysconfdir}/shell=
s"

A bit more readable:

CONFFILES_${PN} =3D "${sysconfdir}/fstab ${@'${sysconfdir}/hostname ${sysco=
nfdir}/hosts' if d.getVar('hostname') else ''} ${sysconfdir}/shells"

>  CONFFILES_${PN} +=3D "${sysconfdir}/motd ${sysconfdir}/nsswitch.conf ${s=
ysconfdir}/profile"
> diff --git a/meta/recipes-core/netbase/netbase_5.5.bb b/meta/recipes-
> core/netbase/netbase_5.5.bb
> index 2061f86..eb53add 100644
> --- a/meta/recipes-core/netbase/netbase_5.5.bb
> +++ b/meta/recipes-core/netbase/netbase_5.5.bb
> @@ -7,8 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://debian/copyright;md5=3D3dd6192d306f582dee7687da3d8748ab
>  PE =3D "1"
>=20
>  SRC_URI =3D "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz \
> -           file://netbase-add-rpcbind-as-an-alias-to-sunrpc.patch \
> -           file://hosts"
> +           file://netbase-add-rpcbind-as-an-alias-to-sunrpc.patch"
>=20
>  SRC_URI[md5sum] =3D "15f2d9b3783802f7f48f6734b6540ac4"
>  SRC_URI[sha256sum] =3D "309bddc69a43b98e5a450992b70cdfc0e3d1afb9107bc631=
d04b0714be98f88b"
> @@ -16,10 +15,7 @@ SRC_URI[sha256sum] =3D "309bddc69a43b98e5a450992b70cdf=
c0e3d1afb9107bc631d04b0714be
>  UPSTREAM_CHECK_URI =3D "${DEBIAN_MIRROR}/main/n/netbase/"
>  do_install () {
>  	install -d ${D}/${mandir}/man8 ${D}${sysconfdir}
> -	install -m 0644 ${WORKDIR}/hosts ${D}${sysconfdir}/hosts
>  	install -m 0644 etc-rpc ${D}${sysconfdir}/rpc
>  	install -m 0644 etc-protocols ${D}${sysconfdir}/protocols
>  	install -m 0644 etc-services ${D}${sysconfdir}/services
>  }
> -
> -CONFFILES_${PN} =3D "${sysconfdir}/hosts"
> --
> 1.9.1

//Peter


