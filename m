Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D9B3C78A32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 00:29:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w5E0SmnC020233
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Jun 2018 17:29:03 -0700
Received: from [172.25.44.2] (172.25.44.2) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 13 Jun 2018 17:28:37 -0700
To: "Maxin B. John" <maxin.john@intel.com>
References: <1528802295-11278-1-git-send-email-maxin.john@intel.com>
	<1528802295-11278-7-git-send-email-maxin.john@intel.com>
	<3063a563-3960-2a4a-d791-20bc066f7ab6@windriver.com>
	<20180613082924.GA16111@mbabyjoh-desk.ger.corp.intel.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <cd3978e0-cd09-6ceb-9c0e-588452adb0e0@windriver.com>
Date: Wed, 13 Jun 2018 20:28:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180613082924.GA16111@mbabyjoh-desk.ger.corp.intel.com>
X-Originating-IP: [172.25.44.2]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 07/12] libunistring: upgrade to 0.9.10
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
X-List-Received-Date: Thu, 14 Jun 2018 00:29:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 06/13/2018 04:29 AM, Maxin B. John wrote:
> Hi Randy,
> 
> On Tue, Jun 12, 2018 at 09:21:17PM -0400, Randy MacLeod wrote:
>> On 06/12/2018 07:18 AM, Maxin B. John wrote:
>>> License-Update: Checksum changed due to updation in documentation. There
>>> are no changes in the license terms.
>>
>> That's correct but I'm not sure if we should include
>> a checksum on the (GPLv3) COPYING file since the README
>> says [1] that:
>>     This license is based on the GNU GPL version 3, see file COPYING.
>> I'd like to know if the COPYING file changed to say the _actual_
>> GPLv2 some day so a checksum would help track such changes.
>>
>>
>> The README statement is an odd way to convey the license terms.
>> Is this just standard FSFese?
> 
> Yes, it is odd.
> 
> README says 'The libunistring library and its header files are dual-licensed under
> "the GNU LGPLv3+ or the GNU GPLv2"' and the project includes a GPL v3 license (COPYING).
> 
> Though not 100% sure, I would assume that it is ok continue with
> LICENSE = "LGPLv3+ | GPLv2"

Yes, that still makes sense.

> 
> If anyone think it is the wrong way to go, please share your views/suggestions.
> 

I guess we'll just accept the lack of a COPYING.gplv2 and
the odd why that the license is stipulated.

Thanks,

../Randy

>> The libunistring commit that sets out these terms is from 0.9:
>>
>> commit 3c15d3a96963703fc02cddda7e968e508638d1b8
>> Author: Bruno Haible <bruno@clisp.org>
>> Date:   Sun Mar 15 02:10:58 2009 +0100
>>
>>      License information.
>>
>>   COPYING     | 674 ++++++++++++++++++++...++++++++++++++++++++
>>   COPYING.LIB | 165 +++++++++...++++++++
>>   ChangeLog   |   3 +
>>   README      |   2 +-
>>   4 files changed, 843 insertions(+), 1 deletion(-)
>>
>>
>> which doesn't help much other than the ChangeLog:
>>
>> +       * COPYING.LIB: New file, from gnulib/doc/COPYING.LESSERv3.
>> +       * COPYING: New file, from gnulib/doc/COPYINGv3.
>>
>>
>> ../Randy
> 
> Best Regards,
> Maxin
> 
>>
>> [1] From README:
>>
>> Copyright
>> ---------
>>
>> The libunistring library and its header files are dual-licensed under
>> "the GNU LGPLv3+ or the GNU GPLv2". This means, you can use it under either
>>    - the terms of the GNU Lesser General Public License (LGPL) version 3 or
>>      (at your option) any later version, or
>>    - the terms of the GNU General Public License (GPL) version 2, or
>>    - the same dual license "the GNU LGPLv3+ or the GNU GPLv2".
>>
>> You find the GNU LGPL version 3 in the file COPYING.LIB.  This license is
>> based on the GNU GPL version 3, see file COPYING.
>>
>> You can find the GNU GPL version 2 at
>> <https://www.gnu.org/licenses/old-licenses/gpl-2.0.html>.
>>
>> Note: This dual license makes it possible for the libunistring library
>> to be used by packages under GPLv2 or GPLv2+ licenses, in particular. See
>> the table in <https://www.gnu.org/licenses/gpl-faq.html#AllCompatibility>.
>>
>> The documentation is under another license; see in the documentation.
>>
>>>
>>> Signed-off-by: Maxin B. John <maxin.john@intel.com>
>>> ---
>>>   .../libunistring/{libunistring_0.9.9.bb => libunistring_0.9.10.bb}  | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>   rename meta/recipes-support/libunistring/{libunistring_0.9.9.bb => libunistring_0.9.10.bb} (85%)
>>>
>>> diff --git a/meta/recipes-support/libunistring/libunistring_0.9.9.bb b/meta/recipes-support/libunistring/libunistring_0.9.10.bb
>>> similarity index 85%
>>> rename from meta/recipes-support/libunistring/libunistring_0.9.9.bb
>>> rename to meta/recipes-support/libunistring/libunistring_0.9.10.bb
>>> index ab7cba5..97fac4e 100644
>>> --- a/meta/recipes-support/libunistring/libunistring_0.9.9.bb
>>> +++ b/meta/recipes-support/libunistring/libunistring_0.9.10.bb
>>> @@ -16,15 +16,15 @@ SECTION = "devel"
>>>   LICENSE = "LGPLv3+ | GPLv2"
>>>   LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6 \
>>>                       file://README;beginline=45;endline=65;md5=08287d16ba8d839faed8d2dc14d7d6a5 \
>>> -                    file://doc/libunistring.texi;md5=efb80a3799a60f95feaf80661d4f204c \
>>> +                    file://doc/libunistring.texi;md5=287fa6075f78a3c85c1a52b0a92547cd \
>>>                      "
>>>   SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz \
>>>              file://iconv-m4-remove-the-test-to-convert-euc-jp.patch \
>>>              file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
>>>   "
>>> -SRC_URI[md5sum] = "4f689e37e4c3bd67de5786aa51d98b13"
>>> -SRC_URI[sha256sum] = "f5e90c08f9e5427ca3a2c0c53f19aa38b25c500913510ad25afef86448bea84a"
>>> +SRC_URI[md5sum] = "0d3274e9838396b12200f8b54ddaf43b"
>>> +SRC_URI[sha256sum] = "a82e5b333339a88ea4608e4635479a1cfb2e01aafb925e1290b65710d43f610b"
>>>   inherit autotools texinfo
>>>   BBCLASSEXTEND = "native nativesdk"
>>>
>>
>>
>> -- 
>> # Randy MacLeod
>> # Wind River Linux
> 


-- 
# Randy MacLeod
# Wind River Linux

