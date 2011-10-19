Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RGTXp-0004uK-GU
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 12:38:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9JAWrwB027491
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2011 03:32:54 -0700 (PDT)
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 19 Oct 2011 03:32:53 -0700
Message-ID: <4E9EA6E7.9000409@windriver.com>
Date: Wed, 19 Oct 2011 18:31:03 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1318904555.git.xiaofeng.yan@windriver.com>	<ff63f110f1f657a011c24f5c8cfb8e7328fae49a.1318904555.git.xiaofeng.yan@windriver.com>	<4E9D103B.10506@intel.com>
	<4E9D123F.6090102@windriver.com>
In-Reply-To: <4E9D123F.6090102@windriver.com>
X-Originating-IP: [128.224.162.146]
Subject: Re: [PATCH 1/2] qmmp: update to 0.5.2
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
X-List-Received-Date: Wed, 19 Oct 2011 10:38:46 -0000
Content-Type: multipart/alternative;
	boundary="------------070105020008080600060406"

--------------070105020008080600060406
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id p9JAWrwB027491

On 2011=E5=B9=B410=E6=9C=8818=E6=97=A5 13:44, Xiaofeng Yan wrote:
> On 2011=E5=B9=B410=E6=9C=8818=E6=97=A5 13:35, Saul Wold wrote:
>> On 10/17/2011 10:21 PM, Xiaofeng Yan wrote:
>>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>
>>> The new version of qmmp can run on core-image-sato by test.
>>> $qmmp *.mp3
>>>
>>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>> ---
>>> meta/recipes-qt/qt-apps/qmmp_0.5.2.bb | 49=20
>>> +++++++++++++++++++++++++++++++++
>>> 1 files changed, 49 insertions(+), 0 deletions(-)
>>> create mode 100644 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
>>>
>>> diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb=20
>>> b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
>>> new file mode 100644
>>> index 0000000..f31409b
>>> --- /dev/null
>>> +++ b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
>>> @@ -0,0 +1,49 @@
>>> +dESCRIPTION =3D "Qmmp (Qt-based Multimedia Player) is an=20
>>> audio-player, written with help of Qt library"
>>> +HOMEPAGE =3D "http://qmmp.ylsoftware.com"
>>> +LICENSE =3D "GPLv2"
>>> +LIC_FILES_CHKSUM =3D=20
>>> "file://COPYING;md5=3D393a5ca445f6965873eca0259a17f833"
>>> +SECTION =3D "multimedia"
>>> +
>>> +PR =3D "r3"
>>> +
>>> +PROVIDES =3D "qmmp"
>>> +DEPENDS =3D "qt4-x11-free taglib libmad libvorbis libogg alsa-lib"
>>> +RDEPENDS_${PN} +=3D "taglib alsa-lib libmad curl"
>>> +
>>> +SRC_URI =3D "http://qmmp.ylsoftware.com/files/${BPN}-${PV}.tar.bz2"
>>> +
>>> +SRC_URI[md5sum] =3D "20852f3cce3471bfc5affa9b2e947dc6"
>>> +SRC_URI[sha256sum] =3D=20
>>> "6391dec020d2a381d7f4b7890fae6c49eadf88b3c9aef571fe3c5e96140822ec"
>>> +
>>> +
>>> +PARALLEL_MAKE =3D ""
>>> +
>>> +inherit qmake2 cmake
>>> +
>>> +export EXTRA_OECMAKE =3D "-DQT_QMAKE_EXECUTABLE=3D${OE_QMAKE_QMAKE} =
\
>>> + -DQT_LRELEASE_EXECUTABLE=3D${OE_QMAKE_LRELEASE} \
>>> + -DQT_MOC_EXECUTABLE=3D${OE_QMAKE_MOC} \
>>> + -DQT_UIC_EXECUTABLE=3D${OE_QMAKE_UIC} \
>>> + -DQT_RCC_EXECUTABLE=3D${OE_QMAKE_RCC} \
>>> + -DQT_LIBRARY_DIR=3D${OE_QMAKE_LIBDIR_QT} \
>>> + -DQT_HEADERS_DIR=3D${OE_QMAKE_INCDIR_QT} \
>>> + -DQT_QTCORE_INCLUDE_DIR=3D${OE_QMAKE_INCDIR_QT}/QtCore \
>>> + "
>>> +
>>> +FILES_${PN} =3D+ "\
>>> + ${libdir}/qmmp/*/*.so \
>>> + ${datadir}/icons/* \
>>> + ${datadir}/qmmp/images/* \
>>> + ${datadir}/applications/qmmp.desktop \
>>> + "
>>> +
>> Xiaofeng,
>>
>> I was looking into this also, I think it would be better to split all=20
>> the various plugins into separate packages using do_split_packages(), =
in
>> the packages.bbclass.
>>
>> I started with this code:
>>> PACKAGES_DYNAMIC =3D "qmmp-plugin-*"
>>>
>>> python populate_packages_prepend () {
>>> qmmp_libdir =3D bb.data.expand('${libdir}/qmmp', d)
>>>
>>> do_split_packages(d, qmmp_libdir, '^(.*)/(.*)\.so$',=20
>>> 'qmmp-plugin-%s-%s', 'Qmmp %s Plugin for %s', extra_depends=3D'')
>>> }
>>
>> But have not completed it yet, if you have time to investigate=20
>> further and complete this correctly, there might be a problem with=20
>> using multiple Regular expressions in the do_split_packages code, but=20
>> I have not fully debugged this yet.
>>
>> Please let me know if you can complete this task.
>>
Hi saul,

