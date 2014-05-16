Return-Path: <jacob.kroon@gmail.com>
Received: from mail-la0-f45.google.com (unknown [209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id 48F2F66078
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 12:24:34 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id gl10so1893778lab.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 05:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7fLDN+9QW2vq0HCVnkiQEKgYeGsAFDfn6nkJ0UP8bdU=;
	b=zch+FSYqKcjGjlpGDGMSi/tngnotOg4BKNODOVHz3AzHfvpBozsaG5Mp9yuS1tg133
	0MhATl23Cb8q9jOL0hAvYoEoPcpUvqLdzHrPjIUxhGtTgWUHqmvFXmp27vzDNeJNVe/b
	Mf2RvdXqj2L+wDpi72u957r3ZQVfcFsGTL2Ke97j2IxbBagjCrhuor/gAh6k2gUQmbOi
	snVW903jRf7dKXDQ6sbZsZ1riq1pImhf8Gi8N+W8HBpUHvZhAJ+Ybat6PYOQoP7FlkR8
	BySRgJ6/ZcxL+T8Ub80YMzk+sc7UKzoBtNs2oMpUyyY+iiV/Wtf49iBdzx3osFAZq4/k
	spjg==
MIME-Version: 1.0
X-Received: by 10.112.235.3 with SMTP id ui3mr862543lbc.93.1400242599721; Fri,
	16 May 2014 05:16:39 -0700 (PDT)
Received: by 10.112.99.106 with HTTP; Fri, 16 May 2014 05:16:39 -0700 (PDT)
In-Reply-To: <CAPbeDC=LgSCO0F7gB7nCJQCgXQrUvRAJCUt35Ss2JrVVWB21dQ@mail.gmail.com>
References: <1400169517-29966-1-git-send-email-sgw@linux.intel.com>
	<CAPbeDC=LgSCO0F7gB7nCJQCgXQrUvRAJCUt35Ss2JrVVWB21dQ@mail.gmail.com>
Date: Fri, 16 May 2014 14:16:39 +0200
Message-ID: <CAPbeDC=Z8OTCuy7+Lj4Hp_y-j3FcA0Ro0SBNRvTRRxy4Zm+qdg@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libusb1: Update to 1.0.18
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
X-List-Received-Date: Fri, 16 May 2014 12:24:40 -0000
Content-Type: multipart/alternative; boundary=001a11c31720c181e004f9836274

--001a11c31720c181e004f9836274
Content-Type: text/plain; charset=UTF-8

On Fri, May 16, 2014 at 7:13 AM, Jacob Kroon <jacob.kroon@gmail.com> wrote:

> Hello Saul,
>
>
> On Thu, May 15, 2014 at 5:58 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>  .../{libusb1-1.0.9 => libusb1}/obsolete_automake_macros.patch      | 0
>>  .../recipes-support/libusb/{libusb1_1.0.9.bb => libusb1_1.0.18.bb} | 7
>> ++-----
>>  2 files changed, 2 insertions(+), 5 deletions(-)
>>  rename meta/recipes-support/libusb/{libusb1-1.0.9 =>
>> libusb1}/obsolete_automake_macros.patch (100%)
>>  rename meta/recipes-support/libusb/{libusb1_1.0.9.bb =>
>> libusb1_1.0.18.bb} (78%)
>>
>> diff --git
>> a/meta/recipes-support/libusb/libusb1-1.0.9/obsolete_automake_macros.patch
>> b/meta/recipes-support/libusb/libusb1/obsolete_automake_macros.patch
>> similarity index 100%
>> rename from
>> meta/recipes-support/libusb/libusb1-1.0.9/obsolete_automake_macros.patch
>> rename to
>> meta/recipes-support/libusb/libusb1/obsolete_automake_macros.patch
>> diff --git a/meta/recipes-support/libusb/libusb1_1.0.9.bbb/meta/recipes-support/libusb/
>> libusb1_1.0.18.bb
>> similarity index 78%
>> rename from meta/recipes-support/libusb/libusb1_1.0.9.bb
>> rename to meta/recipes-support/libusb/libusb1_1.0.18.bb
>> index d57425b..c64f1db 100644
>> --- a/meta/recipes-support/libusb/libusb1_1.0.9.bb
>> +++ b/meta/recipes-support/libusb/libusb1_1.0.18.bb
>> @@ -8,14 +8,11 @@ LIC_FILES_CHKSUM =
>> "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>>
>>  BBCLASSEXTEND = "native nativesdk"
>>
>> -PR = "r1"
>> -
>>  SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
>> -           file://obsolete_automake_macros.patch \
>>            "
>>
>
> That patch is still in git, maybe it should be removed as well ?
>
>
Also, I think it needs to be added a PACKAGECONFIG for "udev", otherwise I
get a build failure when I generate an SDK on my system,
configure script can't find udev although it was requested.

Something like the patch below does the trick for me:

--- a/meta/recipes-support/libusb/libusb1_1.0.18.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.18.bb
@@ -8,12 +8,17 @@ LIC_FILES_CHKSUM =
"file://COPYING;md5=fbc093901857fcd118f065f900982c24"

 BBCLASSEXTEND = "native nativesdk"

-SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
-          "
+SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2"

 SRC_URI[md5sum] = "4a6d049923efc6496f1d383054dac1a6"
 SRC_URI[sha256sum] =
"c73f5cec45a5de94418da4e151b7232958571926984acfb9bce02b9424e83720"

+PACKAGECONFIG ?= "udev"
+PACKAGECONFIG_class-native = ""
+PACKAGECONFIG_class-nativesdk = ""
+
+PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
+
 S = "${WORKDIR}/libusb-${PV}"

 inherit autotools pkgconfig

If this looks good I can submit a proper patch for it.

/Jacob

--001a11c31720c181e004f9836274
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On F=
ri, May 16, 2014 at 7:13 AM, Jacob Kroon <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:jacob.kroon@gmail.com" target=3D"_blank">jacob.kroon@gmail.com</a>&gt=
;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div cla=
ss=3D"gmail_extra"><div class=3D"gmail_quote">Hello Saul,<div><div class=3D=
"h5"><br>
<br>On Thu, May 15, 2014 at 5:58 PM, Saul Wold <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&=
gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: Saul Wold =
&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.inte=
l.com</a>&gt;<br>

---<br>
=C2=A0.../{libusb1-1.0.9 =3D&gt; libusb1}/obsolete_automake_macros.patch =
=C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../recipes-support/libusb/{<a href=3D"http://libusb1_1.0.9.bb" targe=
t=3D"_blank">libusb1_1.0.9.bb</a> =3D&gt; <a href=3D"http://libusb1_1.0.18.=
bb" target=3D"_blank">libusb1_1.0.18.bb</a>} | 7 ++-----<br>
=C2=A02 files changed, 2 insertions(+), 5 deletions(-)<br>
=C2=A0rename meta/recipes-support/libusb/{libusb1-1.0.9 =3D&gt; libusb1}/ob=
solete_automake_macros.patch (100%)<br>
=C2=A0rename meta/recipes-support/libusb/{<a href=3D"http://libusb1_1.0.9.b=
b" target=3D"_blank">libusb1_1.0.9.bb</a> =3D&gt; <a href=3D"http://libusb1=
_1.0.18.bb" target=3D"_blank">libusb1_1.0.18.bb</a>} (78%)<br>
<br>
diff --git a/meta/recipes-support/libusb/libusb1-1.0.9/obsolete_automake_ma=
cros.patch b/meta/recipes-support/libusb/libusb1/obsolete_automake_macros.p=
atch<br>
similarity index 100%<br>
rename from meta/recipes-support/libusb/libusb1-1.0.9/obsolete_automake_mac=
ros.patch<br>
rename to meta/recipes-support/libusb/libusb1/obsolete_automake_macros.patc=
h<br>
diff --git a/meta/recipes-support/libusb/<a href=3D"http://libusb1_1.0.9.bb=
" target=3D"_blank">libusb1_1.0.9.bb</a> b/meta/recipes-support/libusb/<a h=
ref=3D"http://libusb1_1.0.18.bb" target=3D"_blank">libusb1_1.0.18.bb</a><br=
>
similarity index 78%<br>
rename from meta/recipes-support/libusb/<a href=3D"http://libusb1_1.0.9.bb"=
 target=3D"_blank">libusb1_1.0.9.bb</a><br>
rename to meta/recipes-support/libusb/<a href=3D"http://libusb1_1.0.18.bb" =
target=3D"_blank">libusb1_1.0.18.bb</a><br>
index d57425b..c64f1db 100644<br>
--- a/meta/recipes-support/libusb/<a href=3D"http://libusb1_1.0.9.bb" targe=
t=3D"_blank">libusb1_1.0.9.bb</a><br>
+++ b/meta/recipes-support/libusb/<a href=3D"http://libusb1_1.0.18.bb" targ=
et=3D"_blank">libusb1_1.0.18.bb</a><br>
@@ -8,14 +8,11 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dfbc093901=
857fcd118f065f900982c24&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
-PR =3D &quot;r1&quot;<br>
-<br>
=C2=A0SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \=
<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://obsolete_automake_macros.patch =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br></blockquote><br></div><=
/div></div>That patch is still in git, maybe it should be removed as well ?=
<span class=3D""><font color=3D"#888888"><br><br></font></span></div></div>=
</blockquote><div>=C2=A0</div><div>
Also, I think it needs to be added a PACKAGECONFIG for &quot;udev&quot;, ot=
herwise I get a build failure when I generate an SDK on my system,<br></div=
><div>configure script can&#39;t find udev although it was requested.<br>
<br></div><div>Something like the patch below does the trick for me:<br><br=
>--- a/meta/recipes-support/libusb/<a href=3D"http://libusb1_1.0.18.bb">lib=
usb1_1.0.18.bb</a><br>+++ b/meta/recipes-support/libusb/<a href=3D"http://l=
ibusb1_1.0.18.bb">libusb1_1.0.18.bb</a><br>
@@ -8,12 +8,17 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dfbc093901=
857fcd118f065f900982c24&quot;<br>=C2=A0<br>=C2=A0BBCLASSEXTEND =3D &quot;na=
tive nativesdk&quot;<br>=C2=A0<br>-SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/=
libusb/libusb-${PV}.tar.bz2 \<br>
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;<br>+SRC_URI =
=3D &quot;${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2&quot;<br>=C2=A0=
<br>=C2=A0SRC_URI[md5sum] =3D &quot;4a6d049923efc6496f1d383054dac1a6&quot;<=
br>=C2=A0SRC_URI[sha256sum] =3D &quot;c73f5cec45a5de94418da4e151b7232958571=
926984acfb9bce02b9424e83720&quot;<br>
=C2=A0<br>+PACKAGECONFIG ?=3D &quot;udev&quot;<br>+PACKAGECONFIG_class-nati=
ve =3D &quot;&quot;<br>+PACKAGECONFIG_class-nativesdk =3D &quot;&quot;<br>+=
<br>+PACKAGECONFIG[udev] =3D &quot;--enable-udev,--disable-udev,udev&quot;<=
br>+<br>=C2=A0S =3D &quot;${WORKDIR}/libusb-${PV}&quot;<br>
=C2=A0<br>=C2=A0inherit autotools pkgconfig<br><br></div><div>If this looks=
 good I can submit a proper patch for it.<br></div><div><br></div></div>/Ja=
cob<br></div></div>

--001a11c31720c181e004f9836274--
