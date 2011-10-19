Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RGfUn-0003RG-5L
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 01:24:25 +0200
Received: from mail-ww0-f44.google.com ([74.125.82.44])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 19 Oct 2011 16:18:31 -0700
Received: by wwe6 with SMTP id 6so2301139wwe.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2011 16:18:30 -0700 (PDT)
Received: by 10.216.135.207 with SMTP id u57mr7706835wei.56.1319066310156;
	Wed, 19 Oct 2011 16:18:30 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id q30sm12500854wbn.17.2011.10.19.16.18.27
	(version=SSLv3 cipher=OTHER); Wed, 19 Oct 2011 16:18:29 -0700 (PDT)
Message-ID: <4E9F5AC2.9080905@intel.com>
Date: Wed, 19 Oct 2011 16:18:26 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1318904555.git.xiaofeng.yan@windriver.com>	<ff63f110f1f657a011c24f5c8cfb8e7328fae49a.1318904555.git.xiaofeng.yan@windriver.com>	<4E9D103B.10506@intel.com>
	<4E9D123F.6090102@windriver.com> <4E9EA6E7.9000409@windriver.com>
In-Reply-To: <4E9EA6E7.9000409@windriver.com>
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
X-List-Received-Date: Wed, 19 Oct 2011 23:24:25 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/19/2011 03:31 AM, Xiaofeng Yan wrote:
> On 2011年10月18日 13:44, Xiaofeng Yan wrote:
>> On 2011年10月18日 13:35, Saul Wold wrote:
>>> On 10/17/2011 10:21 PM, Xiaofeng Yan wrote:
>>>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>>
>>>> The new version of qmmp can run on core-image-sato by test.
>>>> $qmmp *.mp3
>>>>
>>>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>>> ---
>>>> meta/recipes-qt/qt-apps/qmmp_0.5.2.bb | 49
>>>> +++++++++++++++++++++++++++++++++
>>>> 1 files changed, 49 insertions(+), 0 deletions(-)
>>>> create mode 100644 meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
>>>>
>>>> diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
>>>> b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
>>>> new file mode 100644
>>>> index 0000000..f31409b
>>>> --- /dev/null
>>>> +++ b/meta/recipes-qt/qt-apps/qmmp_0.5.2.bb
>>>> @@ -0,0 +1,49 @@
>>>> +dESCRIPTION = "Qmmp (Qt-based Multimedia Player) is an
>>>> audio-player, written with help of Qt library"
>>>> +HOMEPAGE = "http://qmmp.ylsoftware.com"
>>>> +LICENSE = "GPLv2"
>>>> +LIC_FILES_CHKSUM =
>>>> "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
>>>> +SECTION = "multimedia"
>>>> +
>>>> +PR = "r3"
>>>> +
>>>> +PROVIDES = "qmmp"
>>>> +DEPENDS = "qt4-x11-free taglib libmad libvorbis libogg alsa-lib"
>>>> +RDEPENDS_${PN} += "taglib alsa-lib libmad curl"
>>>> +
>>>> +SRC_URI = "http://qmmp.ylsoftware.com/files/${BPN}-${PV}.tar.bz2"
>>>> +
>>>> +SRC_URI[md5sum] = "20852f3cce3471bfc5affa9b2e947dc6"
>>>> +SRC_URI[sha256sum] =
>>>> "6391dec020d2a381d7f4b7890fae6c49eadf88b3c9aef571fe3c5e96140822ec"
>>>> +
>>>> +
>>>> +PARALLEL_MAKE = ""
>>>> +
>>>> +inherit qmake2 cmake
>>>> +
>>>> +export EXTRA_OECMAKE = "-DQT_QMAKE_EXECUTABLE=${OE_QMAKE_QMAKE} \
>>>> + -DQT_LRELEASE_EXECUTABLE=${OE_QMAKE_LRELEASE} \
>>>> + -DQT_MOC_EXECUTABLE=${OE_QMAKE_MOC} \
>>>> + -DQT_UIC_EXECUTABLE=${OE_QMAKE_UIC} \
>>>> + -DQT_RCC_EXECUTABLE=${OE_QMAKE_RCC} \
>>>> + -DQT_LIBRARY_DIR=${OE_QMAKE_LIBDIR_QT} \
>>>> + -DQT_HEADERS_DIR=${OE_QMAKE_INCDIR_QT} \
>>>> + -DQT_QTCORE_INCLUDE_DIR=${OE_QMAKE_INCDIR_QT}/QtCore \
>>>> + "
>>>> +
>>>> +FILES_${PN} =+ "\
>>>> + ${libdir}/qmmp/*/*.so \
>>>> + ${datadir}/icons/* \
>>>> + ${datadir}/qmmp/images/* \
>>>> + ${datadir}/applications/qmmp.desktop \
>>>> + "
>>>> +
>>> Xiaofeng,
>>>
>>> I was looking into this also, I think it would be better to split all
>>> the various plugins into separate packages using do_split_packages(), in
>>> the packages.bbclass.
>>>
>>> I started with this code:
>>>> PACKAGES_DYNAMIC = "qmmp-plugin-*"
>>>>
>>>> python populate_packages_prepend () {
>>>> qmmp_libdir = bb.data.expand('${libdir}/qmmp', d)
>>>>
>>>> do_split_packages(d, qmmp_libdir, '^(.*)/(.*)\.so$',
>>>> 'qmmp-plugin-%s-%s', 'Qmmp %s Plugin for %s', extra_depends='')
>>>> }
>>>
>>> But have not completed it yet, if you have time to investigate
>>> further and complete this correctly, there might be a problem with
>>> using multiple Regular expressions in the do_split_packages code, but
>>> I have not fully debugged this yet.
>>>
>>> Please let me know if you can complete this task.
>>>
> Hi saul,
>
> The following is my modification to qmmp_0.5.2.bb. Please review it.
> I want to get a reply about how to ship files in ${datadir} for qmmp. I
> shipped them to FILES_${PN} because qmmp need these files when starting
> up. Do you think that they should be packaged like qmmp-plugin-* ?
>
> Please give me your suggestion and I will modify this file.
>
>
> PACKAGES_DYNAMIC += "qmmp-plugin-*"
>
>
> python populate_packages_prepend () {
>          qmmp_libdir = bb.data.expand('${libdir}/qmmp', d)
>          do_split_packages(d, qmmp_libdir, '^lib(.*)\.so$',
> 'qmmp-plugin-%s', 'Qmmp %s Plugin for', recursive=True,extra_depends='')
> }
>
Ah, I see you added the recursive flag, I was trying to capture the 
plugin group (Input, Ouput, Effect, ...) in the package name incase 
there was name conflict, also to match the mad and vorbis naming below.

