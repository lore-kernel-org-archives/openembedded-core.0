Received: from mail-ey0-f173.google.com ([209.85.215.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1Qx9wc-0007G0-Nu
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Aug 2011 05:52:30 +0200
Received: by eyb7 with SMTP id 7so2960665eyb.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 20:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=StxHW4NIpWxt2fy/x6JzmGCkDqDu1OOxQgmxEbo+W54=;
	b=gCnglvZgjxDGr+Z4e7aEpNxEXsXQV3mEwXCBGsSIP5NMes/b54TxJBzIFIlmixK2PC
	mQbmsVseieWdhyYXkstJREP5tGEgm4UFxTztsy1AINVTI2i1hRJy7PD1CQ7smwmCtI/k
	I1DNWvvugf92chBZRRKDPGbDkzyEUsL55KLpE=
MIME-Version: 1.0
Received: by 10.213.26.17 with SMTP id b17mr726939ebc.2.1314416859049; Fri, 26
	Aug 2011 20:47:39 -0700 (PDT)
Received: by 10.213.106.8 with HTTP; Fri, 26 Aug 2011 20:47:38 -0700 (PDT)
In-Reply-To: <c7daa061e6304912a88d6e22d5e37776@DLEE74.ent.ti.com>
References: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
	<c7daa061e6304912a88d6e22d5e37776@DLEE74.ent.ti.com>
Date: Fri, 26 Aug 2011 22:47:38 -0500
Message-ID: <CAD=GYpZa5W2v4Chwke-GQaio8XxwNn83xBjHo0VTRMq9SpZuNg@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sat, 27 Aug 2011 03:52:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 26, 2011 at 3:01 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 26 aug. 2011, om 02:28 heeft Joel A Fernandes het volgende geschreven:
>
>> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
>> ---
>> .../schroedinger/gst-plugin-schroedinger_1.0.9.bb =A0| =A0 15 ++++++++++=
+++++
>> .../schroedinger/schroedinger.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 19 +++++++++++++++++++
>> .../schroedinger/schroedinger/configure.ac.patch =A0 | =A0 13 ++++++++++=
+++
>> .../schroedinger/schroedinger_1.0.9.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 13 =
+++++++++++++
>> 4 files changed, 60 insertions(+), 0 deletions(-)
>> create mode 100644 meta-oe/recipes-multimedia/schroedinger/gst-plugin-sc=
hroedinger_1.0.9.bb
>> create mode 100644 meta-oe/recipes-multimedia/schroedinger/schroedinger.=
inc
>> create mode 100644 meta-oe/recipes-multimedia/schroedinger/schroedinger/=
configure.ac.patch
>> create mode 100644 meta-oe/recipes-multimedia/schroedinger/schroedinger_=
1.0.9.bb
>>
>> diff --git a/meta-oe/recipes-multimedia/schroedinger/gst-plugin-schroedi=
nger_1.0.9.bb b/meta-oe/recipes-multimedia/schroedinger/gst-plugin-schroedi=
nger_1.0.9.bb
>> new file mode 100644
>> index 0000000..0a95646
>> --- /dev/null
>> +++ b/meta-oe/recipes-multimedia/schroedinger/gst-plugin-schroedinger_1.=
0.9.bb
>> @@ -0,0 +1,15 @@
>> +require schroedinger.inc
>> +PR =3D "r0"
>> +
>
>> +DEPENDS +=3D "gstreamer gst-plugins-base"
>> +
>> +SRC_URI[schroedingertargz.md5sum] =3D "d67ec48b7c506db8c8b49156bf409e60=
"
>> +SRC_URI[schroedingertargz.sha256sum] =3D "345abcaa72ff0f2e9c1075e22f714=
1475ee4e6eea23a7f568b69ffc13cc1c723"
>> +
>> +S =3D "${WORKDIR}/schroedinger-${PV}"
>> +
>> +PACKAGES =3D "gst-plugin-schroedinger gst-plugin-schroedinger-dev gst-p=
lugin-schroedinger-dbg"
>> +FILES_gst-plugin-schroedinger +=3D "${libdir}/gstreamer-0.10/libgstschr=
o.so"
>> +FILES_gst-plugin-schroedinger-dev +=3D "${libdir}/gstreamer-0.10/libgst=
schro.*"
>> +FILES_gst-plugin-schroedinger-dbg +=3D "${libdir}/gstreamer-0.10/.debug=
/libgstschro.so"
>> +
>> diff --git a/meta-oe/recipes-multimedia/schroedinger/schroedinger.inc b/=
meta-oe/recipes-multimedia/schroedinger/schroedinger.inc
>> new file mode 100644
>> index 0000000..386fc73
>> --- /dev/null
>> +++ b/meta-oe/recipes-multimedia/schroedinger/schroedinger.inc
>> @@ -0,0 +1,19 @@
>> +HOMEPAGE =3D "http://schrodinger.sourceforge.net/"
>> +LICENSE =3D "MPL GPL LGPL MIT"
>> +DEPENDS =3D "liboil orc-native orc"
>> +
>> +INC_PR =3D "r1"
>
> reset that

Sure

>
>> +
>> +SRC_URI =3D "http://www.diracvideo.org/download/schroedinger/${P}.tar.g=
z;name=3Dschroedingertargz"
>> +SRC_URI +=3D "file://configure.ac.patch"
>> +
>> +EXTRA_OECONF +=3D "STAGING_DIR=3D${STAGING_DIR_NATIVE}"
>> +
>> +inherit autotools
>> +
>> +do_configure_append () {
>> + =A0 =A0 =A0 =A0# Fix stupid libtool... handling.
>> + =A0 =A0 =A0 =A0# rpath handling can't be disabled and the Makefile's c=
an't be regenerated..
>> + =A0 =A0 =A0 =A0# (GNU sed required)
>> + =A0 =A0 =A0 =A0sed -i s/^hardcode_libdir_flag_spec/#hardcode_libdir_fl=
ag_spec/ ${S}/*-libtool
>> +}
>> diff --git a/meta-oe/recipes-multimedia/schroedinger/schroedinger/config=
ure.ac.patch b/meta-oe/recipes-multimedia/schroedinger/schroedinger/configu=
re.ac.patch
>> new file mode 100644
>> index 0000000..ac5e7ee
>> --- /dev/null
>> +++ b/meta-oe/recipes-multimedia/schroedinger/schroedinger/configure.ac.=
patch
>> @@ -0,0 +1,13 @@
>> +Index: schroedinger-1.0.9/configure.ac
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +--- schroedinger-1.0.9.orig/configure.ac
>> ++++ schroedinger-1.0.9/configure.ac
>> +@@ -54,7 +54,7 @@ if test "x${HAVE_ORC}" !=3D xyes ; then
>> + =A0 AC_ERROR([orc-0.4 >=3D $ORC_VER is required])
>> + fi
>> + SCHRO_PKG_DEPS=3D"$SCHRO_PKG_DEPS orc-0.4 >=3D $ORC_VER"
>> +-ORCC=3D`$PKG_CONFIG --variable=3Dorcc orc-0.4`
>> ++ORCC=3D$STAGING_DIR`$PKG_CONFIG --variable=3Dorcc orc-0.4`
>> + AC_SUBST(ORCC)
>> +
>> + AC_ARG_WITH([thread],
>> diff --git a/meta-oe/recipes-multimedia/schroedinger/schroedinger_1.0.9.=
bb b/meta-oe/recipes-multimedia/schroedinger/schroedinger_1.0.9.bb
>> new file mode 100644
>> index 0000000..2994428
>> --- /dev/null
>> +++ b/meta-oe/recipes-multimedia/schroedinger/schroedinger_1.0.9.bb
>> @@ -0,0 +1,13 @@
>> +require schroedinger.inc
>> +
>> +PR =3D "${INC_PR}.0"
>> +
>> +inherit autotools
>> +
>> +SRC_URI[schroedingertargz.md5sum] =3D "d67ec48b7c506db8c8b49156bf409e60=
"
>> +SRC_URI[schroedingertargz.sha256sum] =3D "345abcaa72ff0f2e9c1075e22f714=
1475ee4e6eea23a7f568b69ffc13cc1c723"
>
> Why isn't this in the .inc and why is there a seperate recipe for the gst=
 plugin?

It is that way in OE classic:
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/schroedinge=
r/schroedinger_1.0.9.bb

Thanks
Joel


