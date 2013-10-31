Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 11BB66D12B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2013 16:30:54 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 31 Oct 2013 09:30:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="315324644"
Received: from unknown (HELO [10.255.15.36]) ([10.255.15.36])
	by AZSMGA002.ch.intel.com with ESMTP; 31 Oct 2013 09:30:54 -0700
Message-ID: <527285BE.1080808@linux.intel.com>
Date: Thu, 31 Oct 2013 09:30:54 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <1383041422-5071-1-git-send-email-ml@communistcode.co.uk>
	<527029A5.5080503@linux.intel.com>
	<CAMKF1sp_GKsjFjQpdvc0rS5LBk_aF3TG=BQnn44A1+rCes_5Jw@mail.gmail.com>
In-Reply-To: <CAMKF1sp_GKsjFjQpdvc0rS5LBk_aF3TG=BQnn44A1+rCes_5Jw@mail.gmail.com>
Cc: Jack Mitchell <jmitchell@cbnl.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe][PATCHv3] libjson: update to 0.11 and rename to json-c
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
X-List-Received-Date: Thu, 31 Oct 2013 16:30:54 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/2013 04:13 PM, Khem Raj wrote:
> On Tue, Oct 29, 2013 at 2:33 PM, Saul Wold <sgw@linux.intel.com> wrote:
>> On 10/29/2013 03:10 AM, Jack Mitchell wrote:
>>>
>>> From: Jack Mitchell <jmitchell@cbnl.com>
>>>
>>> libjson is now known as json-c, it keeps support for the old
>>> libjson namespace so it shouldn't break anything. Built without
>>> parallel make as it would fail when it tries to link to link back
>>> to itself, which is odd, but the official word is: don't build in
>>> parallel.
>>>
>> I am seeing a configure failure with this update.
>>
>> See attached log
>
> configure: error: source directory already configured; run "make
> distclean" there first
>
> is it a clean rebuild ?
>
Yes, this is from a clean build, I wonder if this is related to separate 
build dir.

Sau!

>>
>>
>> Sau!
>>
>>
>>> Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
>>> ---
>>>    meta/conf/distro/include/seperatebuilddir.inc     |  2 +-
>>>    meta/recipes-devtools/json-c/json-c_0.11.bb       | 15 +++++++++++++++
>>>    meta/recipes-devtools/libjson/libjson_0.9.bb      | 14 --------------
>>>    meta/recipes-multimedia/pulseaudio/pulseaudio.inc |  2 +-
>>>    4 files changed, 17 insertions(+), 16 deletions(-)
>>>    create mode 100644 meta/recipes-devtools/json-c/json-c_0.11.bb
>>>    delete mode 100644 meta/recipes-devtools/libjson/libjson_0.9.bb
>>>
>>> diff --git a/meta/conf/distro/include/seperatebuilddir.inc
>>> b/meta/conf/distro/include/seperatebuilddir.inc
>>> index c067183..e1a5c6b 100644
>>> --- a/meta/conf/distro/include/seperatebuilddir.inc
>>> +++ b/meta/conf/distro/include/seperatebuilddir.inc
>>> @@ -294,7 +294,7 @@ B_pn-libice = "${SEPB}"
>>>    B_pn-libice-native = "${SEPB}"
>>>    B_pn-libid3tag = "${SEPB}"
>>>    B_pn-libidn = "${SEPB}"
>>> -B_pn-libjson = "${SEPB}"
>>> +B_pn-json-c = "${SEPB}"
>>>    B_pn-libksba = "${SEPB}"
>>>    B_pn-libmad = "${SEPB}"
>>>    B_pn-libmatchbox = "${SEPB}"
>>> diff --git a/meta/recipes-devtools/json-c/json-c_0.11.bb
>>> b/meta/recipes-devtools/json-c/json-c_0.11.bb
>>> new file mode 100644
>>> index 0000000..a909dac
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/json-c/json-c_0.11.bb
>>> @@ -0,0 +1,15 @@
>>> +SUMMARY = "JSON-C implements a reference counting object model that
>>> allows you to easily construct JSON objects in C"
>>> +HOMEPAGE = "https://github.com/json-c/json-c/wiki"
>>> +LICENSE = "MIT"
>>> +LIC_FILES_CHKSUM = "file://COPYING;md5=de54b60fbbc35123ba193fea8ee216f2"
>>> +
>>> +SRC_URI =
>>> "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz"
>>> +
>>> +SRC_URI[md5sum] = "aa02367d2f7a830bf1e3376f77881e98"
>>> +SRC_URI[sha256sum] =
>>> "28dfc65145dc0d4df1dfe7701ac173c4e5f9347176c8983edbfac9149494448c"
>>> +
>>> +RPROVIDES_${PN} = "libjson"
>>> +
>>> +PARALLEL_MAKE = ""
>>> +
>>> +inherit autotools
>>> diff --git a/meta/recipes-devtools/libjson/libjson_0.9.bb
>>> b/meta/recipes-devtools/libjson/libjson_0.9.bb
>>> deleted file mode 100644
>>> index e4951a8..0000000
>>> --- a/meta/recipes-devtools/libjson/libjson_0.9.bb
>>> +++ /dev/null
>>> @@ -1,14 +0,0 @@
>>> -DESCRIPTION = "JSON-C - A JSON implementation in C"
>>> -HOMEPAGE = "http://oss.metaparadigm.com/json-c/"
>>> -
>>> -LICENSE = "MIT"
>>> -LIC_FILES_CHKSUM = "file://COPYING;md5=30a276a476b02c2dcd0849bde417fb17"
>>> -
>>> -SRC_URI = "http://oss.metaparadigm.com/json-c/json-c-${PV}.tar.gz"
>>> -SRC_URI[md5sum] = "3a13d264528dcbaf3931b0cede24abae"
>>> -SRC_URI[sha256sum] =
>>> "702a486c9bf8e19137d484ab5c49b4ad314eb5e1fe37062a72c0a0fa39439475"
>>> -
>>> -S = "${WORKDIR}/json-c-${PV}"
>>> -
>>> -
>>> -inherit autotools
>>> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>>> b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>>> index 4c10aa9..475da41 100644
>>> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>>> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
>>> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =
>>> "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
>>>    DEPENDS = "libatomics-ops liboil libsamplerate0 libsndfile1 libtool"
>>>    # optional
>>>    DEPENDS += "udev alsa-lib glib-2.0 dbus gconf"
>>> -DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
>>> +DEPENDS += "json-c gdbm speex libxml-parser-perl-native"
>>>
>>>    inherit autotools pkgconfig useradd gettext perlnative
>>>
>>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