If using multiple RE expressions in the re match does not work, then we 
should make do_split_package for each grouping and name them correctly
qmmp-plugin-<group>-<library>  with the Description: Qmmp <Group> plugin 
for %s"

> FILES_${PN} = "\
I think this should be a +=
>                  ${bindir}/qmmp \
>                  ${libdir}/lib*${SOLIBS} \
These 2 should go away (part of default FILES_${PN}
>                  ${datadir}/icons/* \
>                  ${datadir}/qmmp/images/* \
>                  ${datadir}/applications/* \
>                  "
There are added via the += above.

>
> FILES_${PN}-dbg += "\
>                  ${libdir}/qmmp/*/.debug/* \
>                 "
>
These should be picked up by the do_split_package above I believe

> PACKAGES += "${PN}-plugin-input-mad ${PN}-plugin-input-vorbis "
>
> FILES_${PN}-plugin-input-mad = "${libdir}/qmmp/Input/libmad.so"
> RDEPENDS_${PN}-plugin-input-mad = "libmad"
> FILES_${PN}-plugin-input-vorbis = "${libdir}/qmmp/Input/libvorbis.so"
> RDEPENDS_${PN}-plugin-input-vorbis = "libvorbis libogg"
>
Ideally the above PACKAGES and FILES_ go away and the default actions 
take over.

Thanks for looking into this.

Sau!

>
>
> Thanks
> Yan
>> Thanks for your reply and I will investigate it according to your
>> suggestion.
>>
>> Thanks
>> Yan
>>> Thanks
>>> Sau!
>>>
>>>
>>>> +FILES_${PN}-dbg += "\
>>>> + ${libdir}/qmmp/*/.debug/* \
>>>> + "
>>>> +
>>>> +PACKAGES += "${PN}-plugin-input-mad ${PN}-plugin-input-vorbis"
>>>> +
>>>> +FILES_${PN}-plugin-input-mad = "${libdir}/qmmp/Input/libmad.so"
>>>> +RDEPENDS_${PN}-plugin-input-mad = "libmad"
>>>> +FILES_${PN}-plugin-input-vorbis = "${libdir}/qmmp/Input/libvorbis.so"
>>>> +RDEPENDS_${PN}-plugin-input-vorbis = "libvorbis libogg"
>>>
>>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



