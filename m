Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SD9UY-0001Ds-2I
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Mar 2012 09:09:54 +0200
Received: by eekc1 with SMTP id c1so645743eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2012 00:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=soeywOTG7Npaeiq625tcvCUt8bsvPeDAhuRIMJLvmEs=;
	b=POSGCEcUgixUeSx23yMKU7DXeIikKBbal34DW6iFw595QeqeoPB+hcrTLyVH0zLNKb
	imeGrtCNQ8jafCEmabffrzoisZrW176u6TbsslcMY2MxtowdralaY8gfmpzAj9fs0hMj
	miZcXJHc9CPe91QS0CKlUerQdvmZR5arGvQmeFcg++ZWGadTb/hNevpIF0X88WmU9L8l
	MT/Sw06LyFKs10xllzzz6IrRRS7fW0AE915OXbPZ8fZ4nNRWdni+ttSZYZRZLUnlPOFY
	XHLPdVTm4eePahnQ2bk7l513fQwlhTelWy7ePWLxcW4+x+o0HcFOKwpCSX4b/E+9eQaO
	XcRQ==
MIME-Version: 1.0
Received: by 10.180.101.136 with SMTP id fg8mr2720539wib.4.1333004450331; Thu,
	29 Mar 2012 00:00:50 -0700 (PDT)
Received: by 10.223.97.77 with HTTP; Thu, 29 Mar 2012 00:00:50 -0700 (PDT)
In-Reply-To: <4F740656.4010903@windriver.com>
References: <1332964015-1069-1-git-send-email-obi@opendreambox.org>
	<4F740656.4010903@windriver.com>
Date: Thu, 29 Mar 2012 09:00:50 +0200
Message-ID: <CAGiJk9c9CSF5cw6m5SfqyOmR2+PF9GiveZfhWm6pkGZ3pkXoZg@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qt4: move from 4.8.0 to 4.8.1
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
X-List-Received-Date: Thu, 29 Mar 2012 07:09:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/3/29 Robert Yang <liezhi.yang@windriver.com>:
>
> Hi Andreas,
>
> I have one question about the qt-x11-free, is it possible to enable
> the "-sm -accessibility" in oe-core, please? There is a meta-kde
> layer which requires the "-sm -accessibility", but they are disabled
> in oe-core currently:
>
> QT_DISTRO_FLAGS ?=3D "-no-accessibility -no-sm"
>
> So there is a "qt4-x11-free_4.8.0.bbappend" in meta-kde, once the
> the oe-core upgrade to 4.8.1, then the meta-kde has to uprade again.
>
> I checked the log of the qt4, can't find the relative log for
> "-no-accessibility -no-sm".
>
> If it is possible to enable them in oe-core, I'd like to send a patch for
> them.
>
> // Robert
>
>
> On 03/29/2012 03:46 AM, Andreas Oberritter wrote:
>>
>> * No changes other than source checksums and PR at recipe level.
>> * DEFAULT_PREFERENCE still set to -1
>>
>> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
>> ---
>> * Considering that OE-core is in a stabilization phase, updating
>> =C2=A0 Qt may be a bad idea. However, version 4.8.0 has D_P=3D-1, so
>> =C2=A0 4.7.4 still gets built by default.
>>
>> * Even if this won't get applied now, other people might be
>> =C2=A0 interested in testing this version and giving feedback.
>>
>> * This recipe has been compile-tested on x86 and x86_64
>> =C2=A0 for mips32el (qt4-native and qt4-embedded).
>>
>> =C2=A0meta/recipes-qt/qt4/{qt-4.8.0.inc =3D> =C2=A0qt-4.8.1.inc} | =C2=
=A0 =C2=A04 ++--
>> =C2=A0.../0001-Added-Openembedded-crossarch-option.patch | =C2=A0 =C2=A0=
0
>> =C2=A0.../{qt-4.8.0 =3D> =C2=A0qt-4.8.1}/configure-lflags.patch =C2=A0| =
=C2=A0 =C2=A00
>> =C2=A0.../configure_oe_compiler.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
>> =C2=A0.../{qt-4.8.0 =3D> =C2=A0qt-4.8.1}/fix-translations.patch =C2=A0| =
=C2=A0 =C2=A00
>> =C2=A0.../recipes-qt/qt4/{qt-4.8.0 =3D> =C2=A0qt-4.8.1}/g++.conf | =C2=
=A0 =C2=A00
>> =C2=A0.../hack-out-pg2-4.7.0.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A00
>> =C2=A0.../qt4/{qt-4.8.0 =3D> =C2=A0qt-4.8.1}/linux.conf =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A00
>> =C2=A0.../{qt-4.8.0 =3D> =C2=A0qt-4.8.1}/pulseaudio-config.patch | =C2=
=A0 =C2=A00
>> =C2=A0.../{qt-4.8.0 =3D> =C2=A0qt-4.8.1}/qmake_cxx_eval.patch =C2=A0 =C2=
=A0| =C2=A0 =C2=A00
>> =C2=A0.../{qt-4.8.0 =3D> =C2=A0qt-4.8.1}/qmake_pri_fixes.patch =C2=A0 | =
=C2=A0 =C2=A00
>> =C2=A0...qt4-embedded_4.8.0.bb =3D> =C2=A0qt4-embedded_4.8.1.bb} | =C2=
=A0 =C2=A02 +-
>> =C2=A0.../{qt4-native_4.8.0.bb =3D> =C2=A0qt4-native_4.8.1.bb} =C2=A0 | =
=C2=A0 =C2=A04 ++--
>> =C2=A0meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb =C2=A0 | =C2=A0 1=
0 ----------
>> =C2=A0meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb =C2=A0 | =C2=A0 1=
0 ++++++++++
>> =C2=A0...qt4-x11-free_4.8.0.bb =3D> =C2=A0qt4-x11-free_4.8.1.bb} | =C2=
=A0 =C2=A02 +-
>> =C2=A016 files changed, 16 insertions(+), 16 deletions(-)
>> =C2=A0rename meta/recipes-qt/qt4/{qt-4.8.0.inc =3D> =C2=A0qt-4.8.1.inc} =
(93%)
>> =C2=A0rename meta/recipes-qt/qt4/{qt-4.8.0 =3D>
>> =C2=A0qt-4.8.1}/0001-Added-Openembedded-crossarch-option.patch (100%)
>> =C2=A0rename meta/recipes-qt/qt4/{qt-4.8.0 =3D> =C2=A0qt-4.8.1}/configur=
e-lflags.patch
>> (100%)
>> =C2=A0rename meta/recipes-qt/qt4/{qt-4.8.0 =3D>
>> =C2=A0qt-4.8.1}/configure_oe_compiler.patch (100%)
>> =C2=A0rename meta/recipes-qt/qt4/{qt-4.8.0 =3D> =C2=A0qt-4.8.1}/fix-tran=
slations.patch
>> (100%)
>> =C2=A0rename meta/recipes-qt/qt4/{qt-4.8.0 =3D> =C2=A0qt-4.8.1}/g++.conf=
 (100%)
