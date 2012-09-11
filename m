Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TBSyg-0001lY-76
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 18:06:18 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8BFrkPh004472
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2012 08:53:46 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 11 Sep 2012 08:53:46 -0700
Message-ID: <504F5E89.4070504@windriver.com>
Date: Tue, 11 Sep 2012 10:53:45 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120824 Thunderbird/15.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1347376071-29566-1-git-send-email-sgw@linux.intel.com>
	<1347376402.2122.44.camel@ted> <504F5A7C.9070407@linux.intel.com>
In-Reply-To: <504F5A7C.9070407@linux.intel.com>
Subject: Re: [PATCH] arch-ia32: Add x32 to MACHINEOVERRIDES
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
X-List-Received-Date: Tue, 11 Sep 2012 16:06:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/12 10:36 AM, Saul Wold wrote:
> On 09/11/2012 08:13 AM, Richard Purdie wrote:
>> On Tue, 2012-09-11 at 08:07 -0700, Saul Wold wrote:
>>> This will allow the KERNEL_FEATURES to trigger the x32 ABI via overrides
>>>
>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>> ---
>>>    meta/conf/machine/include/ia32/arch-ia32.inc |    1 +
>>>    1 files changed, 1 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/meta/conf/machine/include/ia32/arch-ia32.inc b/meta/conf/machine/include/ia32/arch-ia32.inc
>>> index 15f67d7..fa70e57 100644
>>> --- a/meta/conf/machine/include/ia32/arch-ia32.inc
>>> +++ b/meta/conf/machine/include/ia32/arch-ia32.inc
>>> @@ -24,6 +24,7 @@ ABIEXTENSION .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", "x32", "" ,d)}"
>>>    TUNE_CCARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-mx32", "", d)}"
>>>    TUNE_LDARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-m elf32_x86_64", "", d)}"
>>>    TUNE_ASARGS += "${@bb.utils.contains("TUNE_FEATURES", "mx32", "-x32", "", d)}"
>>> +MACHINEOVERRIDES .= "${@bb.utils.contains("TUNE_FEATURES", "mx32", ":x32", "" ,d)}"
>>>
>>>    # ELF64 ABI
>>>    TUNEVALID[m64] = "IA32e (x86_64) ELF64 standard ABI"
>>
>> This is just for the kernel issue, right?
>>
>> In that case, just use ${@bb.utils.contains("TUNE_FEATURES", "mx32",
>> "xxxx", "" ,d)} in the kernel recipe code...
>>
> It's possible that there will be other recipes that need patches or
> other changes in the future, but I guess we can cross that bridge when
> we come to it.
>
> I think I will actually use the features update that Bruce just added
> from here instead.  Since multiple BSP could take advantage of x32 we
> should not have to edit each of there kernel recipes.  It should just be
> enabled based on the x32 DEFAULTTUNE.

I know there are a few other things that can (and should) change behavior based 
on the x32 flag..  but flag or override, it just changes slightly the 
implementation mechanism -- either should work as long as we consistently use it.

--Mark

> Thanks
> 	Sau!
>
>
>
>> Cheers,
>>
>> Richard
>>
>>
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



