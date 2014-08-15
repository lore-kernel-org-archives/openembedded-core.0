Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-04.prod.phx3.secureserver.net
	(p3plsmtpa07-04.prod.phx3.secureserver.net [173.201.192.233])
	by mail.openembedded.org (Postfix) with ESMTP id C0BAA70C47
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 10:54:26 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa07-04.prod.phx3.secureserver.net with 
	id eyuR1o00B1mTNtu01yuRDV; Fri, 15 Aug 2014 03:54:27 -0700
Message-ID: <53EDE6E0.1050108@pabigot.com>
Date: Fri, 15 Aug 2014 05:54:24 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1406706883-15375-1-git-send-email-jackie.huang@windriver.com>
	<1B858668EC6A94408DCA5225FDFA85AABCAE0A8A@ALA-MBA.corp.ad.wrs.com>
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AABCAE0A8A@ALA-MBA.corp.ad.wrs.com>
Subject: Re: [PATCH] ghostscript: add missing dependencies on	libgcrypt and libgpg-error
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
X-List-Received-Date: Fri, 15 Aug 2014 10:54:34 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/15/2014 04:52 AM, Huang, Jie (Jackie) wrote:
> Ping, could someone help merge this? thanks!

That should have been fixed when cups was updated to not introduce false 
dependencies on libgcrypt.  Have you tried with current master?

Peter

>
> Thanks,
> Jackie
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded-core-
>> bounces@lists.openembedded.org] On Behalf Of jackie.huang@windriver.com
>> Sent: Wednesday, July 30, 2014 3:55 PM
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH] ghostscript: add missing dependencies on libgcrypt and libgpg-error
>>
>> From: Jackie Huang <jackie.huang@windriver.com>
>>
>> Fix error:
>> tmp/sysroots/x86_64-linux/usr/libexec/x86_64-wrs-linux/gcc/x86_64-wrs-linux/4.9.0/ld: cannot find -
>> lgcrypt
>> tmp/sysroots/x86_64-linux/usr/libexec/x86_64-wrs-linux/gcc/x86_64-wrs-linux/4.9.0/ld: cannot find -
>> lgpg-error
>>
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> ---
>>   .../ghostscript/ghostscript_9.14.bb                |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.14.bb b/meta/recipes-
>> extended/ghostscript/ghostscript_9.14.bb
>> index e14e656..fbec6ce 100644
>> --- a/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
>> +++ b/meta/recipes-extended/ghostscript/ghostscript_9.14.bb
>> @@ -15,7 +15,7 @@ SECTION = "console/utils"
>>   LICENSE = "GPLv3"
>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=aad21ea85123608e6a0a58d54ee23567"
>>
>> -DEPENDS = "ghostscript-native tiff jpeg fontconfig cups"
>> +DEPENDS = "ghostscript-native tiff jpeg fontconfig cups libgcrypt libgpg-error"
>>   DEPENDS_class-native = ""
>>
>>   SRC_URI_BASE = "http://downloads.ghostscript.com/public/ghostscript-${PV}.tar.gz"
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


