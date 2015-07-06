Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id DB03575D81
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 10:11:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="98120871"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jul 2015 18:15:42 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t66AA5o7019493
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jul 2015 18:10:05 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Mon, 6 Jul 2015 18:11:47 +0800
From: "Li, Xin" <lixin.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] glibc: add systemd support
Thread-Index: AQHQrivzRiNXN/Z5EEO8Y2KGygkhGJ3OShQg
Date: Mon, 6 Jul 2015 10:11:45 +0000
Message-ID: <A8FC939F80655644A89BB21CCD3741E87390C875@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1435115682-1625-1-git-send-email-lixin.fnst@cn.fujitsu.com>
In-Reply-To: <1435115682-1625-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.92]
MIME-Version: 1.0
Subject: Re: [PATCH] glibc: add systemd support
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
X-List-Received-Date: Mon, 06 Jul 2015 10:11:48 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi, Ross

I have sent some patches about "add systemd support and add systemd service=
 files",
Such as iptables, iputils, sysstat and so on.

So how about those patches? :)

Regards,
Li

> -----Original Message-----
> From: Li, Xin/=1B$BM{=1B(B =1B$B6U=1B(B
> Sent: Wednesday, June 24, 2015 11:15 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Li, Xin/=1B$BM{=1B(B =1B$B6U=1B(B
> Subject: [OE-core][PATCH] glibc: add systemd support
>=20
> add systemd service files nscd.service and nscd.socket
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-core/glibc/glibc-package.inc  |  2 +-
>  meta/recipes-core/glibc/glibc.inc          | 20 +++++++++++++++++++-
>  meta/recipes-core/glibc/glibc/nscd.service | 16 ++++++++++++++++
> meta/recipes-core/glibc/glibc/nscd.socket  |  8 ++++++++
>  meta/recipes-core/glibc/glibc_2.21.bb      |  2 ++
>  5 files changed, 46 insertions(+), 2 deletions(-)  create mode 100644
> meta/recipes-core/glibc/glibc/nscd.service
>  create mode 100644 meta/recipes-core/glibc/glibc/nscd.socket
>=20
> diff --git a/meta/recipes-core/glibc/glibc-package.inc
> b/meta/recipes-core/glibc/glibc-package.inc
> index 984362e..4897479 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -47,7 +47,7 @@ FILES_libsotruss =3D "${libdir}/audit/sotruss-lib.so"
>  FILES_SOLIBSDEV =3D "${libdir}/lib*${SOLIBSDEV}"
>  FILES_${PN}-dev +=3D "${bindir}/rpcgen ${libdir}/*_nonshared.a
> ${base_libdir}/*_nonshared.a ${base_libdir}/*.o ${datadir}/aclocal"
>  FILES_${PN}-staticdev +=3D "${libdir}/*.a ${base_libdir}/*.a"
> -FILES_nscd =3D "${sbindir}/nscd*"
> +FILES_nscd =3D "${sbindir}/nscd* ${sysconfdir}/nscd.conf ${sysconfdir}/i=
nit.d/nscd
> ${localstatedir}/db ${systemd_unitdir}/system/nscd.*"
>  FILES_${PN}-mtrace =3D "${bindir}/mtrace"
>  FILES_tzcode =3D "${bindir}/tzselect ${sbindir}/zic ${sbindir}/zdump"
>  FILES_${PN}-utils =3D "${bindir}/* ${sbindir}/*"
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/=
glibc.inc
> index da56bc9..4c28461 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -41,7 +41,7 @@ DEPENDS =3D "virtual/${TARGET_PREFIX}gcc-initial libgcc=
-initial
> linux-libc-headers  #RDEPENDS_${PN} +=3D "${@['','libgcc']['nptl' in
> '${GLIBC_ADDONS}']}"
>  PROVIDES =3D "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc"
>  PROVIDES +=3D "virtual/libintl virtual/libiconv"
> -inherit autotools texinfo distro_features_check
> +inherit autotools texinfo distro_features_check systemd
>  require glibc-options.inc
>=20
>  # The main purpose of setting this variable is to prevent users from acc=
idently
> @@ -95,4 +95,22 @@ do_configure_append() {
>  	sed -i
> 's/^OPTION_EGLIBC_NSSWITCH_FIXED_\(.*\)=3D"\(.*\)"$/OPTION_EGLIBC_NSSWITC
> H_FIXED_\1=3D\2/' option-groups.config  }
>=20
> +do_install_append() {
> +	install -d ${D}/${sysconfdir}
> +	install -m 0644 ${S}/nscd/nscd.conf ${D}/${sysconfdir}/nscd.conf
> +	install -d ${D}/${sysconfdir}/init.d
> +	install -m 0755 ${S}/nscd/nscd.init ${D}/${sysconfdir}/init.d/nscd
> +	install -m 755 -d ${D}/${localstatedir}/db
> +	install -m 755 -d ${D}/${localstatedir}/db/nscd
> +
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/nscd.service ${D}${systemd_unitdir}/system/
> +	install -m 0644 ${WORKDIR}/nscd.socket ${D}${systemd_unitdir}/system/
> +	sed -i -e 's,@localstatedir@,${localstatedir},g'
> ${D}${systemd_unitdir}/system/*
> +	sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/*
> +	sed -i -e 's,@base_bindir@,${base_bindir},g'
> +${D}${systemd_unitdir}/system/* }
> +
> +
>  GLIBC_ADDONS ?=3D "nptl,libidn"
> +
> diff --git a/meta/recipes-core/glibc/glibc/nscd.service
> b/meta/recipes-core/glibc/glibc/nscd.service
> new file mode 100644
> index 0000000..014103e
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/nscd.service
> @@ -0,0 +1,16 @@
> +[Unit]
> +Description=3DName Service Cache Daemon
> +After=3Dsyslog.target
> +
> +[Service]
> +Type=3Dforking
> +ExecStartPre=3D@base_bindir@/mkdir -p @localstatedir@/run/nscd
> +ExecStartPre=3D@base_bindir@/mkdir -p @localstatedir@/db/nscd
> +ExecStart=3D@SBINDIR@/nscd ExecStop=3D@SBINDIR@/nscd --shutdown
> +Restart=3Dalways PIDFile=3D@localstatedir@/run/nscd/nscd.pid
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> +Also=3Dnscd.socket
> diff --git a/meta/recipes-core/glibc/glibc/nscd.socket
> b/meta/recipes-core/glibc/glibc/nscd.socket
> new file mode 100644
> index 0000000..fc63453
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/nscd.socket
> @@ -0,0 +1,8 @@
> +[Unit]
> +Description=3DName Service Cache Daemon Socket
> +
> +[Socket]
> +ListenDatagram=3D@localstatedir@/run/nscd/socket
> +
> +[Install]
> +WantedBy=3Dsockets.target
> diff --git a/meta/recipes-core/glibc/glibc_2.21.bb
> b/meta/recipes-core/glibc/glibc_2.21.bb
> index 8197c29..4230630 100644
> --- a/meta/recipes-core/glibc/glibc_2.21.bb
> +++ b/meta/recipes-core/glibc/glibc_2.21.bb
> @@ -30,6 +30,8 @@ SRC_URI =3D
> "git://sourceware.org/git/glibc.git;branch=3D${BRANCH} \
>             file://Fix-__memcpy_chk-on-non-SSE2-CPUs.patch \
>             ${EGLIBCPATCHES} \
>             ${CVEPATCHES} \
> +           file://nscd.service \
> +           file://nscd.socket \
>            "
>  EGLIBCPATCHES =3D "\
>             file://timezone-re-written-tzselect-as-posix-sh.patch \
> --
> 1.8.4.2


