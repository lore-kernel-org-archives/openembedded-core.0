Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1R130V-0007c3-BJ
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 23:16:35 +0200
Received: by fxg11 with SMTP id 11so222799fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Sep 2011 14:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=GX2+heaWubT6gTrKeBal8QaPvLC30dlCIHmzddKDyRA=;
	b=hm6zhB+RsiG/FW08XVgo8noecCixjN/tAIhYI8s42pqHJu6i+b7G40lk0JGTwHRLf1
	013G8O24Fb1PmBeETngG/uEmI42YSO1bgF6zqVEI87qE9FH8IVy+VTlwRPRncZIuENtr
	FInI5JJNqC/1I7dFGyHKhfp7qidy/Q9iiFE/8=
MIME-Version: 1.0
Received: by 10.223.5.76 with SMTP id 12mr528349fau.103.1315343492343; Tue, 06
	Sep 2011 14:11:32 -0700 (PDT)
Received: by 10.152.22.231 with HTTP; Tue, 6 Sep 2011 14:11:32 -0700 (PDT)
In-Reply-To: <F36B93EF-C96D-4FAE-8EB8-448BB87A3C62@dominion.thruhere.net>
References: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
	<c7daa061e6304912a88d6e22d5e37776@DLEE74.ent.ti.com>
	<CAD=GYpZa5W2v4Chwke-GQaio8XxwNn83xBjHo0VTRMq9SpZuNg@mail.gmail.com>
	<F36B93EF-C96D-4FAE-8EB8-448BB87A3C62@dominion.thruhere.net>
