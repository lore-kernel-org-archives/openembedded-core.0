Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RG2an-0003AA-C0
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 07:52:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9I5kBkl001395
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Oct 2011 22:46:11 -0700 (PDT)
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 17 Oct 2011 22:46:10 -0700
Message-ID: <4E9D123F.6090102@windriver.com>
Date: Tue, 18 Oct 2011 13:44:31 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: Saul Wold <saul.wold@intel.com>
References: <cover.1318904555.git.xiaofeng.yan@windriver.com>
	<ff63f110f1f657a011c24f5c8cfb8e7328fae49a.1318904555.git.xiaofeng.yan@windriver.com>
	<4E9D103B.10506@intel.com>
In-Reply-To: <4E9D103B.10506@intel.com>
X-Originating-IP: [128.224.162.146]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	p9I5kBkl001395
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
X-List-Received-Date: Tue, 18 Oct 2011 05:52:01 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2011=E5=B9=B410=E6=9C=8818=E6=97=A5 13:35, Saul Wold wrote:
> On 10/17/2011 10:21 PM, Xiaofeng Yan wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> The new version of qmmp can run on core-image-sato by test.
>> $qmmp *.mp3
>>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>> meta/recipes-qt/qt-apps/qmmp_0.5.2.bb | 49=20
>> +++++++++++++++++++++++++++++++++
>> 1 files changed, 49 insertions(+), 0 deletions(-)
>> create mode 100644 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
>>
>> diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb=20
>> b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
>> new file mode 100644
>> index 0000000..f31409b
>> --- /dev/null
>> +++ b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
>> @@ -0,0 +1,49 @@
>> +dESCRIPTION =3D "Qmmp (Qt-based Multimedia Player) is an audio-player=
,=20
>> written with help of Qt library"
>> +HOMEPAGE =3D "http://qmmp.ylsoftware.com"
>> +LICENSE =3D "GPLv2"
>> +LIC_FILES_CHKSUM =3D=20
>> "file://COPYING;md5=3D393a5ca445f6965873eca0259a17f833"
>> +SECTION =3D "multimedia"
>> +
>> +PR =3D "r3"
>> +
>> +PROVIDES =3D "qmmp"
>> +DEPENDS =3D "qt4-x11-free taglib libmad libvorbis libogg alsa-lib"
>> +RDEPENDS_${PN} +=3D "taglib alsa-lib libmad curl"
>> +
>> +SRC_URI =3D "http://qmmp.ylsoftware.com/files/${BPN}-${PV}.tar.bz2"
>> +
>> +SRC_URI[md5sum] =3D "20852f3cce3471bfc5affa9b2e947dc6"
>> +SRC_URI[sha256sum] =3D=20
>> "6391dec020d2a381d7f4b7890fae6c49eadf88b3c9aef571fe3c5e96140822ec"
>> +
>> +
>> +PARALLEL_MAKE =3D ""
>> +
>> +inherit qmake2 cmake
>> +
>> +export EXTRA_OECMAKE =3D "-DQT_QMAKE_EXECUTABLE=3D${OE_QMAKE_QMAKE} \
>> + -DQT_LRELEASE_EXECUTABLE=3D${OE_QMAKE_LRELEASE} \
>> + -DQT_MOC_EXECUTABLE=3D${OE_QMAKE_MOC} \
>> + -DQT_UIC_EXECUTABLE=3D${OE_QMAKE_UIC} \
>> + -DQT_RCC_EXECUTABLE=3D${OE_QMAKE_RCC} \
>> + -DQT_LIBRARY_DIR=3D${OE_QMAKE_LIBDIR_QT} \
>> + -DQT_HEADERS_DIR=3D${OE_QMAKE_INCDIR_QT} \
>> + -DQT_QTCORE_INCLUDE_DIR=3D${OE_QMAKE_INCDIR_QT}/QtCore \
>> + "
>> +
>> +FILES_${PN} =3D+ "\
>> + ${libdir}/qmmp/*/*.so \
>> + ${datadir}/icons/* \
>> + ${datadir}/qmmp/images/* \
>> + ${datadir}/applications/qmmp.desktop \
>> + "
>> +
> Xiaofeng,
>
> I was looking into this also, I think it would be better to split all=20
> the various plugins into separate packages using do_split_packages(), i=
n
> the packages.bbclass.
>
> I started with this code:
>> PACKAGES_DYNAMIC =3D "qmmp-plugin-*"
>>
>> python populate_packages_prepend () {
>> qmmp_libdir =3D bb.data.expand('${libdir}/qmmp', d)
>>
>> do_split_packages(d, qmmp_libdir, '^(.*)/(.*)\.so$',=20
>> 'qmmp-plugin-%s-%s', 'Qmmp %s Plugin for %s', extra_depends=3D'')
>> }
>
> But have not completed it yet, if you have time to investigate further=20
> and complete this correctly, there might be a problem with using=20
> multiple Regular expressions in the do_split_packages code, but I have=20
> not fully debugged this yet.
>
> Please let me know if you can complete this task.
>
Thanks for your reply and I will investigate it according to your=20
suggestion.

Thanks
Yan
> Thanks
> Sau!
>
>
>> +FILES_${PN}-dbg +=3D "\
>> + ${libdir}/qmmp/*/.debug/* \
>> + "
>> +
>> +PACKAGES +=3D "${PN}-plugin-input-mad ${PN}-plugin-input-vorbis"
>> +
>> +FILES_${PN}-plugin-input-mad =3D "${libdir}/qmmp/Input/libmad.so"
>> +RDEPENDS_${PN}-plugin-input-mad =3D "libmad"
>> +FILES_${PN}-plugin-input-vorbis =3D "${libdir}/qmmp/Input/libvorbis.s=
o"
>> +RDEPENDS_${PN}-plugin-input-vorbis =3D "libvorbis libogg"
>
>



