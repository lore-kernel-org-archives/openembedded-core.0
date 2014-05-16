Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (unknown [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 979C565EA8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 17:14:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 May 2014 10:14:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1068,1389772800"; d="scan'208";a="512873608"
Received: from unknown (HELO [10.255.12.101]) ([10.255.12.101])
	by orsmga001.jf.intel.com with ESMTP; 16 May 2014 10:14:13 -0700
Message-ID: <53764764.1010608@linux.intel.com>
Date: Fri, 16 May 2014 10:14:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Jacob Kroon <jacob.kroon@gmail.com>
References: <1400169517-29966-1-git-send-email-sgw@linux.intel.com>	<CAPbeDC=LgSCO0F7gB7nCJQCgXQrUvRAJCUt35Ss2JrVVWB21dQ@mail.gmail.com>
	<CAPbeDC=Z8OTCuy7+Lj4Hp_y-j3FcA0Ro0SBNRvTRRxy4Zm+qdg@mail.gmail.com>
In-Reply-To: <CAPbeDC=Z8OTCuy7+Lj4Hp_y-j3FcA0Ro0SBNRvTRRxy4Zm+qdg@mail.gmail.com>
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
X-List-Received-Date: Fri, 16 May 2014 17:14:16 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2014 05:16 AM, Jacob Kroon wrote:
> On Fri, May 16, 2014 at 7:13 AM, Jacob Kroon <jacob.kroon@gmail.com> wrote:
>
>> Hello Saul,
>>
>>
>> On Thu, May 15, 2014 at 5:58 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>
>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>> ---
>>>   .../{libusb1-1.0.9 => libusb1}/obsolete_automake_macros.patch      | 0
>>>   .../recipes-support/libusb/{libusb1_1.0.9.bb => libusb1_1.0.18.bb} | 7
>>> ++-----
>>>   2 files changed, 2 insertions(+), 5 deletions(-)
>>>   rename meta/recipes-support/libusb/{libusb1-1.0.9 =>
>>> libusb1}/obsolete_automake_macros.patch (100%)
>>>   rename meta/recipes-support/libusb/{libusb1_1.0.9.bb =>
>>> libusb1_1.0.18.bb} (78%)
>>>
>>> diff --git
>>> a/meta/recipes-support/libusb/libusb1-1.0.9/obsolete_automake_macros.patch
>>> b/meta/recipes-support/libusb/libusb1/obsolete_automake_macros.patch
>>> similarity index 100%
>>> rename from
>>> meta/recipes-support/libusb/libusb1-1.0.9/obsolete_automake_macros.patch
>>> rename to
>>> meta/recipes-support/libusb/libusb1/obsolete_automake_macros.patch
>>> diff --git a/meta/recipes-support/libusb/libusb1_1.0.9.bbb/meta/recipes-support/libusb/
>>> libusb1_1.0.18.bb
>>> similarity index 78%
>>> rename from meta/recipes-support/libusb/libusb1_1.0.9.bb
>>> rename to meta/recipes-support/libusb/libusb1_1.0.18.bb
>>> index d57425b..c64f1db 100644
>>> --- a/meta/recipes-support/libusb/libusb1_1.0.9.bb
>>> +++ b/meta/recipes-support/libusb/libusb1_1.0.18.bb
>>> @@ -8,14 +8,11 @@ LIC_FILES_CHKSUM =
>>> "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>>>
>>>   BBCLASSEXTEND = "native nativesdk"
>>>
>>> -PR = "r1"
>>> -
>>>   SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
>>> -           file://obsolete_automake_macros.patch \
>>>             "
>>>
>>
>> That patch is still in git, maybe it should be removed as well ?
>>
>>
> Also, I think it needs to be added a PACKAGECONFIG for "udev", otherwise I
> get a build failure when I generate an SDK on my system,
> configure script can't find udev although it was requested.
>

> Something like the patch below does the trick for me:
>
I am supprised you did not see a circular dependency with udev -> libusb 
-> udev, I think we need to disable-udev as default and if there is a 
need for a libusb with udev support we will have to create a new recipe 
possibly to build it after udev is built.

Thoughts here?

Sau!


> --- a/meta/recipes-support/libusb/libusb1_1.0.18.bb
> +++ b/meta/recipes-support/libusb/libusb1_1.0.18.bb
> @@ -8,12 +8,17 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>
>   BBCLASSEXTEND = "native nativesdk"
>
> -SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
> -          "
> +SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2"
>
>   SRC_URI[md5sum] = "4a6d049923efc6496f1d383054dac1a6"
>   SRC_URI[sha256sum] =
> "c73f5cec45a5de94418da4e151b7232958571926984acfb9bce02b9424e83720"
>
> +PACKAGECONFIG ?= "udev"
> +PACKAGECONFIG_class-native = ""
> +PACKAGECONFIG_class-nativesdk = ""
> +
> +PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
> +
>   S = "${WORKDIR}/libusb-${PV}"
>
>   inherit autotools pkgconfig
>
> If this looks good I can submit a proper patch for it.
>
> /Jacob
>

