Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f171.google.com (unknown [209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id BD74A6608B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 20:29:04 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id 10so2322570lbg.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 13:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=z7pPdNJvoQbyZp43+LzNn88o9VMZaPCyqacmwaThtNs=;
	b=w1lVWcNFF3KZbWmCjfjoaisR+EEj5IPgC/RD73M320x2V496eIaqNm9/VEb/nUyyXV
	JzAgFNX8tHXdO5qauhX75UOrUCjoxZzifJMz+eFEILWvxJTP3zEt/VZpnUGFikuhIg3Q
	9iK8jmknB5iCwV9mJwPvPb/XIKCjoBru3WNHRQZhJp0m39exRVcGOLyMj2R5C34jsKu+
	gwUh3ySg5eQ8WblQumm1/lF+Tg7dMWdeVuRhmUF0DBuBT4i++EELj5UwU6ZChQ3HT7lO
	7KkFvdhStRfSdP3zQQttKkraQDh4Yp3OHGdAiKmE/qdVgdz+OkZJtgz1vSHXbI8P3w8A
	DzZQ==
MIME-Version: 1.0
X-Received: by 10.152.10.2 with SMTP id e2mr2826186lab.76.1400272144823; Fri,
	16 May 2014 13:29:04 -0700 (PDT)
Received: by 10.112.16.227 with HTTP; Fri, 16 May 2014 13:29:04 -0700 (PDT)
In-Reply-To: <CAAQYJAuSX6f_iUnrn2tWp035cS77BwPpzC4XY0zWU0r_Fe51Lg@mail.gmail.com>
References: <1400169517-29966-1-git-send-email-sgw@linux.intel.com>
	<CAPbeDC=LgSCO0F7gB7nCJQCgXQrUvRAJCUt35Ss2JrVVWB21dQ@mail.gmail.com>
	<CAPbeDC=Z8OTCuy7+Lj4Hp_y-j3FcA0Ro0SBNRvTRRxy4Zm+qdg@mail.gmail.com>
	<53764764.1010608@linux.intel.com>
	<CAPbeDCmCxA5o99dMhnDsRQnNW4aTDe_qAO4qySO+W_=ErN9k1w@mail.gmail.com>
	<CAAQYJAuSX6f_iUnrn2tWp035cS77BwPpzC4XY0zWU0r_Fe51Lg@mail.gmail.com>
Date: Fri, 16 May 2014 22:29:04 +0200
Message-ID: <CAAQYJAuhFjbWqAB9D+5XXm1+5TtMvddb22CbmeUKXt0BGiL0WQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 16 May 2014 20:29:07 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 16, 2014 at 10:18 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> On Fri, May 16, 2014 at 8:47 PM, Jacob Kroon <jacob.kroon@gmail.com> wrote:
>> On Fri, May 16, 2014 at 7:14 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>>
>>> On 05/16/2014 05:16 AM, Jacob Kroon wrote:
>>>>
>>>> On Fri, May 16, 2014 at 7:13 AM, Jacob Kroon <jacob.kroon@gmail.com>
>>>> wrote:
>>>>
>>>>> Hello Saul,
>>>>>
>>>>>
>>>>> On Thu, May 15, 2014 at 5:58 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>>>>
>>>>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>>>>> ---
>>>>>>   .../{libusb1-1.0.9 => libusb1}/obsolete_automake_macros.patch      |
>>>>>> 0
>>>>>>   .../recipes-support/libusb/{libusb1_1.0.9.bb => libusb1_1.0.18.bb} |
>>>>>> 7
>>>>>> ++-----
>>>>>>   2 files changed, 2 insertions(+), 5 deletions(-)
>>>>>>   rename meta/recipes-support/libusb/{libusb1-1.0.9 =>
>>>>>> libusb1}/obsolete_automake_macros.patch (100%)
>>>>>>   rename meta/recipes-support/libusb/{libusb1_1.0.9.bb =>
>>>>>> libusb1_1.0.18.bb} (78%)
>>>>>>
>>>>>> diff --git
>>>>>>
>>>>>> a/meta/recipes-support/libusb/libusb1-1.0.9/obsolete_automake_macros.patch
>>>>>> b/meta/recipes-support/libusb/libusb1/obsolete_automake_macros.patch
>>>>>> similarity index 100%
>>>>>> rename from
>>>>>>
>>>>>> meta/recipes-support/libusb/libusb1-1.0.9/obsolete_automake_macros.patch
>>>>>> rename to
>>>>>> meta/recipes-support/libusb/libusb1/obsolete_automake_macros.patch
>>>>>> diff --git
>>>>>> a/meta/recipes-support/libusb/libusb1_1.0.9.bbb/meta/recipes-support/libusb/
>>>>>> libusb1_1.0.18.bb
>>>>>> similarity index 78%
>>>>>> rename from meta/recipes-support/libusb/libusb1_1.0.9.bb
>>>>>> rename to meta/recipes-support/libusb/libusb1_1.0.18.bb
>>>>>> index d57425b..c64f1db 100644
>>>>>> --- a/meta/recipes-support/libusb/libusb1_1.0.9.bb
>>>>>> +++ b/meta/recipes-support/libusb/libusb1_1.0.18.bb
>>>>>> @@ -8,14 +8,11 @@ LIC_FILES_CHKSUM =
>>>>>> "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>>>>>>
>>>>>>   BBCLASSEXTEND = "native nativesdk"
>>>>>>
>>>>>> -PR = "r1"
>>>>>> -
>>>>>>   SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
>>>>>> -           file://obsolete_automake_macros.patch \
>>>>>>             "
>>>>>>
>>>>>
>>>>> That patch is still in git, maybe it should be removed as well ?
>>>>>
>>>>>
>>>> Also, I think it needs to be added a PACKAGECONFIG for "udev", otherwise
>>>> I
>>>> get a build failure when I generate an SDK on my system,
>>>> configure script can't find udev although it was requested.
>>>>
>>>
>>>> Something like the patch below does the trick for me:
>>>>
>>> I am supprised you did not see a circular dependency with udev -> libusb
>>> -> udev, I think we need to disable-udev as default and if there is a need
>>> for a libusb with udev support we will have to create a new recipe possibly
>>> to build it after udev is built.
>>>
>>
>> With the patch applied, I wiped my sysroots and did a "cleansstate libusb1
>> udev", and then rebuilt both successfully with no warning
>> about circular dependency. Maybe I'm not hitting the error since I have
>> "systemd" in DISTRO_FEATURES, so it's actually systemd that is the udev
>> provider.
>>
>>> Thoughts here?
>>>
>>> Sau!
>>>
>>>
>
> Yes, building sysvinit I get the failure:
> | checking operating system... Linux
> | checking for library containing clock_gettime... none required
> | checking libudev.h usability... no
> | checking libudev.h presence... no
> | checking for libudev.h... no
> | configure: error: "udev support requested but libudev not installed"
> | Configure failed. The contents of all config.log files follows to
> aid debugging
> | ERROR: oe_runconf failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_configure (log file is located at
> /oe/oe-core/build/tmp-eglibc/
> work/armv4-oe-linux-gnueabi/libusb1/1.0.18-r0/temp/log.do_configure.23838)
> ERROR: Task 1803
> (/oe/oe-core/meta/recipes-support/libusb/libusb1_1.0.18.bb,
> do_configure) failed with exit code '1'
>
> Andrea
>
>

And I can confirm the patch gives circular dependencies issues with sysvinit.

ERROR:
Dependency loop #1 found:
  Task 734 (/oe/oe-core/meta/recipes-core/udev/udev_182.bb,
do_packagedata) (dependent Tasks ['udev, do_package'])
...

Workaround for now is
PACKAGECONFIG ?= "--disable-udev"

Cheers

Andrea

>>>
>>>> --- a/meta/recipes-support/libusb/libusb1_1.0.18.bb
>>>> +++ b/meta/recipes-support/libusb/libusb1_1.0.18.bb
>>>> @@ -8,12 +8,17 @@ LIC_FILES_CHKSUM =
>>>> "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>>>>
>>>>   BBCLASSEXTEND = "native nativesdk"
>>>>
>>>> -SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
>>>> -          "
>>>> +SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2"
>>>>
>>>>   SRC_URI[md5sum] = "4a6d049923efc6496f1d383054dac1a6"
>>>>   SRC_URI[sha256sum] =
>>>> "c73f5cec45a5de94418da4e151b7232958571926984acfb9bce02b9424e83720"
>>>>
>>>> +PACKAGECONFIG ?= "udev"
>>>> +PACKAGECONFIG_class-native = ""
>>>> +PACKAGECONFIG_class-nativesdk = ""
>>>> +
>>>> +PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
>>>> +
>>>>   S = "${WORKDIR}/libusb-${PV}"
>>>>
>>>>   inherit autotools pkgconfig
>>>>
>>>> If this looks good I can submit a proper patch for it.
>>>>
>>>> /Jacob
>>>>
>>
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>