The following is my modification to qmmp_0.5.2.bb. Please review it.
I want to get a reply about how to ship files in ${datadir} for qmmp. I=20
shipped them to FILES_${PN} because qmmp need these files when starting=20
up. Do you think that they should be packaged like qmmp-plugin-* ?

Please give me your suggestion and I will modify this file.


PACKAGES_DYNAMIC +=3D "qmmp-plugin-*"


python populate_packages_prepend () {
         qmmp_libdir =3D bb.data.expand('${libdir}/qmmp', d)
         do_split_packages(d, qmmp_libdir, '^lib(.*)\.so$',=20
'qmmp-plugin-%s', 'Qmmp %s Plugin for', recursive=3DTrue,extra_depends=3D=
'')
}

FILES_${PN} =3D "\
                 ${bindir}/qmmp \
                 ${libdir}/lib*${SOLIBS} \
                 ${datadir}/icons/* \
                 ${datadir}/qmmp/images/* \
                 ${datadir}/applications/* \
                 "

FILES_${PN}-dbg +=3D "\
                 ${libdir}/qmmp/*/.debug/* \
                "

PACKAGES +=3D "${PN}-plugin-input-mad ${PN}-plugin-input-vorbis "

FILES_${PN}-plugin-input-mad =3D "${libdir}/qmmp/Input/libmad.so"
RDEPENDS_${PN}-plugin-input-mad =3D "libmad"
FILES_${PN}-plugin-input-vorbis =3D "${libdir}/qmmp/Input/libvorbis.so"
RDEPENDS_${PN}-plugin-input-vorbis =3D "libvorbis libogg"



Thanks
Yan
> Thanks for your reply and I will investigate it according to your=20
> suggestion.
>
> Thanks
> Yan
>> Thanks
>> Sau!
>>
>>
>>> +FILES_${PN}-dbg +=3D "\
>>> + ${libdir}/qmmp/*/.debug/* \
>>> + "
>>> +
>>> +PACKAGES +=3D "${PN}-plugin-input-mad ${PN}-plugin-input-vorbis"
>>> +
>>> +FILES_${PN}-plugin-input-mad =3D "${libdir}/qmmp/Input/libmad.so"
>>> +RDEPENDS_${PN}-plugin-input-mad =3D "libmad"
>>> +FILES_${PN}-plugin-input-vorbis =3D "${libdir}/qmmp/Input/libvorbis.=
so"
>>> +RDEPENDS_${PN}-plugin-input-vorbis =3D "libvorbis libogg"
>>
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--------------070105020008080600060406
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id p9JAWrwB027491

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content=3D"text/html; charset=3DUTF-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body text=3D"#000000" bgcolor=3D"#ffffff">
    On 2011=E5=B9=B410=E6=9C=8818=E6=97=A5 13:44, Xiaofeng Yan wrote:
    <blockquote cite=3D"mid:4E9D123F.6090102@windriver.com" type=3D"cite"=
>On
      2011=E5=B9=B410=E6=9C=8818=E6=97=A5 13:35, Saul Wold wrote:
      <br>
      <blockquote type=3D"cite">On 10/17/2011 10:21 PM, Xiaofeng Yan
        wrote:
        <br>
        <blockquote type=3D"cite">From: Xiaofeng
          Yan<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:xiaofeng.y=
