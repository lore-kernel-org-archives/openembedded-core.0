Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id C27386A463;
	Thu,  9 Jan 2014 14:49:38 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b57so1372443eek.31
	for <multiple recipients>; Thu, 09 Jan 2014 06:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YMjJWDewUNn+Sn/OSw8n3Dy1AesNDjjOKnciJ4lyNCg=;
	b=bG3QKYrT+pmsnD36DPkj6AHu5UAy/YBMH+Bq6IfMEJPlSWhUM4RS0WqF6i9+ikSNeO
	epzf0tbvPYHjX+9+iG1k0m97WnOMLVRTYQ5fjSgqn1gR8YNtZo74gEdRmavNTsotbCp+
	OQgP+uaBz7psUlWuodZoe5vlUPNiNGt2X7ofZt78tAuf0aJHT5uAK+EI1apictSbE8Rz
	7A3ZWzGFkOrWdlQeaWVc+ioPs7pNXGM4I8iFj7njfkQPN0BbFJKluvD7+RQBuZW/2Zme
	Hw7r10hvafwJcjSwTUm3sFEzn+6uq3AVjraAKZd87JylYIKbKpkNBhCUs4ENuKSjMXAW
	hX2w==
X-Received: by 10.15.34.197 with SMTP id e45mr3724015eev.61.1389278977659;
	Thu, 09 Jan 2014 06:49:37 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 7sm6161322eee.12.2014.01.09.06.49.35
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jan 2014 06:49:36 -0800 (PST)
Date: Thu, 9 Jan 2014 15:49:46 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org, Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20140109144946.GH3709@jama>
References: <20140106221511.85C275049C@opal>
MIME-Version: 1.0
In-Reply-To: <20140106221511.85C275049C@opal>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Chen Qi : Add missing RDEPENDS of initscripts-functions
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
X-List-Received-Date: Thu, 09 Jan 2014 14:49:40 -0000
X-Groupsio-MsgNum: 48768
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hCH6UO/yhd9rsH1L"
Content-Disposition: inline

--hCH6UO/yhd9rsH1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 06, 2014 at 10:15:11PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 6690c12cb1977f6bf93f3eb6d471dbd7db81bf28
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D6690c12cb1977f6bf93f3eb6d471dbd7db81bf28
>=20
> Author: Chen Qi <Qi.Chen@windriver.com>
> Date:   Mon Jan  6 15:27:35 2014 +0800
>=20
> Add missing RDEPENDS of initscripts-functions
>=20
> Now that the initscripts-functions has been packaged separately,
> packages which may use the functions script should have a runtime
> dependency on it.

Do really all these recipes need initscripts-functions e.g. when
building image with systemd?

I have initscripts in blacklist for long time (since switching to
systemd) and now it tries to bring initscripts-functions from it.


