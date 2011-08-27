Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QxD4b-0005nZ-Tj
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Aug 2011 09:12:57 +0200
Received: by wyf19 with SMTP id 19so3100954wyf.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Aug 2011 00:08:08 -0700 (PDT)
Received: by 10.227.201.8 with SMTP id ey8mr1706130wbb.108.1314428888450;
	Sat, 27 Aug 2011 00:08:08 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id fg5sm1899055wbb.6.2011.08.27.00.08.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 27 Aug 2011 00:08:07 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAD=GYpZa5W2v4Chwke-GQaio8XxwNn83xBjHo0VTRMq9SpZuNg@mail.gmail.com>
Date: Sat, 27 Aug 2011 09:08:07 +0200
Message-Id: <F36B93EF-C96D-4FAE-8EB8-448BB87A3C62@dominion.thruhere.net>
References: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
	<c7daa061e6304912a88d6e22d5e37776@DLEE74.ent.ti.com>
	<CAD=GYpZa5W2v4Chwke-GQaio8XxwNn83xBjHo0VTRMq9SpZuNg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH meta-oe 1/9] schroedinger: Imported from OE classic
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
X-List-Received-Date: Sat, 27 Aug 2011 07:12:58 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 27 aug. 2011, om 05:47 heeft Joel A Fernandes het volgende =
geschreven:

> On Fri, Aug 26, 2011 at 3:01 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>>=20
>> Op 26 aug. 2011, om 02:28 heeft Joel A Fernandes het volgende =
geschreven:
>>=20
>>> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
>>> ---
>>> .../schroedinger/gst-plugin-schroedinger_1.0.9.bb  |   15 =
+++++++++++++++
>>> .../schroedinger/schroedinger.inc                  |   19 =
+++++++++++++++++++
>>> .../schroedinger/schroedinger/configure.ac.patch   |   13 =
+++++++++++++
>>> .../schroedinger/schroedinger_1.0.9.bb             |   13 =
+++++++++++++
>>> 4 files changed, 60 insertions(+), 0 deletions(-)
>>> create mode 100644 =
meta-oe/recipes-multimedia/schroedinger/gst-plugin-schroedinger_1.0.9.bb
>>> create mode 100644 =
meta-oe/recipes-multimedia/schroedinger/schroedinger.inc
>>> create mode 100644 =
meta-oe/recipes-multimedia/schroedinger/schroedinger/configure.ac.patch
>>> create mode 100644 =
meta-oe/recipes-multimedia/schroedinger/schroedinger_1.0.9.bb
>>>=20
>>> diff --git =
a/meta-oe/recipes-multimedia/schroedinger/gst-plugin-schroedinger_1.0.9.bb=
 =
b/meta-oe/recipes-multimedia/schroedinger/gst-plugin-schroedinger_1.0.9.bb=

>>> new file mode 100644
>>> index 0000000..0a95646
>>> --- /dev/null
>>> +++ =
b/meta-oe/recipes-multimedia/schroedinger/gst-plugin-schroedinger_1.0.9.bb=

