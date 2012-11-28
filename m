Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TdWg8-00060v-3s
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 02:43:10 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Nov 2012 17:28:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,174,1355126400"; d="scan'208";a="255455707"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.47])
	by fmsmga002.fm.intel.com with ESMTP; 27 Nov 2012 17:28:51 -0800
Message-ID: <50B568D3.40505@linux.intel.com>
Date: Tue, 27 Nov 2012 17:28:51 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Marko Lindqvist <cazfi74@gmail.com>
References: <1353986291-9144-1-git-send-email-cazfi74@gmail.com>
	<1354006492.21863.97.camel@ted>
	<CAF6bG8dAVr-7S2EVQVyOQ0SJtxLCSZdiF-nA1t3yrTL0=jvLSw@mail.gmail.com>
In-Reply-To: <CAF6bG8dAVr-7S2EVQVyOQ0SJtxLCSZdiF-nA1t3yrTL0=jvLSw@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libpng: update to upstream version 1.2.50
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 01:43:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/2012 01:06 AM, Marko Lindqvist wrote:
> On 27 November 2012 10:54, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Tue, 2012-11-27 at 05:18 +0200, Marko Lindqvist wrote:
>>> Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
>>
>> What changed in the LICENSE?
>
>   Version number and release date.
>
Please resend the pull request with this in the commit header

Thanks
	Sau!

>>
>> Cheers,
>>
>> Richard
>>
>>
>>> ---
>>>   .../libpng/{libpng_1.2.49.bb => libpng_1.2.50.bb}          |   12 ++++++------
>>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>>   rename meta/recipes-multimedia/libpng/{libpng_1.2.49.bb => libpng_1.2.50.bb} (52%)
>>>
>>> diff --git a/meta/recipes-multimedia/libpng/libpng_1.2.49.bb b/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
>>> similarity index 52%
>>> rename from meta/recipes-multimedia/libpng/libpng_1.2.49.bb
>>> rename to meta/recipes-multimedia/libpng/libpng_1.2.50.bb
>>> index d33a9f5..211e357 100644
>>> --- a/meta/recipes-multimedia/libpng/libpng_1.2.49.bb
>>> +++ b/meta/recipes-multimedia/libpng/libpng_1.2.50.bb
>>> @@ -3,15 +3,15 @@ DESCRIPTION = "PNG Library"
>>>   HOMEPAGE = "http://www.libpng.org/"
>>>   SECTION = "libs"
>>>   LICENSE = "Libpng"
>>> -LIC_FILES_CHKSUM = "file://LICENSE;md5=20110633230abd47fe8680afa75f1492 \
>>> -                    file://png.h;startline=308;endline=422;md5=edd1c552386a8c3773d90e278ae30891"
>>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c3d807a85c09ebdff087f18b4969ff96 \
>>> +                    file://png.h;startline=310;endline=424;md5=62968b88b0425ceeb919de3fd21b03e5"
>>>   DEPENDS = "zlib"
>>> -PR = "r1"
>>> +PR = "r0"
>>>
>>> -SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.bz2"
>>> +SRC_URI = "${SOURCEFORGE_MIRROR}/project/libpng/libpng12/${PV}/libpng-${PV}.tar.xz"
>>>
>>> -SRC_URI[md5sum] = "d5106b70b4f8b464a7da66bffe4565fb"
>>> -SRC_URI[sha256sum] = "fbf8faa70ebca2ed2ee6df6f2249f4722517b581af5b6c3c71bbdaf925d5954e"
>>> +SRC_URI[md5sum] = "a3e00fccbfe356174ab515b5c00641c7"
>>> +SRC_URI[sha256sum] = "4724f81f8c92ac7f360ad1fbf173396ea7c535923424db9fbaff07bfd9d8e8e7"
>>>
>>>   inherit autotools binconfig pkgconfig
>>>
>>
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


