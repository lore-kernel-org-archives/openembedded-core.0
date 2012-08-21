Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T3qpw-0007xA-CD
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 17:57:48 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Aug 2012 08:40:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,802,1336374000"; d="scan'208";a="211713316"
Received: from unknown (HELO [10.255.13.49]) ([10.255.13.49])
	by fmsmga002.fm.intel.com with ESMTP; 21 Aug 2012 08:40:08 -0700
Message-ID: <5033ABD8.5070203@linux.intel.com>
Date: Tue, 21 Aug 2012 08:40:08 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Jesse Zhang <sen.zhang@windriver.com>
References: <1343959047-24613-1-git-send-email-sen.zhang@windriver.com>
	<1343959047-24613-2-git-send-email-sen.zhang@windriver.com>
	<5032A946.1000301@linux.intel.com> <5032E5E7.8010208@windriver.com>
In-Reply-To: <5032E5E7.8010208@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxpm-native: add dependency on gettext-native
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
X-List-Received-Date: Tue, 21 Aug 2012 15:57:48 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/20/2012 06:35 PM, Jesse Zhang wrote:
> Hi Saul,
>
> On 08/21/2012 05:16 AM, Saul Wold wrote:
>> On 08/02/2012 06:57 PM, Jesse Zhang wrote:
>>> libxpm needs xgettext to build po files. Add explicit dependency on
>>> gettext-native.
>>>
>>> Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
>>> ---
>>>    meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb |    3 ++-
>>>    1 files changed, 2 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb
>>> index 9eaa212..6830216 100644
>>> --- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb
>>> +++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.10.bb
>>> @@ -10,7 +10,8 @@ protocol."
>>>    LICENSE = "BSD"
>>>    LIC_FILES_CHKSUM = "file://COPYING;md5=3e07763d16963c3af12db271a31abaa5"
>>>    DEPENDS += "libxext libsm libxt"
>>> -PR = "r0"
>>> +DEPENDS_virtclass-native = "gettext-native"
>>
>> Is there a reason you don't do an inherit gettext here to ensure other bits are set?
>
> Actually I don't know what's the preferred way to do this. What is
> required by libxpm is the xgettext command; using DEPENDS will be enough
> to make it available, but I didn't know the other solution.
>
Ok, well I am telling you there is another, more correct, way to do this 
using the inherit gettext, so please try using inherit gettext and see 
if that works correctly.  The meta/classes/gettext.bbclass in 
conjunction with native.bbclass correctly set the DEPENDS to use 
gettext-native.

Also, on another note, please modify your patch subject to just say 
libxpm, this initial confused a couple of us thinking that libxpm was a 
native specific recipe.

Sau!


>> Also for the native, you maybe able to use the gettext-minimal-native if there is reason you can't use the inherit.
>
> gettext-minimal-native is already pulled in through the implicit
> dependency chain. But clearly it doesn't provide xgettext?
>
> jesse
>
>>
>>> +PR = "r1"
>>>    PE = "1"
>>>
>>>    XORG_PN = "libXpm"
>>>
>>
>>
>
>


