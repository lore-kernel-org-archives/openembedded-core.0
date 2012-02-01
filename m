Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RsOoG-0004IO-CY
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Feb 2012 02:16:28 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 31 Jan 2012 17:07:28 -0800
Received: by iabz7 with SMTP id z7so729385iab.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2012 17:07:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.15.161 with SMTP id y1mr29862449igc.4.1328058448276; Tue,
	31 Jan 2012 17:07:28 -0800 (PST)
Received: by 10.50.190.161 with HTTP; Tue, 31 Jan 2012 17:07:28 -0800 (PST)
In-Reply-To: <4F26CD01.4050700@linux.intel.com>
References: <1327795253-24794-1-git-send-email-schnitzeltony@googlemail.com>
	<1327795253-24794-2-git-send-email-schnitzeltony@googlemail.com>
	<4F26CD01.4050700@linux.intel.com>
Date: Tue, 31 Jan 2012 17:07:28 -0800
Message-ID: <CAPhnLPCXc6j4W8k_Ed=_Q52fLYvDB5EqFm0V8-Yg19ZC36JNEw@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] atk: add native / disable introspection / merge atk.inc->recipe / change license
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
X-List-Received-Date: Wed, 01 Feb 2012 01:16:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2012 at 9:01 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/28/2012 04:00 PM, Andreas M=FCller wrote:
>>
>> Native support currently is appended in meta-oe. Native build failed wit=
h:
>>
>> | /usr/share/gir-1.0/GLib-2.0.gir:9:1: error: Unsupported version '1.1'
>> | /usr/share/gir-1.0/GLib-2.0.gir:9:39: error: Unsupported version '1.1'
>> | error parsing file Atk-1.0.gir: Failed to parse included gir GLib-2.0
>> | make[3]: *** [Atk-1.0.typelib] Error 1
>>
>> build tested in meta-oe / angstrom environment
>>
>> Signed-off-by: Andreas M=FCller<schnitzeltony@googlemail.com>
>> ---
>> =A0meta/recipes-support/atk/atk.inc =A0 =A0 =A0| =A0 13 -------------
>> =A0meta/recipes-support/atk/atk_2.2.0.bb | =A0 17 +++++++++++++----
>> =A02 files changed, 13 insertions(+), 17 deletions(-)
>> =A0delete mode 100644 meta/recipes-support/atk/atk.inc
>>
>> diff --git a/meta/recipes-support/atk/atk.inc
>> b/meta/recipes-support/atk/atk.inc
>> deleted file mode 100644
>> index 6a4fef6..0000000
>> --- a/meta/recipes-support/atk/atk.inc
>> +++ /dev/null
>> @@ -1,13 +0,0 @@
>> -DESCRIPTION =3D "An accessibility toolkit for GNOME."
>> -HOMEPAGE =3D "http://live.gnome.org/GAP/"
>> -BUGTRACKER =3D "https://bugzilla.gnome.org/"
>> -
>> -LICENSE =3D "LGPLv2& =A0LGPLv2+"
>>
>> -
>> -SECTION =3D "x11/libs"
>> -
>> -DEPENDS =3D "glib-2.0 gtk-doc-native"
>> -
>> -inherit autotools pkgconfig
>> -
>> -EXTRA_OECONF =3D "--disable-glibtest"
>> diff --git a/meta/recipes-support/atk/atk_2.2.0.bb
>> b/meta/recipes-support/atk/atk_2.2.0.bb
>> index 0d657b5..74e7288 100644
>> --- a/meta/recipes-support/atk/atk_2.2.0.bb
>> +++ b/meta/recipes-support/atk/atk_2.2.0.bb
>> @@ -1,14 +1,23 @@
>> -require atk.inc
>> +DESCRIPTION =3D "An accessibility toolkit for GNOME."
>> +HOMEPAGE =3D "http://live.gnome.org/GAP/"
>> +BUGTRACKER =3D "https://bugzilla.gnome.org/"
>> +SECTION =3D "x11/libs"
>>
>> -PR =3D "r1"
>> +LICENSE =3D "GPLv2+& =A0LGPLv2+"
>
> Not sure what you changed here, but you did not fix this as Khem suggeste=
d.
> =A0Also, if you are making LICENSE changes the note you included in your =
00
> Patch email should really be in the Commit message instead.

Few things here:

- LICENSE needs to be ast parsable. It should be:

LICENSE =3D "GPL-2.0+ & LGPL-2.1+"

- LGPLv2.1. It really does matter, IMHO.

For some reason OBS says this is only LGPL-2.1+ I haven't looked at it
too closely, but COPYING is pretty clear here.

-b

>
> Thanks
> =A0 =A0 =A0 =A0Sau!
>
>
>> =A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D3bf50002aefd002f49e7bb8540=
63f7e7 \
>>
>> =A0file://atk/atkutil.c;endline=3D20;md5=3Ddb21b0bdbef9da4dc6eb122debc9f=
9bc \
>>
>> =A0file://atk/atk.h;endline=3D20;md5=3Dc58238d688c24387376d6c69d06248a7"
>> +PR =3D "r2"
>>
>> -SRC_URI =3D
>> "http://download.gnome.org/sources/atk/2.2/${BPN}-${PV}.tar.bz2"
>> +DEPENDS =3D "glib-2.0 gtk-doc-native"
>> +
>> +inherit autotools pkgconfig
>>
>> +SRC_URI =3D
>> "http://download.gnome.org/sources/atk/2.2/${BPN}-${PV}.tar.bz2"
>> =A0SRC_URI[md5sum] =3D "4894e9b04f0a9f1c37a624a1e8d6d73f"
>> =A0SRC_URI[sha256sum] =3D
>> "d201e3f5808aef0b1aec2277bfa61074f68863e405428adb57a73aab5c838450"
>>
>> +BBCLASSEXTEND =3D "native"
>>
>> -
>> +EXTRA_OECONF =3D "--disable-glibtest \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0--disable-introspection"
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