>=20
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> ---
>=20
>  meta/recipes-bsp/alsa-state/alsa-state.bb                 | 2 +-
>  meta/recipes-bsp/apmd/apmd_3.2.2-14.bb                    | 1 +
>  meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb | 2 ++
>  meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb    | 4 ++--
>  meta/recipes-connectivity/openssh/openssh_6.4p1.bb        | 2 +-
>  meta/recipes-connectivity/ppp/ppp_2.4.5.bb                | 1 +
>  meta/recipes-core/dbus/dbus.inc                           | 2 +-
>  meta/recipes-core/systemd/systemd_208.bb                  | 2 +-
>  meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb            | 2 +-
>  meta/recipes-devtools/distcc/distcc_3.1.bb                | 1 +
>  meta/recipes-devtools/tcf-agent/tcf-agent_git.bb          | 2 +-
>  meta/recipes-extended/at/at_3.1.14.bb                     | 3 +--
>  meta/recipes-extended/cronie/cronie_1.4.11.bb             | 2 ++
>  meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb            | 2 ++
>  meta/recipes-extended/sysklogd/sysklogd.inc               | 2 ++
>  meta/recipes-extended/xinetd/xinetd_2.3.15.bb             | 1 +
>  meta/recipes-kernel/oprofile/oprofileui-server_git.bb     | 2 +-
>  17 files changed, 22 insertions(+), 11 deletions(-)
>=20
> diff --git a/meta/recipes-bsp/alsa-state/alsa-state.bb b/meta/recipes-bsp=
/alsa-state/alsa-state.bb
> index 552fcfc..4be74aa 100644
> --- a/meta/recipes-bsp/alsa-state/alsa-state.bb
> +++ b/meta/recipes-bsp/alsa-state/alsa-state.bb
> @@ -37,7 +37,7 @@ PACKAGES +=3D "alsa-states"
> =20
>  RRECOMMENDS_alsa-state =3D "alsa-states"
> =20
> -RDEPENDS_${PN} =3D "alsa-utils-alsactl"
> +RDEPENDS_${PN} =3D "alsa-utils-alsactl initscripts-functions"
>  FILES_${PN} =3D "${sysconfdir}/init.d ${sysconfdir}/asound.conf"
>  CONFFILES_${PN} =3D "${sysconfdir}/asound.conf"
> =20
> diff --git a/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb b/meta/recipes-bsp/ap=
md/apmd_3.2.2-14.bb
> index 8c4b75e..d5ddc17 100644
> --- a/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb
> +++ b/meta/recipes-bsp/apmd/apmd_3.2.2-14.bb
> @@ -8,6 +8,7 @@ LICENSE =3D "GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f \
>                      file://apm.h;beginline=3D6;endline=3D18;md5=3D7d4acc=
1250910a89f84ce3cc6557c4c2"
>  DEPENDS =3D "libtool-cross"
> +RDEPENDS_${PN} =3D "initscripts-functions"
>  PR =3D "r2"
> =20
>  SRC_URI =3D "${DEBIAN_MIRROR}/main/a/apmd/apmd_3.2.2.orig.tar.gz;name=3D=
tarball \
> diff --git a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb b/=
meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
> index 7f216ac..59c9b6a 100644
> --- a/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
> +++ b/meta/recipes-connectivity/irda-utils/irda-utils_0.9.18.bb
> @@ -24,6 +24,8 @@ inherit autotools update-rc.d
>  INITSCRIPT_NAME =3D "irattach"
>  INITSCRIPT_PARAMS =3D "defaults 20"
> =20
> +RDEPENDS_${PN} +=3D "initscripts-functions"
> +
>  do_compile () {
>      oe_runmake -e -C irattach
>      oe_runmake -e -C irdaping
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb b/met=
a/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
> index 45eacd9..fd44ea1 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.2.9.bb
> @@ -9,8 +9,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D95f3a93a5c3c78=
88de623b46ea085a84"
> =20
>  # util-linux for libblkid
>  DEPENDS =3D "libcap libnfsidmap libevent util-linux sqlite3"
> -RDEPENDS_${PN}-client =3D "rpcbind bash"
> -RDEPENDS_${PN} =3D "${PN}-client bash"
> +RDEPENDS_${PN}-client =3D "rpcbind bash initscripts-functions"
> +RDEPENDS_${PN} =3D "${PN}-client bash initscripts-functions"
>  RRECOMMENDS_${PN} =3D "kernel-module-nfsd"
> =20
>  inherit useradd
> diff --git a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb b/meta/re=
cipes-connectivity/openssh/openssh_6.4p1.bb
> index 4f8d70a..c61d16f 100644
> --- a/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_6.4p1.bb
> @@ -122,7 +122,7 @@ FILES_${PN}-misc =3D "${bindir}/ssh* ${libexecdir}/ss=
h*"
>  FILES_${PN}-keygen =3D "${bindir}/ssh-keygen"
> =20
>  RDEPENDS_${PN} +=3D "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
> -RDEPENDS_${PN}-sshd +=3D "${PN}-keygen"
> +RDEPENDS_${PN}-sshd +=3D "${PN}-keygen initscripts-functions"
> =20
>  CONFFILES_${PN}-sshd =3D "${sysconfdir}/ssh/sshd_config"
>  CONFFILES_${PN}-ssh =3D "${sysconfdir}/ssh/ssh_config"
> diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb b/meta/recipes-co=
nnectivity/ppp/ppp_2.4.5.bb
> index 52bab4f..ed1a391 100644
> --- a/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
> +++ b/meta/recipes-connectivity/ppp/ppp_2.4.5.bb
> @@ -5,6 +5,7 @@ SECTION =3D "console/network"
>  HOMEPAGE =3D "http://samba.org/ppp/"
>  BUGTRACKER =3D "http://ppp.samba.org/cgi-bin/ppp-bugs"
>  DEPENDS =3D "libpcap"
> +RDEPENDS_${PN} =3D "initscripts-functions"
>  LICENSE =3D "BSD & GPLv2+ & LGPLv2+ & PD"
>  LIC_FILES_CHKSUM =3D "file://pppd/ccp.c;beginline=3D1;endline=3D29;md5=
=3De2c43fe6e81ff77d87dc9c290a424dea \
>                      file://pppd/plugins/passprompt.c;beginline=3D1;endli=
ne=3D10;md5=3D3bcbcdbf0e369c9a3e0b8c8275b065d8 \
> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbu=
s.inc
> index ae80cb0..9bdb489 100644
> --- a/meta/recipes-core/dbus/dbus.inc
> +++ b/meta/recipes-core/dbus/dbus.inc
> @@ -6,7 +6,7 @@ LICENSE =3D "AFL-2 | GPLv2+"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D10dded3b58148f3f1fd804b26354a=
f3e \
>                      file://dbus/dbus.h;beginline=3D6;endline=3D20;md5=3D=
7755c9d7abccd5dbd25a6a974538bb3c"
>  DEPENDS =3D "expat virtual/libintl"
> -RDEPENDS_dbus =3D "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-pt=
est-ptest', '', d)}"
> +RDEPENDS_dbus =3D "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-pt=
est-ptest', '', d)} initscripts-functions"
>  RDEPENDS_dbus_class-native =3D ""
>  RDEPENDS_dbus_class-nativesdk =3D ""
> =20
> diff --git a/meta/recipes-core/systemd/systemd_208.bb b/meta/recipes-core=
/systemd/systemd_208.bb
> index dcf68dc..6590235 100644
> --- a/meta/recipes-core/systemd/systemd_208.bb
> +++ b/meta/recipes-core/systemd/systemd_208.bb
> @@ -229,7 +229,7 @@ PACKAGES =3D+ "udev-dbg udev udev-utils udev-hwdb"
> =20
>  FILES_udev-dbg +=3D "/lib/udev/.debug"
> =20
> -RDEPENDS_udev +=3D "udev-utils"
> +RDEPENDS_udev +=3D "udev-utils initscripts-functions"
>  RPROVIDES_udev =3D "hotplug"
>  RRECOMMENDS_udev +=3D "udev-hwdb"
> =20
> diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipe=
s-core/sysvinit/sysvinit_2.88dsf.bb
> index dd25f71..a84448a 100644
> --- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954=
499f7abaabaa882bbe \
>                      file://COPYRIGHT;endline=3D15;md5=3D349c872e0066155e=
1818b786938876a4"
>  PR =3D "r11"
> =20
> -RDEPENDS_${PN} =3D "${PN}-inittab"
> +RDEPENDS_${PN} =3D "${PN}-inittab initscripts-functions"
> =20
>  SRC_URI =3D "http://download.savannah.gnu.org/releases-noredirect/sysvin=
it/sysvinit-${PV}.tar.bz2 \
>             file://install.patch \
> diff --git a/meta/recipes-devtools/distcc/distcc_3.1.bb b/meta/recipes-de=
vtools/distcc/distcc_3.1.bb
> index 5c889fa..e351a58 100644
> --- a/meta/recipes-devtools/distcc/distcc_3.1.bb
> +++ b/meta/recipes-devtools/distcc/distcc_3.1.bb
> @@ -6,6 +6,7 @@ LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> =20
>  DEPENDS =3D "avahi"
> +RDEPENDS_${PN} =3D "initscripts-functions"
> =20
>  GTKCONFIG =3D "gtk"
>  GTKCONFIG_libc-uclibc =3D ""
> diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/reci=
pes-devtools/tcf-agent/tcf-agent_git.bb
> index 1eb0021..6d0fbb6 100644
> --- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> +++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
> @@ -15,7 +15,7 @@ SRC_URI =3D "git://git.eclipse.org/gitroot/tcf/org.ecli=
pse.tcf.agent.git \
>            "
> =20
>  DEPENDS =3D "util-linux openssl"
> -RDEPENDS_${PN} =3D "bash"
> +RDEPENDS_${PN} =3D "bash initscripts-functions"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> diff --git a/meta/recipes-extended/at/at_3.1.14.bb b/meta/recipes-extende=
d/at/at_3.1.14.bb
> index 1eb18b3..0a13157 100644
> --- a/meta/recipes-extended/at/at_3.1.14.bb
> +++ b/meta/recipes-extended/at/at_3.1.14.bb
> @@ -7,9 +7,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4325afd396febc=
b659c36b49533135d4"
>  DEPENDS =3D "flex flex-native \
>             ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
> =20
> -VIRTUAL-RUNTIME_initscripts ?=3D "initscripts"                          =
                                                                           =
           =20
>  RDEPENDS_${PN} =3D "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_DE=
PS}', '', d)} \
> -                  ${VIRTUAL-RUNTIME_initscripts} \
> +                  initscripts-functions \
>  "
> =20
>  PAM_DEPS =3D "libpam libpam-runtime pam-plugin-env pam-plugin-limits"
> diff --git a/meta/recipes-extended/cronie/cronie_1.4.11.bb b/meta/recipes=
-extended/cronie/cronie_1.4.11.bb
> index d98d0d9..c698181 100644
> --- a/meta/recipes-extended/cronie/cronie_1.4.11.bb
> +++ b/meta/recipes-extended/cronie/cronie_1.4.11.bb
> @@ -39,6 +39,8 @@ PACKAGECONFIG[pam] =3D "--with-pam,--without-pam,libpam=
,${PAM_DEPS}"
>  INITSCRIPT_NAME =3D "crond"
>  INITSCRIPT_PARAMS =3D "start 90 2 3 4 5 . stop 60 0 1 6 ."
> =20
> +RDEPENDS_${PN} =3D "initscripts-functions"
> +
>  USERADD_PACKAGES =3D "${PN}"
>  GROUPADD_PARAM_${PN} =3D "--system crontab"
> =20
> diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb b/meta/recipe=
s-extended/rpcbind/rpcbind_0.2.1.bb
> index 6043501..c1c3403 100644
> --- a/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
> +++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.1.bb
> @@ -33,6 +33,8 @@ PACKAGECONFIG[tcp-wrappers] =3D "--enable-libwrap,--dis=
able-libwrap,tcp-wrappers"
>  INITSCRIPT_NAME =3D "rpcbind"
>  INITSCRIPT_PARAMS =3D "start 12 2 3 4 5 . stop 60 0 1 6 ."
> =20
> +RDEPENDS_${PN} =3D "initscripts-functions"
> +
>  SYSTEMD_SERVICE_${PN} =3D "rpcbind.service"
>  SYSTEMD_AUTO_ENABLE =3D "disable"
> =20
> diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-e=
xtended/sysklogd/sysklogd.inc
> index 3a51810..ef70044 100644
> --- a/meta/recipes-extended/sysklogd/sysklogd.inc
> +++ b/meta/recipes-extended/sysklogd/sysklogd.inc
> @@ -24,6 +24,8 @@ SRC_URI_append_e500v2 =3D " file://no-vectorization.pat=
ch"
>  INITSCRIPT_NAME =3D "syslog"
>  CONFFILES_${PN} =3D "${sysconfdir}/syslog.conf.${BPN}"
> =20
> +RDEPENDS_${PN} =3D "initscripts-functions"
> +
>  CFLAGS_append =3D " -DSYSV"
> =20
>  do_install () {
> diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes=
-extended/xinetd/xinetd_2.3.15.bb
> index 1928949..c43892c 100644
> --- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
> +++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
> @@ -7,6 +7,7 @@ LICENSE =3D "BSD"
>  LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D8ad8615198542444f84d28a6cf2=
26dd8"
> =20
>  DEPENDS =3D ""
> +RDEPENDS_${PN} =3D "initscripts-functions"
>  PR =3D "r2"
> =20
>  SRC_URI =3D "http://www.xinetd.org/xinetd-${PV}.tar.gz \
> diff --git a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb b/meta=
/recipes-kernel/oprofile/oprofileui-server_git.bb
> index dbb5599..63f33e2 100644
> --- a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
> +++ b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
> @@ -11,7 +11,7 @@ SRC_URI =3D "git://git.yoctoproject.org/oprofileui \
> =20
>  EXTRA_OECONF +=3D "--disable-client --enable-server"
> =20
> -RDEPENDS_${PN} =3D "oprofile"
> +RDEPENDS_${PN} =3D "oprofile initscripts-functions"
> =20
>  do_install_append() {
>  	install -d ${D}${sysconfdir}/init.d
>=20
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-commits

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--hCH6UO/yhd9rsH1L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLOtwoACgkQN1Ujt2V2gBxyyACdFVAUU6Cnha93wAOjf/M60EXj
Q2sAoJMWW70jorVChFwDpEd74tlL10Me
=QxA/
-----END PGP SIGNATURE-----

--hCH6UO/yhd9rsH1L--
