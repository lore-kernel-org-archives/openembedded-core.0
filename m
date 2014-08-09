Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f172.google.com (mail-wi0-f172.google.com
	[209.85.212.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5826465E2E;
	Sat,  9 Aug 2014 09:00:36 +0000 (UTC)
Received: by mail-wi0-f172.google.com with SMTP id n3so2072509wiv.11
	for <multiple recipients>; Sat, 09 Aug 2014 02:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	bh=yr6On7ajTbMzEnvHiUWlJgz92C6fg6hZJsLqhZtCE+M=;
	b=RtQrrJFw9qgU3LAlGbRSmFkgWe60/Z094ePO5ljEAmfKsWx36p19uk0FNe39Rc3t59
	jkFzU04O7jAidLOoy2I7bJTns55Fl0G/QHH/0Fu6na5oLe34qp3lK71InHoKCTMS0MSa
	EkYnHiRAr8OpzLr1OQAA5oexLk7u2MK7ABr3ca9gwXRPaBwR0Xw5mH9YQW4XBhjEOcpS
	G2GPE49BEr415tWklfg52cWhyTW+59no6wehvYvBWv9+bAcXP0crph+Uzyi2NxQkP/jy
	VgkCqrzPrNi4PLZLPjY+kzQnjX6sd8f6/LoS6kCKsN7tOgpiNBcNTee0YxEnFmUsIm9Q
	d04g==
X-Received: by 10.180.37.241 with SMTP id b17mr9684759wik.70.1407574837637;
	Sat, 09 Aug 2014 02:00:37 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	r20sm16773934wik.0.2014.08.09.02.00.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 02:00:36 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 9 Aug 2014 11:01:10 +0200
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Message-ID: <20140809090110.GK14848@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: State of bitbake world, test-dependencies 2014-08-08
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
X-List-Received-Date: Sat, 09 Aug 2014 09:00:38 -0000
X-Groupsio-MsgNum: 56215
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1qrhXh8iFgyYHgLh"
Content-Disposition: inline

--1qrhXh8iFgyYHgLh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 25, 2014 at 05:40:21PM +0200, Martin Jansa wrote:
> Complete logs:
> http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140724_=
145905.log/
>=20
> ERROR: 46 issues were found in these recipes: gst-ffmpeg lttng-modules mo=
demmanager monkey openal-soft ...

I've sent fixes for gst-ffmpeg, openal-soft, qttools, qtimageformats

I'll look into few more, because it's annoying how long they are in this li=
st.
I don't use any of these so I'll look into them in order of number of issues
they have (tracker will be first). I'll also care less about fixing it "pro=
perly"
with PACKAGECONFIGs and will just throw all DEPENDS in (people using these
recipes had enough time to fix it properly and it can be converted to PACKA=
GECONFIG
later).

Complete logs:
http://logs.nslu2-linux.org/buildlogs/oe/world/log.dependencies.20140808_06=
3907.log/

ERROR: 483 issues were found in these recipes: directfb engrave epiphany ex=
pedite gd gmtk gnome-disk-utility gst-ffmpeg guile leptonica libarchive lib=
microhttpd libmikmod libungif libwebp libwmf mariadb midori mpd mpeg2dec mp=
g123 openal-soft opendataplane oscam piglit protobuf snort sox stunnel syne=
rgy tesseract tracker

This is first report with the message format unified with insane_qa check.

WARN: directfb: directfb rdepends on eglibc but it's not a build dependency?
WARN: directfb: directfb rdepends on freetype but it's not a build dependen=
cy?
WARN: directfb: directfb rdepends on libdrm but it's not a build dependency?
WARN: directfb: directfb rdepends on libdrm-kms but it's not a build depend=
ency?
WARN: directfb: directfb rdepends on libgcc but it's not a build dependency?
WARN: directfb: directfb rdepends on libjpeg-turbo but it's not a build dep=
endency?
WARN: directfb: directfb rdepends on liblzma but it's not a build dependenc=
y?
WARN: directfb: directfb rdepends on libpng but it's not a build dependency?
WARN: directfb: directfb rdepends on libstdc++ but it's not a build depende=
ncy?
WARN: directfb: directfb rdepends on libwebp but it's not a build dependenc=
y?
WARN: directfb: directfb rdepends on tiff but it's not a build dependency?
WARN: directfb: directfb rdepends on tslib but it's not a build dependency?
WARN: directfb: directfb rdepends on zlib but it's not a build dependency?
WARN: engrave: engrave rdepends on ecore but it's not a build dependency?
WARN: engrave: engrave rdepends on ecore-evas but it's not a build dependen=
cy?
WARN: engrave: engrave rdepends on ecore-input but it's not a build depende=
ncy?
WARN: engrave: engrave rdepends on ecore-input-evas but it's not a build de=
pendency?
WARN: engrave: engrave rdepends on eglibc but it's not a build dependency?
WARN: engrave: engrave rdepends on eina but it's not a build dependency?
WARN: engrave: engrave rdepends on eo but it's not a build dependency?
WARN: engrave: engrave rdepends on evas but it's not a build dependency?
WARN: engrave: engrave rdepends on expat but it's not a build dependency?
WARN: engrave: engrave rdepends on flex but it's not a build dependency?
WARN: engrave: engrave rdepends on fontconfig but it's not a build dependen=
cy?
WARN: engrave: engrave rdepends on freetype but it's not a build dependency?
WARN: engrave: engrave rdepends on fribidi but it's not a build dependency?
WARN: engrave: engrave rdepends on glib-2.0 but it's not a build dependency?
WARN: engrave: engrave rdepends on libcrypto but it's not a build dependenc=
y?
WARN: engrave: engrave rdepends on libeet but it's not a build dependency?
WARN: engrave: engrave rdepends on libjpeg-turbo but it's not a build depen=
dency?
WARN: engrave: engrave rdepends on libpng but it's not a build dependency?
WARN: engrave: engrave rdepends on libssl but it's not a build dependency?
WARN: engrave: engrave rdepends on libstdc++ but it's not a build dependenc=
y?
WARN: engrave: engrave rdepends on luajit but it's not a build dependency?
WARN: engrave: engrave rdepends on zlib but it's not a build dependency?
WARN: epiphany: epiphany rdepends on cairo but it's not a build dependency?
WARN: epiphany: epiphany rdepends on dbus-glib but it's not a build depende=
ncy?
WARN: epiphany: epiphany rdepends on dbus-lib but it's not a build dependen=
cy?
WARN: epiphany: epiphany rdepends on eglibc but it's not a build dependency?
WARN: epiphany: epiphany rdepends on gconf but it's not a build dependency?
WARN: epiphany: epiphany rdepends on gdk-pixbuf but it's not a build depend=
ency?
WARN: epiphany: epiphany rdepends on glib-2.0 but it's not a build dependen=
cy?
WARN: epiphany: epiphany rdepends on gtk+ but it's not a build dependency?
WARN: epiphany: epiphany rdepends on hicolor-icon-theme but it's not a buil=
d dependency?
WARN: epiphany: epiphany rdepends on iso-codes but it's not a build depende=
ncy?
WARN: epiphany: epiphany rdepends on libavahi-client but it's not a build d=
ependency?
WARN: epiphany: epiphany rdepends on libavahi-common but it's not a build d=
ependency?
WARN: epiphany: epiphany rdepends on libavahi-gobject but it's not a build =
dependency?
WARN: epiphany: epiphany rdepends on libgnome-keyring but it's not a build =
dependency?
WARN: epiphany: epiphany rdepends on libice but it's not a build dependency?
WARN: epiphany: epiphany rdepends on libjavascriptcore but it's not a build=
 dependency?
WARN: epiphany: epiphany rdepends on libnotify but it's not a build depende=
ncy?
WARN: epiphany: epiphany rdepends on libsm but it's not a build dependency?
WARN: epiphany: epiphany rdepends on libsoup-2.4 but it's not a build depen=
dency?
WARN: epiphany: epiphany rdepends on libx11 but it's not a build dependency?
WARN: epiphany: epiphany rdepends on libxml2 but it's not a build dependenc=
y?
WARN: epiphany: epiphany rdepends on libxslt but it's not a build dependenc=
y?
WARN: epiphany: epiphany rdepends on pango but it's not a build dependency?
WARN: epiphany: epiphany rdepends on webkit-gtk but it's not a build depend=
ency?
WARN: expedite: expedite rdepends on eglibc but it's not a build dependency?
WARN: expedite: expedite rdepends on eina but it's not a build dependency?
WARN: expedite: expedite rdepends on evas but it's not a build dependency?
WARN: expedite: expedite rdepends on evas-engine-fb but it's not a build de=
pendency?
WARN: expedite: expedite rdepends on evas-engine-gl-x11 but it's not a buil=
d dependency?
WARN: expedite: expedite rdepends on evas-engine-software-generic but it's =
not a build dependency?
WARN: expedite: expedite rdepends on evas-engine-software-x11 but it's not =
a build dependency?
WARN: expedite: expedite rdepends on evas-loader-png but it's not a build d=
ependency?
WARN: expedite: expedite rdepends on expedite-themes but it's not a build d=
ependency?
WARN: expedite: expedite rdepends on libgcc but it's not a build dependency?
WARN: expedite: expedite rdepends on libsdl but it's not a build dependency?
WARN: expedite: expedite rdepends on libx11 but it's not a build dependency?
WARN: gd: gd rdepends on eglibc but it's not a build dependency?
WARN: gd: gd rdepends on freetype but it's not a build dependency?
WARN: gd: gd rdepends on libjpeg-turbo but it's not a build dependency?
WARN: gd: gd rdepends on liblzma but it's not a build dependency?
WARN: gd: gd rdepends on libpng but it's not a build dependency?
WARN: gd: gd rdepends on libvpx but it's not a build dependency?
WARN: gd: gd rdepends on tiff but it's not a build dependency?
WARN: gd: gd rdepends on zlib but it's not a build dependency?
WARN: gmtk: gmtk rdepends on atk but it's not a build dependency?
WARN: gmtk: gmtk rdepends on cairo but it's not a build dependency?
WARN: gmtk: gmtk rdepends on cairo-gobject but it's not a build dependency?
WARN: gmtk: gmtk rdepends on dbus-lib but it's not a build dependency?
WARN: gmtk: gmtk rdepends on eglibc but it's not a build dependency?
WARN: gmtk: gmtk rdepends on expat but it's not a build dependency?
WARN: gmtk: gmtk rdepends on fontconfig but it's not a build dependency?
WARN: gmtk: gmtk rdepends on freetype but it's not a build dependency?
WARN: gmtk: gmtk rdepends on gdk-pixbuf but it's not a build dependency?
WARN: gmtk: gmtk rdepends on glib-2.0 but it's not a build dependency?
WARN: gmtk: gmtk rdepends on gtk+3 but it's not a build dependency?
WARN: gmtk: gmtk rdepends on harfbuzz but it's not a build dependency?
WARN: gmtk: gmtk rdepends on json-c but it's not a build dependency?
WARN: gmtk: gmtk rdepends on libasound but it's not a build dependency?
WARN: gmtk: gmtk rdepends on libcap but it's not a build dependency?
WARN: gmtk: gmtk rdepends on libffi but it's not a build dependency?
WARN: gmtk: gmtk rdepends on libice but it's not a build dependency?
WARN: gmtk: gmtk rdepends on libpng but it's not a build dependency?
WARN: gmtk: gmtk rdepends on libpulse but it's not a build dependency?
WARN: gmtk: gmtk rdepends on libpulse-mainloop-glib but it's not a build de=
pendency?
WARN: gmtk: gmtk rdepends on libsm but it's not a build dependency?
WARN: gmtk: gmtk rdepends on libsndfile1 but it's not a build dependency?
WARN: gmtk: gmtk rdepends on libx11 but it's not a build dependency?
WARN: gmtk: gmtk rdepends on libx11-xcb but it's not a build dependency?
WARN: gmtk: gmtk rdepends on libxau but it's not a build dependency?
WARN: gmtk: gmtk rdepends on libxcb but it's not a build dependency?
WARN: gmtk: gmtk rdepends on libxcb-render but it's not a build dependency?
WARN: gmtk: gmtk rdepends on libxcb-shm but it's not a build dependency?
WARN: gmtk: gmtk rdepends on libxdmcp but it's not a build dependency?
WARN: gmtk: gmtk rdepends on libxext but it's not a build dependency?
WARN: gmtk: gmtk rdepends on libxi but it's not a build dependency?
WARN: gmtk: gmtk rdepends on libxrender but it's not a build dependency?
WARN: gmtk: gmtk rdepends on libxtst but it's not a build dependency?
WARN: gmtk: gmtk rdepends on pango but it's not a build dependency?
WARN: gmtk: gmtk rdepends on pixman but it's not a build dependency?
WARN: gmtk: gmtk rdepends on util-linux-libuuid but it's not a build depend=
ency?
WARN: gmtk: gmtk rdepends on zlib but it's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on atk but it's =
not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on avahi-ui but =
it's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on cairo but it'=
s not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on dbus-glib but=
 it's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on dbus-lib but =
it's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on eglibc but it=
's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on expat but it'=
s not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on fontconfig bu=
t it's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on freetype but =
it's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on gdk-pixbuf bu=
t it's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on glib-2.0 but =
it's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on gtk+ but it's=
 not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on harfbuzz but =
it's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on libatasmart b=
ut it's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on libavahi-clie=
nt but it's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on libavahi-comm=
on but it's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on libavahi-glib=
 but it's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on libcap but it=
's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on libffi but it=
's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on libgcrypt but=
 it's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on libgnome-keyr=
ing but it's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on libgpg-error =
but it's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on libpng but it=
's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on libudev but i=
t's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on libx11 but it=
's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on libxau but it=
's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on libxcb but it=
's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on libxcb-render=
 but it's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on libxcb-shm bu=
t it's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on libxdmcp but =
it's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on libxext but i=
t's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on libxrender bu=
t it's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on pango but it'=
s not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on pixman but it=
's not a build dependency?
WARN: gnome-disk-utility: gnome-disk-utility-libs rdepends on zlib but it's=
 not a build dependency?
WARN: guile: guile rdepends on bdwgc but it's not a build dependency?
WARN: guile: guile rdepends on eglibc but it's not a build dependency?
WARN: guile: guile rdepends on glibc-gconv-iso8859-1 but it's not a build d=
ependency?
WARN: guile: guile rdepends on gmp but it's not a build dependency?
WARN: guile: guile rdepends on libffi but it's not a build dependency?
WARN: guile: guile rdepends on libltdl but it's not a build dependency?
WARN: guile: guile rdepends on libunistring but it's not a build dependency?
WARN: guile: guile rdepends on ncurses-libncurses but it's not a build depe=
ndency?
WARN: guile: guile rdepends on readline but it's not a build dependency?
WARN: leptonica: leptonica rdepends on eglibc but it's not a build dependen=
cy?
WARN: leptonica: leptonica rdepends on giflib but it's not a build dependen=
cy?
WARN: leptonica: leptonica rdepends on libjpeg-turbo but it's not a build d=
ependency?
WARN: leptonica: leptonica rdepends on liblzma but it's not a build depende=
ncy?
WARN: leptonica: leptonica rdepends on libpng but it's not a build dependen=
cy?
WARN: leptonica: leptonica rdepends on tiff but it's not a build dependency?
WARN: leptonica: leptonica rdepends on zlib but it's not a build dependency?
WARN: libarchive: libarchive rdepends on eglibc but it's not a build depend=
ency?
WARN: libarchive: libarchive rdepends on libattr but it's not a build depen=
dency?
WARN: libarchive: libarchive rdepends on libbz2 but it's not a build depend=
ency?
WARN: libarchive: libarchive rdepends on libxml2 but it's not a build depen=
dency?
WARN: libarchive: libarchive rdepends on nettle but it's not a build depend=
ency?
WARN: libarchive: libarchive rdepends on zlib but it's not a build dependen=
cy?
WARN: libarchive: libarchive-bin rdepends on eglibc but it's not a build de=
pendency?
WARN: libarchive: libarchive-bin rdepends on libattr but it's not a build d=
ependency?
WARN: libarchive: libarchive-bin rdepends on libbz2 but it's not a build de=
pendency?
WARN: libarchive: libarchive-bin rdepends on libxml2 but it's not a build d=
ependency?
WARN: libarchive: libarchive-bin rdepends on nettle but it's not a build de=
pendency?
WARN: libarchive: libarchive-bin rdepends on zlib but it's not a build depe=
ndency?
WARN: libmicrohttpd: libmicrohttpd-bin rdepends on eglibc but it's not a bu=
ild dependency?
WARN: libmicrohttpd: libmicrohttpd-bin rdepends on file but it's not a buil=
d dependency?
WARN: libmicrohttpd: libmicrohttpd-bin rdepends on libcurl but it's not a b=
uild dependency?
WARN: libmicrohttpd: libmicrohttpd-bin rdepends on libmicrohttpd but it's n=
ot a build dependency?
WARN: libmikmod: libmikmod rdepends on dbus-lib but it's not a build depend=
ency?
WARN: libmikmod: libmikmod rdepends on eglibc but it's not a build dependen=
cy?
WARN: libmikmod: libmikmod rdepends on json-c but it's not a build dependen=
cy?
WARN: libmikmod: libmikmod rdepends on libcap but it's not a build dependen=
cy?
WARN: libmikmod: libmikmod rdepends on libice but it's not a build dependen=
cy?
WARN: libmikmod: libmikmod rdepends on libpulse but it's not a build depend=
ency?
WARN: libmikmod: libmikmod rdepends on libpulse-simple but it's not a build=
 dependency?
WARN: libmikmod: libmikmod rdepends on libsm but it's not a build dependenc=
y?
WARN: libmikmod: libmikmod rdepends on libsndfile1 but it's not a build dep=
endency?
WARN: libmikmod: libmikmod rdepends on libx11 but it's not a build dependen=
cy?
WARN: libmikmod: libmikmod rdepends on libx11-xcb but it's not a build depe=
ndency?
WARN: libmikmod: libmikmod rdepends on libxau but it's not a build dependen=
cy?
WARN: libmikmod: libmikmod rdepends on libxcb but it's not a build dependen=
cy?
WARN: libmikmod: libmikmod rdepends on libxdmcp but it's not a build depend=
ency?
WARN: libmikmod: libmikmod rdepends on libxext but it's not a build depende=
ncy?
WARN: libmikmod: libmikmod rdepends on libxi but it's not a build dependenc=
y?
WARN: libmikmod: libmikmod rdepends on libxtst but it's not a build depende=
ncy?
WARN: libmikmod: libmikmod rdepends on util-linux-libuuid but it's not a bu=
ild dependency?
WARN: libungif: libungif rdepends on eglibc but it's not a build dependency?
WARN: libungif: libungif rdepends on libice but it's not a build dependency?
WARN: libungif: libungif rdepends on libsm but it's not a build dependency?
WARN: libungif: libungif rdepends on libx11 but it's not a build dependency?
WARN: libungif: libungif rdepends on libxau but it's not a build dependency?
WARN: libungif: libungif rdepends on libxcb but it's not a build dependency?
WARN: libungif: libungif rdepends on libxdmcp but it's not a build dependen=
cy?
WARN: libungif: libungif rdepends on util-linux-libuuid but it's not a buil=
d dependency?
WARN: libungif: libungif-utils rdepends on eglibc but it's not a build depe=
ndency?
WARN: libungif: libungif-utils rdepends on libungif but it's not a build de=
pendency?
WARN: libungif: libungif-utils rdepends on libx11 but it's not a build depe=
ndency?
WARN: libwebp: libwebp-gif2webp rdepends on eglibc but it's not a build dep=
endency?
WARN: libwebp: libwebp-gif2webp rdepends on giflib but it's not a build dep=
endency?
WARN: libwebp: libwebp-gif2webp rdepends on libwebp but it's not a build de=
pendency?
WARN: ltrace: ltrace rdepends on eglibc but it's not a build dependency?
WARN: ltrace: ltrace rdepends on elfutils but it's not a build dependency?
WARN: ltrace: ltrace rdepends on libelf but it's not a build dependency?
WARN: midori: midori rdepends on cairo but it's not a build dependency?
WARN: midori: midori rdepends on eglibc but it's not a build dependency?
WARN: midori: midori rdepends on gdk-pixbuf but it's not a build dependency?
WARN: midori: midori rdepends on glib-2.0 but it's not a build dependency?
WARN: midori: midori rdepends on gtk+ but it's not a build dependency?
WARN: midori: midori rdepends on hicolor-icon-theme but it's not a build de=
pendency?
WARN: midori: midori rdepends on libjavascriptcore but it's not a build dep=
endency?
WARN: midori: midori rdepends on libnotify but it's not a build dependency?
WARN: midori: midori rdepends on libsoup-2.4 but it's not a build dependenc=
y?
WARN: midori: midori rdepends on libsqlite3 but it's not a build dependency?
WARN: midori: midori rdepends on libunique but it's not a build dependency?
WARN: midori: midori rdepends on libx11 but it's not a build dependency?
WARN: midori: midori rdepends on libxml2 but it's not a build dependency?
WARN: midori: midori rdepends on libxscrnsaver but it's not a build depende=
ncy?
WARN: midori: midori rdepends on pango but it's not a build dependency?
WARN: midori: midori rdepends on webkit-gtk but it's not a build dependency?
WARN: mpd: mpd rdepends on base-files but it's not a build dependency?
WARN: mpd: mpd rdepends on base-passwd but it's not a build dependency?
WARN: mpd: mpd rdepends on eglibc but it's not a build dependency?
WARN: mpd: mpd rdepends on fluidsynth but it's not a build dependency?
WARN: mpd: mpd rdepends on glib-2.0 but it's not a build dependency?
WARN: mpd: mpd rdepends on libao but it's not a build dependency?
WARN: mpd: mpd rdepends on libasound but it's not a build dependency?
WARN: mpd: mpd rdepends on libavahi-client but it's not a build dependency?
WARN: mpd: mpd rdepends on libavahi-common but it's not a build dependency?
WARN: mpd: mpd rdepends on libavcodec but it's not a build dependency?
WARN: mpd: mpd rdepends on libavformat but it's not a build dependency?
WARN: mpd: mpd rdepends on libavutil but it's not a build dependency?
WARN: mpd: mpd rdepends on libbz2 but it's not a build dependency?
WARN: mpd: mpd rdepends on libcdio but it's not a build dependency?
WARN: mpd: mpd rdepends on libcdio-cdda but it's not a build dependency?
WARN: mpd: mpd rdepends on libcdio-paranoia but it's not a build dependency?
WARN: mpd: mpd rdepends on libcurl but it's not a build dependency?
WARN: mpd: mpd rdepends on libfaad but it's not a build dependency?
WARN: mpd: mpd rdepends on libflac but it's not a build dependency?
WARN: mpd: mpd rdepends on libgcc but it's not a build dependency?
WARN: mpd: mpd rdepends on libjack but it's not a build dependency?
WARN: mpd: mpd rdepends on libmms but it's not a build dependency?
WARN: mpd: mpd rdepends on libmodplug but it's not a build dependency?
WARN: mpd: mpd rdepends on libogg but it's not a build dependency?
WARN: mpd: mpd rdepends on libopus but it's not a build dependency?
WARN: mpd: mpd rdepends on libpulse but it's not a build dependency?
WARN: mpd: mpd rdepends on libsamplerate0 but it's not a build dependency?
WARN: mpd: mpd rdepends on libsndfile1 but it's not a build dependency?
WARN: mpd: mpd rdepends on libsqlite3 but it's not a build dependency?
WARN: mpd: mpd rdepends on libstdc++ but it's not a build dependency?
WARN: mpd: mpd rdepends on libvorbis but it's not a build dependency?
WARN: mpd: mpd rdepends on libwrap but it's not a build dependency?
WARN: mpd: mpd rdepends on mpg123 but it's not a build dependency?
WARN: mpd: mpd rdepends on shadow but it's not a build dependency?
WARN: mpd: mpd rdepends on wavpack but it's not a build dependency?
WARN: mpd: mpd rdepends on yajl but it's not a build dependency?
WARN: mpeg2dec: mpeg2dec rdepends on eglibc but it's not a build dependency?
WARN: mpeg2dec: mpeg2dec rdepends on libmpeg2 but it's not a build dependen=
cy?
WARN: mpeg2dec: mpeg2dec rdepends on libmpeg2convert but it's not a build d=
ependency?
WARN: mpeg2dec: mpeg2dec rdepends on libx11 but it's not a build dependency?
WARN: mpeg2dec: mpeg2dec rdepends on libxext but it's not a build dependenc=
y?
WARN: mpeg2dec: mpeg2dec rdepends on libxv but it's not a build dependency?
WARN: mpg123: mpg123 rdepends on audiofile but it's not a build dependency?
WARN: mpg123: mpg123 rdepends on dbus-lib but it's not a build dependency?
WARN: mpg123: mpg123 rdepends on eglibc but it's not a build dependency?
WARN: mpg123: mpg123 rdepends on esound but it's not a build dependency?
WARN: mpg123: mpg123 rdepends on json-c but it's not a build dependency?
WARN: mpg123: mpg123 rdepends on libasound but it's not a build dependency?
WARN: mpg123: mpg123 rdepends on libcap but it's not a build dependency?
WARN: mpg123: mpg123 rdepends on libice but it's not a build dependency?
WARN: mpg123: mpg123 rdepends on libjack but it's not a build dependency?
WARN: mpg123: mpg123 rdepends on libltdl but it's not a build dependency?
WARN: mpg123: mpg123 rdepends on libpulse but it's not a build dependency?
WARN: mpg123: mpg123 rdepends on libpulse-simple but it's not a build depen=
dency?
WARN: mpg123: mpg123 rdepends on libsdl but it's not a build dependency?
WARN: mpg123: mpg123 rdepends on libsm but it's not a build dependency?
WARN: mpg123: mpg123 rdepends on libsndfile1 but it's not a build dependenc=
y?
WARN: mpg123: mpg123 rdepends on libx11 but it's not a build dependency?
WARN: mpg123: mpg123 rdepends on libx11-xcb but it's not a build dependency?
WARN: mpg123: mpg123 rdepends on libxau but it's not a build dependency?
WARN: mpg123: mpg123 rdepends on libxcb but it's not a build dependency?
WARN: mpg123: mpg123 rdepends on libxdmcp but it's not a build dependency?
WARN: mpg123: mpg123 rdepends on libxext but it's not a build dependency?
WARN: mpg123: mpg123 rdepends on libxi but it's not a build dependency?
WARN: mpg123: mpg123 rdepends on libxtst but it's not a build dependency?
WARN: mpg123: mpg123 rdepends on portaudio-v19 but it's not a build depende=
ncy?
WARN: mpg123: mpg123 rdepends on tslib but it's not a build dependency?
WARN: mpg123: mpg123 rdepends on util-linux-libuuid but it's not a build de=
pendency?
WARN: oscam: oscam rdepends on eglibc but it's not a build dependency?
WARN: oscam: oscam rdepends on libcrypto but it's not a build dependency?
WARN: oscam: oscam rdepends on libusb1 but it's not a build dependency?
WARN: oscam: oscam rdepends on pcsc-lite-lib but it's not a build dependenc=
y?
WARN: piglit: piglit rdepends on eglibc but it's not a build dependency?
WARN: piglit: piglit rdepends on libegl-mesa but it's not a build dependenc=
y?
WARN: piglit: piglit rdepends on libgcc but it's not a build dependency?
WARN: piglit: piglit rdepends on libgl-mesa but it's not a build dependency?
WARN: piglit: piglit rdepends on libglu but it's not a build dependency?
WARN: piglit: piglit rdepends on libstdc++ but it's not a build dependency?
WARN: piglit: piglit rdepends on libx11 but it's not a build dependency?
WARN: piglit: piglit rdepends on libxrender but it's not a build dependency?
WARN: piglit: piglit rdepends on mesa-demos but it's not a build dependency?
WARN: piglit: piglit rdepends on python but it's not a build dependency?
WARN: piglit: piglit rdepends on python-json but it's not a build dependenc=
y?
WARN: piglit: piglit rdepends on python-multiprocessing but it's not a buil=
d dependency?
WARN: piglit: piglit rdepends on python-netserver but it's not a build depe=
ndency?
WARN: piglit: piglit rdepends on python-shell but it's not a build dependen=
cy?
WARN: piglit: piglit rdepends on python-subprocess but it's not a build dep=
endency?
WARN: piglit: piglit rdepends on python-textutils but it's not a build depe=
ndency?
WARN: piglit: piglit rdepends on waffle but it's not a build dependency?
WARN: protobuf: protobuf rdepends on eglibc but it's not a build dependency?
WARN: protobuf: protobuf rdepends on libgcc but it's not a build dependency?
WARN: protobuf: protobuf rdepends on libstdc++ but it's not a build depende=
ncy?
WARN: protobuf: protobuf rdepends on zlib but it's not a build dependency?
WARN: snort: snort rdepends on daq but it's not a build dependency?
WARN: snort: snort rdepends on eglibc but it's not a build dependency?
WARN: snort: snort rdepends on libcrypto but it's not a build dependency?
WARN: snort: snort rdepends on libdnet but it's not a build dependency?
WARN: snort: snort rdepends on libpcap but it's not a build dependency?
WARN: snort: snort rdepends on libpcre but it's not a build dependency?
WARN: snort: snort rdepends on util-linux-libuuid but it's not a build depe=
ndency?
WARN: snort: snort rdepends on zlib but it's not a build dependency?
WARN: sox: sox rdepends on dbus-lib but it's not a build dependency?
WARN: sox: sox rdepends on eglibc but it's not a build dependency?
WARN: sox: sox rdepends on file but it's not a build dependency?
WARN: sox: sox rdepends on json-c but it's not a build dependency?
WARN: sox: sox rdepends on libasound but it's not a build dependency?
WARN: sox: sox rdepends on libcap but it's not a build dependency?
WARN: sox: sox rdepends on libflac but it's not a build dependency?
WARN: sox: sox rdepends on libice but it's not a build dependency?
WARN: sox: sox rdepends on libltdl but it's not a build dependency?
WARN: sox: sox rdepends on libogg but it's not a build dependency?
WARN: sox: sox rdepends on libpng but it's not a build dependency?
WARN: sox: sox rdepends on libpulse but it's not a build dependency?
WARN: sox: sox rdepends on libpulse-simple but it's not a build dependency?
WARN: sox: sox rdepends on libsm but it's not a build dependency?
WARN: sox: sox rdepends on libsndfile1 but it's not a build dependency?
WARN: sox: sox rdepends on libvorbis but it's not a build dependency?
WARN: sox: sox rdepends on libx11 but it's not a build dependency?
WARN: sox: sox rdepends on libx11-xcb but it's not a build dependency?
WARN: sox: sox rdepends on libxau but it's not a build dependency?
WARN: sox: sox rdepends on libxcb but it's not a build dependency?
WARN: sox: sox rdepends on libxdmcp but it's not a build dependency?
WARN: sox: sox rdepends on libxext but it's not a build dependency?
WARN: sox: sox rdepends on libxi but it's not a build dependency?
WARN: sox: sox rdepends on libxtst but it's not a build dependency?
WARN: sox: sox rdepends on util-linux-libuuid but it's not a build dependen=
cy?
WARN: sox: sox rdepends on zlib but it's not a build dependency?
WARN: stunnel: stunnel rdepends on eglibc but it's not a build dependency?
WARN: stunnel: stunnel rdepends on libcrypto but it's not a build dependenc=
y?
WARN: stunnel: stunnel rdepends on libssl but it's not a build dependency?
WARN: stunnel: stunnel rdepends on libwrap but it's not a build dependency?
WARN: stunnel: stunnel rdepends on zlib but it's not a build dependency?
WARN: synergy: synergy rdepends on eglibc but it's not a build dependency?
WARN: synergy: synergy rdepends on libgcc but it's not a build dependency?
WARN: synergy: synergy rdepends on libstdc++ but it's not a build dependenc=
y?
WARN: synergy: synergy rdepends on libx11 but it's not a build dependency?
WARN: synergy: synergy rdepends on libxext but it's not a build dependency?
WARN: synergy: synergy rdepends on libxinerama but it's not a build depende=
ncy?
WARN: synergy: synergy rdepends on libxtst but it's not a build dependency?
WARN: tesseract: tesseract rdepends on eglibc but it's not a build dependen=
cy?
WARN: tesseract: tesseract rdepends on giflib but it's not a build dependen=
cy?
WARN: tesseract: tesseract rdepends on leptonica but it's not a build depen=
dency?
WARN: tesseract: tesseract rdepends on libgcc but it's not a build dependen=
cy?
WARN: tesseract: tesseract rdepends on libjpeg-turbo but it's not a build d=
ependency?
WARN: tesseract: tesseract rdepends on liblzma but it's not a build depende=
ncy?
WARN: tesseract: tesseract rdepends on libpng but it's not a build dependen=
cy?
WARN: tesseract: tesseract rdepends on libstdc++ but it's not a build depen=
dency?
WARN: tesseract: tesseract rdepends on tiff but it's not a build dependency?
WARN: tesseract: tesseract rdepends on zlib but it's not a build dependency?
WARN: tracker: tracker rdepends on dbus-lib but it's not a build dependency?
WARN: tracker: tracker rdepends on eglibc but it's not a build dependency?
WARN: tracker: tracker rdepends on enca but it's not a build dependency?
WARN: tracker: tracker rdepends on gdk-pixbuf but it's not a build dependen=
cy?
WARN: tracker: tracker rdepends on glib-2.0 but it's not a build dependency?
WARN: tracker: tracker rdepends on glib-2.0-utils but it's not a build depe=
ndency?
WARN: tracker: tracker rdepends on gsettings-desktop-schemas but it's not a=
 build dependency?
WARN: tracker: tracker rdepends on gtk+3 but it's not a build dependency?
WARN: tracker: tracker rdepends on gvfs but it's not a build dependency?
WARN: tracker: tracker rdepends on libcap but it's not a build dependency?
WARN: tracker: tracker rdepends on libexif but it's not a build dependency?
WARN: tracker: tracker rdepends on libffi but it's not a build dependency?
WARN: tracker: tracker rdepends on libgcc but it's not a build dependency?
WARN: tracker: tracker rdepends on libgcrypt but it's not a build dependenc=
y?
WARN: tracker: tracker rdepends on libgee but it's not a build dependency?
WARN: tracker: tracker rdepends on libgnome-keyring but it's not a build de=
pendency?
WARN: tracker: tracker rdepends on libgpg-error but it's not a build depend=
ency?
WARN: tracker: tracker rdepends on libgsf but it's not a build dependency?
WARN: tracker: tracker rdepends on libsqlite3 but it's not a build dependen=
cy?
WARN: tracker: tracker rdepends on libstdc++ but it's not a build dependenc=
y?
WARN: tracker: tracker rdepends on libunistring but it's not a build depend=
ency?
WARN: tracker: tracker rdepends on upower but it's not a build dependency?
WARN: tracker: tracker rdepends on util-linux-libuuid but it's not a build =
dependency?
WARN: tracker: tracker rdepends on zlib but it's not a build dependency?
WARN: tracker: tracker-dev rdepends on cairo but it's not a build dependenc=
y?
WARN: tracker: tracker-dev rdepends on eglibc but it's not a build dependen=
cy?
WARN: tracker: tracker-dev rdepends on enca but it's not a build dependency?
WARN: tracker: tracker-dev rdepends on expat but it's not a build dependenc=
y?
WARN: tracker: tracker-dev rdepends on fontconfig but it's not a build depe=
ndency?
WARN: tracker: tracker-dev rdepends on freetype but it's not a build depend=
ency?
WARN: tracker: tracker-dev rdepends on giflib but it's not a build dependen=
cy?
WARN: tracker: tracker-dev rdepends on glib-2.0 but it's not a build depend=
ency?
WARN: tracker: tracker-dev rdepends on gstreamer but it's not a build depen=
dency?
WARN: tracker: tracker-dev rdepends on lcms but it's not a build dependency?
WARN: tracker: tracker-dev rdepends on libbz2 but it's not a build dependen=
cy?
WARN: tracker: tracker-dev rdepends on libexif but it's not a build depende=
ncy?
WARN: tracker: tracker-dev rdepends on libffi but it's not a build dependen=
cy?
WARN: tracker: tracker-dev rdepends on libgsf but it's not a build dependen=
cy?
WARN: tracker: tracker-dev rdepends on libgstpbutils-0.10 but it's not a bu=
ild dependency?
WARN: tracker: tracker-dev rdepends on libgsttag-0.10 but it's not a build =
dependency?
WARN: tracker: tracker-dev rdepends on libjpeg-turbo but it's not a build d=
ependency?
WARN: tracker: tracker-dev rdepends on liblzma but it's not a build depende=
ncy?
WARN: tracker: tracker-dev rdepends on libpng but it's not a build dependen=
cy?
WARN: tracker: tracker-dev rdepends on libpoppler but it's not a build depe=
ndency?
WARN: tracker: tracker-dev rdepends on libpoppler-glib but it's not a build=
 dependency?
WARN: tracker: tracker-dev rdepends on libsqlite3 but it's not a build depe=
ndency?
WARN: tracker: tracker-dev rdepends on libstdc++ but it's not a build depen=
dency?
WARN: tracker: tracker-dev rdepends on libunistring but it's not a build de=
pendency?
WARN: tracker: tracker-dev rdepends on libx11 but it's not a build dependen=
cy?
WARN: tracker: tracker-dev rdepends on libxau but it's not a build dependen=
cy?
WARN: tracker: tracker-dev rdepends on libxcb but it's not a build dependen=
cy?
WARN: tracker: tracker-dev rdepends on libxcb-render but it's not a build d=
ependency?
WARN: tracker: tracker-dev rdepends on libxcb-shm but it's not a build depe=
ndency?
WARN: tracker: tracker-dev rdepends on libxdmcp but it's not a build depend=
ency?
WARN: tracker: tracker-dev rdepends on libxext but it's not a build depende=
ncy?
WARN: tracker: tracker-dev rdepends on libxml2 but it's not a build depende=
ncy?
WARN: tracker: tracker-dev rdepends on libxrender but it's not a build depe=
ndency?
WARN: tracker: tracker-dev rdepends on pixman but it's not a build dependen=
cy?
WARN: tracker: tracker-dev rdepends on taglib but it's not a build dependen=
cy?
WARN: tracker: tracker-dev rdepends on taglib-c but it's not a build depend=
ency?
WARN: tracker: tracker-dev rdepends on tiff but it's not a build dependency?
WARN: tracker: tracker-dev rdepends on tracker but it's not a build depende=
ncy?
WARN: tracker: tracker-dev rdepends on tracker but it's not a build depende=
ncy?
WARN: tracker: tracker-dev rdepends on util-linux-libuuid but it's not a bu=
ild dependency?
WARN: tracker: tracker-dev rdepends on zlib but it's not a build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on atk but it's not a bu=
ild dependency?
WARN: tracker: tracker-nautilus-extension rdepends on cairo but it's not a =
build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on eglibc but it's not a=
 build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on expat but it's not a =
build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on fontconfig but it's n=
ot a build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on freetype but it's not=
 a build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on gdk-pixbuf but it's n=
ot a build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on glib-2.0 but it's not=
 a build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on gtk+ but it's not a b=
uild dependency?
WARN: tracker: tracker-nautilus-extension rdepends on harfbuzz but it's not=
 a build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on libffi but it's not a=
 build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on libpng but it's not a=
 build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on libsqlite3 but it's n=
ot a build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on libunistring but it's=
 not a build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on libx11 but it's not a=
 build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on libxau but it's not a=
 build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on libxcb but it's not a=
 build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on libxcb-render but it'=
s not a build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on libxcb-shm but it's n=
ot a build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on libxdmcp but it's not=
 a build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on libxext but it's not =
a build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on libxrender but it's n=
ot a build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on pango but it's not a =
build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on pixman but it's not a=
 build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on tracker but it's not =
a build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on util-linux-libuuid bu=
t it's not a build dependency?
WARN: tracker: tracker-nautilus-extension rdepends on zlib but it's not a b=
uild dependency?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1qrhXh8iFgyYHgLh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPl41YACgkQN1Ujt2V2gBzHmACfSxedMr8YLvu+cim+Q3qqFL39
ezsAn0PgWmd31nSkIn1Kldy+z+wkLeFk
=v5kG
-----END PGP SIGNATURE-----

--1qrhXh8iFgyYHgLh--