>>> @@ -0,0 +1,15 @@
>>> +require schroedinger.inc
>>> +PR =3D "r0"
>>> +
>>=20
>>> +DEPENDS +=3D "gstreamer gst-plugins-base"
>>> +
>>> +SRC_URI[schroedingertargz.md5sum] =3D =
"d67ec48b7c506db8c8b49156bf409e60"
>>> +SRC_URI[schroedingertargz.sha256sum] =3D =
"345abcaa72ff0f2e9c1075e22f7141475ee4e6eea23a7f568b69ffc13cc1c723"
>>> +
>>> +S =3D "${WORKDIR}/schroedinger-${PV}"
>>> +
>>> +PACKAGES =3D "gst-plugin-schroedinger gst-plugin-schroedinger-dev =
gst-plugin-schroedinger-dbg"
>>> +FILES_gst-plugin-schroedinger +=3D =
"${libdir}/gstreamer-0.10/libgstschro.so"
>>> +FILES_gst-plugin-schroedinger-dev +=3D =
"${libdir}/gstreamer-0.10/libgstschro.*"
>>> +FILES_gst-plugin-schroedinger-dbg +=3D =
"${libdir}/gstreamer-0.10/.debug/libgstschro.so"
>>> +
>>> diff --git =
a/meta-oe/recipes-multimedia/schroedinger/schroedinger.inc =
b/meta-oe/recipes-multimedia/schroedinger/schroedinger.inc
>>> new file mode 100644
>>> index 0000000..386fc73
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-multimedia/schroedinger/schroedinger.inc
>>> @@ -0,0 +1,19 @@
>>> +HOMEPAGE =3D "http://schrodinger.sourceforge.net/"
>>> +LICENSE =3D "MPL GPL LGPL MIT"
>>> +DEPENDS =3D "liboil orc-native orc"
>>> +
>>> +INC_PR =3D "r1"
>>=20
>> reset that
>=20
> Sure
>=20
>>=20
>>> +
>>> +SRC_URI =3D =
"http://www.diracvideo.org/download/schroedinger/${P}.tar.gz;name=3Dschroe=
dingertargz"
>>> +SRC_URI +=3D "file://configure.ac.patch"
>>> +
>>> +EXTRA_OECONF +=3D "STAGING_DIR=3D${STAGING_DIR_NATIVE}"
>>> +
>>> +inherit autotools
>>> +
>>> +do_configure_append () {
>>> +        # Fix stupid libtool... handling.
>>> +        # rpath handling can't be disabled and the Makefile's can't =
be regenerated..
>>> +        # (GNU sed required)
>>> +        sed -i =
s/^hardcode_libdir_flag_spec/#hardcode_libdir_flag_spec/ ${S}/*-libtool
>>> +}
>>> diff --git =
a/meta-oe/recipes-multimedia/schroedinger/schroedinger/configure.ac.patch =
b/meta-oe/recipes-multimedia/schroedinger/schroedinger/configure.ac.patch
>>> new file mode 100644
>>> index 0000000..ac5e7ee
>>> --- /dev/null
>>> +++ =
b/meta-oe/recipes-multimedia/schroedinger/schroedinger/configure.ac.patch
>>> @@ -0,0 +1,13 @@
>>> +Index: schroedinger-1.0.9/configure.ac
>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> +--- schroedinger-1.0.9.orig/configure.ac
>>> ++++ schroedinger-1.0.9/configure.ac
>>> +@@ -54,7 +54,7 @@ if test "x${HAVE_ORC}" !=3D xyes ; then
>>> +   AC_ERROR([orc-0.4 >=3D $ORC_VER is required])
>>> + fi
>>> + SCHRO_PKG_DEPS=3D"$SCHRO_PKG_DEPS orc-0.4 >=3D $ORC_VER"
>>> +-ORCC=3D`$PKG_CONFIG --variable=3Dorcc orc-0.4`
>>> ++ORCC=3D$STAGING_DIR`$PKG_CONFIG --variable=3Dorcc orc-0.4`
>>> + AC_SUBST(ORCC)
>>> +
>>> + AC_ARG_WITH([thread],
>>> diff --git =
a/meta-oe/recipes-multimedia/schroedinger/schroedinger_1.0.9.bb =
b/meta-oe/recipes-multimedia/schroedinger/schroedinger_1.0.9.bb
>>> new file mode 100644
>>> index 0000000..2994428
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-multimedia/schroedinger/schroedinger_1.0.9.bb
>>> @@ -0,0 +1,13 @@
>>> +require schroedinger.inc
>>> +
>>> +PR =3D "${INC_PR}.0"
>>> +
>>> +inherit autotools
>>> +
>>> +SRC_URI[schroedingertargz.md5sum] =3D =
"d67ec48b7c506db8c8b49156bf409e60"
>>> +SRC_URI[schroedingertargz.sha256sum] =3D =
"345abcaa72ff0f2e9c1075e22f7141475ee4e6eea23a7f568b69ffc13cc1c723"
>>=20
>> Why isn't this in the .inc and why is there a seperate recipe for the =
gst plugin?
>=20
> It is that way in OE classic:
> =
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/schroeding=
er/schroedinger_1.0.9.bb

That's an observation, not a reason. Please fix it when adding it to =
meta-oe, no need to forward port crap when we can get rid of it.=


