Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RGiTD-0008IT-Lg
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 04:35:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9K2T68u010110
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Oct 2011 19:29:06 -0700 (PDT)
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 19 Oct 2011 19:29:06 -0700
Message-ID: <4E9F86FD.1030402@windriver.com>
Date: Thu, 20 Oct 2011 10:27:09 +0800
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
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p9K2T68u010110
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
X-List-Received-Date: Thu, 20 Oct 2011 02:35:00 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

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
I agree with your comment
>>
>> FILES_${PN}-dbg +=3D "\
>>                  ${libdir}/qmmp/*/.debug/* \
>>                 "
>>
> These should be picked up by the do_split_package above I believe
>
I will use do_split_package to split up them .
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
I will continue looking into them and push this bb file to OE-core after=20
modifying defects.
Thanks for your reply

Thanks
Yan
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