an@windriver.com">&lt;xiaofeng.yan@windriver.com&gt;</a>
          <br>
          <br>
          The new version of qmmp can run on core-image-sato by test.
          <br>
          $qmmp *.mp3
          <br>
          <br>
          Signed-off-by: Xiaofeng Yan<a class=3D"moz-txt-link-rfc2396E" h=
ref=3D"mailto:xiaofeng.yan@windriver.com">&lt;xiaofeng.yan@windriver.com&=
gt;</a>
          <br>
          ---
          <br>
          meta/recipes-qt/qt-apps/qmmp_0.5.2.bb | 49
          +++++++++++++++++++++++++++++++++
          <br>
          1 files changed, 49 insertions(+), 0 deletions(-)
          <br>
          create mode 100644 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
          <br>
          <br>
          diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
          b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
          <br>
          new file mode 100644
          <br>
          index 0000000..f31409b
          <br>
          --- /dev/null
          <br>
          +++ b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
          <br>
          @@ -0,0 +1,49 @@
          <br>
          +dESCRIPTION =3D "Qmmp (Qt-based Multimedia Player) is an
          audio-player, written with help of Qt library"
          <br>
          +HOMEPAGE =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"http:/=
/qmmp.ylsoftware.com">"http://qmmp.ylsoftware.com"</a>
          <br>
          +LICENSE =3D "GPLv2"
          <br>
          +LIC_FILES_CHKSUM =3D
          <a class=3D"moz-txt-link-rfc2396E" href=3D"file://COPYING;md5=3D=
393a5ca445f6965873eca0259a17f833">"file://COPYING;md5=3D393a5ca445f696587=
3eca0259a17f833"</a>
          <br>
          +SECTION =3D "multimedia"
          <br>
          +
          <br>
          +PR =3D "r3"
          <br>
          +
          <br>
          +PROVIDES =3D "qmmp"
          <br>
          +DEPENDS =3D "qt4-x11-free taglib libmad libvorbis libogg
          alsa-lib"
          <br>
          +RDEPENDS_${PN} +=3D "taglib alsa-lib libmad curl"
          <br>
          +
          <br>
          +SRC_URI =3D
          <a class=3D"moz-txt-link-rfc2396E" href=3D"http://qmmp.ylsoftwa=
re.com/files/${BPN}-${PV}.tar.bz2">"http://qmmp.ylsoftware.com/files/${BP=
N}-${PV}.tar.bz2"</a>
          <br>
          +
          <br>
          +SRC_URI[md5sum] =3D "20852f3cce3471bfc5affa9b2e947dc6"
          <br>
          +SRC_URI[sha256sum] =3D
          "6391dec020d2a381d7f4b7890fae6c49eadf88b3c9aef571fe3c5e96140822=
