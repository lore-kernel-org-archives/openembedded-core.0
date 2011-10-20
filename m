Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RGrCc-0002rW-KW
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 13:54:27 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9KBmVoL022181
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Oct 2011 04:48:31 -0700 (PDT)
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 20 Oct 2011 04:48:31 -0700
Message-ID: <4EA00A17.6090805@windriver.com>
Date: Thu, 20 Oct 2011 19:46:31 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: Saul Wold <saul.wold@intel.com>
References: <cover.1318904555.git.xiaofeng.yan@windriver.com>	<ff63f110f1f657a011c24f5c8cfb8e7328fae49a.1318904555.git.xiaofeng.yan@windriver.com>	<4E9D103B.10506@intel.com>
	<4E9D123F.6090102@windriver.com>
	<4E9EA6E7.9000409@windriver.com> <4E9F5AC2.9080905@intel.com>
In-Reply-To: <4E9F5AC2.9080905@intel.com>
X-Originating-IP: [128.224.162.146]
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 20 Oct 2011 11:54:27 -0000
Content-Type: multipart/alternative;
	boundary="------------060807030400090107010808"

--------------060807030400090107010808
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id p9KBmVoL022181

On 2011=E5=B9=B410=E6=9C=8820=E6=97=A5 07:18, Saul Wold wrote:
> On 10/19/2011 03:31 AM, Xiaofeng Yan wrote:
>> On 2011=E5=B9=B410=E6=9C=8818=E6=97=A5 13:44, Xiaofeng Yan wrote:
>>> On 2011=E5=B9=B410=E6=9C=8818=E6=97=A5 13:35, Saul Wold wrote:
>>>> On 10/17/2011 10:21 PM, Xiaofeng Yan wrote:
>>>>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>>>
>>>>> The new version of qmmp can run on core-image-sato by test.
>>>>> $qmmp *.mp3
>>>>>
>>>>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>>> ---
>>>>> meta/recipes-qt/qt-apps/qmmp_0.5.2.bb | 49
>>>>> +++++++++++++++++++++++++++++++++
>>>>> 1 files changed, 49 insertions(+), 0 deletions(-)
>>>>> create mode 100644 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
>>>>>
>>>>> diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
>>>>> b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
>>>>> new file mode 100644
>>>>> index 0000000..f31409b
>>>>> --- /dev/null
>>>>> +++ b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
>>>>> @@ -0,0 +1,49 @@
>>>>> +dESCRIPTION =3D "Qmmp (Qt-based Multimedia Player) is an
>>>>> audio-player, written with help of Qt library"
>>>>> +HOMEPAGE =3D "http://qmmp.ylsoftware.com"
>>>>> +LICENSE =3D "GPLv2"
>>>>> +LIC_FILES_CHKSUM =3D
>>>>> "file://COPYING;md5=3D393a5ca445f6965873eca0259a17f833"
>>>>> +SECTION =3D "multimedia"
>>>>> +
>>>>> +PR =3D "r3"
>>>>> +
>>>>> +PROVIDES =3D "qmmp"
>>>>> +DEPENDS =3D "qt4-x11-free taglib libmad libvorbis libogg alsa-lib"
>>>>> +RDEPENDS_${PN} +=3D "taglib alsa-lib libmad curl"
>>>>> +
>>>>> +SRC_URI =3D "http://qmmp.ylsoftware.com/files/${BPN}-${PV}.tar.bz2=
"
>>>>> +
>>>>> +SRC_URI[md5sum] =3D "20852f3cce3471bfc5affa9b2e947dc6"
>>>>> +SRC_URI[sha256sum] =3D
>>>>> "6391dec020d2a381d7f4b7890fae6c49eadf88b3c9aef571fe3c5e96140822ec"
>>>>> +
>>>>> +
>>>>> +PARALLEL_MAKE =3D ""
>>>>> +
>>>>> +inherit qmake2 cmake
>>>>> +
>>>>> +export EXTRA_OECMAKE =3D "-DQT_QMAKE_EXECUTABLE=3D${OE_QMAKE_QMAKE=
} \
>>>>> + -DQT_LRELEASE_EXECUTABLE=3D${OE_QMAKE_LRELEASE} \
>>>>> + -DQT_MOC_EXECUTABLE=3D${OE_QMAKE_MOC} \
>>>>> + -DQT_UIC_EXECUTABLE=3D${OE_QMAKE_UIC} \
>>>>> + -DQT_RCC_EXECUTABLE=3D${OE_QMAKE_RCC} \
>>>>> + -DQT_LIBRARY_DIR=3D${OE_QMAKE_LIBDIR_QT} \
>>>>> + -DQT_HEADERS_DIR=3D${OE_QMAKE_INCDIR_QT} \
>>>>> + -DQT_QTCORE_INCLUDE_DIR=3D${OE_QMAKE_INCDIR_QT}/QtCore \
>>>>> + "
>>>>> +
>>>>> +FILES_${PN} =3D+ "\
>>>>> + ${libdir}/qmmp/*/*.so \
>>>>> + ${datadir}/icons/* \
>>>>> + ${datadir}/qmmp/images/* \
>>>>> + ${datadir}/applications/qmmp.desktop \
>>>>> + "
>>>>> +
>>>> Xiaofeng,
>>>>
>>>> I was looking into this also, I think it would be better to split al=
l
>>>> the various plugins into separate packages using=20
>>>> do_split_packages(), in
>>>> the packages.bbclass.
>>>>
>>>> I started with this code:
>>>>> PACKAGES_DYNAMIC =3D "qmmp-plugin-*"
>>>>>
>>>>> python populate_packages_prepend () {
>>>>> qmmp_libdir =3D bb.data.expand('${libdir}/qmmp', d)
>>>>>
>>>>> do_split_packages(d, qmmp_libdir, '^(.*)/(.*)\.so$',
>>>>> 'qmmp-plugin-%s-%s', 'Qmmp %s Plugin for %s', extra_depends=3D'')
>>>>> }
>>>>
>>>> But have not completed it yet, if you have time to investigate
>>>> further and complete this correctly, there might be a problem with
>>>> using multiple Regular expressions in the do_split_packages code, bu=
t
>>>> I have not fully debugged this yet.
>>>>
>>>> Please let me know if you can complete this task.
>>>>
>> Hi saul,
>>
>> The following is my modification to qmmp_0.5.2.bb. Please review it.
>> I want to get a reply about how to ship files in ${datadir} for qmmp. =
I
>> shipped them to FILES_${PN} because qmmp need these files when startin=
g
>> up. Do you think that they should be packaged like qmmp-plugin-* ?
>>
>> Please give me your suggestion and I will modify this file.
>>
>>
>> PACKAGES_DYNAMIC +=3D "qmmp-plugin-*"
>>
>>
>> python populate_packages_prepend () {
>>          qmmp_libdir =3D bb.data.expand('${libdir}/qmmp', d)
>>          do_split_packages(d, qmmp_libdir, '^lib(.*)\.so$',
>> 'qmmp-plugin-%s', 'Qmmp %s Plugin for', recursive=3DTrue,extra_depends=
=3D'')
>> }
>>
> Ah, I see you added the recursive flag, I was trying to capture the=20
> plugin group (Input, Ouput, Effect, ...) in the package name incase=20
> there was name conflict, also to match the mad and vorbis naming below.
>
> If using multiple RE expressions in the re match does not work, then=20
> we should make do_split_package for each grouping and name them correct=
ly
> qmmp-plugin-<group>-<library>  with the Description: Qmmp <Group>=20
> plugin for %s"
>

