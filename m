Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei.adrianx.dinu@intel.com>) id 1U0ss4-00011Z-77
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 13:04:01 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 31 Jan 2013 03:48:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,575,1355126400"; d="scan'208";a="280797478"
Received: from adinu-vostro-460 (HELO [10.237.105.33]) ([10.237.105.33])
	by fmsmga001.fm.intel.com with ESMTP; 31 Jan 2013 03:48:14 -0800
Message-ID: <510A5A3B.9090101@intel.com>
Date: Thu, 31 Jan 2013 13:49:15 +0200
From: Andrei Dinu <andrei.adrianx.dinu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <1359376066-20756-1-git-send-email-andrei.adrianx.dinu@intel.com>
	<510945B2.3000000@linux.intel.com>
In-Reply-To: <510945B2.3000000@linux.intel.com>
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
X-List-Received-Date: Thu, 31 Jan 2013 12:04:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

The patch was already merged into master...

Next time i will mention all the testing in the commit message.

Thanks for the heads-up!

Andrei

On 01/30/2013 06:09 PM, Darren Hart wrote:
> Andrei,
>
> There is almost ALWAYS something worth putting in the comment message.
> In this case, please include your latest testing comment in your commit
> message and resend with my Acked by.
>
> On 01/28/2013 04:27 AM, Andrei Dinu wrote:
>> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
>
> Acked-by: Darren Hart <dvhart@linux.intel.com>
>
>
> Thanks,
>
> Darren
>
>> ---
>>   .../mtools/{mtools_4.0.17.bb => mtools_4.0.18.bb}  |    6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>   rename meta/recipes-devtools/mtools/{mtools_4.0.17.bb => mtools_4.0.18.bb} (86%)
>>
>> diff --git a/meta/recipes-devtools/mtools/mtools_4.0.17.bb b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
>> similarity index 86%
>> rename from meta/recipes-devtools/mtools/mtools_4.0.17.bb
>> rename to meta/recipes-devtools/mtools/mtools_4.0.18.bb
>> index 5ce6c09..0f99685 100644
>> --- a/meta/recipes-devtools/mtools/mtools_4.0.17.bb
>> +++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
>> @@ -5,7 +5,7 @@ SECTION = "optional"
>>   LICENSE = "GPLv3"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>>   
>> -PR = "r1"
>> +PR = "r0"
>>   
>>   RDEPENDS_${PN} = "glibc-gconv-ibm850"
>>   RRECOMMENDS_${PN} = "\
>> @@ -24,13 +24,13 @@ RRECOMMENDS_${PN} = "\
>>   	glibc-gconv-ibm866 \
>>   	glibc-gconv-ibm869 \
>>   	"
>> +SRC_URI[md5sum] = "a23646617546bf6ad56f061d8b283c85"
>> +SRC_URI[sha256sum] = "59e9cf80885399c4f229e5d87e49c0c2bfeec044e1386d59fcd0b0aead6b2f85"
>>   
>>   SRC_URI = "${GNU_MIRROR}/mtools/mtools-${PV}.tar.bz2 \
>>              file://mtools-makeinfo.patch \
>>              file://no-x11.gplv3.patch"
>>   
>> -SRC_URI[md5sum] = "15571c615d8f75f5f6d294272f80c7fa"
>> -SRC_URI[sha256sum] = "0ecc358e30a72d215b1d4c625b27e67121cd6f6075370dfb791ef2a8b980ecb6"
>>   
>>   inherit autotools
>>   
>>



