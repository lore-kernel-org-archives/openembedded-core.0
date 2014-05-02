Return-Path: <martin.jansa@gmail.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id A7AB96059B;
	Fri,  2 May 2014 23:01:23 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id hr9so6204666vcb.29
	for <multiple recipients>; Fri, 02 May 2014 16:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=U2nBlYLXSG3Vz4QLLwgkWsPpIkIcswfSh768Gt6upBU=;
	b=M69OrI1cJ1fBlXG1oCTE2BPm7k2wmy+1om2t/a3c8nsBGst8anSnNd62+25X6wPWLm
	p34vLF9Vynv35OeZJ2t1E1Aqgshb/6wMJ0SzsK8I7Go3VPp536ydHU0kjEglCJTRDemX
	Qqi+WLdz54P+lkpy3ldz3xpLZrBXkxHzI0/7oCBfggbr1BJiJHrn3RP4snw4pXQ4o0Gy
	TT4Sx5J9GQ926OSkAs3w2dp/4tp4gUMZukB/uCBi0nQQ9qDt8JmZjVZBqgn86qgXo7qA
	oKOJOn66WecYH8PFx5PlQDhNmp35izsYApGbTfLDjdLHPJhAV78VtHXH21+L17ooh6Dm
	/Arw==
X-Received: by 10.52.37.196 with SMTP id a4mr1995884vdk.33.1399071684529;
	Fri, 02 May 2014 16:01:24 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	un13sm797395vdb.10.2014.05.02.16.01.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 May 2014 16:01:23 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 3 May 2014 01:01:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140502230140.GZ2486@jama>
References: <20140502225414.GY2486@jama>
MIME-Version: 1.0
In-Reply-To: <20140502225414.GY2486@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: State of bitbake world, Failed tasks 2014-05-02
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
X-List-Received-Date: Fri, 02 May 2014 23:01:27 -0000
X-Groupsio-MsgNum: 52767
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0UKK28zE3bJc0fm6"
Content-Disposition: inline

--0UKK28zE3bJc0fm6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 03, 2014 at 12:54:14AM +0200, Martin Jansa wrote:
> Thanks to 2 fixes from Paul were down to only couple recipes.
>=20
> As discussed on OEDAM today, I'll be more aggressive with removing, black=
listing
> so today I'll send patch adding few PNBLACKLIST entries and inheriting bl=
acklist
> bbclass by default.
>=20
> http://www.openembedded.org/wiki/Bitbake_World_Status
>=20

QA issues from last build (incomplete list, for complete list check
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
40403_143715.log/qa.log )

aurora-daemon-0.1+gitrAUTOINC+b65354ad6c: aurora-daemon: found library in w=
rong location: /usr/share/aurora/applications/settings/libaurora-app-settin=
gs.so
cairomm-1.10.0: cairomm: configure was passed unrecognised options: --disab=
le-egl --disable-valgrind --enable-tee --with-x --disable-glesv2
chromium-35.0.1883.0: ELF binary '/home/jenkins/oe/shr-core-branches/shr-co=
re/tmp-eglibc/work/i586-oe-linux/chromium/35.0.1883.0-r0/packages-split/chr=
omium/usr/bin/chrome/libffmpegsumo.so' has relocations in .text
chromium-35.0.1883.0: chromium: found library in wrong location: /usr/bin/c=
hrome/libffmpegsumo.so
chromium-dbg: found library in wrong location: /usr/bin/chrome/.debug/libff=
mpegsumo.so
claws-mail-3.9.0: claws-mail: configure was passed unrecognised options: --=
disable-gnomeprint --disable-clamav-plugin --disable-aspell-test --enable-a=
spell
eglibc-2.19: ELF binary '/home/jenkins/oe/shr-core-branches/shr-core/tmp-eg=
libc/work/core2-64-oe-linux/eglibc/2.19-r0/packages-split/nscd/usr/sbin/nsc=
d' has relocations in .text
evolution-data-server-3.2.3+gitAUTOINC+a9e4e74ec4: evolution-data-server: c=
onfigure was passed unrecognised options: --with-dbus --without-bug-buddy -=
-without-weather --disable-uoa --with-soup
expedite-1.7.9: expedite: configure was passed unrecognised options: --disa=
ble-software-16-ddraw --disable-software-sdl --disable-opengl-glew
fbreader-0.99.5+gitrAUTOINC+2cf1ec0e30: File '/usr/bin/FBReader' from fbrea=
der was already stripped, this will prevent future debugging!
fbreader-0.99.5+gitrAUTOINC+2cf1ec0e30: File '/usr/lib/libzlcore.so.0.14.0'=
 from fbreader was already stripped, this will prevent future debugging!