>> =C2=A0rename meta/recipes-qt/qt4/{qt-4.8.0 =3D>
>> =C2=A0qt-4.8.1}/hack-out-pg2-4.7.0.patch (100%)
>> =C2=A0rename meta/recipes-qt/qt4/{qt-4.8.0 =3D> =C2=A0qt-4.8.1}/linux.co=
nf (100%)
>> =C2=A0rename meta/recipes-qt/qt4/{qt-4.8.0 =3D>
>> =C2=A0qt-4.8.1}/pulseaudio-config.patch (100%)
>> =C2=A0rename meta/recipes-qt/qt4/{qt-4.8.0 =3D> =C2=A0qt-4.8.1}/qmake_cx=
x_eval.patch
>> (100%)
>> =C2=A0rename meta/recipes-qt/qt4/{qt-4.8.0 =3D> =C2=A0qt-4.8.1}/qmake_pr=
i_fixes.patch
>> (100%)
>> =C2=A0rename meta/recipes-qt/qt4/{qt4-embedded_4.8.0.bb =3D>
>> =C2=A0qt4-embedded_4.8.1.bb} (89%)
>> =C2=A0rename meta/recipes-qt/qt4/{qt4-native_4.8.0.bb =3D> =C2=A0qt4-nat=
ive_4.8.1.bb}
>> (60%)
>> =C2=A0delete mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.b=
b
>> =C2=A0create mode 100644 meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.b=
b
>> =C2=A0rename meta/recipes-qt/qt4/{qt4-x11-free_4.8.0.bb =3D>
>> =C2=A0qt4-x11-free_4.8.1.bb} (90%)
>>
>> diff --git a/meta/recipes-qt/qt4/qt-4.8.0.inc
>> b/meta/recipes-qt/qt4/qt-4.8.1.inc
>> similarity index 93%
>> rename from meta/recipes-qt/qt4/qt-4.8.0.inc
>> rename to meta/recipes-qt/qt4/qt-4.8.1.inc
>> index c0d90cd..cd78401 100644
>> --- a/meta/recipes-qt/qt4/qt-4.8.0.inc
>> +++ b/meta/recipes-qt/qt4/qt-4.8.1.inc
>> @@ -22,8 +22,8 @@ SRC_URI =3D
>> "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://linux.conf \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "
>>
>> -SRC_URI[md5sum] =3D "e8a5fdbeba2927c948d9f477a6abe904"
>> -SRC_URI[sha256sum] =3D
>> "9392b74e485e15f75a3e07a527547d4f6747eaf55ebce71ba0e863a9fd320b6e"
>> +SRC_URI[md5sum] =3D "7960ba8e18ca31f0c6e4895a312f92ff"
>> +SRC_URI[sha256sum] =3D
>> "ef851a36aa41b4ad7a3e4c96ca27eaed2a629a6d2fa06c20f072118caed87ae8"
>>
>> =C2=A0S =3D "${WORKDIR}/qt-everywhere-opensource-src-${PV}"
>>
>> diff --git
>> a/meta/recipes-qt/qt4/qt-4.8.0/0001-Added-Openembedded-crossarch-option.=
patch
>> b/meta/recipes-qt/qt4/qt-4.8.1/0001-Added-Openembedded-crossarch-option.=
patch
>> similarity index 100%
>> rename from
>> meta/recipes-qt/qt4/qt-4.8.0/0001-Added-Openembedded-crossarch-option.pa=
tch
>> rename to
>> meta/recipes-qt/qt4/qt-4.8.1/0001-Added-Openembedded-crossarch-option.pa=
tch
>> diff --git a/meta/recipes-qt/qt4/qt-4.8.0/configure-lflags.patch
>> b/meta/recipes-qt/qt4/qt-4.8.1/configure-lflags.patch
>> similarity index 100%
>> rename from meta/recipes-qt/qt4/qt-4.8.0/configure-lflags.patch
>> rename to meta/recipes-qt/qt4/qt-4.8.1/configure-lflags.patch
>> diff --git a/meta/recipes-qt/qt4/qt-4.8.0/configure_oe_compiler.patch
>> b/meta/recipes-qt/qt4/qt-4.8.1/configure_oe_compiler.patch
>> similarity index 100%
>> rename from meta/recipes-qt/qt4/qt-4.8.0/configure_oe_compiler.patch
>> rename to meta/recipes-qt/qt4/qt-4.8.1/configure_oe_compiler.patch
>> diff --git a/meta/recipes-qt/qt4/qt-4.8.0/fix-translations.patch
>> b/meta/recipes-qt/qt4/qt-4.8.1/fix-translations.patch
>> similarity index 100%
>> rename from meta/recipes-qt/qt4/qt-4.8.0/fix-translations.patch
>> rename to meta/recipes-qt/qt4/qt-4.8.1/fix-translations.patch
>> diff --git a/meta/recipes-qt/qt4/qt-4.8.0/g++.conf
>> b/meta/recipes-qt/qt4/qt-4.8.1/g++.conf
>> similarity index 100%
>> rename from meta/recipes-qt/qt4/qt-4.8.0/g++.conf
>> rename to meta/recipes-qt/qt4/qt-4.8.1/g++.conf
>> diff --git a/meta/recipes-qt/qt4/qt-4.8.0/hack-out-pg2-4.7.0.patch
>> b/meta/recipes-qt/qt4/qt-4.8.1/hack-out-pg2-4.7.0.patch
>> similarity index 100%
>> rename from meta/recipes-qt/qt4/qt-4.8.0/hack-out-pg2-4.7.0.patch
>> rename to meta/recipes-qt/qt4/qt-4.8.1/hack-out-pg2-4.7.0.patch
>> diff --git a/meta/recipes-qt/qt4/qt-4.8.0/linux.conf
>> b/meta/recipes-qt/qt4/qt-4.8.1/linux.conf
>> similarity index 100%
>> rename from meta/recipes-qt/qt4/qt-4.8.0/linux.conf
>> rename to meta/recipes-qt/qt4/qt-4.8.1/linux.conf
>> diff --git a/meta/recipes-qt/qt4/qt-4.8.0/pulseaudio-config.patch
>> b/meta/recipes-qt/qt4/qt-4.8.1/pulseaudio-config.patch
>> similarity index 100%
>> rename from meta/recipes-qt/qt4/qt-4.8.0/pulseaudio-config.patch
>> rename to meta/recipes-qt/qt4/qt-4.8.1/pulseaudio-config.patch
>> diff --git a/meta/recipes-qt/qt4/qt-4.8.0/qmake_cxx_eval.patch
>> b/meta/recipes-qt/qt4/qt-4.8.1/qmake_cxx_eval.patch
>> similarity index 100%
>> rename from meta/recipes-qt/qt4/qt-4.8.0/qmake_cxx_eval.patch
>> rename to meta/recipes-qt/qt4/qt-4.8.1/qmake_cxx_eval.patch
>> diff --git a/meta/recipes-qt/qt4/qt-4.8.0/qmake_pri_fixes.patch
>> b/meta/recipes-qt/qt4/qt-4.8.1/qmake_pri_fixes.patch
>> similarity index 100%
>> rename from meta/recipes-qt/qt4/qt-4.8.0/qmake_pri_fixes.patch
>> rename to meta/recipes-qt/qt4/qt-4.8.1/qmake_pri_fixes.patch
>> diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb
>> b/meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb
>> similarity index 89%
>> rename from meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb
>> rename to meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb
>> index efbc02a..5c1c97e 100644
>> --- a/meta/recipes-qt/qt4/qt4-embedded_4.8.0.bb
>> +++ b/meta/recipes-qt/qt4/qt4-embedded_4.8.1.bb
>> @@ -1,7 +1,7 @@
>> =C2=A0require qt-${PV}.inc
>> =C2=A0require qt4-embedded.inc
>>
>> -PR =3D "${INC_PR}.1"
>> +PR =3D "${INC_PR}.0"
>>
>> =C2=A0DEFAULT_PREFERENCE =3D "-1"
>>
>> diff --git a/meta/recipes-qt/qt4/qt4-native_4.8.0.bb
>> b/meta/recipes-qt/qt4/qt4-native_4.8.1.bb
>> similarity index 60%
>> rename from meta/recipes-qt/qt4/qt4-native_4.8.0.bb
>> rename to meta/recipes-qt/qt4/qt4-native_4.8.1.bb
>> index 86c0500..d991c03 100644
>> --- a/meta/recipes-qt/qt4/qt4-native_4.8.0.bb
>> +++ b/meta/recipes-qt/qt4/qt4-native_4.8.1.bb
>> @@ -9,6 +9,6 @@ FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/qt-${PV}:"
>>
>> =C2=A0TOBUILD :=3D "src/tools/bootstrap ${TOBUILD}"
>>
>> -SRC_URI[md5sum] =3D "e8a5fdbeba2927c948d9f477a6abe904"
>> -SRC_URI[sha256sum] =3D
>> "9392b74e485e15f75a3e07a527547d4f6747eaf55ebce71ba0e863a9fd320b6e"
>> +SRC_URI[md5sum] =3D "7960ba8e18ca31f0c6e4895a312f92ff"
>> +SRC_URI[sha256sum] =3D
>> "ef851a36aa41b4ad7a3e4c96ca27eaed2a629a6d2fa06c20f072118caed87ae8"
>>
>> diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb
>> b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb
>> deleted file mode 100644
>> index 02917fe..0000000
>> --- a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.0.bb
>> +++ /dev/null
>> @@ -1,10 +0,0 @@
>> -require qt4-tools-nativesdk.inc
>> -
>> -PR =3D "${INC_PR}.0"
>> -
>> -SRC_URI +=3D "file://qmake_pri_fixes.patch"
>> -
>> -DEFAULT_PREFERENCE =3D "-1"
>> -
>> -SRC_URI[md5sum] =3D "e8a5fdbeba2927c948d9f477a6abe904"
>> -SRC_URI[sha256sum] =3D
>> "9392b74e485e15f75a3e07a527547d4f6747eaf55ebce71ba0e863a9fd320b6e"
>> diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb
>> b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb
>> new file mode 100644
>> index 0000000..e6162fc
>> --- /dev/null
>> +++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk_4.8.1.bb
>> @@ -0,0 +1,10 @@
>> +require qt4-tools-nativesdk.inc
>> +
>> +PR =3D "${INC_PR}.0"
>> +
>> +SRC_URI +=3D "file://qmake_pri_fixes.patch"
>> +
>> +DEFAULT_PREFERENCE =3D "-1"
>> +
>> +SRC_URI[md5sum] =3D "7960ba8e18ca31f0c6e4895a312f92ff"
>> +SRC_URI[sha256sum] =3D
>> "ef851a36aa41b4ad7a3e4c96ca27eaed2a629a6d2fa06c20f072118caed87ae8"
>> diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
>> b/meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb
>> similarity index 90%
>> rename from meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
>> rename to meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb
>> index 6a0b0b8..edd3e0e 100644
>> --- a/meta/recipes-qt/qt4/qt4-x11-free_4.8.0.bb
>> +++ b/meta/recipes-qt/qt4/qt4-x11-free_4.8.1.bb
>> @@ -1,7 +1,7 @@
>> =C2=A0require qt4-x11-free.inc
>> =C2=A0require qt-${PV}.inc
>>
>> -PR =3D "${INC_PR}.1"
>> +PR =3D "${INC_PR}.0"
>>
>> =C2=A0DEFAULT_PREFERENCE =3D "-1"
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

Hi Robert,
this question was already discussed before (see [1]), but then I came
up with the .bbappend (as I had to change other things too).
If you still wand to send a patch to the qt4.inc, it should be no
problem as the previous thread had no negative feedback.



[1] http://lists.linuxtogo.org/pipermail/openembedded-core/2012-February/01=
7792.html


--=20
Regards
Samuel