ec"
          <br>
          +
          <br>
          +
          <br>
          +PARALLEL_MAKE =3D ""
          <br>
          +
          <br>
          +inherit qmake2 cmake
          <br>
          +
          <br>
          +export EXTRA_OECMAKE =3D
          "-DQT_QMAKE_EXECUTABLE=3D${OE_QMAKE_QMAKE} \
          <br>
          + -DQT_LRELEASE_EXECUTABLE=3D${OE_QMAKE_LRELEASE} \
          <br>
          + -DQT_MOC_EXECUTABLE=3D${OE_QMAKE_MOC} \
          <br>
          + -DQT_UIC_EXECUTABLE=3D${OE_QMAKE_UIC} \
          <br>
          + -DQT_RCC_EXECUTABLE=3D${OE_QMAKE_RCC} \
          <br>
          + -DQT_LIBRARY_DIR=3D${OE_QMAKE_LIBDIR_QT} \
          <br>
          + -DQT_HEADERS_DIR=3D${OE_QMAKE_INCDIR_QT} \
          <br>
          + -DQT_QTCORE_INCLUDE_DIR=3D${OE_QMAKE_INCDIR_QT}/QtCore \
          <br>
          + "
          <br>
          +
          <br>
          +FILES_${PN} =3D+ "\
          <br>
          + ${libdir}/qmmp/*/*.so \
          <br>
          + ${datadir}/icons/* \
          <br>
          + ${datadir}/qmmp/images/* \
          <br>
          + ${datadir}/applications/qmmp.desktop \
          <br>
          + "
          <br>
          +
          <br>
        </blockquote>
        Xiaofeng,
        <br>
        <br>
        I was looking into this also, I think it would be better to
        split all the various plugins into separate packages using
        do_split_packages(), in
        <br>
        the packages.bbclass.
        <br>
        <br>
        I started with this code:
        <br>
        <blockquote type=3D"cite">PACKAGES_DYNAMIC =3D "qmmp-plugin-*"
          <br>
          <br>
          python populate_packages_prepend () {
          <br>
          qmmp_libdir =3D bb.data.expand('${libdir}/qmmp', d)
          <br>
          <br>
          do_split_packages(d, qmmp_libdir, '^(.*)/(.*)\.so$',
          'qmmp-plugin-%s-%s', 'Qmmp %s Plugin for %s',
          extra_depends=3D'')
          <br>
          }
          <br>
        </blockquote>
        <br>
        But have not completed it yet, if you have time to investigate
        further and complete this correctly, there might be a problem
        with using multiple Regular expressions in the do_split_packages
        code, but I have not fully debugged this yet.
        <br>
        <br>
        Please let me know if you can complete this task.
        <br>
        <br>
      </blockquote>
    </blockquote>
    Hi saul,<br>
    <br>
    The following is my modification to qmmp_0.5.2.bb. Please review it.<=
br>
    I want to get a reply about how to ship files in ${datadir} for
    qmmp. I shipped them to FILES_${PN} because qmmp need these files
    when starting up. Do you think that they should be packaged like
    qmmp-plugin-* ?<br>
    <br>
    Please give me your suggestion and I will modify this file.<br>
    <small><br>
      <br>
      PACKAGES_DYNAMIC +=3D "qmmp-plugin-*"<br>
      <br>
      <br>
      python populate_packages_prepend () {<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qmmp_libdir =3D bb.data.=
expand('${libdir}/qmmp', d)<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do_split_packages(d, qmm=
p_libdir, '^lib(.*)\.so$',
      'qmmp-plugin-%s', 'Qmmp %s Plugin for',
      recursive=3DTrue,extra_depends=3D'')<br>
      }<br>
      <br>
      FILES_${PN} =3D "\<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ${bindir}/qmmp \<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ${libdir}/lib*${SOLIBS} \<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ${datadir}/icons/* \<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ${datadir}/qmmp/images/* \<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ${datadir}/applications/* \<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "<br>
      <br>
      FILES_${PN}-dbg +=3D "\<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ${libdir}/qmmp/*/.debug/* \<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 "<br>
      <br>
      PACKAGES +=3D "${PN}-plugin-input-mad ${PN}-plugin-input-vorbis "<b=
r>
      <br>
      FILES_${PN}-plugin-input-mad =3D "${libdir}/qmmp/Input/libmad.so"<b=
r>
      RDEPENDS_${PN}-plugin-input-mad =3D "libmad"<br>
      FILES_${PN}-plugin-input-vorbis =3D
      "${libdir}/qmmp/Input/libvorbis.so"<br>
      RDEPENDS_${PN}-plugin-input-vorbis =3D "libvorbis libogg"</small><b=
r>
    <br>
    <br>
    <br>
    Thanks<br>
    Yan<br>
    <blockquote cite=3D"mid:4E9D123F.6090102@windriver.com" type=3D"cite"=
>Thanks
      for your reply and I will investigate it according to your
      suggestion.
      <br>
      <br>
      Thanks
      <br>
      Yan
      <br>
      <blockquote type=3D"cite">Thanks
        <br>
        Sau!
        <br>
        <br>
        <br>
        <blockquote type=3D"cite">+FILES_${PN}-dbg +=3D "\
          <br>
          + ${libdir}/qmmp/*/.debug/* \
          <br>
          + "
          <br>
          +
          <br>
          +PACKAGES +=3D "${PN}-plugin-input-mad
          ${PN}-plugin-input-vorbis"
          <br>
          +
          <br>
          +FILES_${PN}-plugin-input-mad =3D
          "${libdir}/qmmp/Input/libmad.so"
          <br>
          +RDEPENDS_${PN}-plugin-input-mad =3D "libmad"
          <br>
          +FILES_${PN}-plugin-input-vorbis =3D
          "${libdir}/qmmp/Input/libvorbis.so"
          <br>
          +RDEPENDS_${PN}-plugin-input-vorbis =3D "libvorbis libogg"
          <br>
        </blockquote>
        <br>
        <br>
      </blockquote>
      <br>
      <br>
      _______________________________________________
      <br>
      Openembedded-core mailing list
      <br>
      <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Openembedded-c=
ore@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a>
      <br>
<a class=3D"moz-txt-link-freetext" href=3D"http://lists.linuxtogo.org/cgi=
-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-b=
in/mailman/listinfo/openembedded-core</a>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------070105020008080600060406--
