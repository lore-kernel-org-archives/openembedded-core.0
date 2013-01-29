Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1U0EZX-0002VI-5P
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 18:02:21 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jan 2013 08:46:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,561,1355126400"; d="scan'208";a="283686794"
Received: from unknown (HELO envy.home) ([10.255.12.106])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2013 08:46:28 -0800
Message-ID: <5107FCE4.6000602@linux.intel.com>
Date: Tue, 29 Jan 2013 08:46:28 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
References: <1359376066-20756-1-git-send-email-andrei.adrianx.dinu@intel.com>
	<5106C72D.8010007@linux.intel.com> <51079B1D.1080108@intel.com>
In-Reply-To: <51079B1D.1080108@intel.com>
X-Enigmail-Version: 1.5
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mtools : upgrade to 4.0.18
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
X-List-Received-Date: Tue, 29 Jan 2013 17:02:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/29/2013 01:49 AM, Andrei Dinu wrote:
> Hello,

Hi Andrei,

> No, i performed only minimal testing, to see if the package is included 
> and also that it works when summoned in the console. If you can tell me 
> how i can test it further, i would be grateful.

The mtools are used to populate the live images. Pick a BSP that
supports this format (atom-pc for example) and build the minimal image.
Then boot the resulting core-image-minimal.hddimg. You can do this with
qemu if you don't have an atom machine handy.

That would add enough confidence to bump the version for me.

--
Darren

> 
> Thanks,
> 
> Andrei Dinu
> 
> On 01/28/2013 08:45 PM, Darren Hart wrote:
>> Have you performed testing with the generation of live images using this
>> version?
>>
>> Thanks,
>>
>> Darren
>>
>> On 01/28/2013 04:27 AM, Andrei Dinu wrote:
>>> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
>>> ---
>>>   .../mtools/{mtools_4.0.17.bb => mtools_4.0.18.bb}  |    6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>   rename meta/recipes-devtools/mtools/{mtools_4.0.17.bb => mtools_4.0.18.bb} (86%)
>>>
>>> diff --git a/meta/recipes-devtools/mtools/mtools_4.0.17.bb b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
>>> similarity index 86%
>>> rename from meta/recipes-devtools/mtools/mtools_4.0.17.bb
>>> rename to meta/recipes-devtools/mtools/mtools_4.0.18.bb
>>> index 5ce6c09..0f99685 100644
>>> --- a/meta/recipes-devtools/mtools/mtools_4.0.17.bb
>>> +++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
>>> @@ -5,7 +5,7 @@ SECTION = "optional"
>>>   LICENSE = "GPLv3"
>>>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>>>   
>>> -PR = "r1"
>>> +PR = "r0"
>>>   
>>>   RDEPENDS_${PN} = "glibc-gconv-ibm850"
>>>   RRECOMMENDS_${PN} = "\
>>> @@ -24,13 +24,13 @@ RRECOMMENDS_${PN} = "\
>>>   	glibc-gconv-ibm866 \
>>>   	glibc-gconv-ibm869 \
>>>   	"
>>> +SRC_URI[md5sum] = "a23646617546bf6ad56f061d8b283c85"
>>> +SRC_URI[sha256sum] = "59e9cf80885399c4f229e5d87e49c0c2bfeec044e1386d59fcd0b0aead6b2f85"
>>>   
>>>   SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
>>>              file://mtools-makeinfo.patch \
>>>              file://no-x11.gplv3.patch"
>>>   
>>> -SRC_URI[md5sum] = "15571c615d8f75f5f6d294272f80c7fa"
>>> -SRC_URI[sha256sum] = "0ecc358e30a72d215b1d4c625b27e67121cd6f6075370dfb791ef2a8b980ecb6"
>>>   
>>>   inherit autotools
>>>   
>>>
> 

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


