Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qajqt-0000lF-OR
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Jun 2011 09:33:55 +0200
Received: by wyg30 with SMTP id 30so665854wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jun 2011 00:30:17 -0700 (PDT)
Received: by 10.216.221.33 with SMTP id q33mr1170916wep.90.1309073416218;
	Sun, 26 Jun 2011 00:30:16 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id u64sm2162156weq.4.2011.06.26.00.30.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Jun 2011 00:30:14 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E069788.5020204@linux.intel.com>
Date: Sun, 26 Jun 2011 09:30:08 +0200
Message-Id: <15131FDC-2E50-4CD1-93C2-D39B8AA772B5@dominion.thruhere.net>
References: <1308217549-13701-1-git-send-email-koen@dominion.thruhere.net>
	<4E069788.5020204@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1084)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gst-plugins: sync packaging with OE .dev
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Jun 2011 07:33:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 jun 2011, om 04:20 heeft Saul Wold het volgende geschreven:

> On 06/16/2011 02:45 AM, Koen Kooi wrote:
>> Gst-plugins get 2 extra packages:
>>=20
>> ${PN}-apps: helper apps in ${bindir}
>> ${PN}-meta: meta package that will drag in all plugins, libs and apps =
${PN} generates
>>=20
>> The packaging include was split out to be reused by external plugins =
(e.g. gst-plugin-gl, gst-fluendo-*).
>>=20
>> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
>> ---
>>  .../gstreamer/gst-plugins-bad_0.10.21.bb           |    2 +-
>>  .../gstreamer/gst-plugins-base_0.10.32.bb          |    2 +-
>>  .../gstreamer/gst-plugins-good_0.10.28.bb          |    2 +-
>>  .../gstreamer/gst-plugins-package.inc              |   34 =
++++++++++++++++++++
>>  .../gstreamer/gst-plugins-ugly_0.10.17.bb          |    2 +-
>>  meta/recipes-multimedia/gstreamer/gst-plugins.inc  |   18 +---------
>>  6 files changed, 40 insertions(+), 20 deletions(-)
>>  create mode 100644 =
meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
>>=20
>> diff --git =
a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb =
b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb
>> index 2b8a89c..a7023e3 100644
>> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb
>> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb
>> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb3 \
>>=20
>>  DEPENDS +=3D "gst-plugins-base libmusicbrainz tremor librsvg"
>>=20
>> -PR =3D "r0"
>> +PR =3D "r1"
>>=20
>>  inherit gettext
>>=20
>> diff --git =
a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb =
b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
>> index f81011f..e9fadf8 100644
>> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
>> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
>> @@ -15,7 +15,7 @@ SRC_URI +=3D " =
file://gst-plugins-base-tremor.patch"
>>  SRC_URI[md5sum] =3D "2920af2b3162f3d9fbaa7fabc8ed4d38"
>>  SRC_URI[sha256sum] =3D =
"e9aabfac83f6480896da0686e9c911989f896fbad634821b7771ed84a446172b"
>>=20
>> -PR =3D "r0"
>> +PR =3D "r1"
>>=20
>>  inherit gettext
>>=20
>> diff --git =
a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb =
b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb
>> index b9648e3..cca63e9 100644
>> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb
>> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb
>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37343 \
>>=20
>>  DEPENDS +=3D "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib =
libid3tag flac \
>>  	    speex libsoup-2.4"
>> -PR =3D "r0"
>> +PR =3D "r1"
>>=20
>>  inherit gettext
>>=20
>> diff --git =
a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc =
b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
>> new file mode 100644
>> index 0000000..dae9416
>> --- /dev/null
>> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
>> @@ -0,0 +1,34 @@
>> +LIBV =3D "0.10"
>> +
>> +python populate_packages_prepend () {
>> +	gst_libdir =3D bb.data.expand('${libdir}/gstreamer-${LIBV}', d)
>> +	postinst =3D bb.data.getVar('plugin_postinst', d, 1)
>> +	glibdir =3D bb.data.expand('${libdir}', d)
>> +
>> +	do_split_packages(d, glibdir, '^lib(.*)\.so\.*', 'lib%s', =
'gstreamer %s library', extra_depends=3D'', allow_links=3DTrue)
>> +	do_split_packages(d, gst_libdir, '^libgst(.*)\.so$', =
'gst-plugin-%s', 'GStreamer plugin for %s', postinst=3Dpostinst, =
extra_depends=3D'')
>> +	do_split_packages(d, gst_libdir, '^libgst(.*)\.l?a$', =
'gst-plugin-%s-dev', 'GStreamer plugin for %s (development files)', =
extra_depends=3D'')
>> +=09
>> +	pn =3D bb.data.getVar('PN', d, 1)
>> +	metapkg =3D  pn + '-meta'
>> +	bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
>> +	bb.data.setVar('FILES_' + metapkg, "", d)
>> +	blacklist =3D [ pn + '-locale', pn + '-dev', pn + '-dbg', pn + =
'-doc' ]
>> +	metapkg_rdepends =3D []
>> +	packages =3D bb.data.getVar('PACKAGES', d, 1).split()
>> +	for pkg in packages[1:]:
>> +		if not pkg in blacklist and not pkg in metapkg_rdepends =
and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not =
pkg.count('locale') and not pkg.count('-static'):
>> +			metapkg_rdepends.append(pkg)
>> +	bb.data.setVar('RDEPENDS_' + metapkg, ' =
'.join(metapkg_rdepends), d)
>> +	bb.data.setVar('DESCRIPTION_' + metapkg, pn + ' meta package', =
d)
>> +}
>> +
>> +ALLOW_EMPTY =3D "1"
>> +
>> +PACKAGES +=3D "${PN}-apps ${PN}-meta"
>> +FILES_${PN}-apps =3D "${bindir}"
>> +
>> +FILES_${PN} =3D "${datadir}/gstreamer-${LIBV}"
>> +FILES_${PN}-dbg +=3D "${libdir}/gstreamer-${LIBV}/.debug"
>> +
>> +
>> diff --git =
a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.17.bb =
b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.17.bb
>> index 76e00a5..2a79c2a 100644
>> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.17.bb
>> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.17.bb
>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37343 \
>>                      =
file://gst/mpegstream/gstmpegparse.h;beginline=3D1;endline=3D18;md5=3Dff65=
467b0c53cdfa98d0684c1bc240a9"
>>=20
>>  DEPENDS +=3D "gst-plugins-base libid3tag libmad mpeg2dec liba52 =
lame"
>> -PR =3D "r0"
>> +PR =3D "r1"
>>=20
>>  inherit gettext
>>=20
>> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc =
b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
>> index 617aab8..c1d7cd8 100644
>> --- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
>> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
>> @@ -15,13 +15,6 @@ EXTRA_OECONF =3D "--disable-valgrind =
--disable-debug --disable-examples "
>>=20
>>  acpaths =3D "-I ${S}/common/m4 -I ${S}/m4"
>>=20
>> -LIBV =3D "0.10"
>> -#FILES_${PN} +=3D "${libdir}/gstreamer-${LIBV}/*.so"
>> -#FILES_${PN}-dev +=3D "${libdir}/gstreamer-${LIBV}/*.la =
${libdir}/gstreamer-${LIBV}/*.a"
>> -FILES_${PN}-dbg +=3D "${libdir}/gstreamer-${LIBV}/.debug"
>> -
>> -PACKAGES_DYNAMIC =3D "${PN}-*"
>> -
>>  # orc.m4 calls pkg-config ----variable=3Dorcc orc-0.4 to get the =
path to orcc,
>>  # resulting in /usr/bin/orcc. Force it to use the staged orcc.
>>  do_configure_append() {
>> @@ -30,14 +23,7 @@ do_configure_append() {
>>   	done
>>  }
>>=20
>> -python populate_packages_prepend () {
>> -	gst_libdir =3D bb.data.expand('${libdir}/gstreamer-${LIBV}', d)
>> -	postinst =3D bb.data.getVar('plugin_postinst', d, 1)
>> +require gst-plugins-package.inc
>>=20
>> -#	Can't package separate debug packages yet
>> -#	do_split_packages(d, gst_libdir, '\.debug/libgst(.*)\.so$', =
bb.data.expand('${PN}-%s-dbg', d), 'GStreamer plugin for %s (with =
debugging symbols)', recursive=3DTrue, =
extra_depends=3Dbb.data.expand('${PN}-dbg', d), match_path=3DTrue)
>> -	do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', =
bb.data.expand('${PN}-%s', d), 'GStreamer plugin for %s', =
postinst=3Dpostinst, extra_depends=3Dbb.data.expand('${PN}',d))
>> -	do_split_packages(d, gst_libdir, 'libgst(.*)\.l?a$', =
bb.data.expand('${PN}-%s-dev', d), 'GStreamer plugin for %s (development =
files)', extra_depends=3Dbb.data.expand('${PN}-dev',d))
>> -}
>> +PACKAGES_DYNAMIC =3D "${PN}-*"
>>=20
>> -ALLOW_EMPTY =3D "1"
>=20
> Koen,
>=20
> This packaging does not work for most of the gst-meta-base, =
gst-meta-audio and gst-meta-video RDEPENDS fail with this change, along =
with gaku.  When I build core-image-sato-sdk I get failed dependencies.
>=20
> Please look more closely at this change and verify that recipes that =
depend on gst-plugins-* get installed correctly.

What are the errors you are seeing? My images with gstreamer plugins =
work.=