Date: Tue, 6 Sep 2011 16:11:32 -0500
Message-ID: <CAD=GYpYYp+B9R5rPG2pMrLe-jG6dWbBAD+oaEkQU3EvwjuEfyA@mail.gmail.com>
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
X-List-Received-Date: Tue, 06 Sep 2011 21:16:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 27, 2011 at 2:08 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 27 aug. 2011, om 05:47 heeft Joel A Fernandes het volgende geschreven:
>
>> On Fri, Aug 26, 2011 at 3:01 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>>
>>> Op 26 aug. 2011, om 02:28 heeft Joel A Fernandes het volgende geschreve=
n:
>>>
>>>> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
>>>> ---
>>>> .../schroedinger/gst-plugin-schroedinger_1.0.9.bb =A0| =A0 15 ++++++++=
+++++++
>>>> .../schroedinger/schroedinger.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 19 +++++++++++++++++++
>>>> .../schroedinger/schroedinger/configure.ac.patch =A0 | =A0 13 ++++++++=
+++++
>>>> .../schroedinger/schroedinger_1.0.9.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 1=
3 +++++++++++++
>>>> 4 files changed, 60 insertions(+), 0 deletions(-)
>>>> create mode 100644 meta-oe/recipes-multimedia/schroedinger/gst-plugin-=
schroedinger_1.0.9.bb
>>>> create mode 100644 meta-oe/recipes-multimedia/schroedinger/schroedinge=
r.inc
>>>> create mode 100644 meta-oe/recipes-multimedia/schroedinger/schroedinge=
r/configure.ac.patch
>>>> create mode 100644 meta-oe/recipes-multimedia/schroedinger/schroedinge=
r_1.0.9.bb
>>>>
>>>> diff --git a/meta-oe/recipes-multimedia/schroedinger/gst-plugin-schroe=
dinger_1.0.9.bb b/meta-oe/recipes-multimedia/schroedinger/gst-plugin-schroe=
dinger_1.0.9.bb
>>>> new file mode 100644
>>>> index 0000000..0a95646
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-multimedia/schroedinger/gst-plugin-schroedinger_=
1.0.9.bb
>>>> @@ -0,0 +1,15 @@
>>>> +require schroedinger.inc
>>>> +PR =3D "r0"
>>>> +
>>>
>>>> +DEPENDS +=3D "gstreamer gst-plugins-base"
>>>> +
>>>> +SRC_URI[schroedingertargz.md5sum] =3D "d67ec48b7c506db8c8b49156bf409e=
60"
>>>> +SRC_URI[schroedingertargz.sha256sum] =3D "345abcaa72ff0f2e9c1075e22f7=
141475ee4e6eea23a7f568b69ffc13cc1c723"
>>>> +
>>>> +S =3D "${WORKDIR}/schroedinger-${PV}"
>>>> +
>>>> +PACKAGES =3D "gst-plugin-schroedinger gst-plugin-schroedinger-dev gst=
-plugin-schroedinger-dbg"
>>>> +FILES_gst-plugin-schroedinger +=3D "${libdir}/gstreamer-0.10/libgstsc=
hro.so"
>>>> +FILES_gst-plugin-schroedinger-dev +=3D "${libdir}/gstreamer-0.10/libg=
stschro.*"
>>>> +FILES_gst-plugin-schroedinger-dbg +=3D "${libdir}/gstreamer-0.10/.deb=
ug/libgstschro.so"
>>>> +
>>>> diff --git a/meta-oe/recipes-multimedia/schroedinger/schroedinger.inc =
b/meta-oe/recipes-multimedia/schroedinger/schroedinger.inc
>>>> new file mode 100644
>>>> index 0000000..386fc73
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-multimedia/schroedinger/schroedinger.inc
>>>> @@ -0,0 +1,19 @@
>>>> +HOMEPAGE =3D "http://schrodinger.sourceforge.net/"
>>>> +LICENSE =3D "MPL GPL LGPL MIT"
>>>> +DEPENDS =3D "liboil orc-native orc"
>>>> +
>>>> +INC_PR =3D "r1"
>>>
>>> reset that
>>
>> Sure
>>
>>>
>>>> +
>>>> +SRC_URI =3D "http://www.diracvideo.org/download/schroedinger/${P}.tar=
.gz;name=3Dschroedingertargz"
>>>> +SRC_URI +=3D "file://configure.ac.patch"
>>>> +
>>>> +EXTRA_OECONF +=3D "STAGING_DIR=3D${STAGING_DIR_NATIVE}"
>>>> +
>>>> +inherit autotools
>>>> +
>>>> +do_configure_append () {
>>>> + =A0 =A0 =A0 =A0# Fix stupid libtool... handling.
>>>> + =A0 =A0 =A0 =A0# rpath handling can't be disabled and the Makefile's=
 can't be regenerated..
>>>> + =A0 =A0 =A0 =A0# (GNU sed required)
>>>> + =A0 =A0 =A0 =A0sed -i s/^hardcode_libdir_flag_spec/#hardcode_libdir_=
flag_spec/ ${S}/*-libtool
>>>> +}
>>>> diff --git a/meta-oe/recipes-multimedia/schroedinger/schroedinger/conf=
igure.ac.patch b/meta-oe/recipes-multimedia/schroedinger/schroedinger/confi=
gure.ac.patch
>>>> new file mode 100644
>>>> index 0000000..ac5e7ee
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-multimedia/schroedinger/schroedinger/configure.a=
c.patch
>>>> @@ -0,0 +1,13 @@
>>>> +Index: schroedinger-1.0.9/configure.ac
>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>> +--- schroedinger-1.0.9.orig/configure.ac
>>>> ++++ schroedinger-1.0.9/configure.ac
>>>> +@@ -54,7 +54,7 @@ if test "x${HAVE_ORC}" !=3D xyes ; then
>>>> + =A0 AC_ERROR([orc-0.4 >=3D $ORC_VER is required])
>>>> + fi
>>>> + SCHRO_PKG_DEPS=3D"$SCHRO_PKG_DEPS orc-0.4 >=3D $ORC_VER"
>>>> +-ORCC=3D`$PKG_CONFIG --variable=3Dorcc orc-0.4`
>>>> ++ORCC=3D$STAGING_DIR`$PKG_CONFIG --variable=3Dorcc orc-0.4`
>>>> + AC_SUBST(ORCC)
>>>> +
>>>> + AC_ARG_WITH([thread],
>>>> diff --git a/meta-oe/recipes-multimedia/schroedinger/schroedinger_1.0.=
9.bb b/meta-oe/recipes-multimedia/schroedinger/schroedinger_1.0.9.bb
>>>> new file mode 100644
>>>> index 0000000..2994428
>>>> --- /dev/null
>>>> +++ b/meta-oe/recipes-multimedia/schroedinger/schroedinger_1.0.9.bb
>>>> @@ -0,0 +1,13 @@
>>>> +require schroedinger.inc
>>>> +
>>>> +PR =3D "${INC_PR}.0"
>>>> +
>>>> +inherit autotools
>>>> +
>>>> +SRC_URI[schroedingertargz.md5sum] =3D "d67ec48b7c506db8c8b49156bf409e=
60"
>>>> +SRC_URI[schroedingertargz.sha256sum] =3D "345abcaa72ff0f2e9c1075e22f7=
141475ee4e6eea23a7f568b69ffc13cc1c723"
>>>
>>> Why isn't this in the .inc and why is there a seperate recipe for the g=
st plugin?
>>
>> It is that way in OE classic:
>> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/schroedi=
nger/schroedinger_1.0.9.bb
>
> That's an observation, not a reason. Please fix it when adding it to meta=
-oe, no need to forward port crap when we can get rid of it.
> _______________________________________________

I will drop this recipe and add the gst-plugins-bad dependency to VLC