Hi Saul,

I find .debug can't be packaged to rpm package because it is invisible=20
directory. In current OE-core .debug was shipped to FILES_${PN}-dbg, for=20
example , gtk+ ,qt4-x11-free
If we want to split up .debug/* to single package, we can rename .debug=20
to debug to make this directory visible, then debug directory can be=20
split up to single package.
Please review the following two mode.

_Mode 1: Ship  .debug to   FILES_${PN}-dbg_

PACKAGES_DYNAMIC =3D "qmmp-plugin-* "


python populate_packages_prepend () {
         import os
         qmmp_libdir =3D bb.data.expand('${libdir}/qmmp', d)
         gd =3D bb.data.expand('${D}/${libdir}/qmmp', d)
         plug_dirs =3D os.listdir(gd)
/# for makeing  do_split_package for each grouping and name them correctl=
y
# qmmp-plugin-<group>-<library>  with the Description: Qmmp <Group>=20
plugin for %s"
# I use the following method./
         for plug_dir in plug_dirs:
                 g_plug_dir =3D os.path.join(qmmp_libdir,plug_dir)
                 do_split_packages(d, g_plug_dir, '^lib(.*)\.so$',=20
'qmmp-plugin-' + plug_dir + '-%s', 'Qmmp' + plug_dir  + 'plugin for %s')



}

/# if I don't point files to ship file to ${PN}, then FILE_${PN} will=20
get files in usr/lib/qmmp and qmmp-plug-* will not get files. /
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
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
_
Mode 2: Split up  .debug to sub-packages_

PACKAGES_DYNAMIC =3D "qmmp-plugin-* qmmp-debug-plugin-*"


python populate_packages_prepend () {
         import os
         qmmp_libdir =3D bb.data.expand('${libdir}/qmmp', d)
         qmmp_pkgd =3D bb.data.expand('${WORKDIR}/package/${libdir}/qmmp'=
, d)
         gd =3D bb.data.expand('${D}/${libdir}/qmmp', d)
         plug_dirs =3D os.listdir(gd)

         for plug_dir in plug_dirs:
/#rename .debug to debug/
                 if os.path.exists( qmmp_pkgd + '/'  + plug_dir +=20
'/.debug'):
                         os.rename(qmmp_pkgd + '/' + plug_dir +=20
'/.debug',qmmp_pkgd + '/' + plug_dir + '/debug')
                 g_plug_dir =3D os.path.join(qmmp_libdir,plug_dir)
                 do_split_packages(d, g_plug_dir, '^lib(.*)\.so$',=20
'qmmp-plugin-' + plug_dir + '-%s', 'Qmmp' + plug_dir  + 'plugin for %s')
/#split up .debug to sub-packages/
                 g_plug_debug_dir =3D os.path.join(g_plug_dir,'debug')
                 do_split_packages(d, g_plug_debug_dir, '^lib(.*)\.so$',=20
'qmmp-debug-plugin-' + plug_dir + '-%s', 'Qmmp' + plug_dir  + 'plugin=20
debug for %s')
}
/
# if I don't point files to ship file to ${PN}, then FILE_${PN} will get=20
files in usr/lib/qmmp and qmmp-plug-* will not get files./ /I check gtk+=20
and qt4-x11-free and find that they adopt the following method without=20
using default mode./
FILES_${PN} =3D "\
                 ${bindir}/qmmp \
                 ${libdir}/lib*${SOLIBS} \
                 ${datadir}/icons/* \
                 ${datadir}/qmmp/images/* \
                 ${datadir}/applications/* \
                 "

Do you have any comment for above code.  If have, I will continue=20
looking into modification method according to your suggestion. Do you=20
think we should select which method?

Thanks
Yan

>> FILES_${PN} =3D "\
> I think this should be a +=3D
>>                  ${bindir}/qmmp \
>>                  ${libdir}/lib*${SOLIBS} \
> These 2 should go away (part of default FILES_${PN}
>>                  ${datadir}/icons/* \
>>                  ${datadir}/qmmp/images/* \
>>                  ${datadir}/applications/* \
>>                  "
> There are added via the +=3D above.
>
>>
>> FILES_${PN}-dbg +=3D "\
>>                  ${libdir}/qmmp/*/.debug/* \
>>                 "
>>
> These should be picked up by the do_split_package above I believe
>
>> PACKAGES +=3D "${PN}-plugin-input-mad ${PN}-plugin-input-vorbis "
>>
>> FILES_${PN}-plugin-input-mad =3D "${libdir}/qmmp/Input/libmad.so"
>> RDEPENDS_${PN}-plugin-input-mad =3D "libmad"
>> FILES_${PN}-plugin-input-vorbis =3D "${libdir}/qmmp/Input/libvorbis.so=
"
>> RDEPENDS_${PN}-plugin-input-vorbis =3D "libvorbis libogg"
>>
> Ideally the above PACKAGES and FILES_ go away and the default actions=20
> take over.
>
> Thanks for looking into this.
>
> Sau!
>
>>
>>
>> Thanks
>> Yan
>>> Thanks for your reply and I will investigate it according to your
>>> suggestion.
>>>
>>> Thanks
>>> Yan
>>>> Thanks
>>>> Sau!
>>>>
>>>>
>>>>> +FILES_${PN}-dbg +=3D "\
>>>>> + ${libdir}/qmmp/*/.debug/* \
>>>>> + "
>>>>> +
>>>>> +PACKAGES +=3D "${PN}-plugin-input-mad ${PN}-plugin-input-vorbis"
>>>>> +
>>>>> +FILES_${PN}-plugin-input-mad =3D "${libdir}/qmmp/Input/libmad.so"
>>>>> +RDEPENDS_${PN}-plugin-input-mad =3D "libmad"
>>>>> +FILES_${PN}-plugin-input-vorbis =3D=20
>>>>> "${libdir}/qmmp/Input/libvorbis.so"
>>>>> +RDEPENDS_${PN}-plugin-input-vorbis =3D "libvorbis libogg"
>>>>
>>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


--------------060807030400090107010808
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id p9KBmVoL022181

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content=3D"text/html; charset=3DUTF-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body text=3D"#000000" bgcolor=3D"#ffffff">
    On 2011=E5=B9=B410=E6=9C=8820=E6=97=A5 07:18, Saul Wold wrote:
    <blockquote cite=3D"mid:4E9F5AC2.9080905@intel.com" type=3D"cite">On
      10/19/2011 03:31 AM, Xiaofeng Yan wrote:
      <br>
      <blockquote type=3D"cite">On 2011=E5=B9=B410=E6=9C=8818=E6=97=A5 13=
:44, Xiaofeng Yan wrote:
        <br>
        <blockquote type=3D"cite">On 2011=E5=B9=B410=E6=9C=8818=E6=97=A5 =
13:35, Saul Wold wrote:
          <br>
          <blockquote type=3D"cite">On 10/17/2011 10:21 PM, Xiaofeng Yan
            wrote:
            <br>
            <blockquote type=3D"cite">From: Xiaofeng
              Yan<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:xiaofe=
ng.yan@windriver.com">&lt;xiaofeng.yan@windriver.com&gt;</a>
              <br>
              <br>
              The new version of qmmp can run on core-image-sato by
              test.
              <br>
              $qmmp *.mp3
              <br>
              <br>
              Signed-off-by: Xiaofeng
              Yan<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:xiaofe=
ng.yan@windriver.com">&lt;xiaofeng.yan@windriver.com&gt;</a>
              <br>
              ---
              <br>
              meta/recipes-qt/qt-apps/qmmp_0.5.2.bb | 49
              <br>
              +++++++++++++++++++++++++++++++++
              <br>
              1 files changed, 49 insertions(+), 0 deletions(-)
              <br>
              create mode 100644 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
              <br>
              <br>
              diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
              <br>
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
              <br>
              audio-player, written with help of Qt library"
              <br>
              +HOMEPAGE =3D <a class=3D"moz-txt-link-rfc2396E" href=3D"ht=
tp://qmmp.ylsoftware.com">"http://qmmp.ylsoftware.com"</a>
              <br>
              +LICENSE =3D "GPLv2"
              <br>
              +LIC_FILES_CHKSUM =3D
              <br>
              <a class=3D"moz-txt-link-rfc2396E" href=3D"file://COPYING;m=
d5=3D393a5ca445f6965873eca0259a17f833">"file://COPYING;md5=3D393a5ca445f6=
965873eca0259a17f833"</a>
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
              <a class=3D"moz-txt-link-rfc2396E" href=3D"http://qmmp.ylso=
ftware.com/files/${BPN}-${PV}.tar.bz2">"http://qmmp.ylsoftware.com/files/=
${BPN}-${PV}.tar.bz2"</a>
              <br>
              +
              <br>
              +SRC_URI[md5sum] =3D "20852f3cce3471bfc5affa9b2e947dc6"
              <br>
              +SRC_URI[sha256sum] =3D
              <br>
"6391dec020d2a381d7f4b7890fae6c49eadf88b3c9aef571fe3c5e96140822ec"
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
            split all
            <br>
            the various plugins into separate packages using
            do_split_packages(), in
            <br>
            the packages.bbclass.
            <br>
            <br>
            I started with this code:
            <br>
            <blockquote type=3D"cite">PACKAGES_DYNAMIC =3D "qmmp-plugin-*=
"
              <br>
              <br>
              python populate_packages_prepend () {
              <br>
              qmmp_libdir =3D bb.data.expand('${libdir}/qmmp', d)
              <br>
              <br>
              do_split_packages(d, qmmp_libdir, '^(.*)/(.*)\.so$',
              <br>
              'qmmp-plugin-%s-%s', 'Qmmp %s Plugin for %s',
              extra_depends=3D'')
              <br>
              }
              <br>
            </blockquote>
            <br>
            But have not completed it yet, if you have time to
            investigate
            <br>
            further and complete this correctly, there might be a
            problem with
            <br>
            using multiple Regular expressions in the do_split_packages
            code, but
            <br>
            I have not fully debugged this yet.
            <br>
            <br>
            Please let me know if you can complete this task.
            <br>
            <br>
          </blockquote>
        </blockquote>
        Hi saul,
        <br>
        <br>
        The following is my modification to qmmp_0.5.2.bb. Please review
        it.
        <br>
        I want to get a reply about how to ship files in ${datadir} for
        qmmp. I
        <br>
        shipped them to FILES_${PN} because qmmp need these files when
        starting
        <br>
        up. Do you think that they should be packaged like qmmp-plugin-*
        ?
        <br>
        <br>
        Please give me your suggestion and I will modify this file.
        <br>
        <br>
        <br>
        PACKAGES_DYNAMIC +=3D "qmmp-plugin-*"
        <br>
        <br>
        <br>
        python populate_packages_prepend () {
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qmmp_libdir =3D =
bb.data.expand('${libdir}/qmmp', d)
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do_split_package=
s(d, qmmp_libdir, '^lib(.*)\.so$',
        <br>
        'qmmp-plugin-%s', 'Qmmp %s Plugin for',
        recursive=3DTrue,extra_depends=3D'')
        <br>
        }
        <br>
        <br>
      </blockquote>
      Ah, I see you added the recursive flag, I was trying to capture
      the plugin group (Input, Ouput, Effect, ...) in the package name
      incase there was name conflict, also to match the mad and vorbis
      naming below.
      <br>
      <br>
      If using multiple RE expressions in the re match does not work,
      then we should make do_split_package for each grouping and name
      them correctly
      <br>
      qmmp-plugin-&lt;group&gt;-&lt;library&gt;=C2=A0 with the Descriptio=
n:
      Qmmp &lt;Group&gt; plugin for %s"
      <br>
      <br>
    </blockquote>
    <br>
    Hi Saul,<br>
    <br>
    I find .debug can't be packaged to rpm package because it is
    invisible directory. In current OE-core .debug was shipped to
    FILES_${PN}-dbg, for example , gtk+ ,qt4-x11-free<br>
    If we want to split up .debug/* to single package, we can rename
    .debug to debug to make this directory visible, then debug directory
    can be split up to single package.<br>
    Please review the following two mode. <br>
    <br>
    <font color=3D"#330033"><u>Mode 1: Ship=C2=A0 .debug to =C2=A0 FILES_=
${PN}-dbg</u></font><br>
    <br>
    PACKAGES_DYNAMIC =3D "qmmp-plugin-* "<br>
    <br>
    <br>
    python populate_packages_prepend () {<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 import os<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qmmp_libdir =3D bb.data.ex=
pand('${libdir}/qmmp', d)<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gd =3D bb.data.expand('${D=
}/${libdir}/qmmp', d)<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 plug_dirs =3D os.listdir(g=
d)<br>
    <font color=3D"#3333ff"><i># for makeing=C2=A0 do_split_package for e=
ach
        grouping and name them correctly <br>
        # qmmp-plugin-&lt;group&gt;-&lt;library&gt;=C2=A0 with the
        Description: Qmmp &lt;Group&gt; plugin for %s"<br>
        # I use the following method.</i></font> <br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for plug_dir in plug_dirs:=
<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 g_plug_dir =3D os.path.join(qmmp_libdir,plug_dir)<b=
r>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 do_split_packages(d, g_plug_dir, '^lib(.*)\.so$',
    'qmmp-plugin-' + plug_dir + '-%s', 'Qmmp' + plug_dir=C2=A0 + 'plugin =
for
    %s')<br>
    <br>
    <br>
    <br>
    }<br>
    <br>
    <i><font color=3D"#3333ff"># if I don't point files to ship file to
        ${PN}, then FILE_${PN} will get files in usr/lib/qmmp and
        qmmp-plug-* will not get files.</font> </i><br>
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
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D<br>
    <u><font color=3D"#330033"><br>
        Mode 2: Split up=C2=A0 .debug to sub-packages</font></u><br>
    <br>
    PACKAGES_DYNAMIC =3D "qmmp-plugin-* qmmp-debug-plugin-*"<br>
    <br>
    <br>
    python populate_packages_prepend () {<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 import os<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qmmp_libdir =3D bb.data.ex=
pand('${libdir}/qmmp', d)<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 qmmp_pkgd =3D
    bb.data.expand('${WORKDIR}/package/${libdir}/qmmp', d)<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gd =3D bb.data.expand('${D=
}/${libdir}/qmmp', d)<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 plug_dirs =3D os.listdir(g=
d)<br>
    <br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for plug_dir in plug_dirs:=
<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 <i><font color=3D"#3333ff">#rename .debug to debug<=
/font></i><br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if os.path.exists( qmmp_pkgd + '/'=C2=A0 + plug_dir=
 +
    '/.debug'):<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 os.=
rename(qmmp_pkgd + '/' + plug_dir +
    '/.debug',qmmp_pkgd + '/' + plug_dir + '/debug')<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 g_plug_dir =3D os.path.join(qmmp_libdir,plug_dir)<b=
r>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 do_split_packages(d, g_plug_dir, '^lib(.*)\.so$',
    'qmmp-plugin-' + plug_dir + '-%s', 'Qmmp' + plug_dir=C2=A0 + 'plugin =
for
    %s')<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0<i><font color=3D"#3333ff"> #split up .debug to
        sub-packages</font></i><br>
    =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 g_plug_debug_dir =3D os.path.join(g_plug_dir,'debug')<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 do_split_packages(d, g_plug_debug_dir,
    '^lib(.*)\.so$', 'qmmp-debug-plugin-' + plug_dir + '-%s', 'Qmmp' +
    plug_dir=C2=A0 + 'plugin debug for %s')<br>
    }<br>
    <i><font color=3D"#3333ff"><br>
        # if I don't point files to ship file to ${PN}, then FILE_${PN}
        will get files in usr/lib/qmmp and qmmp-plug-* will not get
        files.</font></i> =C2=A0<i><font color=3D"#3333ff"> I check gtk+ =
and
        qt4-x11-free and find that they adopt the following method
        without using default mode.</font></i><br>
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
    Do you have any comment for above code.=C2=A0 If have, I will continu=
e
    looking into modification method according to your suggestion. Do
    you think we should select which method?=C2=A0 <br>
    <br>
    Thanks<br>
    Yan<br>
    <br>
    <blockquote cite=3D"mid:4E9F5AC2.9080905@intel.com" type=3D"cite">
      <blockquote type=3D"cite">FILES_${PN} =3D "\
        <br>
      </blockquote>
      I think this should be a +=3D
      <br>
      <blockquote type=3D"cite">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${bindir}/qmmp \
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${libdir}/lib*${SOLIBS} \
        <br>
      </blockquote>
      These 2 should go away (part of default FILES_${PN}
      <br>
      <blockquote type=3D"cite">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${datadir}/icons/*=
 \
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${datadir}/qmmp/images/* \
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${datadir}/applications/* \
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
        <br>
      </blockquote>
      There are added via the +=3D above.
      <br>
      <br>
      <blockquote type=3D"cite">
        <br>
        FILES_${PN}-dbg +=3D "\
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${libdir}/qmmp/*/.debug/* \
        <br>
        =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 "
        <br>
        <br>
      </blockquote>
      These should be picked up by the do_split_package above I believe
      <br>
      <br>
      <blockquote type=3D"cite">PACKAGES +=3D "${PN}-plugin-input-mad
        ${PN}-plugin-input-vorbis "
        <br>
        <br>
        FILES_${PN}-plugin-input-mad =3D "${libdir}/qmmp/Input/libmad.so"
        <br>
        RDEPENDS_${PN}-plugin-input-mad =3D "libmad"
        <br>
        FILES_${PN}-plugin-input-vorbis =3D
        "${libdir}/qmmp/Input/libvorbis.so"
        <br>
        RDEPENDS_${PN}-plugin-input-vorbis =3D "libvorbis libogg"
        <br>
        <br>
      </blockquote>
      Ideally the above PACKAGES and FILES_ go away and the default
      actions take over.
      <br>
      <br>
      Thanks for looking into this.
      <br>
      <br>
      Sau!
      <br>
      <br>
      <blockquote type=3D"cite">
        <br>
        <br>
        Thanks
        <br>
        Yan
        <br>
        <blockquote type=3D"cite">Thanks for your reply and I will
          investigate it according to your
          <br>
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
          <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Openembedd=
ed-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org<=
/a>
          <br>
<a class=3D"moz-txt-link-freetext" href=3D"http://lists.linuxtogo.org/cgi=
-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-b=
in/mailman/listinfo/openembedded-core</a>
          <br>
        </blockquote>
        <br>
        <br>
        <br>
        _______________________________________________
        <br>
        Openembedded-core mailing list
        <br>
        <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:Openembedded=
-core@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a=
>
        <br>
<a class=3D"moz-txt-link-freetext" href=3D"http://lists.linuxtogo.org/cgi=
-bin/mailman/listinfo/openembedded-core">http://lists.linuxtogo.org/cgi-b=
in/mailman/listinfo/openembedded-core</a>
        <br>
      </blockquote>
      <br>
      <br>
    </blockquote>
    <br>
  </body>
</html>

--------------060807030400090107010808--