fbreader-0.99.5+gitrAUTOINC+2cf1ec0e30: File '/usr/lib/libzltext.so.0.14.0'=
 from fbreader was already stripped, this will prevent future debugging!
fbreader-0.99.5+gitrAUTOINC+2cf1ec0e30: File '/usr/lib/zlibrary/ui/zlui-gtk=
=2Eso' from fbreader was already stripped, this will prevent future debuggi=
ng!
fluidsynth-1.1.1: fluidsynth: configure was passed unrecognised options: --=
without-readline-support
fsodeviced-0.12.0: fsodeviced: configure was passed unrecognised options: -=
-enable-htcdream-powercontrol
fuse-2.9.3: fuse: configure was passed unrecognised options: --disable-kern=
el-module
gnome-settings-daemon-2.32.1: gnome-settings-daemon: configure was passed u=
nrecognised options: --disable-esd
gnome-themes-2.32.1: gnome-themes: configure was passed unrecognised option=
s: --disable-hicolor-check
gst-fluendo-mpegdemux-0.10.72: gst-fluendo-mpegdemux: configure was passed =
unrecognised options: --disable-debug
gypsy-0.9: gypsy: configure was passed unrecognised options: --with-distro
imagemagick-6.8.8: imagemagick: configure was passed unrecognised options: =
--without-jp2
libgsf-1.14.26: libgsf: configure was passed unrecognised options: --withou=
t-python --without-gnome-vfs --without-bonobo
liblockfile-1.09: liblockfile: configure was passed unrecognised options: -=
-enable-static
libmicrohttpd-0.9.34: libmicrohttpd: configure was passed unrecognised opti=
ons: --enable-gnutls
libxaw-1.0.10: libxaw: configure was passed unrecognised options: --disable=
-docs
links-2.7: links: configure was passed unrecognised options: --enable-javas=
cript --with-libfl --without-sdl
links-x11-2.7: links-x11: configure was passed unrecognised options: --enab=
le-javascript --with-libfl --without-sdl
metacity-2.34.13: metacity: configure was passed unrecognised options: --di=
sable-verbose
openbox-3.5.0: openbox: configure was passed unrecognised options: --with-p=
lugins
openobex-1.5: openobex: configure was passed unrecognised options: --with-u=
sb --with-bluez
oscam-1.10+9164: File '/usr/bin/oscam' from oscam was already stripped, thi=
s will prevent future debugging!
owfs-2.9p1: owfs: configure was passed unrecognised options: --enable-cache=
 --enable-mt
polkit-gnome-0.102: polkit-gnome: configure was passed unrecognised options=
: --disable-scrollkeeper --disable-man-pages
qt-creator-2.8.1: qt-creator: found library in wrong location: /usr/share/q=
tcreator/qbs/lib/qbs/plugins/libqbs_cpp_scanner.so
qt-creator-dbg: found library in wrong location: /usr/share/qtcreator/qbs/l=
ib/qbs/plugins/.debug/libqbs_cpp_scanner.so
qt-creator-dbg: found library in wrong location: /usr/share/qtcreator/qbs/l=
ib/qbs/plugins/.debug/libqbs_qt_scanner.so
qt-creator: found library in wrong location: /usr/share/qtcreator/qbs/lib/q=
bs/plugins/libqbs_qt_scanner.so
qwt-6.0.1: File '/usr/lib/libqwt.so.6.0.1' from qwt was already stripped, t=
his will prevent future debugging!
qwt-6.0.1: File '/usr/lib/libqwtmathml.so.6.0.1' from qwt was already strip=
ped, this will prevent future debugging!
qwt-6.0.1: File '/usr/lib/qt4/plugins/designer/libqwt_designer_plugin.so' f=
rom qwt was already stripped, this will prevent future debugging!
ruby-1.9.3-p429: ruby: configure was passed unrecognised options: --enable-=
wide-getaddrinfo
start-stop-daemon-1.16.0.2: start-stop-daemon: configure was passed unrecog=
nised options: --without-deselect
sylpheed-2.7.1: sylpheed: configure was passed unrecognised options: --enab=
le-gnutls
talloc-2.0.1: talloc: Files/directories were installed but not shipped
vsftpd-3.0.0: vsftpd: Files/directories were installed but not shipped
xbmc-11.0+gitrAUTOINC+82388d55da: xbmc: configure was passed unrecognised o=
ptions: --disable-rpath



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0UKK28zE3bJc0fm6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNkI9QACgkQN1Ujt2V2gBxhhwCeJ//JzPa3eahnEkiXjJH+gGYQ
H5oAnAmIssqOcQ030Hubg3/JZK8s2TWt
=CI+1
-----END PGP SIGNATURE-----

--0UKK28zE3bJc0fm6--
