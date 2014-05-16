Return-Path: <jacob.kroon@gmail.com>
X-Greylist: delayed 23468 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 16 May 2014 18:47:47 UTC
Received: from mail-lb0-f177.google.com (unknown [209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id AF6926028A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 18:47:47 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id s7so2215031lbd.22
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 11:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=dU3b7vFpWFrfVMt4TCH8iE3QePBx4w1ViIUvsY5E/Ds=;
	b=pwQNbkudHldPPHjtnyQ3tLvz1WT4Bzb8p5KpFitchQqsdwIRYWhWm2bYipGJZfABIw
	0q25EMQcBXL6KlRpyjw6qu9XRTR+r3gG62751qO4PVPzNm+HlMD8Xn+05sP4qrVvRsmU
	efvsbGFaGQrhHI7ctoE+neIRj7CYIubC4DBaWZtEyHA0QV8UjOOQXwnPahLbuR3MFG8U
	ftMeU/JVs6npVBpFDg+DtXbD9Ojz53f41eufns12ErKHvtBcHEfVzLjzIAjnYHptOFuQ
	30Xqc+47WH9G5DmGjO3rExH5aSvQLUCy2ewQktTrbU0Z2GJ2ePogXLckls7lRnyYABF1
	yWig==
MIME-Version: 1.0
X-Received: by 10.152.6.194 with SMTP id d2mr2997125laa.54.1400266068240; Fri,
	16 May 2014 11:47:48 -0700 (PDT)
Received: by 10.112.99.106 with HTTP; Fri, 16 May 2014 11:47:48 -0700 (PDT)
In-Reply-To: <53764764.1010608@linux.intel.com>
References: <1400169517-29966-1-git-send-email-sgw@linux.intel.com>
	<CAPbeDC=LgSCO0F7gB7nCJQCgXQrUvRAJCUt35Ss2JrVVWB21dQ@mail.gmail.com>
	<CAPbeDC=Z8OTCuy7+Lj4Hp_y-j3FcA0Ro0SBNRvTRRxy4Zm+qdg@mail.gmail.com>
	<53764764.1010608@linux.intel.com>
Date: Fri, 16 May 2014 20:47:48 +0200
Message-ID: <CAPbeDCmCxA5o99dMhnDsRQnNW4aTDe_qAO4qySO+W_=ErN9k1w@mail.gmail.com>
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
X-List-Received-Date: Fri, 16 May 2014 18:47:54 -0000
Content-Type: multipart/alternative; boundary=089e013d186a96b04f04f988d9f6

--089e013d186a96b04f04f988d9f6
Content-Type: text/plain; charset=UTF-8

On Fri, May 16, 2014 at 7:14 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 05/16/2014 05:16 AM, Jacob Kroon wrote:
>
>> On Fri, May 16, 2014 at 7:13 AM, Jacob Kroon <jacob.kroon@gmail.com>
>> wrote:
>>
>>  Hello Saul,
>>>
>>>
>>> On Thu, May 15, 2014 at 5:58 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>>
>>>  Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>>> ---
>>>>   .../{libusb1-1.0.9 => libusb1}/obsolete_automake_macros.patch      |
>>>> 0
>>>>   .../recipes-support/libusb/{libusb1_1.0.9.bb => libusb1_1.0.18.bb} |
>>>> 7
>>>> ++-----
>>>>   2 files changed, 2 insertions(+), 5 deletions(-)
>>>>   rename meta/recipes-support/libusb/{libusb1-1.0.9 =>
>>>> libusb1}/obsolete_automake_macros.patch (100%)
>>>>   rename meta/recipes-support/libusb/{libusb1_1.0.9.bb =>
>>>> libusb1_1.0.18.bb} (78%)
>>>>
>>>> diff --git
>>>> a/meta/recipes-support/libusb/libusb1-1.0.9/obsolete_
>>>> automake_macros.patch
>>>> b/meta/recipes-support/libusb/libusb1/obsolete_automake_macros.patch
>>>> similarity index 100%
>>>> rename from
>>>> meta/recipes-support/libusb/libusb1-1.0.9/obsolete_
>>>> automake_macros.patch
>>>> rename to
>>>> meta/recipes-support/libusb/libusb1/obsolete_automake_macros.patch
>>>> diff --git a/meta/recipes-support/libusb/libusb1_1.0.9.bbb/meta/
>>>> recipes-support/libusb/
>>>> libusb1_1.0.18.bb
>>>> similarity index 78%
>>>> rename from meta/recipes-support/libusb/libusb1_1.0.9.bb
>>>> rename to meta/recipes-support/libusb/libusb1_1.0.18.bb
>>>> index d57425b..c64f1db 100644
>>>> --- a/meta/recipes-support/libusb/libusb1_1.0.9.bb
>>>> +++ b/meta/recipes-support/libusb/libusb1_1.0.18.bb
>>>> @@ -8,14 +8,11 @@ LIC_FILES_CHKSUM =
>>>> "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>>>>
>>>>   BBCLASSEXTEND = "native nativesdk"
>>>>
>>>> -PR = "r1"
>>>> -
>>>>   SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
>>>> -           file://obsolete_automake_macros.patch \
>>>>             "
>>>>
>>>>
>>> That patch is still in git, maybe it should be removed as well ?
>>>
>>>
>>>  Also, I think it needs to be added a PACKAGECONFIG for "udev",
>> otherwise I
>> get a build failure when I generate an SDK on my system,
>> configure script can't find udev although it was requested.
>>
>>
>  Something like the patch below does the trick for me:
>>
>>  I am supprised you did not see a circular dependency with udev -> libusb
> -> udev, I think we need to disable-udev as default and if there is a need
> for a libusb with udev support we will have to create a new recipe possibly
> to build it after udev is built.
>
>
With the patch applied, I wiped my sysroots and did a "cleansstate libusb1
udev", and then rebuilt both successfully with no warning
about circular dependency. Maybe I'm not hitting the error since I have
"systemd" in DISTRO_FEATURES, so it's actually systemd that is the udev
provider.

Thoughts here?
>
> Sau!
>
>
>
>  --- a/meta/recipes-support/libusb/libusb1_1.0.18.bb
>> +++ b/meta/recipes-support/libusb/libusb1_1.0.18.bb
>> @@ -8,12 +8,17 @@ LIC_FILES_CHKSUM =
>> "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>>
>>   BBCLASSEXTEND = "native nativesdk"
>>
>> -SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
>> -          "
>> +SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2"
>>
>>   SRC_URI[md5sum] = "4a6d049923efc6496f1d383054dac1a6"
>>   SRC_URI[sha256sum] =
>> "c73f5cec45a5de94418da4e151b7232958571926984acfb9bce02b9424e83720"
>>
>> +PACKAGECONFIG ?= "udev"
>> +PACKAGECONFIG_class-native = ""
>> +PACKAGECONFIG_class-nativesdk = ""
>> +
>> +PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
>> +
>>   S = "${WORKDIR}/libusb-${PV}"
>>
>>   inherit autotools pkgconfig
>>
>> If this looks good I can submit a proper patch for it.
>>
>> /Jacob
>>
>>

--089e013d186a96b04f04f988d9f6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On F=
ri, May 16, 2014 at 7:14 PM, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</spa=
n> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On 0=
5/16/2014 05:16 AM, Jacob Kroon wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
On Fri, May 16, 2014 at 7:13 AM, Jacob Kroon &lt;<a href=3D"mailto:jacob.kr=
oon@gmail.com" target=3D"_blank">jacob.kroon@gmail.com</a>&gt; wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Hello Saul,<br>
<br>
<br>
On Thu, May 15, 2014 at 5:58 PM, Saul Wold &lt;<a href=3D"mailto:sgw@linux.=
intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt; wrote:<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Signed-off-by: Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com" target=
=3D"_blank">sgw@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0 .../{libusb1-1.0.9 =3D&gt; libusb1}/obsolete_automake_<u></u>macros.=
patch =C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0 .../recipes-support/libusb/{<a href=3D"http://libusb1_1.0.9.bb" targ=
et=3D"_blank">li<u></u>busb1_1.0.9.bb</a> =3D&gt; <a href=3D"http://libusb1=
_1.0.18.bb" target=3D"_blank">libusb1_1.0.18.bb</a>} | 7<br>
++-----<br>
=C2=A0 2 files changed, 2 insertions(+), 5 deletions(-)<br>
=C2=A0 rename meta/recipes-support/libusb/{<u></u>libusb1-1.0.9 =3D&gt;<br>
libusb1}/obsolete_automake_<u></u>macros.patch (100%)<br>
=C2=A0 rename meta/recipes-support/libusb/{<a href=3D"http://libusb1_1.0.9.=
bb" target=3D"_blank">l<u></u>ibusb1_1.0.9.bb</a> =3D&gt;<br>
<a href=3D"http://libusb1_1.0.18.bb" target=3D"_blank">libusb1_1.0.18.bb</a=
>} (78%)<br>
<br>
diff --git<br>
a/meta/recipes-support/libusb/<u></u>libusb1-1.0.9/obsolete_<u></u>automake=
_macros.patch<br>
b/meta/recipes-support/libusb/<u></u>libusb1/obsolete_automake_<u></u>macro=
s.patch<br>
similarity index 100%<br>
rename from<br>
meta/recipes-support/libusb/<u></u>libusb1-1.0.9/obsolete_<u></u>automake_m=
acros.patch<br>
rename to<br>
meta/recipes-support/libusb/<u></u>libusb1/obsolete_automake_<u></u>macros.=
patch<br>
diff --git a/meta/recipes-support/libusb/<u></u>libusb1_1.0.9.bbb/meta/<u><=
/u>recipes-support/libusb/<br>
<a href=3D"http://libusb1_1.0.18.bb" target=3D"_blank">libusb1_1.0.18.bb</a=
><br>
similarity index 78%<br>
rename from meta/recipes-support/libusb/<a href=3D"http://libusb1_1.0.9.bb"=
 target=3D"_blank">li<u></u>busb1_1.0.9.bb</a><br>
rename to meta/recipes-support/libusb/<a href=3D"http://libusb1_1.0.18.bb" =
target=3D"_blank">li<u></u>busb1_1.0.18.bb</a><br>
index d57425b..c64f1db 100644<br>
--- a/meta/recipes-support/libusb/<a href=3D"http://libusb1_1.0.9.bb" targe=
t=3D"_blank"><u></u>libusb1_1.0.9.bb</a><br>
+++ b/meta/recipes-support/libusb/<a href=3D"http://libusb1_1.0.18.bb" targ=
et=3D"_blank"><u></u>libusb1_1.0.18.bb</a><br>
@@ -8,14 +8,11 @@ LIC_FILES_CHKSUM =3D<br>
&quot;file://COPYING;md5=3D<u></u>fbc093901857fcd118f065f900982c<u></u>24&q=
uot;<br>
<br>
=C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
-PR =3D &quot;r1&quot;<br>
-<br>
=C2=A0 SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/libusb/<u></u>libusb-${PV}.t=
ar.bz2 \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://obsolete_automake_<u></u>macros=
.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
</blockquote>
<br>
That patch is still in git, maybe it should be removed as well ?<br>
<br>
<br>
</blockquote>
Also, I think it needs to be added a PACKAGECONFIG for &quot;udev&quot;, ot=
herwise I<br>
get a build failure when I generate an SDK on my system,<br>
configure script can&#39;t find udev although it was requested.<br>
<br>
</blockquote>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Something like the patch below does the trick for me:<br>
<br>
</blockquote></div></div>
I am supprised you did not see a circular dependency with udev -&gt; libusb=
 -&gt; udev, I think we need to disable-udev as default and if there is a n=
eed for a libusb with udev support we will have to create a new recipe poss=
ibly to build it after udev is built.<br>

<br></blockquote><div>=C2=A0<br></div><div>With the patch applied, I wiped =
my sysroots and did a &quot;cleansstate libusb1 udev&quot;, and then rebuil=
t both successfully with no warning<br>about circular dependency. Maybe I&#=
39;m not hitting the error since I have &quot;systemd&quot; in DISTRO_FEATU=
RES, so it&#39;s actually systemd that is the udev provider.<br>
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
Thoughts here?<br>
<br>
Sau!<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
--- a/meta/recipes-support/libusb/<a href=3D"http://libusb1_1.0.18.bb" targ=
et=3D"_blank"><u></u>libusb1_1.0.18.bb</a><br>
+++ b/meta/recipes-support/libusb/<a href=3D"http://libusb1_1.0.18.bb" targ=
et=3D"_blank"><u></u>libusb1_1.0.18.bb</a><br>
@@ -8,12 +8,17 @@ LIC_FILES_CHKSUM =3D<br>
&quot;file://COPYING;md5=3D<u></u>fbc093901857fcd118f065f900982c<u></u>24&q=
uot;<br>
<br>
=C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
-SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/libusb/<u></u>libusb-${PV}.tar.bz2=
 \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
+SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/libusb/<u></u>libusb-${PV}.tar.bz2=
&quot;<br>
<br>
=C2=A0 SRC_URI[md5sum] =3D &quot;<u></u>4a6d049923efc6496f1d383054dac1<u></=
u>a6&quot;<br>
=C2=A0 SRC_URI[sha256sum] =3D<br>
&quot;<u></u>c73f5cec45a5de94418da4e151b723<u></u>2958571926984acfb9bce02b9=
424e8<u></u>3720&quot;<br>
<br>
+PACKAGECONFIG ?=3D &quot;udev&quot;<br>
+PACKAGECONFIG_class-native =3D &quot;&quot;<br>
+PACKAGECONFIG_class-nativesdk =3D &quot;&quot;<br>
+<br>
+PACKAGECONFIG[udev] =3D &quot;--enable-udev,--disable-udev,<u></u>udev&quo=
t;<br>
+<br>
=C2=A0 S =3D &quot;${WORKDIR}/libusb-${PV}&quot;<br>
<br>
=C2=A0 inherit autotools pkgconfig<br>
<br>
If this looks good I can submit a proper patch for it.<br>
<br>
/Jacob<br>
<br>
</blockquote>
</div></div></blockquote></div><br></div></div>

--089e013d186a96b04f04f988d9f6--
